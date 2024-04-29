# stata-ado
This contains the programs written in Stata. These are saved as ado files and can be downloaded into the personal ado folders and used as necessary. 

/**************************************************************************************************
1. clean_multiple
Purpose: This program helps to clean multiple-select variables downloaded in wide-format from SurveyCTO software. 
This is most useful when correcting issues identified through HFCs or classifying "other" responses in existing or new catrgories
The program cleans the multiple select variables through following steps:
1. Deletes the selected (incorrect) option (eg 999) from the variable value
2. Appends the correct option to the variable value
3. Changes indicator for whether the original option was selected for the var (eg var_999) to 0
4. Changes indicator for the correct option to 1

Note: this program only deals when there is only one option to be appended
To append multiple options, split the answers and run program on each separately

Syntax: clean_multiple, var_change(insert_og_var_to_change) var_corr(insert_var_with_correct_vals)
***************************************************************************************************/
