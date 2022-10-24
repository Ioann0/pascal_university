program kr;
type Node = ^Bder;
     Bder = record
      info: integer;
      key: integer;
      left, right: Node;
     end;
var tree, prev: Node;
    fl, fr: text;
    array_of_numbers: array of array of integer;
    ST: string;
    level: integer;
    elem: integer;
    ans: byte;


{-----------------------------вывод записи--------------------------------------}
procedure P(Z: Bder);
begin
  write(Z.info);
end;

{-----------------------------создание нового узла------------------------------}
procedure FORM(var TR: Node; Z: Bder);
begin
  if tr = nil then begin //формирование новой записи
    new(tr);
    tr^:= z; //в данном узле
  end
  else if z.info < tr^.info then FORM(tr^.left, z) // в левой ветви
                            else FORM(tr^.right, z); // в правой
end;

{--------------------------------вывод всех для дерева--------------------}
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

{--------------------------------удаление из дерева----------------------------}
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


{-------------------------------проверка пустоты дерева------------------------}
function PP(s: Node): boolean;
begin
  if s = nil then begin
    writeln('Пусто');
    PP:= true;
  end
  else begin PP:= False; writeln('Дерево не пустое! Нажмите "4" для печати!', #10#10); end;
end;


{----------------------------вывод дерева--------------------------------------}
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
    arr[ high(arr), 0 ] := tr^.info;
    arr[ high(arr), 1 ] := 1;
      
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
  writeln('  Число           Кол-во повторений');
  for i := 0 to high(arr) do 
    writeln(arr[i,0]:5,arr[i,1]:20);
  
end;

{---------------Вывод в виде дерева-----------------------}
procedure Lkp(tr: Node; level: integer);
var
  i: integer;
begin
  if tr = nil then
    exit;
  Lkp(tr^.left, level + 1);
  for i:= 1 to level do
    write('  ');
  writeln(tr^.info);
  Lkp(tr^.right, level + 1);
end;

{--------------Ввод элементов с клавиатуры-------------------}
procedure manual(var tr: Node);
var
  z: Bder; n: integer;
begin
  writeln('Сколько узлов вы хотите ввести? ');
  writeln('-->'); readln(n);
  for var j:= 1 to n do begin
    writeln('Введите целое число:');
    with Z do begin
      readln(info);
      left:= nil; right:= nil;
      FORM(tr, z);
    end;
  end;
end;

{--------------------------------поиск по дереву-------------------------------}
procedure poisk_elem(tr: Node; elem: integer);
begin
  while tr <> nil do begin
    if elem = tr^.info then begin write('Узел найден!!!',  ' --> '); P(tr^); writeln; exit; end;
    if elem < tr^.info then tr:= tr^.left
                       else tr:= tr^.right;
  end;
  write('Такого значения нет, попробуйте еще раз!');
end;

begin
  repeat
    writeln('1 - Добавить элементы в дерево из файла.', #10, '2 - Добавить элемент в дерево вручную.', #10, '3 - Проверка пустоты дерева.');
    writeln('4 - Печать в виде Дерева.', #10, '5 - Поиск элемента в дереве.', #10, '6 - Удаление узла дерева в ручную', #10, '7 - Посчитать сколько раз элементы дерева встречаются в дереве', #10,'0 - выход!');
    write('  --> '); read(ans);
    case ans of
      1: begin writeln(#10, 'Создание дерева!'); tree:= nil; VVOD('data.txt'); end;
      2: manual(tree);
      3: PP(tree);
      4: begin writeln(#10, '----Печать в виде дерева!-----'); Lkp(tree, 10); end;
      5: begin writeln(#10, 'Введите целое число для поиска: '); readln(elem); poisk_elem(tree, elem); end;
      6: begin writeln(#10, 'Введите целое число для удаления из дерева:  '); readln(elem); DelTree(elem, tree); end;
      7: begin writeln(#10, '---------------------------------------------------------'); Counting(tree, array_of_numbers); VIVOD_ARRAY_OF_N(array_of_numbers);end;
    end;
  
  until ans = 0;
  
  {
  PP(tree);
  writeln('Создание дерева!');
  tree:= nil;
  VVOD('data.txt');
  writeln('Вывод узлов дерева');
  PrintDer(tree);
  {Lkp(tree, 10);
  manual(tree);
  writeln('Вывод узлов дерева');
  PrintDer(tree);}
  {readln(elem);
  poisk_elem(tree, elem); 
  
  DelTree(5, tree);
  writeln('Вывод узлов дерева');
  PrintDer(tree);
  Lkp(tree, 10);
  
  Counting(tree, array_of_numbers);
  VIVOD_ARRAY_OF_N(array_of_numbers);}
end.