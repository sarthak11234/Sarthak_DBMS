create or replace procedure  proc_grade(
r in number,
gt in number,
grade out varchar2
)
is
begin
if gt >= 500 then
grade := '1st class with dist.';
elsif gt >= 350 then
grade := '1st class';
elsif gt >= 250 then
grade := '2nd class';
else
grade := 'fail';
end if;
end proc_grade;
/