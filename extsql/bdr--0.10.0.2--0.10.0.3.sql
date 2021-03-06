SET LOCAL search_path = bdr;
SET bdr.permit_unsafe_ddl_commands = true;
SET bdr.skip_ddl_replication = true;

-- Read-only node support
ALTER TABLE bdr.bdr_nodes ADD COLUMN node_read_only boolean DEFAULT false;

CREATE FUNCTION bdr.bdr_node_set_read_only(
    node_name text,
    read_only boolean
) RETURNS void LANGUAGE C VOLATILE
AS 'MODULE_PATHNAME';

RESET bdr.permit_unsafe_ddl_commands;
RESET bdr.skip_ddl_replication;
RESET search_path;
