unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, Gauges, ShellCtrls, StdCtrls,jpeg;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Splitter1: TSplitter;
    Panel4: TPanel;
    Splitter2: TSplitter;
    Panel5: TPanel;
    Image1: TImage;
    ShellTreeView1: TShellTreeView;
    Gauge1: TGauge;
    Panel6: TPanel;
    Label1: TLabel;
    ScrollBox1: TScrollBox;
    procedure ClearImage();
    procedure ShowImage();
    procedure ShellTreeView1Click(Sender: TObject);
    procedure ScrollBox1Click(Sender: TObject);
    procedure ScrollBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Image: array[0..1000] of TImage;
  //存放缩略图
  ImgName : array[0..1000] of TLabel;
//  存放图片名
  BackGroud : array[0..1000] of TPanel;
  //放置缩略图和图片名的背景
  ImgNameBak :array[0..1000] of TPanel;
  //存放imgname的背景
  ImgPos,NamPos, imgcount:Integer;
  //缩略图的位置和图片数量
  Path :string; //当前图片的路径
  Filelist: TStringList; //记录当前路径下的所有图片名

implementation

{$R *.dfm}
procedure TForm1.ClearImage;
var
  i:Integer;
begin
  if Imgcount>=1 then
    for i:=1 to Imgcount do
    begin
      if Assigned(Image[i]) then
      begin
        Image[i].Free;
        Image[i]:=nil;
      end;
      if Assigned(ImgName[i]) then
      begin
        ImgName[i].Free;
        ImgName[i]:=nil;
      end;
      if Assigned(ImgNameBak[i]) then
      begin
        ImgNameBak[i].Free;
        ImgNameBak[i]:=nil;
      end;
      if Assigned(BackGroud[i]) then
      begin
        BackGroud[i].Free;
        BackGroud[i]:=nil;
      end;
      
    end;
end;

procedure TForm1.ShowImage;
var
  i,j,k:Integer;
  begin
    ClearImage();
    imgcount:=Filelist.count;
    for i:=1 to Imgcount do
    begin
      BackGroud[i]:=TPanel.Create(self);
      BackGroud[i].Parent:=ScrollBox1;
      BackGroud[i].Visible:=True;
      BackGroud[i].Width:=104;
      BackGroud[i].Height:=118;
      //动态创建BackGroud，作为放置缩略图和图片名的背景
      image[i]:=TImage.Create(self);
      image[i].Parent:=BackGroud[i];
      image[i].Visible:=True;
      image[i].Stretch:=True;
      image[i].Center:=True;
      image[i].Width:=98;
      image[i].Height:=98;
      //动态创建Timage,用来存放缩略图
      ImgNameBak[i]:=TPanel.Create(self);
      ImgNameBak[i].Parent:=BackGroud[i];
      ImgNameBak[i].BevelOuter:=bvLowered;
      ImgNameBak[i].Font.Size:=9;
      ImgNameBak[i].Font.Color:=clBlue;
      ImgNameBak[i].Width:=100;
      ImgNameBak[i].Height :=12;
      //动态创建ImgNameBak,用来作为imgname的背景
      ImgName[i]:=TLabel.Create(self);
      ImgName[i].Parent:=ImgNameBak[i];
      ImgName[i].Font.Color :=clBlue;
      ImgName[i].Width:=100;
      //动态创建ImgName,用来存放图片名
      Gauge1.MaxValue :=Filelist.count;
      Gauge1.ForeColor:=clBlue;
      Gauge1.BackColor:=clBlack;
      Gauge1.Progress :=i;
      Path :=ShellTreeView1.Path +'\' + Filelist.Strings[i-1];
      //设置文件路径
                                  
      Image[i].Picture.LoadFromFile(Path);
      ImgNameBak[i].OnClick:=ScrollBox1.OnClick;
      ImgNameBak[i].OnDblClick:=ScrollBox1.OnDblClick;
      Image[i].OnMouseMove:=ScrollBox1.OnMouseMove;
      Image[i].OnClick:=ScrollBox1.OnClick;
      Image[i].OnDblClick:=ScrollBox1.OnDblClick;
      if (Image[i].Picture.Width<98) and (Image[i].Picture.Height<98) then
         Image[i].Stretch:=False;
      //如果图片小于image 的大小则以图片的实际大小显示
      ImgName[i].Caption:= Filelist.Strings[i-1];
      ImgNameBak[i].Caption:=ImgName[i].Caption;
      ImgName[i].Visible:=False;
      //显示图片名，保证图片名 居中
      if(i>=1) and (i<=5) then
      begin
        if(i=1) then
        begin
          BackGroud[i].Top:=8;
          BackGroud[i].Left :=8;
          Image[i].Top:=3;
          Image[i].Left:=3;
          Image[i].Visible:=True;
          
        end;
        if(i>=2) and (i<=5) then
        begin
          BackGroud[i].Top:=BackGroud[i-1].Top;
          BackGroud[i].Left:=BackGroud[i-1].Left+108;
          Image[i].Top:=3;
          Image[i].Left:=3;
          Image[i].Visible:=True;
          
        end;
      end
      else
      begin
        k:=Trunc(i/5);
        if((i mod (k*5))=1) then
        begin
          if k=1 then
            BackGroud[i].Top:=130
          else
            BackGroud[i].Top:=120*k+12;
          BackGroud[i].Left:=8;
          Image[i].Top:=3;
          Image[i].Left:=3;
          Image[i].Visible:=True;
        end
        else
        begin
          BackGroud[i].Top:=BackGroud[i-1].Top;
          BackGroud[i].Left:=BackGroud[i-1].Left+108;
          Image[i].Top:=3;
          Image[i].Left:=3;
          Image[i].Visible:=True;
        end;
      end;
      ImgNameBak[i].Top:=Image[i].Top+101;
      ImgNameBak[i].Left:=1;
    end;
    panel6.Caption:='一共有'+inttostr(imgcount)+'张图片';
  end;

procedure TForm1.ShellTreeView1Click(Sender: TObject);
var
  sr: TSearchRec;
begin

  if not Assigned(Filelist) then
  begin
    Filelist := TStringList.Create;
  end;
  Filelist.Clear;
  if(FindFirst(ShellTreeView1.Path +'\*.*',faAnyFile,sr)=0) then
  begin
    repeat
      if(UpperCase(ExtractFileExt(sr.Name))='.JPG')or
      (UpperCase(ExtractFileExt(sr.Name))='.ICO')or
      (UpperCase(ExtractFileExt(sr.Name))='.BMP')or
      (UpperCase(ExtractFileExt(sr.Name))='.JEPG')
      then
        Filelist.Add(sr.Name);
        ShowMessage(sr.Name);
    until FindNext(sr)<>0;
    FindClose(sr);
  end;
  ShowImage;
  end;


procedure TForm1.ScrollBox1Click(Sender: TObject);
var
  path1:string;
begin
  if((Sender is TImage)or (Sender is TLabel)) then
  begin
    path1:=ShellTreeView1.Path+'\'+ Filelist.Strings[NamPos-1];
    Image1.Stretch :=True;
    Image1.Picture.LoadFromFile(path1);
    if(Image1.Picture.Width<Image1.Width) and (Image1.Picture.Height<Image1.Height) then
    Image1.Stretch:=False;
    //如果图片小于image1 的大小则以图片的实际大小显示
  end;
end;

procedure TForm1.ScrollBox1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  path1:string;
begin
  ImgPos:=0;
  
  if not Assigned(Filelist) then
  begin
    Filelist := TStringList.Create;
  end;
  for ImgPos:=1 to Filelist.Count do
    if((Sender =Image[ImgPos]) or (Sender = imgName[ImgPos])) then
    begin
      NamPos:= ImgPos;
      path1:= ShellTreeView1.Path+'\'+FileList.strings[NamPos-1];
      ScrollBox1.Hint:='文件名:'+Filelist.strings[nampos-1]+#13+'图像大小:'+ IntToStr(Image[ImgPos].Picture.Width)+'          X'+ IntToStr(Image[ImgPos].Picture.Height)+'像素';
    end;

end;

end.
