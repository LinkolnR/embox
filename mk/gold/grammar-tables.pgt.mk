##TEMPLATE-NAME 'Make - MyBuild engine (Tables file)'
##LANGUAGE 'GNU Make'
##ENGINE-NAME 'MyBuild'
##AUTHOR 'Eldar Abusalimov'
##FILE-EXTENSION 'mk'
##NOTES
This template outputs the tables using extended syntax of Make functional language.

Generally you should not modify the generated file.
##END-NOTES
##ID-SEPARATOR '_'
# This file is auto-generated by GOLD Parser Builder using MyBuild program
# template. Do not edit!
##PARAMETERS
#
# Grammar info:
#   Name            : %Name%
#   Version         : %Version%
#   Author          : %Author%
#   About           : %About%
#   Case Sensitive  : %CaseSensitive%
#   Start Symbol    : %StartSymbol%
##END-PARAMETERS

ifndef gold_grammar
$(error 'gold_grammar' is not defined. \
	Do not include $(notdir $(lastword $(MAKEFILE_LIST))) directly!)
endif # gold_grammar

ifdef __gold_$(gold_grammar)_parser
$(error Multiple inclusion of tables file for '$(gold_grammar)' parser. \
	Do not include $(notdir $(lastword $(MAKEFILE_LIST))) directly!)
endif # __gold_$(gold_grammar)_parse

define __gold_$(gold_grammar)_parser
	$(gold-parser \
##SYMBOL-TABLE
		$(gold-symbol-table \
		# 	$(gold-symbol <ID>,
		# 		<Type>,
		# 		<Function name>
		# 	),
##SYMBOLS
			$(gold-symbol %Index%,%Kind%,# %Description%
				%ID%),
##END-SYMBOLS
		),# Total %Count% symbol(s).
##END-SYMBOL-TABLE

##RULE-TABLE
		$(gold-rule-table \
		# 	$(gold-rule <ID>,
		# 		<LHS nonterminal ID>,
		# 		<RHS total symbols>,
		# 		<Function name>
		# 	),
##RULES
			$(gold-rule %Index%,%NonterminalIndex%,%SymbolCount%,# %Description%
				%ID%),
##END-RULES
		),# Total %Count% rule(s).
##END-RULE-TABLE

##CHAR-SET-TABLE
		$(gold-charset-table \
		# 	$(gold-charset <ID>,
		# 		<List of chars>
		# 	),
##CHAR-SETS
##RANGE-CHARS '.'
##DELIMITER ';'
			$(gold-charset %Index%,# %Chars.XML% #
				%Chars.RangeList%),
##END-CHAR-SETS
		),# Total %Count% charset(s).
##END-CHAR-SET-TABLE

##DFA-TABLE
		$(gold-dfa-table %InitialState%,
		# 	$(gold-dfa-state <ID>,
		# 		<Accept symbol ID or -1>
		# 		$(gold-dfa-edge <Charset ID>,
		# 			<Target state ID>
		# 		),
		# 		...
		# 	),
##DFA-STATES
			$(gold-dfa-state %Index%,%AcceptIndex%,
##DFA-EDGES
				$(gold-dfa-edge %CharSetIndex%,%Target%),
##END-DFA-EDGES
			),# Total %EdgeCount% edge(s).
##END-DFA-STATES
		),# Total %Count% DFA state(s).
##END-DFA-TABLE

##LALR-TABLE
		$(gold-lalr-table %InitialState%,# <- Initial state
		# 	$(gold-lalr-state <ID>,
		# 		$(gold-lalr-action <Symbol ID>,
		# 			<Action>,
		# 			<Value>
		# 		),
		# 		...
		# 	),
##LALR-STATES
			$(gold-lalr-state %Index%,
##LALR-ACTIONS
				$(gold-lalr-action %SymbolIndex%,%Action%,%Value%),
##END-LALR-ACTIONS
			),# Total %ActionCount% action(s).
##END-LALR-STATES
		)# Total %Count% LALR state(s).
##END-LALR-TABLE

	)
endef # __gold_$(gold_grammar)_parser

$(def_all)

