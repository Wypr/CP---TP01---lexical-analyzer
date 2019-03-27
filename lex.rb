require 'lex'
#documentaçaõ da GEM: https://github.com/piotrmurach/lex

class PascalLanguage < Lex::Lexer
    tokens(
        :NUM,
        :FLOAT_NUM,
        :ID,
        :STRING
      )
    rule(:ID, /\A[_\$a-zA-Z][_\$0-9a-zA-Z]*/)
end

=begin
input = arquivo vindo do cmd
teste = PascalLanguage.new
output = teste.lex(input)  #output será um vetor de tokens 
=end
