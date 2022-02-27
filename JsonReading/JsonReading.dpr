program JsonReading;

uses
  Vcl.Forms,
  FroJsonOutput in 'FroJsonOutput.pas' {FrmJsonRead},
  JsonUtils in 'JsonUtils.pas',
  StockType_u in 'StockType_u.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmJsonRead, FrmJsonRead);
  Application.Run;
end.
