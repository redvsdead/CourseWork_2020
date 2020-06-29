//модуль для работы с множествами
unit USolidSet;

interface

uses SysUtils, Windows;

type
  TSet = set of byte;
  TList = ^TNode;
  TNode = record
      Index: Integer;
      S: TSet;
      Next: TList;
  end;
  TBigSet = TList;

//инициализация множества
procedure InitSet (var S: TBigSet);
//удаление элемента из множества
procedure TryExcludeFromSet (S1: TBigSet; el: integer);
//добавление элемента в множество
procedure IncludeToSet (S1: TBigSet; el: integer);
//добавление множества в список
procedure AddSetToList(S1: TBigSet; el: TSet; ind: integer);
//удаление множества из списка
procedure RemoveSet(S1: TBigSet; el: TSet; ind: integer);
//объединение множеств
function CombineSets (S1, S2: TBigSet): TList;
//пересечение множеств
function CrossSets (S1, S2: TBigSet): TList;
//разность множеств
function DifferenceSets (S1, S2: TBigSet): TList;

function IsEmpty (S: TBigSet): boolean;
//вывод множества на экран
function SetToStr (S: TBigSet): string;
//очистка множества (до заглавного звена)
procedure ClearSet (S: TBigSet);
//удаление множества
//procedure DestroySet (var S: TBigSet);

implementation

//инициализация заглавного элемента пустым множеством
procedure InitSet (var S: TBigSet);
begin
  new(S);
    S.Index := 0;
    S.S := [];
    S.Next := nil;
end;

//добавление числа к множеству
procedure IncludeToSet (S1: TBigSet; el: integer);
var
  S, NewS: TList;
begin
  new(S);
  S := S1;
  while (S.Next <> nil) and (S.Next.Index <= el div 256) do
      begin
        S := S.Next;
      end;
  if S.Index = (el div 256) then
  begin
    S.S := S.S + [el mod 256];
  end
  else
//встраиваем новое
    begin
      new(NewS);
      NewS.Next := S.Next;
      S.Next := NewS;
      NewS.Index := el div 256;
      NewS.S := NewS.S + [el mod 256];
    end;
end;

procedure TryExcludeFromSet (S1: TBigSet; el: integer);
var
  num: Integer;
  S: TList;
begin
  new(S);
  S := S1;
  while (S.Next <> nil) and (S.Next.Index <= el div 256) do
    begin
      S := S.Next;
    end;
  if S.Index = el div 256 then
      begin
      S.S := S.S - [el mod 256];
      writeln('Элемент исключен.');
      if (S.S = []) and (S.Index > 0) then
        S := S.Next;
    end
  else
    writeln('Такого элемента в множестве нет.');
end;

function IsEmpty (S: TBigSet): boolean;
var nS: TList;
begin
  new(nS);
  nS :=  S;
  result := true;
  while nS.Next <> nil do
    result := result or (nS.S = []);
end;

procedure AddSetToList(S1: TBigSet; el: TSet; ind: integer);
var S, newp: TList;
begin
  new(S);
  S := S1;
  while (S.Next <> nil) and (S.Next.Index <= ind) do
  begin
    S := S.Next;
  end;
  if S.Index = ind then
    S.S := S.S + el
  else
  begin
    new(newp);
    newp.Next := S.Next;
    S.Next := newp;
    newp.Index := ind;
    newp.S := el;
  end;
end;

procedure RemoveSet(S1: TBigSet; el: TSet; ind: integer);
var S: TList;
begin
  new(S);
  S := S1;
  while (S.Next <> nil) and (S.Next.Index <= ind) do
  begin
    S := S.Next;
  end;
  if S.Index = ind then
  begin
    S.S := S.S - el;
    if (S.Index > 0) and (S.S = []) then
      S := S.Next;
  end;
end;


function CombineSets (S1, S2: TBigSet): TList;
var
  ptr: TList;
  i: Integer;
begin
  new(Result);
  InitSet(Result);
  ptr := S1;
  while ptr <> nil do
  begin
    AddSetToList(Result, ptr.S, ptr.Index);
    ptr := ptr.Next;
  end;
  ptr := S2;
  while ptr <> nil do
  begin
    AddSetToList(Result, ptr.S, ptr.Index);
    ptr := ptr.Next;
  end;
end;

function CrossSets (S1, S2: TBigSet): TList;
var el: TSet;
begin
  new(Result);
  while (S1 <> nil) and (S2 <> nil) do
  begin
    if S1.Index = S2.Index then
    begin
      el := S1.S * S2.S;
      AddSetToList(Result, el, S1.Index);
      S2 := S2.Next;
    end;
    S1 := S1.Next;
  end;
end;

function DifferenceSets (S1, S2: TBigSet): TList;
var el: TSet;
begin
  new(Result);
  while (S1 <> nil) and (S2 <> nil) do
  begin
    if S1.Index = S2.Index then
    begin
      el := S1.S + S2.S - S1.S * S2.S;
      AddSetToList(Result, el, S1.Index);
      S2 := S2.Next;
      S1 := S1.Next;
    end
    else
      if S1.Index < S2.Index then
      begin
        AddSetToList(Result, S1.S, S1.Index);
        S1 := S1.Next;
      end
    else
      begin
        AddSetToList(Result, S2.S, S2.Index);
        S2 := S2.Next;
      end;
  end;
  while S1 <> nil do
    begin
    AddSetToList(Result, S1.S, S1.Index);
    S1 := S1.Next;
    end;
  while S2 <> nil do
    begin
    AddSetToList(Result, S2.S, S1.Index);
    S2 := S2.Next;
    end
end;

function SetToStr (S: TBigSet): string;
var
  i, num: integer;
  ptr: TList;
begin
  new(ptr);
  ptr := S;
  result := '';
  while ptr <> nil do
  begin
    for i := 0 to 255 do
      if i in ptr.S then
        begin
          num := ptr.Index * 256 + i;
          result := result + IntToStr(num) + '  ';
        end;
    ptr := ptr.Next;
  end;
  dispose(ptr);
end;

procedure ClearSet (S: TBigSet);
var
  ptr: TList;
begin
  new(ptr);
  S.S := [];
  ptr := S.Next;
  while S <> nil do
  begin
    ptr := S;
    S := S.Next;
    dispose(ptr);
  end;
end;

end.
