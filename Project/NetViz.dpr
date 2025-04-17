program NetViz;

uses
  System.StartUpCopy,
  FMX.Forms,
  NetViz.View.Main in '..\Src\ViewModel\NetViz.View.Main.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
