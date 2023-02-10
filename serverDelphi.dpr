program serverDelphi;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  System.SysUtils,
  Horse,
  System.Json;

procedure GetPing(Req: THorseRequest; Res: THorseResponse; Next: TNextProc);
var
vUsuario, vUsuario2, vUsuario3,vLista : TJSONObject;
vArray : TJSONArray;
begin
  vUsuario   := TJSONObject.create();
  vUsuario2                         := TJSONObject.create();
  vUsuario3 := TJSONObject.create();
  vArray := TJSONArray.Create();
  vLista := TJSONObject.create();

  try
    vUsuario.AddPair('nome','Ricardo');
    vUsuario.AddPair('idade','29');
    vUsuario.AddPair('profissao','Programador');
    vUsuario.AddPair('cargo',' Resolvedor de Problema');
    vArray.AddElement(vUsuario);

    vUsuario2.AddPair('nome','Julia');
    vUsuario2.AddPair('idade','4');
    vUsuario2.AddPair('profissao',' ');
    vUsuario2.AddPair('cargo',' ');
    vArray.AddElement(vUsuario2);

    vUsuario3.AddPair('nome','Delphi');
    vUsuario3.AddPair('idade','100');
    vUsuario3.AddPair('profissao','Copilador ');
    vUsuario3.AddPair('cargo',' ');
    vArray.AddElement(vUsuario3);

    vLista.AddPair('usuarios',vArray);

    Res.Send(vLista.ToString);
  finally

  end;
end;
begin
  try
   THorse.Get('/usuario', GetPing);
  THorse.Listen(9000);
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
