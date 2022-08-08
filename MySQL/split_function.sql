/*
###########################################################################################################
#                                                                                                         #
#   Author: OrxataGuy                                                                                     #
#                                                                                                         #
#   Description:                                                                                          #
#   MySQL hasn't any functions that ables you to split strings, so I created a simple one to do this.     #
#                                                                                                         #
#   Usage:                                                                                                #
#   SELECT SPLIT('Tests/Learning/FirstSteps/HelloWorld', '/', 1); // Expected: Tests                      #
#   SELECT SPLIT('Tests/Learning/FirstSteps/HelloWorld', '/', 4); // Expected: HelloWorld                 #
#                                                                                                         #
###########################################################################################################
*/

CREATE FUNCTION `SPLIT` (
  `_STR` VARCHAR(255), 
  `_DELIM` VARCHAR(12), 
  `_POS` INT
) RETURNS VARCHAR(255) CHARSET UTF8MB4 NOT DETERMINISTIC CONTAINS SQL SQL SECURITY DEFINER RETURN REPLACE(
  SUBSTRING(
    SUBSTRING_INDEX(`_STR`, `_DELIM`, `_POS`), 
    LENGTH(
      SUBSTRING_INDEX(`_STR`, `_DELIM`, `_POS` - 1)
    ) + 1
  ), 
  `_DELIM`, 
  ''
);
