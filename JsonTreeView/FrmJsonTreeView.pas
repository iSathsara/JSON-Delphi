unit FrmJsonTreeView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls,
  JSONTreeView, JSONDoc;

type
  TFrmTreeView = class(TForm)
    JSONDocument1: TJSONDocument;
    JSONTreeView1: TJSONTreeView;
    Panel1: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTreeView: TFrmTreeView;

implementation

{$R *.dfm}



end.
