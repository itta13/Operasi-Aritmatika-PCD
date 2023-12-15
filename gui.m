function varargout = gui(varargin)
% GUI MATLAB code for gui.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui

% Last Modified by GUIDE v2.5 18-Nov-2023 10:10:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
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


% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui (see VARARGIN)

% Choose default command line output for gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btnnoise.
function btnnoise_Callback(hObject, eventdata, handles)
% hObject    handle to btnnoise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Z=get(handles.axes3,'Userdata');
NR=medfilt2(Z);
set(handles.figure1,'CurrentAxes',handles.axes4);
imshow(NR);
set(handles.axes4,'Userdata',NR);

% --- Executes on button press in btnbw.
function btnbw_Callback(hObject, eventdata, handles)
% hObject    handle to btnbw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
BW=get(handles.axes5,'Userdata');
BW=im2bw(BW);
set(handles.figure1,'CurrentAxes',handles.axes6);
imshow(BW);
set(handles.axes6,'Userdata',BW);

% --- Executes on button press in btnSharp.
function btnSharp_Callback(hObject, eventdata, handles)
% hObject    handle to btnSharp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Z=get(handles.axes4,'Userdata');
myFilter=fspecial('gaussian');
%'gaussian', 'sobel', 'prewitt', 'laplacian', 'log', 'average', 'unsharp',
%'roberts'
S=imfilter(Z, myFilter, 'replicate');%%%%
set(handles.figure1,'CurrentAxes',handles.axes5);
imshow(S);
set(handles.axes5,'Userdata',S);

% --- Executes on button press in btnedge.
function btnedge_Callback(hObject, eventdata, handles)
% hObject    handle to btnedge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I=get(handles.axes6,'Userdata');
I=edge(I);
set(handles.figure1,'CurrentAxes',handles.axes7);
imshow(I);
set(handles.axes7,'Userdata',I);

% --- Executes on button press in btngray.
function btngray_Callback(hObject, eventdata, handles)
% hObject    handle to btngray (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Z=get(handles.axes2,'Userdata');
I=rgb2gray(Z);
set(handles.figure1,'CurrentAxes',handles.axes3);
imshow(I);
set(handles.axes3,'Userdata',I);

baris=size(I,1);
kolom=size(I,2);
header=linspace(1,kolom,kolom);
row=linspace(1,baris,baris);

set(handles.uitable1,'data',I,'ColumName',header,'RowName',row);
set(handles.uitable1,'Userdata',I);



function edbrowser_Callback(hObject, eventdata, handles)
% hObject    handle to edbrowser (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edbrowser as text
%        str2double(get(hObject,'String')) returns contents of edbrowser as a double


% --- Executes during object creation, after setting all properties.
function edbrowser_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edbrowser (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnbrowser.
function btnbrowser_Callback(hObject, eventdata, handles)
[namafile,direktori]=uigetfile({'*.png;*.jpg','file Image(*.bmp,*.gif)';'*.*','semua file(*.*)'},'buka file image');

alamatimage=fullfile(direktori,namafile);
set(handles.edbrowser,'String',alamatimage);
I=imread(alamatimage);
w=size(I,1);
h=size(I,2);
s=size(I,3);

D='1 DImensi';
if s>=3
    D='2 Dimensi';
end
set(handles.edw,'String',num2str(w));
set(handles.edh,'String',num2str(h));
set(handles.eddim,'String',D);

set(handles.figure1,'CurrentAxes',handles.axes1);
imshow(I);
set(handles.axes1,'Userdata',I);
        myicon(:,:,1) = [0 1; 0 1];
        myicon(:,:,2) = [.8 1; 0 .3];
        myicon(:,:,3) = [.3 0; .9 .5];
        h=msgbox('Sukses Load Image','Success','custom',myicon);



% --- Executes on button press in btnresize.
function btnresize_Callback(hObject, eventdata, handles)
% hObject    handle to btnresize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I=get(handles.axes1,'Userdata');

n1=get(handles.edit1,'String');
n2=get(handles.edit2,'String');

in1=str2num(n1);
in2=str2num(n2);

Z=imresize(I,[in1,in2]);
set(handles.figure1,'CurrentAxes',handles.axes2);
imshow(Z);
set(handles.axes2,'Userdata',Z);

baris=in1;
kolom=in2;
header= linspace(1,kolom,kolom);
row = linspace(1,baris,baris);

ZZ=rgb2gray(Z);
set(handles.myTable,'data',ZZ,'ColumnName',header,'RowName',row);
set(handles.myTable,'Userdata',ZZ);

h=msgbox('Sukses Load Image','Success','help');



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
