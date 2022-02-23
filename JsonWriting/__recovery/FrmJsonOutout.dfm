object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'JSON Writing - Delphi'
  ClientHeight = 451
  ClientWidth = 634
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 15
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 634
    Height = 41
    Align = alTop
    Padding.Left = 10
    Padding.Top = 5
    Padding.Right = 10
    Padding.Bottom = 5
    TabOrder = 0
    object BtnDOM: TButton
      Left = 11
      Top = 6
      Width = 75
      Height = 29
      Align = alLeft
      Caption = 'DOM'
      TabOrder = 0
      OnClick = BtnDOMClick
    end
    object BtnWriter: TButton
      Left = 86
      Top = 6
      Width = 75
      Height = 29
      Margins.Left = 10
      Align = alLeft
      Caption = 'Writer'
      TabOrder = 1
      OnClick = BtnWriterClick
    end
    object BtnBuilder: TButton
      Left = 161
      Top = 6
      Width = 75
      Height = 29
      Align = alLeft
      Caption = 'Builder'
      TabOrder = 2
      OnClick = BtnBuilderClick
    end
    object BitBtn1: TBitBtn
      Left = 548
      Top = 6
      Width = 75
      Height = 29
      Align = alRight
      Kind = bkClose
      NumGlyphs = 2
      TabOrder = 3
    end
    object BtnClear: TButton
      Left = 473
      Top = 6
      Width = 75
      Height = 29
      Align = alRight
      Caption = 'Clear'
      TabOrder = 4
      OnClick = BtnClearClick
    end
  end
  object PanelBottom: TPanel
    Left = 0
    Top = 41
    Width = 634
    Height = 410
    Align = alClient
    Padding.Left = 10
    Padding.Top = 10
    Padding.Right = 10
    Padding.Bottom = 10
    TabOrder = 1
    object MemoResult: TMemo
      Left = 11
      Top = 11
      Width = 612
      Height = 388
      Align = alClient
      Color = clSkyBlue
      Lines.Strings = (
        '')
      TabOrder = 0
    end
  end
end
