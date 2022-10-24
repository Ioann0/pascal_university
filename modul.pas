unit modul;
interface
type
  ST = string;
  city = set of string;
  Node = ^Bder;
     Bder = record
      info: integer;
      key: integer;
      left, right: Node;
     end;
var
  cities: city := ['москва', 'санкт-петербург', 'новосибирск'];
  Simvol: array[1..35] of char = ('а', 'б', 'в', 'г', 'д', 'е', 'ж', 'з', 'и',
                                  'й', 'к', 'л', 'м', 'н', 'о', 'п', 'р', 'с',
                                  'т', 'у', 'ф', 'х', 'ц', 'ч', 'ш', 'щ', 'ъ',
                                  'ы', 'ь', 'э', 'ю', 'я', ' ', '-', #13);
  rat: string;
  att: string;
  counter: integer;
  ans: byte;
  tree, prev: Node;
  fl, fr: text;
  array_of_numbers: array of array of integer;
  //ST: string;

Function number (c:char) : byte;
function Poisk (S,P : ST): array of integer;
procedure P(Z: Bder);
procedure FORM(var TR: Node; Z: Bder);
procedure VVOD(NF: string);
Procedure DelTree(x: Integer; Var s: Node);
function PP(s: Node): boolean;
Procedure PrintDer(tr: Node);
Procedure Counting (tr: Node; var arr: array of array of integer);
procedure VIVOD_ARRAY_OF_N (const arr: array of array of integer);

implementation

Function number (c:char) : byte;
Var
  i: byte;
Begin
  for i:=1 to 35 do
    if c = Simvol[i] then
      number:=i;
End;

function Poisk (S,P : ST): array of integer;
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
  for i:=1 to 35 do
    D[i]:=m;
  dl:=1;
  for i:=m-1 downto 1 do begin
    j:=Number(p[i]);
    if D[j]=m then
      D[j]:=dl;
    dl:=dl+1;
  end;
  
  
  {--Непосредственно поиск--}
  i:=m;
  j:=m;
  while (j>=0) and (i<=N) do begin
    for h:=1 to m do
      pr[h-1]:=false;
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

procedure P(Z: Bder);
begin
  write(Z.info);
end;

procedure FORM(var TR: Node; Z: Bder);
begin
  if tr = nil then begin //формирование новой записи
    new(tr);
    tr^:= z; //в данном узле
  end
  else if z.info < tr^.info then FORM(tr^.left, z) // в левой ветви
                            else FORM(tr^.right, z); // в правой
end;

procedure VVOD(NF: string);
var Z: Bder;
begin
  assign(fl, NF); reset(fl);
  writeln('---------Заполнение дерева новыми записями---------');
  while not seekeof(fl) do with Z do begin
    read(fl, info); //P(Z);//ввод данных и вывод
    left:= nil; right:= nil;
    FORM(tree, z); //вызов для формирования нового узла
  end;
  writeln; close(fl);
end;

Procedure DelTree(x: Integer; Var s: Node);
Var q: Node;
{ процедура поиска подходящего узла и вставка его на место удаляемого }
Procedure D1(Var r: Node);
Begin
  if r^.Right <> Nil Then D1(r^.Right)
                   else begin
                     q^.info:=r^.info;
                     q:=r;
                     r:=r^.Left;
                     dispose(q);
                   end;

end;
begin { поиск узла для удаления}
  if p = Nil then Writeln('Требуемого элемента в списке нет')
  else If x < s^.info Then DelTree (x, s^.Left)
  else if x > s^.info Then DelTree (x, s^.Right)
  else { узел найден }
  begin { удаление узлов? имеющих одного сына}
    q:= s;
    if q^.Right = Nil then begin
      s:=q^.Left;
      dispose(s);
    end
    else
    if q^.Left = Nil then begin
      s:=q^.Right;
      dispose(q);
    end
    else D1(q^.Left) { у узла два сына, удаление постепенно}
  end;
end;

function PP(s: Node): boolean;
begin
  if s = nil then begin
    writeln('Пусто');
    PP:= true;
  end
  else PP:= False;
end;


Procedure PrintDer(tr: Node);
begin
  if tr <> Nil then begin
    PrintDer(tr^.left); { <- переход к левому сыну при его наличии }
    writeln('-->', tr^.info); { <- печать узла }
    PrintDer(tr^.right); { <- переход к правому сыну при наличии }
 end;
end;

Procedure Counting (tr: Node; var arr: array of array of integer);
var
  i: integer;
label
  next_number;
begin
  if tr <> Nil then begin
   
    for i := 0 to high(arr) do 
      if arr[i,0] = tr^.info then begin
        arr[i,1] += 1;
        goto next_number;
      end;
    

    setlength(arr, length(arr)+1); 
    setlength(arr[high(arr)], 2); 
    // Присваиваем значения элементам нового двухэлементного массива в массиве arr
    arr[high(arr), 0]:= tr^.info;
    arr[high(arr), 1]:= 1;
      
    next_number:
    // Переход к сыновьям текущего узла tr:
    Counting(tr^.left, arr); { <- переход к левому сыну при его наличии }
    Counting(tr^.right, arr); { <- переход к правому сыну при наличии }
    
    
  end;
end;

procedure VIVOD_ARRAY_OF_N (const arr: array of array of integer);
var
  i: integer;
begin
  writeln('Число   Кол-во повторений');
  for i := 0 to high(arr) do 
    writeln(arr[i,0]:5,arr[i,1]:20);
  
end;

begin
  
end.