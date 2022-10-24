program Dijkstraall;
uses modul;
const N = 6; inf = 100000;
type vektor = array[1..N] of integer;
     tm = array[1..N, 1..N] of integer;
var start: integer;
    ans: integer;
// задается матрица начальных значений размера NxN.
const GR: tm = (
  (0, 9, 1, 4, 0, 0), //1
  (0, 0, 0, 0, 0, 0), //2
  (1, 0, 0, 3, 2, 4), //3
  (4, 0, 3, 0, 0, 1), //4
  (0, 0, 2, 0, 0, 2), //5
  (0, 0, 4, 1, 2, 0)  //6
  );


procedure Dijkstra(GR: tm; st: integer);
var count, index, i, u, m, min: integer;
    distance: vektor;
    visited: array[1..N] of boolean;
begin 
  m:=st;
  for i:=1 to N do begin distance[i]:=inf; visited[i]:=false; end;
  distance[st]:=0;
  for count:=1 to N-1 do begin 
    min:=inf;
    for i:=1 to N do
      if (not visited[i]) and (distance[i]<=min) then begin
        min:=distance[i]; index:=i; end;
    u:=index;
    visited[u]:=true;
    for i:=1 to N do if (not visited[i]) and (GR[u, i]<>0) and (distance[u]<>inf) and
 (distance[u]+GR[u, i]<distance[i]) then distance[i]:=distance[u]+GR[u, i];
 end;
 write('Стоимость пути из начальной вершины до остальных:'); writeln;
 for i:=1 to N do if distance[i]<>inf then begin writeln(m,' > ', i,' = ', distance[i]); writeln(fl, distance[i]);  end
 else writeln(m,' -> ', i,' = ', 'маршрут недоступен');
end;

{основной блок программы}
begin
 repeat
 writeln('Введите вариант для работа программы');
 writeln('1 - для задания вершины, 2 - для вывода дерева путей, 0 - для выхода');
 readln(ans);
 case ans of
 1: begin writeln('Задайте начальную вершину!');
    write('Начальная вершина >> '); read(start); assign(fl, 'data_4.txt'); rewrite(fl); Dijkstra(GR, start); close(fl); end;
 2: begin tree:= nil; VVOD('data_4.txt'); writeln('>>>>дерево путей<<<<'); PrintDer(tree); end;
 end;
 until ans = 0;
end.
