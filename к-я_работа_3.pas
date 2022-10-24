program kr3;
uses modul;
var k, max: integer;
    c: char;
    s, q: string;
    ans: byte;

procedure poisk_2(q: string);
var j: char;
    i: integer;
begin
  s:= readalltext(q);
  max:= 0;
  for j:='а' to 'я' do begin
    k:=0;
    for i:=1 to length(s) do 
      if s[i] = j then k:= k + 1;
      if k > max then begin
        max:= k;
        c:= j;
      end;
  end;
end;



begin
  repeat
    writeln('Выберите вариант для текста, для поиска наиболее частого символа');
    writeln('1 - текст № 1, 2 - текст №2, 3 - текст №3');
    write('--> '); read(ans);
  case ans of
    1: begin poisk_2('data_3.txt');
    writeln('самый часто используемый символ: ', c);
    writeln('Количество раз, когда появился символ "', c, '": ', max); end;
    2: begin poisk_2('dat.txt'); writeln('самый часто используемый символ: ', c);
    writeln('Количество раз, когда появился символ "', c, '": ', max); end;
    3: begin poisk_2('data_3_1.txt'); writeln('самый часто используемый символ: ', c);
    writeln('Количество раз, когда появился символ "', c, '": ', max); end;
  end;
  until ans = 0;
end.