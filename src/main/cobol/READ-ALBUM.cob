IDENTIFICATION DIVISION.
PROGRAM-ID. READ-ALBUM.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  ALBUM-ID         PIC X(40).
01  ALBUM-RECORD.
    05  ALBUM-TITLE      PIC X(255).
    05  ALBUM-ARTIST     PIC X(255).
    05  ALBUM-RELEASE-YEAR PIC X(4).
    05  ALBUM-GENRE      PIC X(255).
    05  ALBUM-TRACK-COUNT PIC 9(3).
    05  ALBUM-EXT-ID     PIC X(255).

PROCEDURE DIVISION.
    DISPLAY "Enter Album ID: ".
    ACCEPT ALBUM-ID.

    EXEC SQL
        SELECT title, artist, release_year, genre, track_count, album_id
        INTO :ALBUM-TITLE, :ALBUM-ARTIST, :ALBUM-RELEASE-YEAR, :ALBUM-GENRE, :ALBUM-TRACK-COUNT, :ALBUM-EXT-ID
        FROM ALBUM
        WHERE id = :ALBUM-ID
    END-EXEC.

    IF SQLCODE = 0 THEN
        DISPLAY "Album Details:".
        DISPLAY "Title: " ALBUM-TITLE.
        DISPLAY "Artist: " ALBUM-ARTIST.
        DISPLAY "Release Year: " ALBUM-RELEASE-YEAR.
        DISPLAY "Genre: " ALBUM-GENRE.
        DISPLAY "Track Count: " ALBUM-TRACK-COUNT.
        DISPLAY "External Album ID: " ALBUM-EXT-ID
    ELSE
        DISPLAY "Error retrieving album."
        DISPLAY "SQLCODE: " SQLCODE
        IF SQLCODE = 100 THEN
            DISPLAY "Album not found."
        ELSE
            DISPLAY "Please check the database connection or input value."
        END-IF
    END-IF.

    STOP RUN.
