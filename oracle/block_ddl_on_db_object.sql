-- Block DDL executions on a specific database object

CREATE OR REPLACE TRIGGER "TRIGGER_BLOCK_DDL_PROTECTED_OBJECT"
  before CREATE or DROP on database
begin

  if (ORA_DICT_OBJ_NAME = 'PROTECTED_OBJECT' AND UPPER(ora_dict_obj_owner) = 'OWNER_NAME') then
    dbms_output.put_line('TRIGGER_BLOCK_DDL_PROTECTED_OBJECT');
    RAISE_APPLICATION_ERROR(-20000,'The "PROTECTED_OBJECT" cannot be modified');
  end if;
end;
