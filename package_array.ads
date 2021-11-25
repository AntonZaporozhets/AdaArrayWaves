package package_array is
   
   size : Integer;
   s : Integer;
   threads : Integer;
   result : Long_Integer;
   arr : array (1..100000) of Long_Integer;
   procedure init_arr(size : Integer);
   procedure part_sum(index, size : in Integer);
   
   task type my_task is
      entry start(i, s : in Integer);
   end my_task;
   
   protected monitor is
      procedure counter;
      procedure set_counter(sc : Integer);
      entry get_result(gr : out Long_Integer);
   private
      count : Integer;
   end monitor;   

end package_array;
