type
  ST = string;
  city = set of string;
var
  cities: city := ['москва', 'санкт-петербург', 'новосибирск'];
  Simvol: array[1..35] of char = ('а', 'б', 'в', 'г', 'д', 'е', 'ж', 'з', 'и',
                                  'й', 'к', 'л', 'м', 'н', 'о', 'п', 'р', 'с',
                                  'т', 'у', 'ф', 'х', 'ц', 'ч', 'ш', 'щ', 'ъ',
                                  'ы', 'ь', 'э', 'ю', 'я', ' ', '-', #13);
  //array_of_search_results: array of integer;
  fl: text;
  rat: string;
  att: string;
  counter: integer;
  ans: byte;
label met1;


Function number (c:char) : byte;
Var
  i: byte;
Begin
  for i:=1 to 35 do
    if c = Simvol[i] then
      number:=i;
End;

function Poisk(S,P : ST): array of integer;
Var
  i, j, k, dl, h, N, M: integer;
  D : array[1..35] of byte;
  pr : array of boolean; 
  array_of_search_results: array of integer;

Begin
  
  N:= length(S);
  M:= length(P);
  
  setlength(pr, m);
  
  {--Заполняем матрицу расстояний--}
  for i:=1 to 35 do D[i]:=m;
  dl:=1;
  for i:=m-1 downto 1 do begin
    j:=Number(p[i]);
    if D[j]=m then D[j]:=dl;
    dl:=dl+1;
  end;
  
  
  {--Непосредственно поиск--}
  i:=m;
  j:=m;
  while (j>=0) and (i<=N) do begin
    for h:=1 to m do pr[h-1]:=false;
    j:=m;
    k:=i;
    while (j>0) and (S[k]=P[j]) do begin
      pr[j-1]:=true;
      k:=k-1;
      j:=j-1; 
    end;
    if j = 0 then begin
      setlength(array_of_search_results, length(array_of_search_results)+1);
      //array_of_search_results[high(array_of_search_results)] := i-m+1;
      inc(counter);
    end;
    i:=i+d[number(s[i])];
  end;
  
  Poisk := array_of_search_results;
End;

procedure Convert(var s:string);
{ANSI -> ASCII}
var i:integer;
begin
  for i:=1 to length(s) do
    if ord(s[i]) in [192..239] then s[i]:=chr(ord(s[i])-64)
    else if ord(s[i]) in [240..255] then s[i]:=chr(ord(s[i])-16)
    else if ord(s[i])=168 then s[i]:=chr(ord(240))
    else if ord(s[i])=184 then s[i]:=chr(ord(241));
end;

begin
  rat:= readalltext('dat.txt');
  writeln('Выберите достопримечательность, которую хотите найти: ');
  
  met1:
  writeln('1 - кремль; 2 - сенатская площадь; 3 - музей; 0 - для выхода из программы');
  write('ваш ввод --> ');
  read(ans);

  case ans of
    1: att:= 'кремль';
    2: att:= 'сенатская площадь';
    3: att:= 'музей';
    0: exit;
  end;
   Poisk(rat, att);
  //array_of_search_results := Poisk(rat, 'кремль');
  writeln('Количество раз, когда появилось слово ', '"',att, '"',': ', counter);
  writeln;
  //write(array_of_search_results);
  counter:=0;
  goto met1;
end.