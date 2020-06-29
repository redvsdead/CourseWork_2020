unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, USolidSet;

type
  TForm1 = class(TForm)
    firstEdit: TEdit;
    secondEdit: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    addfirst: TButton;
    addsecond: TButton;
    subButton: TButton;
    divButton: TButton;
    addButton: TButton;
    removefirst: TButton;
    removesec: TButton;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    firstShow: TEdit;
    secondShow: TEdit;
    answerShow: TEdit;
    procedure divButtonClick(Sender: TObject);
    procedure subButtonClick(Sender: TObject);
    procedure addButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure removefirstClick(Sender: TObject);
    procedure removesecClick(Sender: TObject);
    procedure addsecondClick(Sender: TObject);
    procedure addfirstClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  first, second, output: TBigSet;
  firstEnabled, secEnabled: boolean;

implementation

{$R *.dfm}

procedure enableButtons(add, sub, divid: TButton);
var
  enable: boolean;
begin
  enable := firstEnabled and secEnabled;
  add.Enabled := enable;
  sub.Enabled := enable;
  divid.Enabled := enable;
end;

procedure printSet(edit: TEdit; aSet: TBigSet);
begin
     edit.Text := SetToStr(aSet);
end;

procedure TForm1.addButtonClick(Sender: TObject);
begin
  output := CombineSets(first, second);
  printset(answerShow, output);
end;

procedure TForm1.addfirstClick(Sender: TObject);
var num: longInt;
begin
  if TryStrToInt(firstEdit.Text, num) then
  begin
    firstEnabled := true;
    IncludeToSet(first, num);
    enableButtons(addButton, subButton, divButton);
    printSet(firstShow, first);
  end;
end;

procedure TForm1.addsecondClick(Sender: TObject);
var
  num: longInt;
begin
  if TryStrToInt(secondEdit.Text, num) then
  begin
    secEnabled := true;
    IncludeToSet(second, num);
    enableButtons(addButton, subButton, divButton);
    printSet(secondShow, second);
  end;
end;

procedure TForm1.divButtonClick(Sender: TObject);
begin
  output := DifferenceSets(first, second);
  printset(answerShow, output);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  InitSet(first);
  InitSet(second);
  firstEnabled := false;
  secEnabled := false;
  enableButtons(addButton, subButton, divButton);
end;

procedure TForm1.removefirstClick(Sender: TObject);
var num: longInt;
begin
  if TryStrToInt(firstEdit.Text, num) then
  begin
    TryExcludeFromSet(first, num);
    if IsEmpty(first) then
      firstEnabled := false;
    enableButtons(addButton, subButton, divButton);
    printSet(firstShow, first);
  end;

end;

procedure TForm1.removesecClick(Sender: TObject);
var num: longInt;
begin
  if TryStrToInt(secondEdit.Text, num) then
  begin
    TryExcludeFromSet(second, num);
    if IsEmpty(second) then
      secEnabled := false;
    enableButtons(addButton, subButton, divButton);
    printSet(secondShow, second);
  end;
end;
procedure TForm1.subButtonClick(Sender: TObject);
begin
  output := CrossSets(first, second);
  printset(answerShow, output);
end;

end.
