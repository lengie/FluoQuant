function varargout = Mask(varargin)
%{
Written 5/25/11 by Liana Engie, Joint Science Department of the Claremont
Colleges.

MASK is a user interface (created in GUIDE) to quantify fluorescent images.
Users process every TIF file in a folder and can cycle through them.

Outputs:
-Excel spreadsheet with numbers for each set of corresponding images
-PNG of each masked image (STILL BEING REFINED)
%}

% MASK M-file for Mask.fig
%      MASK, by itself, creates a new MASK or raises the existing
%      singleton*.
%
%      H = MASK returns the handle to a new MASK or the handle to
%      the existing singleton*.
%
%      MASK('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MASK.M with the given input arguments.
%
%      MASK('Property','Value',...) creates a new MASK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Mask_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Mask_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Last Modified by GUIDE v2.5 01-Jun-2011 11:35:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @Mask_OpeningFcn, ...
    'gui_OutputFcn',  @Mask_OutputFcn, ...
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


% --- Executes just before Mask is made visible.
function Mask_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Mask (see VARARGIN)

% Choose default command line output for Mask
handles.output = hObject;
%handles.scaled_invisible = 0;
handles.opacity = .2;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Mask wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Mask_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function Threshold_edit_Callback(hObject, eventdata, handles)
% hObject    handle to Threshold_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Threshold_edit as text
%        str2double(get(hObject,'String')) returns contents of Threshold_edit as a double


%store the contents of Threshold_edit as a string. if the string
%is not a number then input will be empty
input = str2num(strtrim(get(hObject,'String')));

if (isempty(input))
    set(hObject,'String','0')
end

guidata(hObject, handles); %end each callback function with this


% --- Executes during object creation, after setting all properties.
function Threshold_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Threshold_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Second_Threshold_edit_Callback(hObject, eventdata, handles)
% hObject    handle to Second_Threshold_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Second_Threshold_edit as text
%        str2double(get(hObject,'String')) returns contents of Second_Threshold_edit as a double


%store the contents of Second_Threshold_edit as a string. if the string
%is not a number then input will be empty
input = str2num(strtrim(get(hObject,'String')));

if (isempty(input))
    set(hObject,'String','0')
end

guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function Second_Threshold_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Second_Threshold_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Third_Threshold_edit_Callback(hObject, eventdata, handles)
% hObject    handle to Third_Threshold_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Third_Threshold_edit as text
%        str2double(get(hObject,'String')) returns contents of Third_Threshold_edit as a double

%store the contents of Third_Threshold_edit as a string. if the string
%is not a number then input will be empty
input = str2num(strtrim(get(hObject,'String')));

if (isempty(input))
    set(hObject,'String','0')
end

guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function Third_Threshold_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Third_Threshold_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Reverse_push.
function Reverse_push_Callback(hObject, eventdata, handles)
% hObject    handle to Reverse_push (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

scaled_invisible = handles.scaled_invisible;

steps = get(handles.channels_edit,'String'); %`viewing frame'
steps = str2double(steps);
files = dir('*.tif'); %there must be some way to do this outside of the
%functions and just put it into the inputs
num = get(handles.current_image_static,'String');
num = str2double(num);

masks = handles.masks;
yellow = handles.yellow;
opacity = handles.opacity;

a = imread(files(num-1).name);
b = imread(files(num-2).name);
ind = (num-1)/steps;

if steps == 3
    num = num - 3;
    axes(handles.axes1);
    c = imread(files(num).name);
    hold on
    if scaled_invisible == true;
        imagesc(c);
        h = imshow(yellow);
    else
        imshow(c);
        h = imshow(yellow);
    end
    hold off
    set(h, 'AlphaData', opacity*masks{ind});

    axes(handles.axes2);
    hold on
    if scaled_invisible == true;
        imagesc(b);
        h = imshow(yellow);
    else
        imshow(b);
        h = imshow(yellow);
    end
    hold off
    set(h, 'AlphaData', opacity*masks{ind});

    axes(handles.axes3);
    hold on
    if scaled_invisible == true;
        imagesc(a);
        h = imshow(yellow);
    else
        imshow(as);
        h = imshow(yellow);
    end
    hold off
    set(h, 'AlphaData', opacity*masks{ind});
elseif steps==2
    num = num - 2;
    axes(handles.axes1);
    hold on
    if scaled_invisible == true;
        imagesc(b);
        h = imshow(yellow);
    else
        imshow(b);
        h = imshow(yellow);
    end
    hold off
    set(h, 'AlphaData', opacity*masks{ind});

    axes(handles.axes2);
    hold on
    if scaled_invisible == true;
        imagesc(a);
        h = imshow(yellow);
    else
        imshow(a);
        h = imshow(yellow);
    end
    hold off
    set(h, 'AlphaData', opacity*masks{ind});
elseif steps==1
    num = num - 1;
    axes(handles.axes1);
    hold on
    if scaled_invisible == true; %checkbox
        imagesc(a);
        h = imshow(yellow);
    else
        imshow(a);
        h = imshow(yellow);
    end
    hold off
    set(h, 'AlphaData', opacity*masks{ind});
end

next = num2str(num);
set(handles.current_image_static,'String',next);
guidata(hObject, handles);

% --- Executes on button press in Next_push.
function Next_push_Callback(hObject, eventdata, handles)
% hObject    handle to Next_push (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

scaled_invisible = handles.scaled_invisible;

steps = get(handles.channels_edit,'String'); %`viewing frame'
steps = str2double(steps);
files = dir('*.tif'); %there must be some way to do this outside of the
%functions and just put it into the inputs
num = get(handles.current_image_static,'String');
num = str2double(num); %current DAPI

masks = handles.masks;
ind = (num+(steps-1))/steps;

yellow = handles.yellow;
opacity = handles.opacity;

%cla(handles.axes1)
%cla(handles.axes2)
%cla(handles.axes3)
if steps==1
    ind = num+1;
elseif steps==2
    ind = (num+3)/steps;
elseif steps==3
    ind = (num+5)/steps;
end

b = imread(files(num+3).name); %previous 1st image + 3

if steps ==3
    axes(handles.axes2); %previous 1st image + 2
    num = num + 3;
    a = imread(files(num+1).name);
    hold on
    if scaled_invisible == true;
        imagesc(a);
        h = imshow(yellow);
    else
        imshow(a);
        h = imshow(yellow);
    end
    hold off
    set(h, 'AlphaData', opacity*masks{ind});

    axes(handles.axes1);
    hold on
    if scaled_invisible == true;
        imagesc(b);
        h = imshow(yellow);
    else
        imshow(b);
        h = imshow(yellow);
    end
    hold off
    set(h, 'AlphaData', opacity*masks{ind});

    axes(handles.axes3);
    c = imread(files(num+2).name);
    hold on
    if scaled_invisible == true;
        imagesc(c);
        h = imshow(yellow);
    else
        imshow(c);
        h = imshow(yellow);
    end
    hold off
    set(h, 'AlphaData', opacity*masks{ind});
elseif steps==2
    axes(handles.axes1); %previous 1st image + 2
    num = num + 2;
    a = imread(files(num).name);
    hold on
    if scaled_invisible == true;
        imagesc(a);
        h = imshow(yellow);
    else
        imshow(a);
        h = imshow(yellow);
    end
    hold off
    set(h, 'AlphaData', opacity*masks{ind});

    axes(handles.axes2);
    hold on
    if scaled_invisible == true;
        imagesc(b);
        h = imshow(yellow);
    else
        imshow(b);
        h = imshow(yellow);
    end
    hold off
    set(h, 'AlphaData', opacity*masks{ind});
elseif steps==1
    num = num + 1;
    a = imread(files(num).name); %just goes up one

    axes(handles.axes1);
    hold on
    if scaled_invisible == true; %checkbox
        imagesc(a);
        h = imshow(yellow);
    else
        imshow(a);
        h = imshow(yellow);
    end
    hold off
    set(h, 'AlphaData', opacity*masks{ind});
end

next = num2str(num);
set(handles.current_image_static,'String',next);
guidata(hObject, handles);


function channels_edit_Callback(hObject, eventdata, handles)
% hObject    handle to channels_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of channels_edit as text
%        str2double(get(hObject,'String')) returns contents of channels_edit as a double

%really, I've only prepared for this being a number between 1 and 3.

input = str2num(strtrim(get(hObject,'String')));

%checks to see if input is empty. if so, default channels_edit to two
if (isempty(input))
    set(hObject,'String','2')
end
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function channels_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to channels_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in scaled_checkbox.
function scaled_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to scaled_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of scaled_checkbox

if (get(hObject,'Value') == get(hObject,'Max'))
    % imagesc
    check = true;
else
    % imread
    check = false;
end

handles.scaled_invisible = check;
guidata(hObject, handles);
assignin('base','handles',handles);


% --- Executes on button press in Process_push.
function Process_push_Callback(hObject, eventdata, handles)
% hObject    handle to Process_push (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global scaled_invisible
scaled_invisible = handles.scaled_invisible; %seems like it's working now...
colormap('gray');
MaskThreshold = get(handles.Threshold_edit,'String');
MaskThreshold = str2num(MaskThreshold);
SecThresh = get(handles.Second_Threshold_edit,'String');
SecThresh = str2num(SecThresh);
TrdThresh = get(handles.Third_Threshold_edit,'String');
TrdThresh = str2num(TrdThresh);

files = dir('*.tif'); %gets every .tif file in the folder

captured = get(handles.Date_captured_edit,'String');
processed = get(handles.Date_processed_edit,'String');
steps = get(handles.channels_edit,'String');
steps = str2double(steps);

global masks
masks = {};

global yellow %to make the mask for cycling
opacity = handles.opacity;

%Setting up the cell array
values = {'Date Captured','Date Processed','Image','DAPI Bfr','DAPI Masked'};
if steps == 2 || steps == 3
    values(1,6) = {'RedBfr'};
    values(1,7) = {'RedMasked'};
    values(1,10) = {'Red Masked/DAPI Masked'};
    if steps == 3
        values(1,8) = {'GreenBfr'};
        values(1,9) = {'GreenMasked'};
        values(1,11) = {'Grn Masked/DAPI Masked'};
    end
end

for i = 1:steps:numel(files)
    a = files(i).name; %DAPI
    set(handles.current_image_static,'String',i);
    b = files(i+1).name;
    if steps==3
        c = files(i+2).name;
    end


    %MASKCODE BEGINS HERE
    q = imread(a); %DAPI picture
    p = imread(b); %Chd1 picture
    axes(handles.axes1);
    if scaled_invisible == true;
        imagesc(q);
    else
        imshow(q);
    end
    mask = true(size(q)); %creates a matrix of 1s
    %%%%%%%%%%alternate masking code: arrayfun(@(x)x*double(x>MaskThreshold),q)

    %%%mask & image%%%
    m = find(q<=MaskThreshold);
    mask(m) = false; %masks
    mask2 = zeros(size(mask)); %for the image
    mask2(mask) = opacity; %for the transparency

    %%%false coloring: colors where the mask is %%%
    yellow = cat(3,255*ones(size(q)),255*ones(size(q)),zeros(size(q)));
    hold on
    h = imshow(yellow);
    hold off
    set(h, 'AlphaData', mask2);

    %saving
    F = getframe(handles.axes1);  % Only want to get axes.
    imwrite(F.cdata,strcat(a(1:length(a)-4),' mask.png'));  % Write the image.


    DAPIBfr = sum(sum(q)); %total sum of DAPI
    set(handles.DAPI_unmasked_static,'String',DAPIBfr);

    qcopy = q;
    qcopy(~mask)=0;
    DAPIMasked = sum(sum(qcopy));
    set(handles.DAPI_masked_static,'String',DAPIMasked);

    %Values
    if steps == 2 || steps == 3
        d = imread(b);
        RedBfr = sum(sum(d));
        d(~mask)=0;
        cutoffR = find(d<=SecThresh);
        d(cutoffR) = 0;
        RedMasked = sum(sum(d));

        RedRatio = RedMasked/DAPIMasked;
        set(handles.Second_ratio_static,'String',RedRatio);


        %Chd1 false color image
        axes(handles.axes2); %this takes 6 seconds
        if scaled_invisible == true;
            imagesc(p)
        else
            imshow(p)
        end
        hold on
        h = imshow(yellow);
        hold off
        set(h, 'AlphaData', mask2);
        F = getframe(handles.axes2);  % Only want to get axes.
        imwrite(F.cdata,strcat(b(1:length(b)-4),' mask.png'))

        %Third Channel's image
        if steps==3
            axes(handles.axes3);
            e = imread(c);
            if scaled_invisible == true;
                imagesc(e); %display before the mask is applied
            else
                imshow(e);
            end
            GreenBfr = sum(sum(e));
            e(~mask)=0;
            cutoffG = find(e<=TrdThresh);
            e(cutoffG) = 0;
            GreenMasked = sum(sum(e));

            GrnRatio = GreenMasked/DAPIMasked;
            set(handles.Third_ratio_static,'String',GrnRatio);

            hold on
            h = imshow(yellow);
            hold off
            set(h, 'AlphaData', mask2);
            F = getframe(handles.axes3);  % Only want to get axes.
            imwrite(F.cdata,strcat(c(1:length(c)-4),' mask.png'))
        end
    end
    %MASKCODE ENDS HERE

    cells = size(values); %so that the spreadsheet is not affected by steps
    %cells can also be used as a counter

    masks(cells(1)) = {mask}; %better to store the binary (rather than mask2)

    %For either 2 or 3 channels, there will be the following
    %The first image will be on the second row, etc
    values(cells(1)+1,1) = {captured};
    values(cells(1)+1,2) = {processed};
    values(cells(1)+1,3) = {a};
    values(cells(1)+1,4) = {DAPIBfr};
    values(cells(1)+1,5) = {DAPIMasked};
    if steps==2 || steps ==3
        values(cells(1)+1,6) = {RedBfr};
        values(cells(1)+1,7) = {RedMasked};
        values(cells(1)+1,10) = {RedRatio};
        if steps==3 %additional if there are three channels
            values(cells(1)+1,8) = {GreenBfr};
            values(cells(1)+1,9) = {GreenMasked};
            values(cells(1)+1,11) = {GrnRatio};
        end
    end
end

file_name = strcat(captured,' Processed.xls');
xlswrite(file_name,values); %could have made it .csv or .mat
%To be more general, and accessible, I chose .csv
%HOWEVER, NOT WORKING YET. Only xls is working. Okay fine.

handles.yellow = yellow;
handles.masks = masks;

guidata(hObject, handles);


function Date_captured_edit_Callback(hObject, eventdata, handles)
% hObject    handle to Date_captured_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Date_captured_edit as text
%        str2double(get(hObject,'String')) returns contents of Date_captured_edit as a double


%checks to see if input is empty. if so, default Date_captured_edit to
%yy_mm_dd
if (isempty(get(hObject,'String')))
    set(hObject,'String','yy_mm_dd')
end
guidata(hObject, handles);
assignin('base','handles',handles);

% --- Executes during object creation, after setting all properties.
function Date_captured_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Date_captured_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Date_processed_edit_Callback(hObject, eventdata, handles)
% hObject    handle to Date_processed_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Date_processed_edit as text
%        str2double(get(hObject,'String')) returns contents of Date_processed_edit as a double


%checks to see if input is empty. if so, default Date_processed_edit to
%'yy_mm_dd'
if (isempty(get(hObject,'String')))
    set(hObject,'String','yy_mm_dd')
end
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function Date_processed_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Date_processed_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on button press in first_image_push.
function first_image_push_Callback(hObject, eventdata, handles)
% hObject    handle to first_image_push (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

scaled_invisible = handles.scaled_invisible;

steps = get(handles.channels_edit,'String'); %`viewing frame'
steps = str2double(steps);
files = dir('*.tif'); %there must be some way to do this outside of the
%functions and just put it into the inputs
masks = handles.masks;

yellow = handles.yellow;
opacity = handles.opacity;

%clearing - probably not necessary
cla(handles.axes1)
cla(handles.axes2)
cla(handles.axes3)

a = imread(files(1).name);

axes(handles.axes1);
hold on
if scaled_invisible == true; %checkbox
    imagesc(a);
    h = imshow(yellow);
else
    imshow(a);
    h = imshow(yellow);
end
hold off
set(h, 'AlphaData', opacity*masks{1});

if steps ==2 || steps ==3
    axes(handles.axes2); %happens regardless
    b = imread(files(2).name);
    hold on
    if scaled_invisible == true;
        imagesc(b);
        h = imshow(yellow);
    else
        imshow(b);
        h = imshow(yellow);
    end
    hold off
    set(h, 'AlphaData', opacity*masks{1});

    if steps ==3 %addition, for steps == 3
        axes(handles.axes3);
        c = imread(files(3).name);
        hold on
        if scaled_invisible == true;
            imagesc(c);
            h = imshow(yellow);
        else
            imshow(c);
            h = imshow(yellow);
        end
        hold off
        set(h, 'AlphaData', opacity*masks{1});
    end
end

current = num2str(1);
set(handles.current_image_static,'String',current)
guidata(hObject, handles);

% --- Executes on button press in last_image_push.
function last_image_push_Callback(hObject, eventdata, handles)
% hObject    handle to last_image_push (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
scaled_invisible = handles.scaled_invisible;

steps = get(handles.channels_edit,'String'); %`viewing frame'
steps = str2double(steps);
files = dir('*.tif'); %there must be some way to do this outside of the
%functions and just put it into the inputs
masks = handles.masks;
yellow = handles.yellow;
opacity = handles.opacity;

cla(handles.axes1)
cla(handles.axes2)
cla(handles.axes3)

last = length(files);
ind = numel(masks);

a = imread(files(last).name); %last image

axes(handles.axes1);
hold on
if scaled_invisible == true; %checkbox
    imagesc(a);
    h = imshow(yellow);
else
    imshow(a);
    h = imshow(yellow);
end
hold off
set(h, 'AlphaData', opacity*masks{ind});

if steps == 1
    current = num2str(last);
    set(handles.current_image_static,'String',current)
end

if steps ==2 || steps ==3
    b = imread(files(last-1).name);
    if steps ==3
        c = imread(files(last-2).name);
        if scaled_invisible == true;
            axes(handles.axes1);
            hold on
            imagesc(c); %last-2
            h = imshow(yellow);
            hold off
            set(h, 'AlphaData', opacity*masks{ind});

            axes(handles.axes2);
            hold on
            imagesc(b); %last-1
            h = imshow(yellow);
            set(h, 'AlphaData', opacity*masks{ind});

            axes(handles.axes3);
            hold on
            imagesc(a); %last
            h = imshow(yellow);
            set(h, 'AlphaData', opacity*masks{ind});
        else
            axes(handles.axes1);
            hold on
            imshow(c); %last-2
            h = imshow(yellow);
            hold off
            set(h, 'AlphaData', opacity*masks{ind});

            axes(handles.axes2);
            hold on
            imshow(b); %last-1
            h = imshow(yellow);
            set(h, 'AlphaData', opacity*masks{ind});

            axes(handles.axes3);
            hold on
            imshow(a); %last
            h = imshow(yellow);
            set(h, 'AlphaData', opacity*masks{ind});
        end

        current = num2str(last-2);
        set(handles.current_image_static,'String',current)
    else %if steps==2
        if scaled_invisible == true;
            axes(handles.axes1);
            hold on
            imagesc(b);
            h = imshow(yellow);
            hold off
            set(h, 'AlphaData', opacity*masks{ind});

            axes(handles.axes2);
            hold on
            imagesc(a);
            h = imshow(yellow);
            set(h, 'AlphaData', opacity*masks{ind});
        else
            axes(handles.axes1);
            hold on
            imshow(b);
            h = imshow(yellow);
            hold off
            set(h, 'AlphaData', opacity*masks{ind});

            axes(handles.axes2);
            hold on
            imshow(a);
            h = imshow(yellow);
            set(h, 'AlphaData', opacity*masks{ind});
        end

        current = num2str(last-1);
        set(handles.current_image_static,'String',current)
    end
end

guidata(hObject, handles);
