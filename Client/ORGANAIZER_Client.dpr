program ORGANAIZER_Client;

uses
  Forms,
  menu in 'menu.pas' {Login},
  main in 'main.pas' {Tasks},
  Cr_task in 'Cr_task.pas' {Create_task};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TLogin, Login);
  Application.CreateForm(TTasks, Tasks);
  Application.CreateForm(TCreate_task, Create_task);
  img_nazn_id := $0;
  img_vipoln_id := $0;
  Application.Run;
end.
