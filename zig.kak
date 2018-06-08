# Kakoune mode for zig-lang

hook global BufCreate .*[.]zig %{
  set-option buffer filetype zig
}

add-highlighter shared/ regions -default code zig \
  comment-line     '//'   '$'                     '' \
  double-string    'c?"'    (?<!\\)(\\\\)*"         '' \
  single-string    "'"    (?<!\\)(\\\\)*'         '' \
  # multiline-string \\\\   '$'                     ''

add-highlighter shared/zig/double-string    fill string
add-highlighter shared/zig/single-string    fill string
# add-highlighter shared/zig/multiline-string fill string
add-highlighter shared/zig/comment-line          fill comment

add-highlighter shared/zig/code regex '\b(?:const|var|extern|packed|export|pub|noalias|inline|comptime|nakedcc|stdcallcc|volatile|align|section)\b' 0:keyword
add-highlighter shared/zig/code regex '\b(?:struct|enum|union)\b' 0:keyword
add-highlighter shared/zig/code regex '\b(?:break|return|continue|asm|defer|errdefer|unreachable|try|catch|async|await|suspend|resume|cancel)\b' 0:keyword
add-highlighter shared/zig/code regex '\b(?:if|else|switch|and|or)\b' 0:keyword
add-highlighter shared/zig/code regex '\b(?:while|for)\b' 0:keyword
add-highlighter shared/zig/code regex '\b(?:null|undefined|this)\b' 0:keyword
add-highlighter shared/zig/code regex '\b(?:fn|use|test)\b' 0:keyword

add-highlighter shared/zig/code regex '\b(?:bool|f32|f64|f128|void|noreturn|type|error|promise|i2|u2|i3|u3|i4|u4|i5|u5|i6|u6|i7|u7|i8|u8|i16|u16|u29|i29|i32|u32|i64|u64|i128|u128|isize|usize|c_short|c_ushort|c_int|c_uint|c_long|c_ulong|c_longlong|c_ulonglong|c_longdouble|c_void)\b' 0:type

add-highlighter shared/zig/code regex '\b(?:true|false)\b'                                0:keyword
add-highlighter shared/zig/code regex '(\+%?|-%?|/|\*%?|=|\^|&|\?|\||!|>|<|%|<<%?|>>)=?'  0:default
add-highlighter shared/zig/code regex '(@)(\w+)'                                          1:default 2:function
add-highlighter shared/zig/code regex '\b[0-9]+(.[0-9]+)=([eE][+-]?[0-9]+)='              0:value
add-highlighter shared/zig/code regex '\b0x[a-fA-F0-9]+([a-fA-F0-9]+([pP][+-]?[0-9]+)?)=' 0:value
add-highlighter shared/zig/code regex '\b0o[0-7]+'                                        0:value
add-highlighter shared/zig/code regex '\b0b[01]+(.[01]+([eE][\+-]?[0-9]+)?)='             0:value

hook -group zig-highlight global WinSetOption filetype=zig %{ add-highlighter window ref zig }
hook -group zig-highlight global WinSetOption filetype=(?!zig).* %{ remove-highlighter window/zig }
