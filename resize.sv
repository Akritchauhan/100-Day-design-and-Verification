module dynamic_array_resize;
  int arr[];
  
  initial begin
    arr=new[3];
    foreach(arr[i]) arr[i]=i+1;
    $display("Before resize :%p",arr);
    
    
    arr=new[5](arr);//copy old content
    arr[3]=10;
    arr[4]=20;
    $dsiplay("After resize:%p"arr);
    
    arr=new[10];
    $dsiplay("After resize:%p",arr);
  end
endmodule
