IDENTIFICATION DIVISION.
PROGRAM-ID. UPDATE-ALBUM.

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

01  UPDATE-FIELDS.
    05  TITLE-UPDATED    PIC X(1) VALUE 'N'.
    05  ARTIST-UPDATED   PIC X(1) VALUE 'N'.
    05  RELEASE-YEAR-UPDATED PIC X(1) VALUE 'N'.
    05  GENRE-UPDATED    PIC X(1) VALUE 'N'.
    05  TRACK-COUNT-UPDATED PIC X(1) VALUE 'N'.
    05  EXT-ID-UPDATED   PIC X(1) VALUE 'N'.


PROCEDURE DIVISION.
    DISPLAY "Enter Album ID to Update: ".
    ACCEPT ALBUM-ID.

    DISPLAY "Enter New Details (leave blank to keep current):".

    DISPLAY "Title: ".
    ACCEPT ALBUM-TITLE.
    IF ALBUM-TITLE IS NOT SPACES THEN
        MOVE 'Y' TO TITLE-UPDATED
    END-IF.

    DISPLAY "Artist: ".
    ACCEPT ALBUM-ARTIST.
    IF ALBUM-ARTIST IS NOT SPACES THEN
        MOVE 'Y' TO ARTIST-UPDATED
    END-IF.

    DISPLAY "Release Year: ".
    ACCEPT ALBUM-RELEASE-YEAR.
    IF ALBUM-RELEASE-YEAR IS NOT SPACES THEN
        MOVE 'Y' TO RELEASE-YEAR-UPDATED
    END-IF.

    DISPLAY "Genre: ".
    ACCEPT ALBUM-GENRE.
    IF ALBUM-GENRE IS NOT SPACES THEN
        MOVE 'Y' TO GENRE-UPDATED
    END-IF.

    DISPLAY "Track Count: ".
    ACCEPT ALBUM-TRACK-COUNT.
    IF ALBUM-TRACK-COUNT IS NOT SPACES THEN
        MOVE 'Y' TO TRACK-COUNT-UPDATED
    END-IF.

    DISPLAY "External Album ID: ".
    ACCEPT ALBUM-EXT-ID.
    IF ALBUM-EXT-ID IS NOT SPACES THEN
        MOVE 'Y' TO EXT-ID-UPDATED
    END-IF.

    IF TITLE-UPDATED = 'Y' OR ARTIST-UPDATED = 'Y' OR RELEASE-YEAR-UPDATED = 'Y' OR
       GENRE-UPDATED = 'Y' OR TRACK-COUNT-UPDATED = 'Y' OR EXT-ID-UPDATED = 'Y' THEN

        EXEC SQL
            UPDATE ALBUM
            SET
                title = CASE WHEN :TITLE-UPDATED = 'Y' THEN :ALBUM-TITLE ELSE title END,
                artist = CASE WHEN :ARTIST-UPDATED = 'Y' THEN :ALBUM-ARTIST ELSE artist END,
                release_year = CASE WHEN :RELEASE-YEAR-UPDATED = 'Y' THEN :ALBUM-RELEASE-YEAR ELSE release_year END,
                genre = CASE WHEN :GENRE-UPDATED = 'Y' THEN :ALBUM-GENRE ELSE genre END,
                track_count = CASE WHEN :TRACK-COUNT-UPDATED = 'Y' THEN :ALBUM-TRACK-COUNT ELSE track_count END,
                album_id = CASE WHEN :EXT-ID-UPDATED = 'Y' THEN :ALBUM-EXT-ID ELSE album_id END
            WHERE id = :ALBUM-ID
        END-EXEC

        IF SQLCODE = 0 THEN
            DISPLAY "Album updated successfully."
        ELSE
            DISPLAY "Error updating album."
            DISPLAY "SQLCODE: " SQLCODE
            IF SQLCODE = 100 THEN
                DISPLAY "Possible data inconsistency or constraint violation."
            ELSE
                DISPLAY "Please check the database and input values."
            END-IF
        END-IF

    ELSE
        DISPLAY "No changes provided. Album not updated."
    END-IF.

    STOP RUN.
