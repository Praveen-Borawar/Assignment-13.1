*** Settings ***
Resource  ../Functional_Flipkart/testSteps.robot
Resource  ../Functional_Flipkart/initializeVariables.robot

*** Test Cases ***
User should be able to Land on Flipkart Website
    Open Flipkart Website
    Login-Add User Details
    Navigate To Flipkart and Select "Electronics"
    Search for "Televisions" in the List
    
User Should be able to select a particular product
    Selecting The Product
    Verify Product Page Title
    Click On Add To Cart Button

verify the added item present in the cart
    Navigate To Home Page and Click Cart Button
    Verify Item in the Cart