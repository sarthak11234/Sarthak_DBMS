declare
v_r number;
total number;
nm varchar2(50);
gr varchar2(20);
begin
v_r := &r;
select roll_no, name, total_mark into v_r, nm, total from student_mark where roll_no = v_r;
proc_grade(v_r, total, gr);
DBMS_OUTPUT.PUT_LINE(v_r || ' ' || nm || ' ' || gr);
insert into student_result(roll_no, name, grade) values (v_r, nm, gr);
DBMS_OUTPUT.PUT_LINE('one record inserted');
end;
/