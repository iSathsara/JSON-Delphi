unit FroJsonOutput;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, JsonUtils, StockType_u,
  System.JSON,
  System.JSON.Types,
  System.JSON.Builders,
  System.JSON.Readers;

type
  TFrmJsonRead = class(TForm)
    Panel1: TPanel;
    BtnReadWithDom: TButton;
    BtnReadWithReader: TButton;
    BtnReadTokens: TButton;
    Panel2: TPanel;
    MemoJson: TMemo;
    ListBoxTokens: TListBox;
    MemoResult: TMemo;
    BitBtn1: TBitBtn;
    procedure BtnReadTokensClick(Sender: TObject);
    procedure BtnReadWithDomClick(Sender: TObject);
  private
    { Private declarations }
    function GetJsonText: String;
    procedure ProcessStockObj(stocks: TStocks; stockObj: TJSONObject);
    procedure DisplayStocks(stocks:TStocks);
    procedure Log(s: String);
  public
    { Public declarations }
  end;

var
  FrmJsonRead: TFrmJsonRead;

implementation

{$R *.dfm}
{______________________________________________________________________________}
procedure TFrmJsonRead.BtnReadTokensClick(Sender: TObject);
var
  jsonText: String;
  sr: TStringReader;
  jtr: TJsonTextReader;
  s: String;
begin
  ListBoxTokens.Items.Clear;
  jsonText := GetJsonText;
  sr := TStringReader.Create(jsonText);

  try
    jtr := TJsonTextReader.Create(sr);
    try
      while jtr.Read do begin
        s := JsonTokenToString(jtr.TokenType);    // get relevant token type (from JsonUtils)
        ListBoxTokens.Items.Add(s);               // add to thelist box
      end;
    finally
      jtr.Free;
    end;
  finally
    sr.Free;
  end;
end;
{______________________________________________________________________________}
procedure TFrmJsonRead.BtnReadWithDomClick(Sender: TObject);
var
  stocks: TStocks;
  valRoot: TJSONValue;
  valStocks: TJSONValue;
  objRoot: TJSONObject;
  arrStocks: TJSONArray;
  i: Integer;
begin
  stocks := TStocks.Create;
  try
    valRoot := TJSONObject.ParseJSONValue(GetJsonText);
    if valRoot <> nil then begin
      objRoot := TJSONObject(valRoot);
      if objRoot.Count > 0 then begin
        valStocks := objRoot.Values['Stocks'];
        if valStocks <> nil then begin
          if valStocks is TJSONArray then begin
            arrStocks := TJSONArray(valStocks);
            for i := 0 to arrStocks.Count - 1 do begin
              if arrStocks.Items[i] is TJSONObject then
                ProcessStockObj(stocks, TJSONObject(arrStocks.Items[i]));
            end;
          end;
        end;
      end;
    end;
    // need to display values
    DisplayStocks(stocks);
  finally
    stocks.Free;
  end;
end;
procedure TFrmJsonRead.DisplayStocks(stocks: TStocks);
var stock: TStock;
    i : integer;
begin
  MemoResult.Lines.Clear;

  Log(DateTimeToStr(now));
  Log('----------------');

  if stocks <> nil then begin
    Log('Stock Count : '+stocks.Count.ToString);
    Log('');
    // loop through stock list
    for i := 0 to stocks.Count - 1 do begin
      stock := stocks[i];
      Log('Stock Nr : '+i.ToString);
      Log('Stock Nom: '+stock.Symbol);
      Log('Stock Ptr: '+stock.Price.ToString);
      Log('==================');
      Log('');
    end;
  end else Log('No Stocks found!');
end;

{______________________________________________________________________________}
function TFrmJsonRead.GetJsonText: String;
Var s: String;
begin
  for s in MemoJson.Lines do
    Result := Result + s;
end;
procedure TFrmJsonRead.Log(s: String);
begin
  MemoResult.Lines.Add(s);
end;

{______________________________________________________________________________}
procedure TFrmJsonRead.ProcessStockObj(stocks: TStocks; stockObj: TJSONObject);
var stock: TStock; val: TJSONValue;
begin
  stock := TStock.Create;
  val := stockObj.Values['symbol'];
  if val <> nil then
    if val is TJSONString then
      stock.Symbol := TJSONString(val).Value;

  val := stockObj.Values['price'];
  if val <> nil then
    if val is TJSONNumber then
      stock.price := TJSONNumber(val).AsDouble;

  stocks.Add(stock);
end;

end.
