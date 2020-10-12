function bias_Image=create_bias_image(img,nrow,ncol,alpha)
%% Code here
%% nrow and ncol are size of bias_Image
bias_Image=zeros(nrow,ncol);
for i=1:nrow
   for j=1:ncol
     %% create a random number in range [1 ? alpha,1+ alpha]
     %% Without condition 
     bias_Image(i,j)= (1- alpha) + 2*alpha.*rand(1,1);
     %% With condition slowly varying-how to do it

   end
end
bias_Image = bias_Image +img
end