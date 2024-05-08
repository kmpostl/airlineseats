import sys
from PyQt5.QtWidgets import QApplication, QMainWindow, QMenuBar, QMenu, QAction, QWidget, QVBoxLayout, QPushButton


class MenuWindow(QMainWindow):
    def __init__(self):
        super().__init__()

        self.setWindowTitle("Dynamic Menu Example")
        self.setGeometry(100, 100, 500, 400)

        # Create the initial menu bar
        menu_bar = QMenuBar(self)
        self.setMenuBar(menu_bar)

        # Create the first menu
        file_menu = QMenu("File", self)
        menu_bar.addMenu(file_menu)

        # Create a QAction for the first menu
        first_menu_action = QAction("First Menu", self)
        first_menu_action.triggered.connect(self.switch_to_first_menu)
        file_menu.addAction(first_menu_action)

        # Create a QWidget and layout for the initial menu
        self.central_widget = QWidget()
        self.setCentralWidget(self.central_widget)
        layout = QVBoxLayout(self.central_widget)

        # Add a button to the initial menu
        button = QPushButton("Switch to First Menu", self.central_widget)
        button.clicked.connect(self.switch_to_first_menu)
        layout.addWidget(button)

    def switch_to_first_menu(self):
        # Remove the existing layout
        if self.central_widget.layout() is not None:
            old_layout = self.central_widget.layout()
            while old_layout.count():
                old_layout.takeAt(0)

        # Create the new menu
        first_menu = QMenu("First Menu", self)

        # Create a QAction for the first menu
        first_menu_action = QAction("Switch to Initial Menu", self)
        first_menu_action.triggered.connect(self.switch_to_initial_menu)
        first_menu.addAction(first_menu_action)

        # Add the first menu to the menu bar
        menu_bar = self.menuBar()
        menu_bar.clear()
        menu_bar.addMenu(first_menu)

        # Create a QWidget and layout for the first menu
        first_menu_widget = QWidget()
        first_menu_layout = QVBoxLayout(first_menu_widget)

        # Add a button to the first menu
        button = QPushButton("Switch to Initial Menu", first_menu_widget)
        button.clicked.connect(self.switch_to_initial_menu)
        first_menu_layout.addWidget(button)

        # Set the first menu widget as the new central widget
        self.setCentralWidget(first_menu_widget)

    def switch_to_initial_menu(self):
        # Remove the existing layout
        if self.central_widget.layout() is not None:
            old_layout = self.central_widget.layout()
            while old_layout.count():
                old_layout.takeAt(0)

        # Create the initial menu bar
        menu_bar = QMenuBar(self)
        self.setMenuBar(menu_bar)

        # Create the initial menu
        file_menu = QMenu("File", self)
        menu_bar.addMenu(file_menu)

        # Create a QAction for the initial menu
        first_menu_action = QAction("First Menu", self)
        first_menu_action.triggered.connect(self.switch_to_first_menu)
        file_menu.addAction(first_menu_action)

        # Create a QWidget and layout for the initial menu
        initial_widget = QWidget()
        initial_layout = QVBoxLayout(initial_widget)

        # Add a button to the initial menu
        button = QPushButton("Switch to First Menu", initial_widget)
        button.clicked.connect(self.switch_to_first_menu)
        initial_layout.addWidget(button)

        # Set the initial menu widget as the new central widget
        self.setCentralWidget(initial_widget)


if __name__ == '__main__':
    app = QApplication(sys.argv)
    window = MenuWindow()
    window.show()
    sys.exit(app.exec_())
