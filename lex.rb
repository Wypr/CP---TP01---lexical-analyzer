require 'lex'
#documentaçaõ da GEM: https://github.com/piotrmurach/lex

class PascalLanguage < Lex::Lexer
  
   def self.keywords
    {
        absolute: :ABSOLUTE,  
        and: :AND,  
        array: :ARRAY,  
        asm: :ASM,  
        begin: :BEGIN,  
        case: :CASE,  
        const: :CONST,  
        constructor: :CONSTRUCTOR,  
        destructor: :DESTRUCTOR,  
        div: :DIV,  
        do: :DO,  
        downto: :DOWNTO,  
        else: :ELSE,  
        end: :END,  
        file: :FILE,  
        for: :FOR,  
        function: :FUNCTION,  
        goto: :GOTO,  
        if: :IF,  
        implementation: :IMPLEMENTATION,  
        in: :IN,  
        inherited: :INHERITED,  
        inline: :INLINE,  
        interface: :INTERFACE,  
        label: :LABEL,  
        mod: :MOD,  
        nil: :NIL,  
        not: :NOT,  
        object: :OBJECT,  
        of: :OF,  
        operator: :OPERATOR, 
        or: :OR,  
        packed: :PACKED,  
        procedure: :PROCEDURE,  
        program: :PROGRAM,  
        record: :RECORD,  
        reintroduce: :REINTRODUCE,  
        repeat: :REPEAT,  
        self: :SELF,  
        set: :SET,  
        shl: :SHL,  
        shr: :SHR,  
        string: :STRING,  
        then: :THEN,  
        to: :TO,  
        type: :TYPE,  
        unit:  :UNIT,  
        until: :UNTIL,  
        uses: :USES,  
        var: :VAR,  
        while: :WHILE,  
        with: :WITH,  
        xor: :XOR,
        abstract: :ABSTRACT,
        alias: :ALIAS,
        assembler: :ASSEMBLER,
        bitpacked: :BITPACKED,
        break: :BREAK,
        cdecl: :CDECL,
        continue: :CONTINUE,
        cppdecl: :CPPDECL,
        cvar: :CVAR,
        default: :DEFAULT,
        deprecated: :DEPRECATED,
        dynamic: :DYNAMIC,
        enumerator: :ENUMERATOR,
        experimental: :EXPERIMENTAL,
        export: :EXPORT,
        external: :EXTERNAL,
        far: :FAR,
        far16: :FAR16,
        forward: :FORWARD,
        generic: :GENERIC,
        helper: :HELPER,
        implements: :IMPLEMENTS,
        index: :INDEX,
        interrupt: :INTERRUPT,
        iocheck: :IOCHECK,
        local: :LOCAL,
        message: :MESSAGE,
        name: :NAME,
        near: :NEAR,
        nodefault: :NODEFAULT,
        noreturn: :NORETURN,
        nostackframe: :NOSTACKFRAME,
        oldfpccall: :OLDFPCCAL,
        otherwise: :OTHERWISE,
        overload: :OVERLOAD,
        override: :OVERRIDE,
        pascal: :PASCAL,
        platform: :PLATFORM,
        private: :PRIVATE,
        protected: :PROTECTED,
        public: :PUBLIC,
        published: :PUBLISHED,
        read: :READ,
        register: :REGISTER,
        result: :RESULT,
        safecall: :SAFECALL,
        saveregisters: :SAVEREGISTERS,
        softfloat: :SOFTFLOAT,
        specialize: :SPECIALIZE,
        static: :STATIC,
        stdcall: :STDCALL,
        stored: :STORED,
        strict: :STRICT,
        unaligned: :UNALIGNED,
        unimplemented: :UNIMPLEMENTED,
        varargs: :VARARGS,
        virtual: :VIRTUAL,
        write: :WRITE, 
      }
  end
    
   

    tokens(
      :DUALSYMBOLS,
      :SYMBOLS,
      *keywords.values,
      :ID,
      :NUM,
      :REAL,
    )

    rule(:ID, /[_a-zA-Z][_0-9a-zA-Z]*/) do |lexer, token|
      token.name = lexer.class.keywords.fetch(token.value.downcase.to_sym, :ID)
      token
    end

    rule(:SYMBOLS, /[+-\/*=<>\[\]\.,\(\):\^@\{\}\$#&%]/)
    rule(:DUALSYMBOLS, /^(<<)$|^(>>)$|^(\*\*)$|^(<>)$|^(><)$|^(<=)$|^(>=)$|^(:=)$|^(\+=)$|^(-=)$|^(\*=)$|^(\/=)$|^(\(\*)$|^(\*\)$)|^(\(\.)$|^(\.\))$|^(\/\/)$/)
    rule(:NUM,/(^[0-9]*$)|(^\$[0-9a-fA-F]+$)|(^\&[0-9]+$)|(^%[0-1]+$)/)
    rule(:REAL, /^([0-9]+)(\.[0-9]+)([eE][-+]?[0-9]+)?|([0-9]+)([eE][-+]?[0-9]+)$|^([0-9]+)\.([0-9]+)?$/)
   

    ignore = " \t\n"
    error do |lexer, token|
    end

end


teste = PascalLanguage.new

output = teste.lex( "Write('Digite Num1:'); 
Readln(Num1);
      Num2:=123*1.23E+4*40.+555;
Sum:=Num1+Num2*1;
Writeln(Sum);
Readln")


puts output.map{|k,v| "#{k} => #{v}"}