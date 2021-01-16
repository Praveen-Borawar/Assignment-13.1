*** Settings ***
Library  SeleniumLibrary
Library  Collections
Resource  ../Functional_Flipkart/testSteps.robot
Resource  ../Functional_Flipkart/initializeVariables.robot

*** Keywords ***
Open Flipkart Website
    Open Browser  ${url_books}  ${brows}   
    Maximize Browser Window
    sleep  4s
    Log to Console  Step1

Login-Add User Details
    #Mobile Number
    ${Enter_Mobile_Number}  Set Variable  xpath=//input[@class='_2IX_2- VJZDxU']
    input text  ${Enter_Mobile_Number}  ${Mobile_Number}
    #Password
    ${Enter_Password}  Set Variable  xpath=//input[@type='password'] 
    input text  ${Enter_Password}  ${Password}
    #Click Login Button
    Click Element  xpath=//div[@class='_1D1L_j']/button
    Log to Console  Step2

Navigate To Flipkart and Select "Electronics" 
    ${Total_Category} =  Get Element Count  xpath=//div[@class='_1kidPb']/span
    sleep  3s
    FOR  ${i}  IN RANGE  1  ${Total_Category}
    ${Category_Name_Dynamic} =  Get Text  xpath=//div[@class='_1kidPb']/span[${i}]
    Exit For Loop If  "${Category_Name_Dynamic}" == "${Category_Type}"
    END
    Set Test Variable  ${Category_Name_Static}  xpath=//div[@class='_1kidPb']/span[${i}]
    Mouse Over  ${Category_Name_Static}
    sleep  5s
    Log to Console  Step3

Search for "Televisions" in the List
    ${Category_List} =  Get Element Count  xpath=//div[@class='_1fwVde'][4]/a
    #Log to Console  ${buk_list}
    FOR  ${j}  IN RANGE  1  ${Category_List}
    ${Category_Names} =  Get Text  xpath=//div[@class='_1fwVde'][4]/a[${j}]
    #Log to Console  ${buk_names}
    Exit For Loop If  "${Category_Names}" == "${Device_Category}"
    END
    Set Test Variable  ${exact_buk_elem}  xpath=//div[@class='_1fwVde'][4]/a[${j}]
    Click Element  ${exact_buk_elem}
    sleep  3s
    #Selecting the size of Television 
    Click Element  xpath=//*[@Class='E2-pcE _1q8tSL col-10-12']/div[2]/div/div/div/a
    Log to Console  Step4
    
Selecting The Product
    sleep  3s
    ${Product_Count} =  Get Element Count  xpath=//div[@class='E2-pcE _1q8tSL']/div
    #Log to Console  ${category_count}
    sleep  4s
    FOR  ${x}  IN RANGE  2  ${Product_Count}
    ${Dynamic_Product_Name} =  Get Text  xpath=//div[@class='E2-pcE _1q8tSL']/div[${x}]/div/div/div/a/div[2]/div[1]/div[1]
    #Scroll Element Into View  xpath=//*[@id="leftNavContainer"]/ul/li[${i}]/a
    #Log to Console  ${dynamic_categ_name}
    Exit For Loop If  "${Dynamic_Product_Name}" == "${Product_Name}"
    END
    Click Element  xpath=//div[@class='E2-pcE _1q8tSL']/div[${x}]/div/div/div/a/div[2]/div[1]/div[1]
    Log to Console  Step5

Verify WebPage title
    [Arguments]  ${title_name}
    Wait Until Page Contains  ${title_name}
    Log to Console  ${title_name}

Verify Product Page Title
    Select Window  ${Product_Page_Title}
    Verify WebPage title  ${Product_Page_Title}
    Log to Console  Step6

Click On Add To Cart Button
    Click Element  xpath=//div[@class='_1p3MFP dTTu2M']/ul/li/button
    sleep  5s
    Log to Console  Step7

Navigate To Home Page and Click Cart Button
    Click Element  xpath=//img[@class='_2xm1JU']
    sleep  5s
    #Click on Cart
    Click Element  xpath=//a[@class='_3SkBxJ']
    sleep  5s
    Log to Console  Step8

Verify Item in the Cart
    ${Item_name} =  Get Text  xpath=//div[@class='_2nQDXZ']/div[1]/div/a
    Run Keyword if  "${Product_Name}" == "${Item_name}"  Item Added Successfully 
    Log to Console  Step9

Item Added Successfully
    Log to Console  Pass!! "Device Successfully Added"
    Close All Browsers  
