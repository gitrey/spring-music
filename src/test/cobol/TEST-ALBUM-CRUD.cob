IDENTIFICATION DIVISION.
PROGRAM-ID. TEST-ALBUM-CRUD.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  TEST-ALBUM.
    05  ALBUM-ID         PIC X(40).
    05  ALBUM-TITLE      PIC X(255) VALUE "Test Album".
    05  ALBUM-ARTIST     PIC X(255) VALUE "Test Artist".
    05  ALBUM-RELEASE-YEAR PIC X(4) VALUE "2023".
    05  ALBUM-GENRE      PIC X(255) VALUE "Test Genre".
    05  ALBUM-TRACK-COUNT PIC 9(3) VALUE 10.
    05  ALBUM-EXT-ID     PIC X(255) VALUE "TEST1234".

01  READ-ALBUM-DATA.
    05  READ-TITLE      PIC X(255).
    05  READ-ARTIST     PIC X(255).
    05  READ-RELEASE-YEAR PIC X(4).
    05  READ-GENRE      PIC X(255).
    05  READ-TRACK-COUNT PIC 9(3).
    05  READ-EXT-ID     PIC X(255).

01  ALBUMS-FOUND       PIC X(1) VALUE 'N'.

PROCEDURE DIVISION.
    DISPLAY "--- Starting Album CRUD Tests ---".

    DISPLAY "-- Test Case 1: Create Album --".
    CALL "CREATE-ALBUM" USING TEST-ALBUM.
    IF SQLCODE = 0 THEN
        DISPLAY "Test Case 1 Passed: Album created successfully."
    ELSE
        DISPLAY "Test Case 1 Failed: Album creation error."
    END-IF.

    DISPLAY "-- Test Case 2: Read Album --".
    CALL "READ-ALBUM" USING ALBUM-ID, READ-ALBUM-DATA.
    IF SQLCODE = 0 AND
       READ-TITLE = ALBUM-TITLE AND
       READ-ARTIST = ALBUM-ARTIST AND
       READ-RELEASE-YEAR = ALBUM-RELEASE-YEAR AND
       READ-GENRE = ALBUM-GENRE AND
       READ-TRACK-COUNT = ALBUM-TRACK-COUNT AND
       READ-EXT-ID = ALBUM-EXT-ID THEN
        DISPLAY "Test Case 2 Passed: Album read successfully and data matches."
    ELSE
        DISPLAY "Test Case 2 Failed: Album read error or data mismatch."
    END-IF.

    DISPLAY "-- Test Case 3: Update Album --".
    MOVE "Updated Title" TO ALBUM-TITLE.
    MOVE "Updated Artist" TO ALBUM-ARTIST.
    CALL "UPDATE-ALBUM" USING TEST-ALBUM.
    IF SQLCODE = 0 THEN
        DISPLAY "Test Case 3 Passed: Album updated successfully."
    ELSE
        DISPLAY "Test Case 3 Failed: Album update error."
    END-IF.

    DISPLAY "-- Test Case 4: Read Updated Album --".
    CALL "READ-ALBUM" USING ALBUM-ID, READ-ALBUM-DATA.
    IF SQLCODE = 0 AND
       READ-TITLE = "Updated Title" AND
       READ-ARTIST = "Updated Artist" AND
       READ-RELEASE-YEAR = ALBUM-RELEASE-YEAR AND
       READ-GENRE = ALBUM-GENRE AND
       READ-TRACK-COUNT = ALBUM-TRACK-COUNT AND
       READ-EXT-ID = ALBUM-EXT-ID THEN
        DISPLAY "Test Case 4 Passed: Updated album read successfully and data matches."
    ELSE
        DISPLAY "Test Case 4 Failed: Updated album read error or data mismatch."
    END-IF.

    DISPLAY "-- Test Case 5: Delete Album --".
    CALL "DELETE-ALBUM" USING ALBUM-ID.
    IF SQLCODE = 0 THEN
        DISPLAY "Test Case 5 Passed: Album deleted successfully."
    ELSE
        DISPLAY "Test Case 5 Failed: Album deletion error."
    END-IF.

    DISPLAY "-- Test Case 6: Verify Deletion --".
    CALL "READ-ALBUM" USING ALBUM-ID, READ-ALBUM-DATA.
    IF SQLCODE NOT = 0 THEN
        DISPLAY "Test Case 6 Passed: Album deletion verified."
    ELSE
        DISPLAY "Test Case 6 Failed: Album deletion verification error."
    END-IF.

    DISPLAY "-- Test Case 7: Find All Albums --".
    CALL "FIND-ALL-ALBUMS" USING ALBUMS-FOUND.
    IF ALBUMS-FOUND = 'Y' THEN
        DISPLAY "Test Case 7 Passed: Albums retrieved successfully."
    ELSE
        DISPLAY "Test Case 7 Failed: No albums found or retrieval error."
    END-IF.

    DISPLAY "--- Album CRUD Tests Completed ---".
    STOP RUN.
