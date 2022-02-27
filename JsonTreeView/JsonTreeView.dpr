program JsonTreeView;

uses
  Vcl.Forms,
  FrmJsonTreeView in 'FrmJsonTreeView.pas' {FrmTreeView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmTreeView, FrmTreeView);
  Application.Run;
end.
