unit NetViz.View.Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.TMSFNCTypes, FMX.TMSFNCUtils, FMX.TMSFNCGraphics, FMX.TMSFNCGraphicsTypes,
  FMX.TMSFNCCustomControl, FMX.TMSFNCWebBrowser, FMX.Layouts,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TFrmMain = class(TForm)
    GridPanelLayout1: TGridPanelLayout;
    TMSFNCWebBrowser1: TTMSFNCWebBrowser;
    BtnLoadHtml: TButton;
    procedure TMSFNCWebBrowser1Initialized(Sender: TObject);
    procedure BtnLoadHtmlClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.fmx}

uses
  System.IOUtils;

procedure TFrmMain.BtnLoadHtmlClick(Sender: TObject);
var
  OpenDlg: TOpenDialog;
begin
  // Load file
  OpenDlg := TOpenDialog.Create(self);
	OpenDlg.Filter := 'HTML Files (*.html)|*.html';
  OpenDlg.Title := 'Load HTML File';
	if (OpenDlg.Execute() and FileExists(OpenDlg.FileName)) then
  begin
    TMSFNCWebBrowser1.LoadFile(OpenDlg.FileName);
  end;
  OpenDlg.Free;
end;

procedure TFrmMain.TMSFNCWebBrowser1Initialized(Sender: TObject);
begin
  // Load local file
  var LPath := TPath.Combine(ExtractFilePath(ParamStr(0)), 'Data/sample_network_viz.html');
  TMSFNCWebBrowser1.LoadFile(LPath);
end;

end.
