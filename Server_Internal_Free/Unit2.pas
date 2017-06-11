unit Unit2;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, Organaizer_Server_TLB, StdVcl, ExtCtrls, IBStoredProc, IBQuery,
  Provider, DB, IBCustomDataSet, IBTable, IBDatabase;

type
  TRemoteDM = class(TRemoteDataModule, IRemoteDM)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    tbl_task: TIBTable;
    dsp_task_v: TDataSetProvider;
    ibq_create_task: TIBQuery;
    dsp_create_task: TDataSetProvider;
    tbl_users: TIBTable;
    tbl_status: TIBTable;
    dsp_users: TDataSetProvider;
    dsp_status: TDataSetProvider;
    ibsp_norm_task: TIBStoredProc;
    t_norm_task: TTimer;
    ibq_user_id: TIBQuery;
    dsp_user_id: TDataSetProvider;
    ibq_users: TIBQuery;
    ibq_task_v: TIBQuery;
    dsp_task_tbl: TDataSetProvider;
    ibq_task_tree: TIBQuery;
    dsp_task_tree: TDataSetProvider;
    procedure t_norm_taskTimer(Sender: TObject);
  private
    { Private declarations }
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

class procedure TRemoteDM.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
begin
  if Register then
  begin
    inherited UpdateRegistry(Register, ClassID, ProgID);
    EnableSocketTransport(ClassID);
    EnableWebTransport(ClassID);
  end else
  begin
    DisableSocketTransport(ClassID);
    DisableWebTransport(ClassID);
    inherited UpdateRegistry(Register, ClassID, ProgID);
  end;
end;

procedure TRemoteDM.t_norm_taskTimer(Sender: TObject);
begin
  ibsp_norm_task.ExecProc;
end;

initialization
  TComponentFactory.Create(ComServer, TRemoteDM,
    Class_RemoteDM, ciInternal, tmFree);
end.
