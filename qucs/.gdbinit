define pqst
  set $d=$arg0.d
  printf "(Qt5 QString)0x%x length=%i: \"",&$arg0,$d->size
  set $i=0
  set $ca=(const ushort*)(((const char*)$d)+$d->offset)
  while $i < $d->size
    set $c=$ca[$i++]
    if $c < 32 || $c > 127
      printf "\\u%04x", $c
    else
      printf "%c" , (char)$c
    end
  end
  printf "\"\n"
end

define pqstd
  set $d=(QStringData*)$arg0.d
  printf "(Qt5 QString)0x%x length=%i: \"",&$arg0,$d->size
  set $i=0
  while $i < $d->size
    set $c=$d->data()[$i++]
    if $c < 32 || $c > 127
      printf "\\u%04x", $c
    else
      printf "%c" , (char)$c
    end
  end
  printf "\"\n"
end

define b0
  break main.c:$arg0
end
document b0
  break main.c
end

set listsize 20

alias to=until
b main
run