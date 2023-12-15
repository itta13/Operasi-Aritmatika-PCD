function varargout = aplikasi_citra(varargin)
% APLIKASI_CITRA MATLAB code for aplikasi_citra.fig
%      APLIKASI_CITRA, by itself, creates a new APLIKASI_CITRA or raises the existing
%      singleton*.
%
%      H = APLIKASI_CITRA returns the handle to a new APLIKASI_CITRA or the handle to
%      the existing singleton*.
%
%      APLIKASI_CITRA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in APLIKASI_CITRA.M with the given input arguments.
%
%      APLIKASI_CITRA('Property','Value',...) creates a new APLIKASI_CITRA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before aplikasi_citra_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to aplikasi_citra_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help aplikasi_citra

% Last Modified by GUIDE v2.5 30-Nov-2023 13:23:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @aplikasi_citra_OpeningFcn, ...
                   'gui_OutputFcn',  @aplikasi_citra_OutputFcn, ...
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


% --- Executes just before aplikasi_citra is made visible.
function aplikasi_citra_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to aplikasi_citra (see VARARGIN)

% Choose default command line output for aplikasi_citra
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);



% UIWAIT makes aplikasi_citra wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = aplikasi_citra_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


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



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_buka_citra1.
function btn_buka_citra1_Callback(hObject, eventdata, handles)
% hObject    handle to btn_buka_citra1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[nama_file1, nama_path1]=uigetfile(...
 {'*.bmp; *.jpg; *.jpeg', 'File citra (*.bmp, *.jpg, *.jpeg)';
 '*.bmp', 'File Bitmap(*.bmp)';...
 '*.jpg', 'File Jpg(*.jpg)';
  '*.jpeg', 'File Jpeg(*.jpeg)';
 '*.*', 'Semua File (*.*)'},...
 'Buka file citra asli');

if ~isequal(nama_file1, 0)
 handles.data1=imread(fullfile(nama_path1, nama_file1));
 guidata(hObject, handles);
 handles.current_data1=handles.data1;
 axes(handles.axes1);
 imshow(handles.current_data1);
 title(handles.axes1, 'CITRA ASLI');
else
 return
end

set(handles.edit1, 'String', nama_file1);
set(handles.edit2, 'String', size(handles.data1,1));
set(handles.edit3, 'String', size(handles.data1,2));

% --- Executes on button press in btn_tutup.
function btn_tutup_Callback(hObject, eventdata, handles)
% hObject    handle to btn_tutup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%untuk keluar dari apalikasi
delete(handles.figure1)


% --- Executes on selection change in menu_resize_citra1.
function menu_resize_citra1_Callback(hObject, eventdata, handles)
% hObject    handle to menu_resize_citra1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Menambahkan nilai ke menu_resize_citra1
    set(handles.menu_resize_citra1, 'String', {'Citra Asli','200x200','100x100', '50x50', '20x20', '10x10', '4x4', '2x2'});

% Mendapatkan nilai yang dipilih dari pop-up menu
selectedValue = get(hObject, 'Value');

% Mendapatkan citra dari axes1
originalImage1 = getimage(handles.axes1);

% Menentukan aksi berdasarkan nilai yang dipilih
switch selectedValue
    case 1
        % citra Asli
        imshow(originalImage1, 'Parent', handles.axes2);
        title(handles.axes2, '');
    case 2
        % Resize citra menjadi 200x200 dan menampilkannya di axes2
        resizedImage = imresize(originalImage1, [200, 200]);
        imshow(resizedImage, 'Parent', handles.axes2);
        title(handles.axes2, '');
    case 3
        % Resize citra menjadi 100x100 dan menampilkannya di axes2
        resizedImage = imresize(originalImage1, [100, 100]);
        imshow(resizedImage, 'Parent', handles.axes2);
        title(handles.axes2, '');
    case 4
        % Resize citra menjadi 50x50 dan menampilkannya di axes2
        resizedImage = imresize(originalImage1, [50, 50]);
        imshow(resizedImage, 'Parent', handles.axes2);
        title(handles.axes2, '');
    case 5
        % Resize citra menjadi 20x20 dan menampilkannya di axes2
        resizedImage = imresize(originalImage1, [20, 20]);
        imshow(resizedImage, 'Parent', handles.axes2);
        title(handles.axes2, '');
    case 6
        % Resize citra menjadi 10x10 dan menampilkannya di axes2
        resizedImage = imresize(originalImage1, [10, 10]);
        imshow(resizedImage, 'Parent', handles.axes2);
        title(handles.axes2, '');
     case 7
        % Resize citra menjadi 4x4 dan menampilkannya di axes2
        resizedImage = imresize(originalImage1, [4, 4]);
        imshow(resizedImage, 'Parent', handles.axes2);
        title(handles.axes2, '');
    case 8
        % Resize citra menjadi 2x2 dan menampilkannya di axes2
        resizedImage = imresize(originalImage1, [2, 2]);
        imshow(resizedImage, 'Parent', handles.axes2);
        title(handles.axes2, '');
    otherwise
        % Aksi , jika nilai tidak sesuai dengan yang diharapkan
        disp('Menu tidak valid.');
end


% Mendapatkan citra dari axes2
resizedImage = getimage(handles.axes2);

% Memisahkan saluran warna RGB
R = resizedImage(:,:,1);
G = resizedImage(:,:,2);
B = resizedImage(:,:,3);

% Menampilkan matriks citra red di dalam table1
dataRed = num2cell(R);
set(handles.table1, 'Data', dataRed);

% Menampilkan matriks citra green di dalam table2
dataGreen = num2cell(G);
set(handles.table2, 'Data', dataGreen);

% Menampilkan matriks citra blue di dalam table3
dataBlue = num2cell(B);
set(handles.table3, 'Data', dataBlue);


% Hints: contents = cellstr(get(hObject,'String')) returns menu_resize_citra1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from menu_resize_citra1

% --- Executes during object creation, after setting all properties.
function menu_resize_citra1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to menu_resize_citra1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_red.
function btn_red_Callback(hObject, eventdata, handles)
% hObject    handle to btn_red (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Mengambil citra dari axes1 dan axes3
originalImage1 = getimage(handles.axes1);
originalImage2 = getimage(handles.axes3);

% Mendapatkan saluran warna RGB
R1 = originalImage1(:,:,1);
G1 = originalImage1(:,:,2);
B1 = originalImage1(:,:,3);

R2 = originalImage2(:,:,1);
G2 = originalImage2(:,:,2);
B2 = originalImage2(:,:,3);

% Membuat citra warna merah
red1 = cat(3, R1, zeros(size(G1)), zeros(size(B1)));
red2 = cat(3, R2, zeros(size(G2)), zeros(size(B2)));


% Menampilkan citra red 
imshow(red1, 'Parent', handles.axes5);
title(handles.axes5, 'Citra 1 Red');

imshow(red2, 'Parent', handles.axes6);
title(handles.axes6, 'Citra 2 Red');


% --- Executes on button press in btn_green.
function btn_green_Callback(hObject, eventdata, handles)
% hObject    handle to btn_green (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Mengambil citra dari axes1 dan axes3
originalImage1 = getimage(handles.axes1);
originalImage2 = getimage(handles.axes3);

% Mendapatkan saluran warna RGB
R1 = originalImage1(:,:,1);
G1 = originalImage1(:,:,2);
B1 = originalImage1(:,:,3);

R2 = originalImage2(:,:,1);
G2 = originalImage2(:,:,2);
B2 = originalImage2(:,:,3);

% Membuat citra warna green
green1 = cat(3, zeros(size(R1)), G1, zeros(size(B1)));
green2 = cat(3, zeros(size(R2)), G2, zeros(size(B2)));

% Menampilkan citra green
imshow(green1, 'Parent', handles.axes5);
title(handles.axes5, 'Citra 1 Green');

imshow(green2, 'Parent', handles.axes6);
title(handles.axes6, 'Citra 2 Green')


% --- Executes on button press in btn_blue.
function btn_blue_Callback(hObject, eventdata, handles)
% hObject    handle to btn_blue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Mengambil citra dari axes1 dan axes3
originalImage1 = getimage(handles.axes1);
originalImage2 = getimage(handles.axes3);

% Mendapatkan saluran warna RGB
R1 = originalImage1(:,:,1);
G1 = originalImage1(:,:,2);
B1 = originalImage1(:,:,3);

R2 = originalImage2(:,:,1);
G2 = originalImage2(:,:,2);
B2 = originalImage2(:,:,3);

% Membuat citra warna blue
blue1 = cat(3, zeros(size(R1)), zeros(size(G1)), B1);
blue2 = cat(3, zeros(size(R2)), zeros(size(G2)), B2);

% Menampilkan citra blue
imshow(blue1, 'Parent', handles.axes5);
title(handles.axes5, 'Citra 1 blue');

imshow(blue2, 'Parent', handles.axes6);
title(handles.axes6, 'Citra 2 blue')


% --- Executes on button press in btn_grayscale.
function btn_grayscale_Callback(hObject, eventdata, handles)
% hObject    handle to btn_grayscale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Mengambil citra dari axes1 dan axes3
originalImage1 = getimage(handles.axes1);
originalImage2 = getimage(handles.axes3);

% Mengonversi citra RGB ke citra abu-abu menggunakan rgb2gray
grayImage1 = rgb2gray(originalImage1);
grayImage2 = rgb2gray(originalImage2);

% Menampilkan citra Grayscale
imshow(grayImage1, 'Parent', handles.axes5);
title(handles.axes5, 'Citra 1 Grayscale');

imshow(grayImage2, 'Parent', handles.axes6);
title(handles.axes6, 'Citra 2 Grayscale');


% --- Executes on button press in btn_bw.
function btn_bw_Callback(hObject, eventdata, handles)
% hObject    handle to btn_bw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Mengambil citra dari axes1 dan axes3
originalImage1 = getimage(handles.axes1);
originalImage2 = getimage(handles.axes3);

% Mengonversi citra RGB ke citra abu-abu menggunakan rgb2gray
grayImage1 = rgb2gray(originalImage1);
grayImage2 = rgb2gray(originalImage2);

%membuat thresholding dari citra asli
thresh1 = graythresh(grayImage1);
thresh2 = graythresh(grayImage2);

%Membuat Citra Hitam Putih di axes5
Citra_bw_Otsu1 = im2bw(grayImage1, thresh1);
imshow(Citra_bw_Otsu1, 'Parent', handles.axes5);
title(handles.axes5, 'Citra 1 Hitam Putih');

%Membuat Citra Hitam Putih di axes6
Citra_bw_Otsu2 = im2bw(grayImage2, thresh2);
imshow(Citra_bw_Otsu2, 'Parent', handles.axes6);
title(handles.axes6, 'Citra 2 Hitam Putih');


% --- Executes on button press in btn_negatif.
function btn_negatif_Callback(hObject, eventdata, handles)
% hObject    handle to btn_negatif (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Mengambil citra dari axes1 dan axes3
originalImage1 = getimage(handles.axes1);
originalImage2 = getimage(handles.axes3);

% Mengambil saluran warna RGB
R1 = originalImage1(:,:,1);
G1 = originalImage1(:,:,2);
B1 = originalImage1(:,:,3);

R2 = originalImage2(:,:,1);
G2 = originalImage2(:,:,2);
B2 = originalImage2(:,:,3);

% Membuat citra negatif
negatif1 = cat(3, 255 - R1, 255 - G1, 255 - B1);
negatif2 = cat(3, 255 - R2, 255 - G2, 255 - B2);

% Menampilkan citra negatif
imshow(negatif1, 'Parent', handles.axes5);
title(handles.axes5, 'Citra 1 Negatif');

imshow(negatif2, 'Parent', handles.axes6);
title(handles.axes6, 'Citra 2 Negatif');


% --- Executes on button press in btn_brightness.
function btn_brightness_Callback(hObject, eventdata, handles)
% hObject    handle to btn_brightness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Mengambil citra dari axes1 dan axes3
originalImage1 = getimage(handles.axes7);
originalImage2 = getimage(handles.axes3);

% Memperoleh nilai pencerahan dari Edit Text 'brightness'
brightnessValue = str2double(get(handles.brightness, 'String'));

% Memastikan bahwa nilai pencerahan valid
if isnan(brightnessValue)
    warndlg('Masukkan nilai pencerahan yang valid.', 'Peringatan');
    return;
end

% Memperoleh saluran warna RGB
R1 = originalImage1(:,:,1);
G1 = originalImage1(:,:,2);
B1 = originalImage1(:,:,3);

R2 = originalImage2(:,:,1);
G2 = originalImage2(:,:,2);
B2 = originalImage2(:,:,3);

% Melakukan operasi pencerahan pada setiap saluran warna
brightenedImage1 = cat(3, min(R1 + brightnessValue, 255), min(G1 + brightnessValue, 255), min(B1 + brightnessValue, 255));
brightenedImage2 = cat(3, min(R2 + brightnessValue, 255), min(G2 + brightnessValue, 255), min(B2 + brightnessValue, 255));

% Menampilkan citra hasil pencerahan di axes2
imshow(brightenedImage1, 'Parent', handles.axes5);
title(handles.axes5, 'Pencerahan Citra 1');

imshow(brightenedImage2, 'Parent', handles.axes6);
title(handles.axes6, 'Pencerahan Citra 2')

function brightness_Callback(hObject, eventdata, handles)
% hObject    handle to brightness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of brightness as text
%        str2double(get(hObject,'String')) returns contents of brightness as a double


% --- Executes during object creation, after setting all properties.
function brightness_CreateFcn(hObject, eventdata, handles)
% hObject    handle to brightness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double

% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double

% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double

% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_buka_citra2.
function btn_buka_citra2_Callback(hObject, eventdata, handles)
% hObject    handle to btn_buka_citra2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[nama_file2, nama_path2]=uigetfile(...
 {'*.bmp; *.jpg; *.jpeg', 'File citra (*.bmp, *.jpg, *.jpeg)';
 '*.bmp', 'File Bitmap(*.bmp)';...
 '*.jpg', 'File Jpg(*.jpg)';
  '*.jpeg', 'File Jpeg(*.jpeg)';
 '*.*', 'Semua File (*.*)'},...
 'Buka file citra asli');

if ~isequal(nama_file2, 0)
 handles.data2=imread(fullfile(nama_path2, nama_file2));
 guidata(hObject, handles);
 handles.current_data2=handles.data2;
 axes(handles.axes3);
 imshow(handles.current_data2);
 title(handles.axes3, 'CITRA ASLI');
else
 return
end

set(handles.edit4, 'String', nama_file2);
set(handles.edit5, 'String', size(handles.data2,1));
set(handles.edit6, 'String', size(handles.data2,2));


% --- Executes on selection change in menu_resize_citra2.
function menu_resize_citra2_Callback(hObject, eventdata, handles)
% hObject    handle to menu_resize_citra2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns menu_resize_citra2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from menu_resize_citra2

% Menambahkan nilai ke menu_resize_citra1
    set(handles.menu_resize_citra2, 'String', {'Citra Asli','200x200','100x100', '50x50', '20x20', '10x10', '4x4', '2x2'});

% Mendapatkan nilai yang dipilih dari pop-up menu
selectedValue = get(hObject, 'Value');

% Mendapatkan citra dari axes3
originalImage2 = getimage(handles.axes3);

% Menentukan aksi berdasarkan nilai yang dipilih
switch selectedValue
    case 1
        % citra Asli
        imshow(originalImage2, 'Parent', handles.axes4);
        title(handles.axes4, '');
    case 2
        % Resize citra menjadi 200x200 dan menampilkannya di axes2
        resizedImage = imresize(originalImage2, [200, 200]);
        imshow(resizedImage, 'Parent', handles.axes4);
        title(handles.axes4, '');
    case 3
        % Resize citra menjadi 100x100 dan menampilkannya di axes2
        resizedImage = imresize(originalImage2, [100, 100]);
        imshow(resizedImage, 'Parent', handles.axes4);
        title(handles.axes4, '');
    case 4
        % Resize citra menjadi 50x50 dan menampilkannya di axes2
        resizedImage = imresize(originalImage2, [50, 50]);
        imshow(resizedImage, 'Parent', handles.axes4);
        title(handles.axes4, '');
    case 5
        % Resize citra menjadi 20x20 dan menampilkannya di axes2
        resizedImage = imresize(originalImage2, [20, 20]);
        imshow(resizedImage, 'Parent', handles.axes4);
        title(handles.axes4, '');
    case 6
        % Resize citra menjadi 10x10 dan menampilkannya di axes2
        resizedImage = imresize(originalImage2, [10, 10]);
        imshow(resizedImage, 'Parent', handles.axes4);
        title(handles.axes4, '');
     case 7
        % Resize citra menjadi 4x4 dan menampilkannya di axes2
        resizedImage = imresize(originalImage2, [4, 4]);
        imshow(resizedImage, 'Parent', handles.axes4);
        title(handles.axes4, '');
    case 8
        % Resize citra menjadi 2x2 dan menampilkannya di axes2
        resizedImage = imresize(originalImage2, [2, 2]);
        imshow(resizedImage, 'Parent', handles.axes4);
        title(handles.axes4, '');
    otherwise
        % Aksi , jika nilai tidak sesuai dengan yang diharapkan
        disp('Menu tidak valid.');
end

% --- Executes during object creation, after setting all properties.
function menu_resize_citra2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to menu_resize_citra2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_penjumlahan.
function btn_penjumlahan_Callback(hObject, eventdata, handles)
    % Mengambil citra dari axes2 dan axes4 (resize citra 1 dan citra 2)
    resizedImage1 = getimage(handles.axes2);
    resizedImage2 = getimage(handles.axes4);

    % Memastikan kedua citra memiliki ukuran yang sama
    if ~isequal(size(resizedImage1), size(resizedImage2))
        warndlg('Ukuran citra harus sama untuk penjumlahan.', 'Peringatan');
        return;
    end

    % Menambahkan citra 1 dengan citra 2
    hasilPenjumlahan = imadd(resizedImage1, resizedImage2);

    % Menampilkan hasil penjumlahan di axes7
    axes(handles.axes7);
    imshow(hasilPenjumlahan);
    title(handles.axes7, 'Hasil Penjumlahan Resize Citra 1 dan Resize Citra 2');


% --- Executes on button press in btn_pengurangan.
function btn_pengurangan_Callback(hObject, eventdata, handles)
    % Mengambil citra dari axes2 dan axes4 (resize citra 1 dan citra 2)
    resizedImage1 = getimage(handles.axes2);
    resizedImage2 = getimage(handles.axes4);

    % Memastikan kedua citra memiliki ukuran yang sama
    if ~isequal(size(resizedImage1), size(resizedImage2))
        warndlg('Ukuran citra harus sama untuk pengurangan.', 'Peringatan');
        return;
    end

    % Melakukan pengurangan citra 1 dengan citra 2
    hasilPengurangan = imsubtract(resizedImage1, resizedImage2);

    % Menampilkan hasil pengurangan di axes7
    axes(handles.axes7);
    imshow(hasilPengurangan);
    title(handles.axes7, 'Hasil Pengurangan Resize Citra 1 dan Resize Citra 2');

% --- Executes on button press in btn_perkalian.
function btn_perkalian_Callback(hObject, eventdata, handles)
    % Mengambil citra dari axes2 dan axes4 (resize citra 1 dan citra 2)
    resizedImage1 = getimage(handles.axes2);
    resizedImage2 = getimage(handles.axes4);

    % Memastikan kedua citra memiliki ukuran yang sama
    if ~isequal(size(resizedImage1), size(resizedImage2))
        warndlg('Ukuran citra harus sama untuk perkalian.', 'Peringatan');
        return;
    end

    % Melakukan perkalian citra 1 dengan citra 2
    hasilPerkalian = immultiply(resizedImage1, resizedImage2);

    % Menampilkan hasil perkalian di axes7
    axes(handles.axes7);
    imshow(hasilPerkalian);
    title(handles.axes7, 'Hasil Perkalian Resize Citra 1 dan Resize Citra 2');
    

% --- Executes on button press in btn_pembagian.
function btn_pembagian_Callback(hObject, eventdata, handles)
    % Mengambil citra dari axes2 dan axes4 (resize citra 1 dan citra 2)
    resizedImage1 = getimage(handles.axes2);
    resizedImage2 = getimage(handles.axes4);

    % Memastikan kedua citra memiliki ukuran yang sama
    if ~isequal(size(resizedImage1), size(resizedImage2))
        warndlg('Ukuran citra harus sama untuk pembagian.', 'Peringatan');
        return;
    end

    % Melakukan pembagian citra 1 dengan citra 2
    hasilPembagian = imdivide(resizedImage1, resizedImage2);

    % Menampilkan hasil pembagian di axes7
    axes(handles.axes7);
    imshow(hasilPembagian);
    title(handles.axes7, 'Hasil Pembagian Resize Citra 1 dan Resize Citra 2');


% --- Executes on button press in btn_and.
function btn_and_Callback(hObject, eventdata, handles)
% hObject    handle to btn_or (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    % Mendapatkan kedua citra dari axes2 dan4
    axes2_image = getimage(handles.axes2);
    citra1 = rgb2gray(axes2_image);

    axes4_image = getimage(handles.axes4);
    citra2 = rgb2gray(axes4_image);

    % Pastikan kedua citra memiliki ukuran yang sama
    if ~isequal(size(citra1), size(citra2))
        msgbox('Ukuran citra harus sama untuk operasi AND.', 'Error', 'error');
        return;
    end

    % Mengonversi citra1 dan citra2 ke citra biner
    level_citra1 = graythresh(citra1);
    citra_biner1 = im2bw(citra1, level_citra1);

    level_citra2 = graythresh(citra2);
    citra_biner2 = im2bw(citra2, level_citra2);

    % Melakukan operasi AND pada citra biner
    hasil_and_biner = citra_biner1 & citra_biner2;

    % Menampilkan hasil di axes7
    axes(handles.axes7);
    imshow(hasil_and_biner);
    title(handles.axes7, 'Hasil Operasi AND Citra 1 dan 2');

    % Menyimpan hasil operasi AND ke dalam handles
    handles.hasil_and = hasil_and_biner;

    % Menyimpan handles
    guidata(hObject, handles);



% --- Executes on button press in btn_or.
function btn_or_Callback(hObject, eventdata, handles)
% hObject    handle to btn_or (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    % Mendapatkan citra dari axes2 dan axes4
    axes2_image = getimage(handles.axes2);
    citra1 = rgb2gray(axes2_image);

    axes4_image = getimage(handles.axes4);
    citra2 = rgb2gray(axes4_image);

    % Pastikan kedua citra memiliki ukuran yang sama
    if ~isequal(size(citra1), size(citra2))
        msgbox('Ukuran citra harus sama untuk operasi OR.', 'Error', 'error');
        return;
    end

    % Mengonversi citra1 dan cittra2 ke citra biner
    level_citra1 = graythresh(citra1);
    citra_biner1 = im2bw(citra1, level_citra1);

    level_citra2 = graythresh(citra2);
    citra_biner2 = im2bw(citra2, level_citra2);

    % Melakukan operasi OR pada citra biner
    hasil_or_biner = citra_biner1 | citra_biner2;

    % Menampilkan hasil di axes7
    axes(handles.axes7);
    imshow(hasil_or_biner);
    title(handles.axes7, 'Hasil Operasi OR Citra 1 dan 2');

    % Menyimpan hasil operasi OR ke dalam handles
    handles.hasil_or = hasil_or_biner;

    % Menyimpan handles
    guidata(hObject, handles);


% --- Executes on button press in btn_not.
function btn_not_Callback(hObject, eventdata, handles)
% hObject    handle to btn_not (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    % Mendapatkan citra dari axes2
    axes2_image = getimage(handles.axes2);
    citra1 = rgb2gray(axes2_image);

    % Mengonversi citra1 ke citra biner
    level_citra1 = graythresh(citra1);
    citra_biner1 = im2bw(citra1, level_citra1);

    % Melakukan operasi complement pada citra biner
    hasil_not_biner1 = imcomplement(citra_biner1);

    % Menampilkan hasil di axes7
    axes(handles.axes7);
    imshowpair(citra_biner1, hasil_not_biner1, 'montage');
    title(handles.axes7, 'Hasil Operasi NOT dari Citra 1');

    % Menyimpan hasil operasi NOT ke dalam handles
    handles.hasil_not1 = hasil_not_biner1;

    % Menyimpan handles
    guidata(hObject, handles);
