/**************************************************************************************************
clean_multiple
Syntax: clean_multiple, var_change(insert_og_var_to_change) var_corr(insert_var_with_correct_vals)
Purpose: This program cleans the multiple select variables through following steps:
1. Deletes 999 from the variable value
2. Appends the correct option to the variable value
3. Changes indicator for whether option 999 was selected for the var (var_999) to 0
4. Changes indicator for the correct option to 1

Note: this program only deals when there is only one option to be appended
To append multiple options, split the answers and run program on each separately
***************************************************************************************************/

cap program drop clean_multiple
program clean_multiple
	syntax, var_change(str) var_corr(str)
	
	replace `var_change' = subinstr(`var_change', "999", "",.)
	replace `var_change' = `var_change' + `var_corr' if !missing(`var_corr')
	replace `var_change'_999 = 0 if !missing(`var_corr')
	
	
	levelsof `var_corr', l(corr_val) c
	
	foreach value of local corr_val {
		cap gen `var_change'_`value' = 0
		replace `var_change'_`value' = 1 if `var_corr' == "`value'"
	}
end
