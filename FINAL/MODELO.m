function varargout = MODELO(varargin)
% MODELO MATLAB code for MODELO.fig
%      MODELO, by itself, creates a new MODELO or raises the existing
%      singleton*.
%
%      H = MODELO returns the handle to a new MODELO or the handle to
%      the existing singleton*.
%
%      MODELO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MODELO.M with the given input arguments.
%
%      MODELO('Property','Value',...) creates a new MODELO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MODELO_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MODELO_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MODELO

% Last Modified by GUIDE v2.5 13-May-2015 11:11:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MODELO_OpeningFcn, ...
                   'gui_OutputFcn',  @MODELO_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before MODELO is made visible.
function MODELO_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MODELO (see VARARGIN)
global t;
global x;
global y;
global PotPormedio;
global SIRPromedio;
global NoHO;
global IPromedio;
global ServCelda0;
global ServCelda1;
global tiempo;

axes(handles.axes1)
bs = rsmak('circle',500,[0,0]);
fnplt (bs,'b'), axis square;
hold on
bs = rsmak('circle',50,[200,200]);
fnplt (bs,'b'), axis square;
grid on;

axes(handles.axes2)
bs = rsmak('circle',500,[0,0]);
fnplt (bs,'b'), axis square;
hold on
bs = rsmak('circle',50,[200,200]);
fnplt (bs,'b'), axis square;
grid on;

axes(handles.axes3)
plot(0,0);grid on;

axes(handles.axes4)
plot(0,0);grid on;

axes(handles.axes5)
plot(0,0);grid on;

axes(handles.axes6)
plot(0,0);grid on;


% Choose default command line output for MODELO
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MODELO wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MODELO_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fun=get(handles.popupmenu1,'Value');
tempo=get(handles.popupmenu2,'String');
index=get(handles.popupmenu2,'Value');
tiempo=tempo{index(1)};
moviles=get(handles.popupmenu3,'String');
index2=get(handles.popupmenu3,'Value');
nummoviles=moviles{index2(1)};
ShowMS=floor((str2double(nummoviles)-1)*rand())+1;
set(handles.text1,'String',strcat('Movement Simulation (only MS',num2str(ShowMS),')'));
set(handles.text2,'String',strcat('Serving Cell (only MS',num2str(ShowMS),')'));
   
% encerar
set(handles.text6,'String',' ');
set(handles.text10,'String',' ');
set(handles.text11,'String',' ');
set(handles.text12,'String',' ');
axes(handles.axes2)
bs = rsmak('circle',500,[0,0]);
fnplt (bs,'b'), axis square;
hold on
bs = rsmak('circle',50,[200,200]);
fnplt (bs,'b'), axis square;
grid on;

axes(handles.axes3)
plot(0,0);grid on
axes(handles.axes4)
plot(0,0);grid on
axes(handles.axes5)
plot(0,0);grid on
axes(handles.axes6)
plot(0,0);grid on
%global t;
%global PotPormedio;
%global SIRPromedio;
%global x;
%global y;
%global NoHO;

if fun==2%Movilidad Random Walk
    set(handles.popupmenu1,'Enable','off');
    set(handles.popupmenu2,'Enable','off');
    set(handles.popupmenu3,'Enable','off');
   %Simulacion de Movimiento
    axes(handles.axes1)
    %grafico(x,y);grid on;
    [t,x,y,PotPormedio,SIRPromedio,NoHO,IPromedio,ServCelda0x,ServCelda0y,ServCelda1x,ServCelda1y]= PrincipalV4(2,str2double(tiempo),str2double(nummoviles),ShowMS);
    hold off ;
    
    %Celda Servidora
    axes(handles.axes2)
    bs = rsmak('circle',500,[0,0]);
    fnplt (bs,'b'), axis square;
    hold on
    bs = rsmak('circle',50,[200,200]);
    fnplt (bs,'b'), axis square;
    grid on;

    plot(ServCelda0x,ServCelda0y,'go',ServCelda1x,ServCelda1y,'ro');
    % plot(ServCelda0x,ServCelda0y,'bo'); hold on
    %  plot(ServCelda1x,ServCelda1y,'ro');
    %legend('Pico Celda','bo','Macro Celda')
    hold off ;
    
    %Potencia
    axes(handles.axes3)
    plot(t,PromedioMovil(PotPormedio),'LineWidth',2);grid on;
    set(handles.text6,'String',strcat(num2str(mean(PotPormedio)),' dBm') );
  % set(handles.text6,'String',(mean(PotPormedio)) );
       
    %Handover
    axes(handles.axes4)
    %stem(t,NoHO,'LineWidth',2);grid on;
    plot(t,PromedioMovil(NoHO),'LineWidth',2);grid on;
     set(handles.text12,'String',strcat('#HO: ',num2str(mean((NoHO)))));
     
    %Interferencia
    axes(handles.axes5)
    plot(t,PromedioMovil(IPromedio),'LineWidth',2);grid on;
    set(handles.text10,'String',strcat(num2str(mean(IPromedio)),' dBm'));
   %SIR
    axes(handles.axes6)
    plot(t,PromedioMovil(SIRPromedio),'LineWidth',2);grid on;    
    set(handles.text11,'String',strcat(num2str(mean(SIRPromedio)),' dBm'));
 
    set(handles.popupmenu1,'Enable','on');
    set(handles.popupmenu2,'Enable','on');
    set(handles.popupmenu3,'Enable','on');
elseif fun==3%Movilidad Random Direction
    
    set(handles.popupmenu1,'Enable','off');
    set(handles.popupmenu2,'Enable','off');
    set(handles.popupmenu3,'Enable','off');
    %Simulacion de Movimiento
    axes(handles.axes1)
    %grafico(x,y);grid on;
    [t,x,y,PotPormedio,SIRPromedio,NoHO,IPromedio,ServCelda0x,ServCelda0y,ServCelda1x,ServCelda1y]= PrincipalV4(3,str2double(tiempo),str2double(nummoviles),ShowMS);
    hold off ;
    
    %Celda Servidora
    axes(handles.axes2)
    
    grid on;hold off ;
    bs = rsmak('circle',500,[0,0]);
    fnplt (bs,'b'), axis square;  
    hold on
    bs = rsmak('circle',50,[200,200]);
    fnplt (bs,'b'), axis square;
    grid on;
    plot(ServCelda0x,ServCelda0y,'go',ServCelda1x,ServCelda1y,'ro');
    hold off;
    %Potencia
    axes(handles.axes3)
    plot(t,PromedioMovil(PotPormedio),'LineWidth',2);grid on;
    set(handles.text6,'String',strcat(num2str(mean(PotPormedio)),' dBm') );
  % set(handles.text6,'String',(mean(PotPormedio)) );
       
    %Handover
    axes(handles.axes4)
    %plot(t,NoHO,'LineWidth',2);grid on;
    plot(t,PromedioMovil(NoHO),'LineWidth',2);grid on; 
    %set(handles.text12,'String',strcat('#HO: ',num2str(mean(sum(NoHO)))));
    set(handles.text12,'String',strcat('#HO: ',num2str(mean((NoHO)))));

    
    %Interferencia
    axes(handles.axes5)
    plot(t,PromedioMovil(IPromedio),'LineWidth',2);grid on;
    set(handles.text10,'String',strcat(num2str(mean(IPromedio)),' dBm'));
   %SIR
    axes(handles.axes6)
    plot(t,PromedioMovil(SIRPromedio),'LineWidth',2);grid on;    
    set(handles.text11,'String',strcat(num2str(mean(SIRPromedio)),' dBm'));
 
  
    set(handles.popupmenu1,'Enable','on');
    set(handles.popupmenu2,'Enable','on');
    set(handles.popupmenu3,'Enable','on');
end
%guidata(hObject, handles);
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, ~, ~)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tiempo=get(handles.popupmenu2,'String');
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
