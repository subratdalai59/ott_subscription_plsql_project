set serveroutput on
set verify off
declare
co ott%rowtype;
cs subs%rowtype;
sidd number(2):=&sidd;
ottidd number(3):=&ottidd;
ctypee varchar(15):='&ctypee';
s number(1);
o number(1);
s1 number(2);
o2 number(2);
discc number(5);
famtt number(5);
ott_error exception;
subs_error exception;
both_error exception;
not_taken exception;
sorry exception;
begin
select count(sid) into s from subs where sid=sidd;
select count(ottid) into o from ott where ottid=ottidd;
if s=0 or o=0 then
        if o=0 and s=0 then
                raise both_error;
        elsif s=0 then
                raise subs_error;
        else
                raise ott_error;
        end if;
else
        select * into co from ott where ottid=ottidd;
        select * into cs from subs where sid=sidd;
        select count(sid) into s1 from ottsubs where sid=sidd;
        select count(ottid) into o2 from ottsubs where ottid=ottidd;
        if s1>0 and o2>0 then
                raise not_taken;
        elsif o2=4 then
                raise sorry;
        else
                if ctypee='student' then
                        discc:=co.ottcost-(co.ottcost/2);
                        famtt:=co.ottcost-discc;
                else
                        discc:=0;
                        famtt:=co.ottcost;
                end if;
                insert into ottsubs values (cs.sid,co.ottid,ctypee,co.ottcost,discc,famtt);
        end if;
end if;
exception
when ott_error then
dbms_output.put_line('ott id wrong !');
when subs_error then
dbms_output.put_line('susbcriber id wrong !');
when both_error then
dbms_output.put_line('both ott id and susbcriber id wrong !');
when not_taken then
dbms_output.put_line('already having a subscription yo cant take it again  !');
when sorry then
dbms_output.put_line('Sorry , already 4 subscribers has already taken this ,limit exceed !');
end;
/
select * from ottsubs;
