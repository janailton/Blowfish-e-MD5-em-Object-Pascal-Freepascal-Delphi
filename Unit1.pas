{

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

}




unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, LbCipher, LbClass;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Memo2: TMemo;
    md5: TLbMD5;
    Button1: TButton;
    Button2: TButton;
    EditSenha: TEdit;
    Label1: TLabel;
    LbBlowfish1: TLbBlowfish;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


function bintostr(const bin: array of byte): string;
const HexSymbols = '0123456789ABCDEF';
var i: integer;
begin
  SetLength(Result, 2*Length(bin));
  for i :=  0 to Length(bin)-1 do begin
    Result[1 + 2*i + 0] := HexSymbols[1 + bin[i] shr 4];
    Result[1 + 2*i + 1] := HexSymbols[1 + bin[i] and $0F];
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
 dig: Tmd5Digest;
begin
  md5.HashString(memo1.Lines.Text);
  md5.GetDigest(dig);
  memo2.Lines.Text:= bintostr(dig);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  LbBlowfish1.GenerateKey(editsenha.Text);
  memo2.Lines.Text:= LbBlowfish1.EncryptString(memo1.Lines.Text);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  LbBlowfish1.GenerateKey(editsenha.Text);
  memo2.Lines.Text:= LbBlowfish1.DecryptString(memo1.Lines.Text);
end;

end.
