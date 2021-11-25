with Ada.Text_IO;
use Ada.Text_IO;

package body package_array is

   procedure init_arr(size : Integer) is
   begin
      for i in 1..size loop
         arr(i) := Long_Integer(i);
      end loop;
   end init_arr;
   
   procedure part_sum(index, size : in Integer) is
   begin
      arr(index) := arr(index)+arr(size-index+1);
   end part_sum;
   
   protected body monitor is
      procedure counter is
      begin
         count := count - 1;
      end counter;   
      
      procedure set_counter(sc : Integer) is
      begin
         count := sc;
      end set_counter;
      
      entry get_result(gr : out Long_Integer) when count = 0 is
      begin   
         gr := arr(1);
      end get_result;     
   end monitor;  

   task body my_task is
      index, size : Integer;
   begin
      accept start(i, s : in Integer) do
         index := i;
         size := s;
      end start;
      part_sum(index,size);
      monitor.counter;
   end my_task;   


end package_array;
