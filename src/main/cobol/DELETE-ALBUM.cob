IDENTIFICATION DIVISION.
PROGRAM-ID. DELETE-ALBUM.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  ALBUM-ID         PIC X(40).

PROCEDURE DIVISION.
    DISPLAY "Enter Album ID to Delete: ".
    ACCEPT ALBUM-ID.

    EXEC SQL
        DELETE FROM ALBUM
        WHERE id = :ALBUM-ID
    END-EXEC.

    IF SQLCODE = 0 THEN
        DISPLAY "Album deleted successfully."
    ELSE
        DISPLAY "Error deleting album."
        DISPLAY "SQLCODE: " SQLCODE
        IF SQLCODE = 100 THEN
            DISPLAY "Album not found."
        ELSE
            DISPLAY "Please check the database and input values."
        END-IF
    END-IF.

    STOP RUN.
