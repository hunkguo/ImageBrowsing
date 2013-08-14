object Form1: TForm1
  Left = 301
  Top = 198
  Width = 913
  Height = 539
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 0
    Width = 9
    Height = 501
  end
  object Gauge1: TGauge
    Left = 144
    Top = 472
    Width = 257
    Height = 25
    Progress = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 8
    Width = 257
    Height = 225
    Caption = 'Panel1'
    TabOrder = 0
    object Splitter2: TSplitter
      Left = 1
      Top = 1
      Width = 257
      Height = 223
    end
    object Panel4: TPanel
      Left = 8
      Top = 8
      Width = 241
      Height = 33
      Caption = #36873#25321#27983#35272#25991#20214#22841
      TabOrder = 0
    end
    object ShellTreeView1: TShellTreeView
      Left = 24
      Top = 56
      Width = 217
      Height = 153
      ObjectTypes = [otFolders]
      Root = 'rfDesktop'
      UseShellImages = True
      AutoRefresh = False
      Indent = 19
      ParentColor = False
      RightClickSelect = True
      ShowRoot = False
      TabOrder = 1
      OnClick = ShellTreeView1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 240
    Width = 257
    Height = 225
    Caption = 'Panel2'
    TabOrder = 1
    object Image1: TImage
      Left = 16
      Top = 48
      Width = 233
      Height = 161
    end
    object Panel5: TPanel
      Left = 8
      Top = 8
      Width = 241
      Height = 25
      Caption = #22270#29255#27983#35272
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 280
    Top = 0
    Width = 561
    Height = 465
    Caption = 'Panel3'
    TabOrder = 2
    object Label1: TLabel
      Left = 56
      Top = 192
      Width = 31
      Height = 13
      Caption = 'Label1'
    end
    object ScrollBox1: TScrollBox
      Left = 1
      Top = 1
      Width = 559
      Height = 463
      Align = alClient
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = ScrollBox1Click
      OnMouseMove = ScrollBox1MouseMove
    end
  end
  object Panel6: TPanel
    Left = 488
    Top = 472
    Width = 225
    Height = 25
    Caption = 'Panel6'
    TabOrder = 3
  end
end
