object FrmJsonRead: TFrmJsonRead
  Left = 0
  Top = 0
  Caption = 'JSON Reading - Delphi'
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
  object Panel1: TPanel
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
    object BtnReadWithDom: TButton
      Left = 429
      Top = 6
      Width = 119
      Height = 29
      Align = alRight
      Caption = 'Read With DOM'
      TabOrder = 0
      OnClick = BtnReadWithDomClick
    end
    object BtnReadWithReader: TButton
      Left = 309
      Top = 6
      Width = 120
      Height = 29
      Align = alRight
      Caption = 'Read With Reader'
      TabOrder = 1
      OnClick = BtnReadWithReaderClick
    end
    object BtnReadTokens: TButton
      Left = 11
      Top = 6
      Width = 120
      Height = 29
      Align = alLeft
      Caption = 'Read Tokens'
      TabOrder = 2
      OnClick = BtnReadTokensClick
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
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 634
    Height = 410
    Align = alClient
    TabOrder = 1
    object MemoJson: TMemo
      Left = 1
      Top = 1
      Width = 185
      Height = 408
      Align = alLeft
      Lines.Strings = (
        '{'
        '  "Stocks": ['
        '    {'
        '      "symbol": "Falkan",'
        '      "price": 175.5'
        '    },'
        '    {'
        '      "symbol": "esparco",'
        '      "price": 221.7'
        '    }'
        '  ]'
        '}')
      TabOrder = 0
    end
    object ListBoxTokens: TListBox
      Left = 186
      Top = 1
      Width = 161
      Height = 408
      Align = alLeft
      ItemHeight = 15
      TabOrder = 1
    end
    object MemoResult: TMemo
      Left = 347
      Top = 1
      Width = 286
      Height = 408
      Align = alClient
      Lines.Strings = (
        '')
      TabOrder = 2
    end
  end
end
