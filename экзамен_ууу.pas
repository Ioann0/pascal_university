program exam;
const N = 3;
type PSTRC = ^STRC;
     STRC = record
        inf: array of real;
        ptr: PSTRC;
     end;
var q: PSTRC;
    i: integer;
    err: boolean;
    fl: text;
    a:= new real[3];
    
    
    
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
end;
    
{
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
}

function cht(q: PSTRC; var err: boolean): array of real;
begin
  if q <> nil then begin
    err:= false;
    cht:= q^.inf
                   end
                   else begin
                     write('Ошибка, нет элементов!');
                     err:= true;
                   end;
end;

procedure VIVOD(q: PSTRC);
var nov: PSTRC;
begin
  nov:= q;
  while (nov <> nil) do begin
    write(nov^.inf:3);
    nov:= nov^.ptr;
  end;
end; 
{ 
procedure zadanie(q: PSTRC);
var nov, cur: PSTRC; i: integer; 
    a: array of real;
    b: array of real;
begin
  cur:= q;
  while cur <> nil do begin
    write(cur^.inf);
    cur:= cur^.ptr;
  end;
end;
}


 
begin
  zapolnenie_mas('exam1.txt', a);
  q:= nil;
  //dop(q, a);
  a:= nil;
  SetLength(a, N);
  zapolnenie_mas('exam2.txt', a);
  //dop(q, a);
  writeln('----------------------------');
  write('chtenie 1 elementa: ', cht(q, err), #10#10);
  writeln('--VIVOD vsex elementov---');
  VIVOD(q);
  //q:= nil;
  //zadanie(q);
end.