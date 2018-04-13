addpath(genpath(pwd));

%% write frames to gif
input_file_path=['Input'];
output_name='out.gif';
dt=0.2;
write2Gif(input_file_path,output_name,dt);