%% This scipt illustrates how to get 20-sim model variables and their properties
%% NOTE: before running this script, make sure that 20sim is opened and the xmlrpc interface is enabled! 

clear; 

% Do not use the Octave paging functionality.
if exist('OCTAVE_VERSION','builtin') == 5 && page_screen_output == 1
  more off;
end

% all function files are found in the library directory. Always make sure the 20-sim path is set in your Octave/Matlab session.
run('../library/xxsim/xxsimAddToPath.m');

% connect to 20-sim
xxsimConnect();

%fprintf('The script will now open and process the model 9_link_snake_31-12-2020distb(type2).emx...');
%input(' [Press ''Enter'' to continue]');

% open the tutorial model ControlledSystem.emx (from the currrent working directory)
modelfile = fullfile(pwd, '9_link_snake_26-03-2021distb(pd)');
xxsimOpenModel(modelfile);

% process the model
xxsimProcessModel();

% pause
%fprintf('The script will now get all parameters in the model using ''xxsimGetParameters''...');
%input(' [Press ''Enter'' to continue]');

% get all parameters
%fprintf('List of parameters in the model...\n');
par = xxsimGetParameters({});

% display the list
%for i = 1: length(par)
    %fprintf('\t%s%s%f\n', par(i).name,' = ', par(i).values);
%end

% contents of xxsimGetParameters
%fprintf('\n NOTE: The function xxsimGetParameters returns a scalar structure containing the fields: name, size, values, properties \n');

%fprintf('\tname = name of parameter\n\tsize = size of parameter (e.g matrix size)\n\tvalues = value(s) of parameter\n\tproperties = struct array containing the fields key and value: key contains ''value type'' (e.g parameter, initial value), arithmetictype, quantity, unit and unit symbol\n\n NOTE: This also holds for functions ''xxsimGetVariables'', ''xxsimGetValues'' and ''xxsimGetInitialValues''');

%fprintf('\n\n Let us now include units (if specified) to the parameter list shown above...');
%fprintf('\n We will use ''properties'' field to extract units...\n');
%input(' [Press ''Enter'' to continue]');

% Let us now get all parameters with their units
%for i = 1: length(par)
 %   prop = par(i).properties;
 %   fprintf('\t%s%s%f %s\n', par(i).name,' = ', par(i).values, prop(5).value);
%end

% get all initial values
%fprintf('\n The script will now get all initial values in the model using ''xxsimGetVariables''...');
%input(' [Press ''Enter'' to continue]');

% Note: The model has to be processed first to get initial values
%ini = xxsimGetVariables({}, 'initialValue');
%for i = 1: length(ini)
   % prop = ini(i).properties;
    %fprintf('\t%s%s%f %s\n', ini(i).name,' = ', ini(i).values, prop(5).value);
%end

%fprintf('\nThe ''properties'' field can also be used to filter value types such as parameters, initial values ,...');
%fprintf('\n Example : Let us first get the list of all variables then filter initial values...');
%input(' [Press ''Enter'' to continue]');

% first get all variables
var = xxsimGetVariables({});
%fprintf('List of all variables ...\n');
%for i = 1: length(var)
  %  fprintf('\t%s\n', var(i).name);
%end

%input('[Press ''Enter'' to filter initial values using ''properties'' field]');
%for i = 1: length(var)
  %  initFiltered = var(i).properties;
   % if strcmp(initFiltered(1).key, 'initialValue')
   %     fprintf('\t%s\n', var(i).name);
    %end
%end

% inform the user before closing model
%fprintf('\nThe script will now close the model...');
%input(' [Press ''Enter'' to continue]');

% close the tutorial model ControlledSystem.emx
%xxsimCloseModel();

% disconnect from 20-sim
%xxsimDisconnect(); 

%clear;
retval = xxsimSetLogVariables({'time','vt'});
retval1 = xxsimSetLogVariables({'time','Qt'});
