*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    CustomLibraryWithRegex.py

*** Variables ***
${URL}    https://economictimes.indiatimes.com/
${LINK_XPATH}   //a[contains(text(), 'Modi')]

*** Test Cases ***
Search for Links with WebElements And Process Links to extract text
  Open Browser    ${URL}  Chrome
  Sleep    10s

  # Print the first 5 links and text of links
   @{elements} =    Get WebElements    xpath=${LINK_XPATH}
    ${all_links} =    Create List 
    
     FOR    ${i}    IN RANGE    0    5

        ${element} =    Get From List    ${elements}    ${i}
        ${link} =    Get Element Attribute    ${element}    href
        Log To Console    Sample link: ${link}    ${\n}
    
        
        ${text} =    Get Text    ${element}
        Log To Console    Link text: ${text}
        Log    Link text: ${text}


        ${clean_text}=    extract_clean_text    ${link}
        Log To Console    Link text with Regex: ${clean_text}    ${\n}
        Log    Link text: ${clean_text}
    END
    
  Close Browser

