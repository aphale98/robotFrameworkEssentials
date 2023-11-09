Simple Test Case
================

This is a simple test case example written in reStructuredText format.

.. code:: robotframework

   *** Settings ***
   Documentation    A simple test case example.
   Library          SeleniumLibrary

   *** Test Cases ***
   Open Google Homepage
       [Documentation]   Open the Google homepage using SeleniumLibrary.
       Create Webdriver     Chrome
       Go To    http://www.google.com
       Title Should Be    Google
       Close Browser
