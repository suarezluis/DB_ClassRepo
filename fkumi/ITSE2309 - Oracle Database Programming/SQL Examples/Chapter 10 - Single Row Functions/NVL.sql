select CUSTOMER#, LASTNAME, FIRSTNAME, ADDRESS, CITY, STATE, ZIP, NVL(REFERRED, -1) REFERRED, REGION, NVL2(EMAIL, EMAIL, 'Null') EMAIL from customers order by lastname, firstname;