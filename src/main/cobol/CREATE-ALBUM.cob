IDENTIFICATION DIVISION.
PROGRAM-ID. CREATE-ALBUM.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  ALBUM-RECORD.
    05  ALBUM-ID         PIC X(40).
    05  ALBUM-TITLE      PIC X(255).
    05  ALBUM-ARTIST     PIC X(255).
    05  ALBUM-RELEASE-YEAR PIC X(4).
    05  ALBUM-GENRE      PIC X(255).
    05  ALBUM-TRACK-COUNT PIC 9(3).
    05  ALBUM-EXT-ID     PIC X(255).

PROCEDURE DIVISION.
    DISPLAY "Enter Album Details:".
    DISPLAY "Title: ".
    ACCEPT ALBUM-TITLE.
    DISPLAY "Artist: ".
    ACCEPT ALBUM-ARTIST.
    DISPLAY "Release Year: ".
    ACCEPT ALBUM-RELEASE-YEAR.
    DISPLAY "Genre: ".
    ACCEPT ALBUM-GENRE.
    DISPLAY "Track Count: ".
    ACCEPT ALBUM-TRACK-COUNT.
    DISPLAY "External Album ID: ".
    ACCEPT ALBUM-EXT-ID.

    CALL "GENERATE-ALBUM-ID" USING ALBUM-ID.

    EXEC SQL
        INSERT INTO ALBUM (id, title, artist, release_year, genre, track_count, album_id)
        VALUES (:ALBUM-ID, :ALBUM-TITLE, :ALBUM-ARTIST, :ALBUM-RELEASE-YEAR, :ALBUM-GENRE, :ALBUM-TRACK-COUNT, :ALBUM-EXT-ID)
    END-EXEC.

    IF SQLCODE = 0 THEN
        DISPLAY "Album created successfully."
    ELSE
        DISPLAY "Error creating album."
        DISPLAY "SQLCODE: " SQLCODE
        IF SQLCODE = 100 THEN
            DISPLAY "Possible duplicate entry or constraint violation."
        ELSE
            DISPLAY "Please check the database and input values."
        END-IF
    END-IF.
    STOP RUN.
