call liquibase.bat diffChangeLog --includeSchema=true
call liquibase/liquibase.bat updateSQL > diff.sql
