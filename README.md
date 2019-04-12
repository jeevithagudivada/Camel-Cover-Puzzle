# Camel-Cover-Puzzle

The Camel Cover puzzle traces the path of the camel on a 7X7 doughnut chess board in which the center square i.e.the row-column(3 3)
is removed. The Camel moves in L-shape path i.e 3 squares in one direction horizontally or vertically and then 1 square at right angles. 

To start with, the camel is placed on any square on the board and the goal is to find the maximum visited squares.
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
BUILD, INSTALLATION and SETUP

For Windows: 

The source links for downloading CLisp and LispIDE are given below:

CLisp - https://sourceforge.net/projects/clisp/
LispIDE - https://www.daansystems.com/lispide/
LispIDE is a graphical Shell for Clisp or Common Lisp implementation. Clisp is a dilect of Lisp programming Language.
To start with, the Clisp is installed using the installer package clisp-2.49-win32-mingw-big.exe available in the above link. Next, after exacting LispIDE.zip LispIDE is installed by running installer package LispIDE_Setup.exe given in the above link.
Finally, LispIDE.exe is run from the installed location after selecting the clisp.exe executable from the previously installed clisp-2.49 folder. 

For MAC-OS:

The source link for Downloading CLisp for Mac OS is given below:
Clisp - https://www.macports.org/install.php
In the above link, follow the instruction under the header Quickstart and install the package appropriate for the Operating System. In the terminal type the command - sudo port install clisp

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
To run the application

In the LispIDE, use the File->Open option to open the lisp file "camel.lisp". 
This lisp file contains the solution code. 
Then in the console area of the LispIDE, present at the bottom, type in the load command as (load "<path>:\\481-p1_APG\\camel.lisp") to load the definitions from the file.


In the Mac Terminal, load Common Lisp with the command 'clisp' without the single quotation marks.

To execute type command- (find-camels-path 0 0) 
