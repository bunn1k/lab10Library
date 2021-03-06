unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    RichEdit1: TRichEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  SummaX_Y: function(X, Y: real): real;
  ProizvX_Y: function(X, Y: real): real;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  H: THandle;
  X, Y: real;
begin
  RichEdit1.Clear;
  X := StrToFloat(Edit1.Text);
  Y := StrToFloat(Edit2.Text);

  H := LoadLibrary('MainDll.dll');

  if H <> 0 then
  begin
    @SummaX_Y := GetProcAddress(H, 'SummaX_Y');
    if @SummaX_Y <> nil then
      RichEdit1.Lines.Add(FloatToStr(SummaX_Y(X, Y)));

    FreeLibrary(H);
  end;

end;

procedure TForm1.Button2Click(Sender: TObject);
var
  H: THandle;
  X, Y: real;
begin
  RichEdit1.Clear;
  X := StrToFloat(Edit1.Text);
  Y := StrToFloat(Edit2.Text);

  H := LoadLibrary('MainDll.dll');

  if H <> 0 then
  begin
    @ProizvX_Y := GetProcAddress(H, 'ProizvX_Y');
    if @ProizvX_Y <> nil then
      RichEdit1.Lines.Add(FloatToStr(ProizvX_Y(X, Y)));

    FreeLibrary(H);
  end;

end;

end.
