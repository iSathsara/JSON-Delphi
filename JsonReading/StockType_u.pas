unit StockType_u;

interface

uses
  System.Generics.Collections;

type
  // single stock object
  TStock = class
  private
    fSymbol : String;
    fPrice  : Double;
    procedure SetSymbol(Const aSymbol: String);
    procedure SetPrice(Const aPrice: Double);
  public
    property Symbol : String read fSymbol write SetSymbol;
    property Price : Double read fPrice write SetPrice;
  end;

type
  // put stock by stock into the list.
  TStocks = TObjectList<TStock>;

implementation

{ TStock }

procedure TStock.SetPrice(const aPrice: Double);
begin
  fPrice := aPrice;
end;

procedure TStock.SetSymbol(const aSymbol: String);
begin
  fSymbol := aSymbol;
end;

end.
