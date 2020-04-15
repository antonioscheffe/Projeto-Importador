unit USenha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask,uprincipal;

type
  TfrmLogin = class(TForm)
    edtSenha: TMaskEdit;
    cbbBase: TComboBox;
    edtnumChamadoEntrada: TEdit;
    mmchamadosNumeros: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure edtSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure carregaChamado;
    procedure salvaChamado;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

procedure TfrmLogin.carregaChamado;
begin
   if FileExists('c:\log\chamado.txt') then
      mmchamadosNumeros.Lines.LoadFromFile('c:\log\chamado.txt');
end;

procedure TfrmLogin.salvaChamado;
begin
  frmPrincipal.edtCodChamado.Text := edtnumChamadoEntrada.text;
  frmPrincipal.carregarConsulta;
   mmchamadosNumeros.lines.SaveToFile('C:\log\chamado.txt');
end;

procedure TfrmLogin.edtSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  if edtnumChamadoEntrada.text <>'' then
  begin
     if edtSenha.Text = 'Jcs030291' then
     begin
       self.Hide;
       if cbbBase.ItemIndex =0 then
       begin
         frmPrincipal.SQLConnection1.Params.Clear;
         frmPrincipal.SQLConnection1.Params.Add('DriverName=Oracle');
         frmPrincipal.SQLConnection1.Params.Add('DataBase=dbhomolog');
         frmPrincipal.SQLConnection1.Params.Add('User_Name=sapiensh');
         frmPrincipal.SQLConnection1.Params.Add('Password=sapiensh');
         frmPrincipal.SQLConnection1.Params.Add('RowsetSize=20');
         frmPrincipal.SQLConnection1.Params.Add('BlobSize=-1');
         frmPrincipal.SQLConnection1.Params.Add('ErrorResourceFile=');
         frmPrincipal.SQLConnection1.Params.Add('LocaleCode=0000');
         frmPrincipal.SQLConnection1.Params.Add('Oracle TransIsolation=ReadCommited');
         frmPrincipal.SQLConnection1.Params.Add('OS Authentication=False'     );
         frmPrincipal.SQLConnection1.Params.Add('Multiple Transaction=False');
         frmPrincipal.SQLConnection1.Params.Add('Trim Char=False');
         frmPrincipal.SQLConnection1.connected:=true;
         salvaChamado;
         frmPrincipal.ShowModal;


       end;
       if cbbBase.ItemIndex =1 then
       begin
       frmPrincipal.SQLConnection1.connected :=false;
         frmPrincipal.SQLConnection1.Params.Clear;
         frmPrincipal.SQLConnection1.Params.Add('DriverName=Oracle');
         frmPrincipal.SQLConnection1.Params.Add('DataBase=dbprod');
//         frmPrincipal.SQLConnection1.Params.Add('User_Name=erpconsulta');
//         frmPrincipal.SQLConnection1.Params.Add('Password=blukit2015$');
         frmPrincipal.SQLConnection1.Params.Add('User_Name=sapiens');
         frmPrincipal.SQLConnection1.Params.Add('Password=sapiens');
         frmPrincipal.SQLConnection1.Params.Add('RowsetSize=20');
         frmPrincipal.SQLConnection1.Params.Add('BlobSize=-1');
         frmPrincipal.SQLConnection1.Params.Add('ErrorResourceFile=');
         frmPrincipal.SQLConnection1.Params.Add('LocaleCode=0000');
         frmPrincipal.SQLConnection1.Params.Add('Oracle TransIsolation=ReadCommited');
         frmPrincipal.SQLConnection1.Params.Add('OS Authentication=False'     );
         frmPrincipal.SQLConnection1.Params.Add('Multiple Transaction=False');
         frmPrincipal.SQLConnection1.Params.Add('Trim Char=False');
         frmPrincipal.SQLConnection1.connected:=true;
         salvaChamado; 
         frmPrincipal.ShowModal;

       end;
       self.close;
     end;
   end
   else
      ShowMessage('� necess�rio informar um chamado!!!');

end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
   edtnumChamadoEntrada.setfocus;
   carregaChamado;
end;

end.
