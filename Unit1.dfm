object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 423
  ClientWidth = 718
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 59
    Width = 189
    Height = 13
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1101#1083#1077#1084#1077#1085#1090' '#1074#1090#1086#1088#1086#1075#1086' '#1084#1085#1086#1078#1077#1089#1090#1074#1072
  end
  object Label2: TLabel
    Left = 32
    Top = 16
    Width = 189
    Height = 13
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1101#1083#1077#1084#1077#1085#1090' '#1087#1077#1088#1074#1086#1075#1086' '#1084#1085#1086#1078#1077#1089#1090#1074#1072
  end
  object Label3: TLabel
    Left = 24
    Top = 128
    Width = 99
    Height = 13
    Caption = #1055#1077#1088#1074#1086#1077' '#1084#1085#1086#1078#1077#1089#1090#1074#1086':'
  end
  object Label4: TLabel
    Left = 24
    Top = 204
    Width = 98
    Height = 13
    Caption = #1042#1090#1086#1088#1086#1077' '#1084#1085#1086#1078#1077#1089#1090#1074#1086':'
  end
  object Label5: TLabel
    Left = 24
    Top = 285
    Width = 53
    Height = 13
    Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090
  end
  object firstEdit: TEdit
    Left = 24
    Top = 32
    Width = 257
    Height = 21
    TabOrder = 0
  end
  object secondEdit: TEdit
    Left = 24
    Top = 80
    Width = 257
    Height = 21
    TabOrder = 1
  end
  object addfirst: TButton
    Left = 304
    Top = 30
    Width = 73
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 2
    OnClick = addfirstClick
  end
  object addsecond: TButton
    Left = 304
    Top = 78
    Width = 73
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 3
    OnClick = addsecondClick
  end
  object addButton: TButton
    Left = 480
    Top = 144
    Width = 193
    Height = 41
    Caption = #1053#1072#1081#1090#1080' '#1086#1073#1098#1077#1076#1080#1085#1077#1085#1080#1077' '#1084#1085#1086#1078#1077#1089#1090#1074
    TabOrder = 4
    OnClick = addButtonClick
  end
  object subButton: TButton
    Left = 480
    Top = 213
    Width = 193
    Height = 41
    Caption = #1053#1072#1081#1090#1080' '#1087#1077#1088#1077#1089#1077#1095#1077#1085#1080#1077' '#1084#1085#1086#1078#1077#1089#1090#1074
    TabOrder = 5
    OnClick = subButtonClick
  end
  object divButton: TButton
    Left = 480
    Top = 285
    Width = 193
    Height = 41
    Caption = #1053#1072#1081#1090#1080' '#1088#1072#1079#1085#1086#1089#1090#1100' '#1084#1085#1086#1078#1077#1089#1090#1074
    TabOrder = 6
    OnClick = divButtonClick
  end
  object removefirst: TButton
    Left = 416
    Top = 30
    Width = 73
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 7
    OnClick = removefirstClick
  end
  object removesec: TButton
    Left = 416
    Top = 78
    Width = 73
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 8
  end
  object firstShow: TEdit
    Left = 24
    Top = 147
    Width = 393
    Height = 21
    ReadOnly = True
    TabOrder = 9
  end
  object secondShow: TEdit
    Left = 24
    Top = 223
    Width = 393
    Height = 21
    ReadOnly = True
    TabOrder = 10
  end
  object answerShow: TEdit
    Left = 24
    Top = 305
    Width = 393
    Height = 21
    ReadOnly = True
    TabOrder = 11
  end
end
