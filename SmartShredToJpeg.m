
   function SmartShredToJpeg(C,fname)
 % C is a cell array that houses a shredded jpeg. (Assume produced by the function Shred}
 % This function creates a jpeg file with name fname, obtained by applying imwrite to the
 % ``glued together'' shreds.
 
 % The number of shreds..
 q = length(C); 
 B = cell(q,1);
 % Components in the following vector will be set to zero as shreds are selected. 
 % I.e., WhoIsLeft(k)==0 means the kth shred has been selected.
 WhoIsLeft = ones(1,q);
 for k = 1:q
     % Pick the kth shred for the sorted image
     if k==1
         % Find the shred with the darkest left edge
         for k = 1:q;
           v(k) = sum(double(C{k}(:,1,1)))+sum(double(C{k}(:,1,2)))+sum(double(C{k}(:,1,3)));
         end
         [mv,i] = min(v);
         B{1} = C{i};
         WhoIsLeft(i) = 0;
         last = i;
     else
     % Now look for the best left edge among the remaining shreds
         alfa = inf;
         for i=1:q
             if WhoIsLeft(i)==1
                % The ith shred is a candidate
                mu = PixelDiff(C{last},C{i});
                if mu <= alfa
                   % We have discovered a new best shred. Remember its index
                   % and the distance of its left edge to the right edge of
                   % C{last}..
                   iBest = i;
                   alfa = mu;
                end
             end
         end
         last = iBest;
         B{k} = C{iBest};
         WhoIsLeft(iBest) = 0;
     end
 end
 ShredToJpeg(B,fname)
 
 function alfa = PixelDiff(Y,Z)
   [my,ny,r] = size(Y);
   [mz,nz,r] = size(Z);
   alfa = sum(abs(double(Y(:,ny,1))-double(Z(:,1,1))))+...
             sum(abs(double(Y(:,ny,2))-double(Z(:,1,2))))+...
             sum(abs(double(Y(:,ny,3))-double(Z(:,1,3))));
 
 
 