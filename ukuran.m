function varargout = ukuran(varargin)
% UKURAN MATLAB code for ukuran.fig
%      UKURAN, by itself, creates a new UKURAN or raises the existing
%      singleton*.
%
%      H = UKURAN returns the handle to a new UKURAN or the handle to
%      the existing singleton*.
%
%      UKURAN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UKURAN.M with the given input arguments.
%
%      UKURAN('Property','Value',...) creates a new UKURAN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ukuran_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ukuran_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ukuran

% Last Modified by GUIDE v2.5 21-Nov-2023 08:29:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ukuran_OpeningFcn, ...
                   'gui_OutputFcn',  @ukuran_OutputFcn, ...
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


% --- Executes just before ukuran is made visible.
function ukuran_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ukuran (see VARARGIN)

% Choose default command line output for ukuran
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ukuran wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ukuran_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[nama_file1, nama_path1]=uigetfile(...
{'*.bmp; *.jpg', 'File citra (*.bmp, *.jpg)';
'*.bmp', 'File Bitmap(*.bmp)';...
'*.jpg', 'File Jpeg(*.jpg)';
'*.*', 'Semua File (*.*)'},...
'Buka file citra asli');

if ~isequal(nama_file1, 0);
handles.data1=imread(fullfile(nama_path1, nama_file1));
guidata(hObject, handles);
handles.current_data1=handles.data1;
axes(handles.axes1);
imshow(handles.current_data1);
else
    return
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[nama_file2, nama_path2]=uigetfile(...
{'*.bmp; *.jpg', 'File citra (*.bmp, *.jpg)';
'*.bmp', 'File Bitmap(*.bmp)';...
'*.jpg', 'File Jpeg(*.jpg)';
'*.*', 'Semua File (*.*)'},...
'Buka file citra asli');
if ~isequal(nama_file2, 0);
handles.data2=imread(fullfile(nama_path2, nama_file2));
guidata(hObject, handles);
handles.current_data2=handles.data2;
axes(handles.axes2);
imshow(handles.current_data2);
else
return
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Resize the image to 10x10
resizedImage10x10 = imresize(handles.data1, [10, 10]);
axes(handles.axes3);
imshow(resizedImage10x10);
handles.resizedImage10x10 = resizedImage10x10;

resizedImage10x10 = imresize(handles.data2, [10, 10]);
axes(handles.axes4);
imshow(resizedImage10x10);
handles.resizedImage10x10 = resizedImage10x10;



% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
resizedImage20x20 = imresize(handles.data1, [20, 20]);
axes(handles.axes3);
imshow(resizedImage20x20);
handles.resizedImage20x20 = resizedImage20x20;

resizedImage20x20 = imresize(handles.data2, [20, 20]);
axes(handles.axes4);
imshow(resizedImage20x20);
handles.resizedImage20x20 = resizedImage20x20;

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
resizedImage50x50 = imresize(handles.data1, [50, 50]);
axes(handles.axes3);
imshow(resizedImage50x50);
handles.resizedImage50x50 = resizedImage50x50;

resizedImage50x50 = imresize(handles.data2, [50, 50]);
axes(handles.axes4);
imshow(resizedImage50x50);
handles.resizedImage50x50 = resizedImage50x50;


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
resizedImage100x100 = imresize(handles.data1, [100, 100]);
axes(handles.axes3);
imshow(resizedImage100x100);
handles.resizedImage100x100 = resizedImage100x100;

resizedImage100x100 = imresize(handles.data2, [100, 100]);
axes(handles.axes4);
imshow(resizedImage100x100);
handles.resizedImage100x100 = resizedImage100x100;


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc
cla(handles.axes3,'reset')
cla(handles.axes4,'reset')
cla(handles.axes5,'reset')


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imgA = handles.data2;
bwA= im2bw (imgA);

axes(handles.axes2);

notA =not(bwA);
axes(handles.axes5), imshow(notA);


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imgB = handles.data1;
bwB= im2bw (imgB);

axes(handles.axes1);

notB =not(bwB);
axes(handles.axes5), imshow(notB);

% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imgA = handles.data1;
imgB = handles.data2;
bwA = im2bw(imgA);
bwB = im2bw(imgB);

axes(handles.axes1);
axes(handles.axes2);

AandB = and(bwA, bwB);
axes(handles.axes5), imshow(AandB);

% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imgA = handles.data1;
imgB = handles.data2;
bwA = im2bw(imgA);
bwB = im2bw(imgB);

axes(handles.axes1);
axes(handles.axes2);

AorB = or(bwA, bwB);
axes(handles.axes5), imshow(AorB);

% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imgA = handles.data1;
imgB = handles.data2;
bwA = im2bw(imgA);
bwB = im2bw(imgB);

axes(handles.axes1);
axes(handles.axes2);

AxorB = xor(bwA, bwB);
axes(handles.axes5), imshow(AxorB);
