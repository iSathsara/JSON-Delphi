unit FrmJsonOutout;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TForm1 = class(TForm)
    PanelTop: TPanel;
    BtnDOM: TButton;
    BtnWriter: TButton;
    BtnBuilder: TButton;
    PanelBottom: TPanel;
    MemoResult: TMemo;
    BitBtn1: TBitBtn;
    BtnClear: TButton;
    procedure BtnDOMClick(Sender: TObject);
    procedure BtnClearClick(Sender: TObject);
    procedure BtnWriterClick(Sender: TObject);
    procedure BtnBuilderClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  System.JSON,
  System.JSON.Types,
  System.JSON.Writers,
  System.JSON.Builders;



procedure TForm1.BtnClearClick(Sender: TObject);
begin
  MemoResult.Lines.Clear;
end;

// --------- DOM ---------------------------------------------------------------
procedure TForm1.BtnDOMClick(Sender: TObject);
var
  ObjStock, ObjS1, ObjS2: TJSONObject;
  arrStocks: TJSONArray;
begin
  ObjStock := TJSONObject.Create;
  try
    // create json array.
    arrStocks := TJSONArray.Create;

    ObjS1 := TJSONObject.Create;
    ObjS1.AddPair('symbol', TJSONString.Create('Fierri'));
    ObjS1.AddPair('price', TJSONNumber.Create(180.8));
    arrStocks.Add(ObjS1);

    ObjS2 := TJSONObject.Create;
    ObjS2.AddPair('symbol', TJSONString.Create('esparco'));
    ObjS2.AddPair('price', TJSONNumber.Create(133.5));
    arrStocks.Add(ObjS2);

    // add array to stocks object.
    ObjStock.AddPair('stocks', arrStocks);

    MemoResult.Lines.Clear;
    MemoResult.Lines.Add(ObjStock.ToString);
  finally
    ObjStock.Free;
  end;
end;

// ----------- WRITER ----------------------------------------------------------
procedure TForm1.BtnWriterClick(Sender: TObject);
var
  StringWriter: TStringWriter;
  Writer: TJsonTextWriter;
begin
  StringWriter := TStringWriter.Create;
  Writer := TJsonTextWriter.Create(StringWriter);

  try
    Writer.Formatting := TJsonFormatting.Indented;

    // main object
    Writer.WriteStartObject;                     // json object
    Writer.WritePropertyName('Stocks');          // object name
    Writer.WriteStartArray;                      // set object as array

    // inside values
    Writer.WriteStartObject;                     // defeine inside objects
    Writer.WritePropertyName('symbol');
    Writer.WriteValue('Fierri');
    Writer.WritePropertyName('price');
    Writer.WriteValue(180.8);
    Writer.WriteEndObject;                       // end object

    Writer.WriteStartObject;
    Writer.WritePropertyName('symbol');
    Writer.WriteValue('esparco');
    Writer.WritePropertyName('price');
    Writer.WriteValue(133.5);
    Writer.WriteEndObject;

    Writer.WriteEndArray;                        // end array
    Writer.WriteEndObject;                       // end the object

    MemoResult.Lines.Clear;
    MemoResult.Lines.Add(StringWriter.ToString);
  finally
    Writer.Free;
  end;

end;

// -------- BUILDER ------------------------------------------------------------
procedure TForm1.BtnBuilderClick(Sender: TObject);
var
  Writer: TJsonTextWriter;
  StringWriter: TStringWriter;
  Builder: TJSONObjectBuilder;
begin
  StringWriter := TStringWriter.Create;
  Writer := TJsonTextWriter.Create(StringWriter);
  Builder := TJSONObjectBuilder.Create(Writer);

  try
    Writer.Formatting := TJsonFormatting.Indented;

    Builder
      .BeginObject
        .BeginArray('Stocks')
          .BeginObject
            .Add('symbol', 'Fierri')
            .Add('price', 180.8)
          .EndObject
          .BeginObject
            .Add('symbol', 'esparco')
            .Add('price', 133.5)
          .EndObject
        .EndArray
      .EndObject;

    MemoResult.Lines.Clear;
    MemoResult.Lines.Add(StringWriter.ToString);
  finally
    StringWriter.Free;
    Writer.Free;
    Builder.Free;
  end;
end;

end.
