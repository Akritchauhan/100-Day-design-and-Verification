function [7:0] square:
  input [3:0] a;
  begin
    square=a * a;
  end
endfunction



function [7:0] max_value:
  input [7:0]a,b;
  begin
    max_value=a>b?a:b;
  end
endfunction


function parity:
  input [7:0] data;
  begin
    parity=^data;
  end
endfunction
