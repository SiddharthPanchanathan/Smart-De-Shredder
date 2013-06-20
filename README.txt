Smart-De-Shredder tries to glue the randomly ordered shreds together in the right order so as to reconstruct 
the original image. We assume that in the original image, there is a black border along the left edge.
That identiﬁes the left most shred. As far as reassembling the shreds in the right order, when we 
“cut” the orginal image into vertical strips, the pixels along the right edge of the “left” strip are
very similar to the pixels along the left edge of the “right” strip. Thus, as we glue the strips together 
one-by-one left-to-right, we look among the remaining strips for that strip whose left edge looks the most like 
the right edge of the last strip glued in.
