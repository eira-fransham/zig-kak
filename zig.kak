# Kakoune mode for zig-lang

hook global BufCreate .*\.zig %{
  set-option buffer filetype zig
}

add-highlighter shared/zig/double-string fill string
add-highlighter shared/zig/single-string fill string
add-highlighter shared/zig/comment fill comment

add-highlighter shared/ regions -default code zig \
  double-string '"'  (?<!\\)(\\\\)*"         '' \
  single-string "'" (?<!\\)(\\\\)*' '' \
  comment-line '//' '$' \
  multiline-string '\\\\' '$' '' \

add-highlighter shared/zig/storage regex 'const|var|extern|packed|export|pub|noalias|inline|comptime|nakedcc|stdcallcc|volatile|align|section' 0:attribute
add-highlighter shared/zig/structure regex 'struct|enum|union' 0:keyword
add-highlighter shared/zig/statement regex 'break|return|continue|asm|defer|errdefer|unreachable|try|catch|async|await|suspend|resume|cancel' 0:keyword
add-highlighter shared/zig/conditional regex 'if|else|switch|and|or' 0:keyword
add-highlighter shared/zig/repeat regex 'while|for' 0:keyword
add-highlighter shared/zig/constant regex 'null|undefined|this' 0:keyword
add-highlighter shared/zig/keyword regex 'fn|use|test' 0:keyword

add-highlighter shared/zig/type regex 'bool|f32|f64|f128|void|noreturn|type|error|promise|i2|u2|i3|u3|i4|u4|i5|u5|i6|u6|i7|u7|i8|u8|i16|u16|u29|i29|i32|u32|i64|u64|i128|u128|isize|usize|c_short|c_ushort|c_int|c_uint|c_long|c_ulong|c_longlong|c_ulonglong|c_longdouble|c_void' 0:type

add-highlighter shared/zig/boolean         regex 'true|false'                                       0:keyword
add-highlighter shared/zig/operator        regex '(+%?|-%?|/|*%?|=|\^|&|?|\||!|>|<|%|<<%?|>>)=?'    0:operator
add-highlighter shared/zig/arrow-character regex '->'                                               0:operator
add-highlighter shared/zig/builtin-fn      regex '(@)(\w+)'                                         1:operator 2:keyword
add-highlighter shared/zig/dec-number      regex '<[0-9]+(.[0-9]+)=([eE][+-]?[0-9]+)='              0:value
add-highlighter shared/zig/hex-number      regex '<0x[a-fA-F0-9]+([a-fA-F0-9]+([pP][+-]?[0-9]+)?)=' 0:value
add-highlighter shared/zig/oct-number      regex '\<0o[0-7]\+'                                      0:value
add-highlighter shared/zig/bin-number      regex '<0b[01]+(.[01]+([eE][\+-]?[0-9]+)?)='             0:value
