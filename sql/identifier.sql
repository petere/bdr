-- No real way to test the sysid, so ignore it
SELECT timeline= 1, dboid = (SELECT oid FROM pg_database WHERE datname = current_database())
FROM bdr.bdr_get_local_nodeid();