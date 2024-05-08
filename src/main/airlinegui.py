import mysql.connector
import sys
import csv
from PyQt5.QtWidgets import *
import numpy as np
# Establish a connection to the database
cnx = mysql.connector.connect(
    host="127.0.0.1",
    user="lyn",
    password="apassword1234",
    database="Lynschema"
)

# Create a cursor object
cursor = cnx.cursor()

class MainWindow(QMainWindow):


    def __init__(self):
        super().__init__()
        
        
        self.setWindowTitle("Airliner")
        # Fetch the results
        
        self.flight = None
        self.seatSelected = None
        self.firstName = ""
        self.lastName = ""
        self.message = ""

        self.resize(900, 600)
        container = self.flightDisplay()
        
        self.setCentralWidget(container)
        
    
    def flightDisplay(self):
        query = "SELECT flightnumber FROM Flight"
        cursor.execute(query)
        flights = cursor.fetchall()
        # This can be reworked to look better for sqrtable data set sizes but for now its fine
        columns = int(np.floor(np.sqrt(len(flights))))
        if(flights == None):
            return
        layout = QVBoxLayout()
        tableLayout = QHBoxLayout()
        track = 0
        if(columns == 0):
            column = QVBoxLayout()
            while (track < len(flights)):
                button = QPushButton(str(flights[track][0]))
                button.setObjectName(str(flights[track][0]))
                button.clicked.connect(self.flightClicked)
                column.addWidget(button)
                button.setSizePolicy(QSizePolicy.Preferred, QSizePolicy.Expanding)
                track += 1
        
        breakFlag = False

        for i in range(columns + 1):
            column = QVBoxLayout()
            if (breakFlag):
                break
            for j in range(columns):
                if (track >= len(flights)):
                    breakFlag = True
                    break
                button = QPushButton(str(flights[track][0]))
                button.setObjectName(str(flights[track][0]))
                button.clicked.connect(self.flightClicked)
                column.addWidget(button)
                button.setSizePolicy(QSizePolicy.Preferred, QSizePolicy.Expanding)
                track += 1
            tableLayout.addLayout(column)
        
        layout.addWidget(QLabel("Flights"))        
        layout.addLayout(tableLayout)
        container = QWidget()
        container.setLayout(layout)
        return container
    
    def flightClicked(self):
        self.flight = self.sender().objectName()
        #sender = self.sender()
        self.refreshSeats()

    def refreshSeats(self):
        query = f'SELECT * FROM SEAT WHERE FLIGHTNUMBER = {self.flight}'
        cursor.execute(query)
        self.seats = cursor.fetchall()
        layout = QGridLayout()
        ## HEADER ##
        layout.addWidget(QLabel(f'Flight {self.flight}'), 0, 0, 1, 4)
        layout.setColumnStretch(0, 1)
        layout.setColumnStretch(1, 1)
        layout.setColumnStretch(2, 1)
        layout.setColumnStretch(3, 1)
        #layout.setColumnStretch(4, 2)
        #layout.addWidget(QLabel("Seats"))
        track = 0
        row_sets = [self.seats[i:i+10] for i in range(0, len(self.seats), 10)]
        for i in range(len(row_sets)):
            for j in range(len(row_sets[i])):
                button = QPushButton(str(self.seats[track][1]))
                button.setObjectName(str(self.seats[track][1]))

                ## CHECK IF A PASSENGER ALREADY HAS THE SEAT ##
                if (self.seats[track][4] == 1):
                    button.setEnabled(False)
                    button.setStyleSheet("background-color : red")
                else:
                    button.setStyleSheet("background-color : green")
                    button.setObjectName(str(self.seats[track][1]))
                    button.clicked.connect(self.seatClicked)
                    
                layout.addWidget(button, j + 1, i)
                button.setSizePolicy(QSizePolicy.Preferred, QSizePolicy.Expanding)
                track += 1

        container = QWidget()
        self.AddPassengerWidget()
        layout.addWidget(self.sidePanel, 0, 4, 10, 2)
        #layout.removeWidget()
        container.setLayout(layout)
        self.setCentralWidget(container)

    def seatClicked(self):
        #self.sender().setEnabled(False)
        for row in self.seats:
            if str(row[1]) == self.sender().objectName():
                self.seatSelected = row
        self.refreshSeats()
        #self.flightClicked()
        #self.seatText.update()

    def firstNameChanged (self, text):
        self.firstName = text
        #print(self.firstName)

    def lastNameChanged (self, text):
        self.lastName = text
        #print(self.lastName)
    def addPassClicked(self):
        ##############This can all be thrown in a stored proc#################
        try:
            ## ADD PASSENGER ##
            query = "INSERT INTO passenger (FirstName, LastName, SeatID, FlightNumber) VALUES ("
            query += f'"{self.firstName}", "{self.lastName}", {self.seatSelected[0]}, {self.flight})'
            #print(query)
            cursor.execute(query)
            cnx.commit()
            ## GET NEW PASSENGER ID ##
            query = f'SELECT PassengerID from PASSENGER WHERE FlightNumber = {self.flight} and SeatID = {self.seatSelected[0]} and LastName = "{self.lastName}" and FirstName = "{self.firstName}"'
            #print(query)
            cursor.execute(query)
            PassengerID = cursor.fetchall()

            ## UPDATE SEATS ##
            query = f'UPDATE Seat SET PassengerID={PassengerID[0][0]}, TAKEN=1 where SeatID={self.seatSelected[0]} and FlightNumber={self.flight}'
            #print(str(PassengerID[0][0]))
            cursor.execute(query)
            cnx.commit()

            self.seatSelected = None
            self.lastName = None
            self.firstName = None
            ## DONE SO REFRESH ##
            self.refreshSeats()
        except TypeError:
            self.message = "Please Choose a seat"
            #print(self.message)
        finally:
            self.refreshSeats()

    ## HAD TO LOOK THIS UP ##
    def exportClicked(self):
        try:
            query = f'select s.*, p.lastname, p.firstname from seat as s left outer join passenger as p on s.seatid = p.seatid where s.flightnumber = {self.flight}'
            cursor.execute(query)
            report = cursor.fetchall()
            with open('report.csv', 'w', newline='') as csvfile:
                writer = csv.writer(csvfile)
                writer.writerow([i[0] for i in cursor.description])
                writer.writerows(report)

        except:
            self.message = "Unknown Error"

    def AddPassengerWidget(self):
        text = ""
        if self.seatSelected == None:
            text = "None"
        else:
            text = str(self.seatSelected[1])
        
        layout = QVBoxLayout()
        self.seatText = QLabel(f'Seat selected: {text}')
        firstNameText = QLineEdit()
        lastNameText = QLineEdit()
        firstNameText.setPlaceholderText("Enter first name: ")
        lastNameText.setPlaceholderText("Enter last name: ")
        addPassegerButton = QPushButton("Add Passenger")
        exportButton = QPushButton("Export Report")
        firstNameText.textChanged.connect(self.firstNameChanged)
        lastNameText.textChanged.connect(self.lastNameChanged)
        addPassegerButton.clicked.connect(self.addPassClicked)
        exportButton.clicked.connect(self.exportClicked)
        messageBox = QLabel(str(self.message))
        messageBox.setStyleSheet("color: red")
        layout.addWidget(self.seatText)
        layout.addWidget(firstNameText)
        layout.addWidget(lastNameText)
        layout.addWidget(addPassegerButton)
        layout.addWidget(exportButton)
        layout.addWidget(messageBox)

        firstNameText.setSizePolicy(QSizePolicy.Preferred, QSizePolicy.Expanding)
        lastNameText.setSizePolicy(QSizePolicy.Preferred, QSizePolicy.Expanding)
        addPassegerButton.setSizePolicy(QSizePolicy.Preferred, QSizePolicy.Expanding)

        self.sidePanel = QWidget()
        self.sidePanel.setLayout(layout)
        

        
app = QApplication(sys.argv)
app.setStyleSheet("QLabel{font-size: 18pt;} QPushButton{font-size: 12pt;}")
window = MainWindow()
window.show()

sys.exit(app.exec_())