-- pkg = SQL package name or Pro*C source file name
-- pgm = SQL packgage procedure name or Pro*C procedure or function name

select lpm.pkg, lpm.pgm,
       lm.log_id, lm.pgm_id, lm.log_code, lm.custid, lm.facility,
       lm.orderid, lm.author, lm.sid, lm.msg, lm.create_date, lm.create_user
from log_messages lm
join log_programs_master lpm on lm.pgm_id = lpm.pgm_id
where 1=1
  and lower(pkg) = 'zwave'
  --and lower(lpm.pgm) in ('start_ptl_order','pick_order_by_subtask','pick_a_plate')
  and lm.create_date >= sysdate - interval '2' minute  -- can be minute, hour, day
order by lm.log_id;
