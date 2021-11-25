with Ada.Text_IO, Ada.Long_Integer_Text_IO, package_array;
use Ada.Text_IO, Ada.Long_Integer_Text_IO, package_array;

procedure Main is

begin
   Put("Input a size of array: ");
   size := Integer'Value(Get_Line);

   init_arr(size);
   while size > 1 loop
      threads := size/2;
      declare
         var_task : array (1..threads) of my_task;
      begin
         monitor.set_counter(threads);
         for i in 1..threads loop
            var_task(i).start(i,size);
         end loop;

         if size mod 2 = 1 then
            size := size/2 + 1;
         else
            size := size/2;
         end if;
      end;
      monitor.get_result(result);
   end loop;

   New_Line;
   Put("Result: ");
   Put_Line(result'img);

end Main;
