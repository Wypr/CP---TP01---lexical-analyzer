=begin
How to install/) {gem install 'rltk'
=end

require 'rltk/lexer'
class PascalLex < RLTK::Lexer

rule(/absolute/) { :ABSOLUTE} 
rule(/and/) { :AND} 
rule(/array/) { :ARRAY} 
rule(/asm/) { :ASM} 
rule(/begin/) { :BEGIN} 
rule(/case/) { :CASE} 
rule(/const/) { :CONST} 
rule(/constructor/) { :CONSTRUCTOR} 
rule(/destructor/) { :DESTRUCTOR} 
rule(/div/) { :DIV} 
rule(/do/) {:DO}  
rule(/downto/) {:DOWNTO}  
rule(/else/) {:ELSE}  
rule(/end/) {:END}  
rule(/file/) {:FILE}  
rule(/for/) {:FOR}  
rule(/function/) {:FUNCTION}  
rule(/goto/) {:GOTO}  
rule(/if/) {:IF}  
rule(/implementation/) {:IMPLEMENTATION}  
rule(/in/) {:IN}  
rule(/inherited/) {:INHERITED}  
rule(/inline/) {:INLINE}  
rule(/interface/) {:INTERFACE}  
rule(/label/) {:LABEL}  
rule(/mod/) {:MOD}  
rule(/nil/) {:NIL}  
rule(/not/) {:NOT}  
rule(/object/) {:OBJECT}  
rule(/of/) {:OF}  
rule(/operator/) {:OPERATOR} 
rule(/or/) {:OR}  
rule(/packed/) {:PACKED}  
rule(/procedure/) {:PROCEDURE}  
rule(/program/) {:PROGRAM}  
rule(/record/) {:RECORD}  
rule(/reintroduce/) {:REINTRODUCE}  
rule(/repeat/) {:REPEAT}  
rule(/self/) {:SELF}  
rule(/set/) {:SET}  
rule(/shl/) {:SHL}  
rule(/shr/) {:SHR}  
rule(/string/) {:STRING}  
rule(/then/) {:THEN}  
rule(/to/) {:TO}  
rule(/type/) {:TYPE}  
rule(/unit/) { :UNIT}  
rule(/until/) {:UNTIL}  
rule(/uses/) {:USES}  
rule(/var/) {:VAR}  
rule(/while/) {:WHILE}  
rule(/with/) {:WITH}  
rule(/xor/) {:XOR}
rule(/abstract/) {:ABSTRACT}
rule(/alias/) {:ALIAS}
rule(/assembler/) {:ASSEMBLER}
rule(/bitpacked/) {:BITPACKED}
rule(/break/) {:BREAK}
rule(/cdecl/) {:CDECL}
rule(/continue/) {:CONTINUE}
rule(/cppdecl/) {:CPPDECL}
rule(/cvar/) {:CVAR}
rule(/default/) {:DEFAULT}
rule(/deprecated/) {:DEPRECATED}
rule(/dynamic/) {:DYNAMIC}
rule(/enumerator/) {:ENUMERATOR}
rule(/experimental/) {:EXPERIMENTAL}
rule(/export/) {:EXPORT}
rule(/external/) {:EXTERNAL}
rule(/far/) {:FAR}
rule(/far16/) {:FAR16}
rule(/forward/) {:FORWARD}
rule(/generic/) {:GENERIC}
rule(/helper/) {:HELPER}
rule(/implements/) {:IMPLEMENTS}
rule(/index/) {:INDEX}
rule(/interrupt/) {:INTERRUPT}
rule(/iocheck/) {:IOCHECK}
rule(/local/) {:LOCAL}
rule(/message/) {:MESSAGE}
rule(/name/) {:NAME}
rule(/near/) {:NEAR}
rule(/nodefault/) {:NODEFAULT}
rule(/noreturn/) {:NORETURN}
rule(/nostackframe/) {:NOSTACKFRAME}
rule(/oldfpccall/) {:OLDFPCCAL}
rule(/otherwise/) {:OTHERWISE}
rule(/overload/) {:OVERLOAD}
rule(/override/) {:OVERRIDE}
rule(/pascal/) {:PASCAL}
rule(/platform/) {:PLATFORM}
rule(/private/) {:PRIVATE}
rule(/protected/) {:PROTECTED}
rule(/public/) {:PUBLIC}
rule(/published/) {:PUBLISHED}
rule(/read/) {:READ}
rule(/register/) {:REGISTER}
rule(/result/) {:RESULT}
rule(/safecall/) {:SAFECALL}
rule(/saveregisters/) {:SAVEREGISTERS}
rule(/softfloat/) {:SOFTFLOAT}
rule(/specialize/) {:SPECIALIZE}
rule(/static/) {:STATIC}
rule(/stdcall/) {:STDCALL}
rule(/stored/) {:STORED}
rule(/strict/) {:STRICT}
rule(/unaligned/) {:UNALIGNED}
rule(/unimplemented/) {:UNIMPLEMENTED}
rule(/varargs/) {:VARARGS}
rule(/virtual/) {:VIRTUAL}
rule(/write/) {:WRITE}
rule(/ /){}
rule(/\d+/){|t| [:INTEGER, t.to_s] }
rule(/\h+/){|t| [:INTEGER, t.to_s] }
rule(/[_a-zA-Z]\w*/) {|t| [:ID , t.to_s]} 
rule(/(\d+)(\.\d+)([eE][-+]?\d+)?|(\d+)([eE][-+]?\d+)|(\d+)\.(\d+)?/) {|t| [:REAL, t.to_s]}
rule(/[^a-zA-Z0-9_ \t\r\n\f]/){ |t| [:SYMBOLS, t.to_s]}
rule(/\/\/(.*?)$/){|t| [:COMMENT, t.to_s]}
rule(/\{(.*?)\}$/m){|t| [:COMMENT, t.to_s]}
rule(/\(\*(.*?)\*\)$/m){|t| [:COMMENT, t.to_s]}
rule(/[ \t\r\n\f]/)
end
puts PascalLex.lex( File.read('2.in').downcase);
