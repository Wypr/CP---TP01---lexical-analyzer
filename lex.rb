require 'lex'
#documentaçaõ da GEM: https://github.com/piotrmurach/lex

class PascalLanguage < Lex::Lexer
    tokens(
        :DUALSYMBOLS,
        :SYMBOLS,

      )
        rule(:SYMBOLS, /[+-\/*=<>\[\]\.,\(\):\^@\{\}\$#&%]/)
        rule(:DUALSYMBOLS, /^(<<)$|^(>>)$|^(\*\*)$|^(<>)$|^(><)$|^(<=)$|^(>=)$|^(:=)$|^(\+=)$|^(-=)$|^(\*=)$|^(\/=)$|^(\(\*)$|^(\*\)$)|^(\(\.)$|^(\.\))$|^(\/\/)$/)
end

=begin
input = arquivo vindo do cmd
teste = PascalLanguage.new
output = teste.lex(input)  #output será um vetor de tokens 
=end


teste = PascalLanguage.new

output = teste.lex("++++++++*///")

puts output.map{|k,v| "#{k} => #{v}"}
#(<<)|(>>)|(\*\*)|(<>)|(><)|(<=)|(>=)|(:=)|(\+=)|(-=)|(\*=)|(\/=)|(\(\*)|(\*\))|(\(\.)|(\.\))|(\/\/)