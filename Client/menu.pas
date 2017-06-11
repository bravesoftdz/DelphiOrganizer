unit menu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, TrayIcon, DB, DBClient, MConnect, SConnect, main;

type
  TLogin = class(TForm)
    TrayIcon1: TTrayIcon;
    lbe_login: TLabeledEdit;
    lbe_password: TLabeledEdit;
    cds_user_id: TClientDataSet;
    OK: TButton;
    Cancel: TButton;
    Label1: TLabel;
    cds_user: TClientDataSet;
    SocketConnection1: TSocketConnection;
    procedure OKClick(Sender: TObject);
    procedure lbe_passwordKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Login: TLogin;
  //user_id: integer;
  //Passw: String;

implementation

{$R *.dfm}

procedure TLogin.OKClick(Sender: TObject);
begin
try
{cds_user_id.Active := false;
cds_user_id.Params.ParamByName('login').AsString := lbe_login.Text;
cds_user_id.Params.ParamByName('password').AsString := Passw; //lbe_password.Text;
cds_user_id.Active := true;
user_id := cds_user_id.FieldByName('code').Value;
label1.Caption := '����� ���������� ' + cds_user_id.FieldByName('fio').Value + '!';
label1.Visible := true;
Passw := '';
Login.Hide;
Tasks.Show; }
cds_user.Close;
cds_user.CommandText := 'select * from users us where us.login = ' + '''' + lbe_login.Text + '''' + ' and  us."PASSWORD" = ' + lbe_password.Text +';';
cds_user.Open;
user_id := cds_user.FieldByName('code').Value;
label1.Caption := '����� ���������� ' + cds_user.FieldByName('fio').Value + '!';
label1.Visible := true;
lbe_password.Text := '';
cds_user.Close;
cds_user.Active := false;
Login.Hide;
Tasks.Show;
Tasks.time_task.Enabled := true;

except
showmessage('������� ���������� ����� � ������!');
end;


end;

procedure TLogin.lbe_passwordKeyPress(Sender: TObject; var Key: Char);
begin
{
if ord(key) = 8 then
  begin
    Passw := copy(Passw,1,length(Passw)-1);
    lbe_password.Text := copy(lbe_password.Text,1,length(Passw));
   // lbe_password.PasswordChar := 'q';
  end
  else
  begin
    Passw := Passw + Key;
    Key := '*';
  end;
}
end;

procedure TLogin.FormCreate(Sender: TObject);
begin
SocketConnection1.Connected := true;
end;

end.
