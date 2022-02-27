program JsonWorkbench;

uses
  System.StartUpCopy,
  FMX.Forms,
  fmWorkBench in 'fmWorkBench.pas' {Form1},
  Writers in 'Writers.pas',
  Converters in 'Converters.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
