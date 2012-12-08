require 'LambdaRegexp'

include ULL::ETSII::Alu3299::LambdaRegexp

if __FILE__ == $0
	
	e = -('c'.re)
	s = 'ccddd'
	remaining = e[s]
	puts "/c?/ '#{s}' Matched. Remaining = '#{remaining}'" if remaining

	e = ~('c'.re) - -('f'.re) - +('d'.re)
	s = 'ccdddf'
	remaining = e[s]
	puts "/c*f?d+/ '#{s}' Matched. Remaining = '#{remaining}'" if remaining

	# Ejemplo proporcionado por el profesor
	e = 'cd'.re
	s = 'cde'
	remaining = e[s] # 'cde' Matched. Remaining = 'e' 
	puts "/cd/ '#{s}' Matched. Remaining = '#{remaining}'" if remaining

	e = 'd'.re | 'r'.re
	s = 'rdddf'     
	remaining = e[s] #  'rdddf' Matched. Remaining = 'dddf' 
	puts "/d|r/ '#{s}' Matched. Remaining = '#{remaining}'" if remaining

	e = 'c'.re - ('d'.re | 'r'.re)
	s = 'crddf'     
	remaining = e[s] # 'crddf' Matched. Remaining = 'ddf' 
	puts "/c(d|r)/ '#{s}' Matched. Remaining = '#{remaining}'" if remaining

	e = 'c'.re - +('d'.re | 'r'.re)
	s = 'crddf'
	remaining = e[s]
	puts "/c(d|r)+/ '#{s}' Matched. Remaining = '#{remaining}'" if remaining

	e = 'c'.re - ~('d'.re | 'r'.re)
	s = 'cdrdrf'
	remaining = e[s]
	puts "/c(d|r)*/ '#{s}' Matched. Remaining = '#{remaining}'" if remaining

	e = 'c'.re - ~('d'.re | 'r'.re)
	s = 'cfff'
	remaining = e[s]
	puts "/c(d|r)*/ '#{s}' Matched. Remaining = '#{remaining}'" if remaining

	e = 'c'.re - ~('d'.re | 'r'.re)
	s = 'cdrd'
	remaining = e[s]
	puts "/c(d|r)*/ '#{s}' Matched. Remaining = '#{remaining}'" if remaining

	e = 'c'.re - +('d'.re | 'r'.re)
	s = 'cfff'
	remaining = e[s] # 'cfff' didn't match. Remaining = 'false'
	puts "/c(d|r)+/ '#{s}' didn't match. Remaining = '#{remaining}'" unless remaining
end