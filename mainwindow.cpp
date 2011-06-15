#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    ui->view->setSource(QUrl::fromLocalFile(QLatin1String("qml/Wakedo/main.qml")));
}

MainWindow::~MainWindow()
{
    delete ui;
}
