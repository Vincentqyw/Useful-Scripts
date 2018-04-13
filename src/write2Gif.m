
function write2Gif(input_file_path,output_name,dt)

img_path_list=dir(strcat(input_file_path,'/', '*.jpg'));
[~, ind] = sort([img_path_list(:).datenum], 'ascend');
img_path_list = img_path_list(ind);
img_num=length(img_path_list);
if img_num > 0
    figure;
    set(gcf,'position',[467 73 726 726])
    for j=1:img_num
        image_name = img_path_list(j).name;
        read_image = imread(strcat(input_file_path,'/', image_name));
        imshow(read_image,'border','tight','initialmagnification','fit');
        axis normal
        truesize
        dis = j;
        text(40,40,sprintf('Frame : %d',dis),'fontsize',20,'color','y');
        n=j;
        frame(n)=getframe(gcf); % get the frame
        image=frame(n).cdata;
        [image,map]     =  rgb2ind(image,256);
            
        if n==1
             imwrite(image,map,output_name,'gif','Loopcount',inf);
        else
             imwrite(image,map,output_name,'WriteMode','append','DelayTime',dt);
        end
    end
end
