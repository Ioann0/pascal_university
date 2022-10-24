program exam;
const N = 3;
type PSTRC = ^STRC;
     STRC = record
        inf: array of real;
        ptr: PSTRC;
     end;
var q: PSTRC;
    fl: text;
    a:= new real[3];
    ccou: integer;


    
procedure zapolnenie_mas(link: string; a: array of real);
var el: real; i: integer;
begin
  assign(fl, link); reset(fl);
  
  while not eof(fl) do begin
    readln(fl, el);
    a[i]:= el;
    inc(i)
  end;
  close(fl);
  inc(ccou);
end;


procedure dop(var q: PSTRC; dat: array of real);
var nov, cur, pr: PSTRC;
begin
  cur:= q; pr:= nil;
  new(nov);
  nov^.inf:= dat;
  nov^.ptr:= nil;
  while cur <> nil do begin
    pr:= cur; cur:= cur^.ptr;
  end;
  if pr <> nil then pr^.ptr:= nov
               else q:= nov;
end;

procedure VIVOD(q: PSTRC);
var nov: PSTRC;
begin
  nov:= q;
  while (nov <> nil) do begin
    write(nov^.inf:3);
    nov:= nov^.ptr;
  end;
  writeln;
end; 

procedure zadanie(q: PSTRC);
var cur: PSTRC; i, j, t: integer;
    k: real;
    a: array of real;
    b: array of real;
    cou: integer;
begin
  cur:= q;
  cou:= 0;
  SetLength(a,N);
  SetLength(b, N);
  while cur <> nil do begin
    k:= 1;
    for i:= 0 to 2 do begin
      if cur^.inf[i] < 0 then begin
        a[cou]:= cur^.inf[i];
        inc(cou);
      end;
    end;
    for j:=0 to high(a) do 
      if a[j] <> 0 then begin
        k:= k * a[j];
      end;
    for j:= t to N do b[t]:= k; 
    cou:= 0;
    inc(t);
    cur:= cur^.ptr;
  end;
  writeln('Отрицательные произведения массивов: ');
  for i:=0 to high(b) do begin
    writeln('--> ', b[i]:15:8);
  end;
 // writeln(b);
end;


begin
  zapolnenie_mas('exam1.txt', a);
  dop(q, a);
  a:= nil;
  SetLength(a, N);
  zapolnenie_mas('exam2.txt', a);
  dop(q, a);
  writeln('---VIVOD vsex elementov---');
  VIVOD(q);
  writeln;
  zadanie(q);
end.