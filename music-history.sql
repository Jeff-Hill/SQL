-- Query all of the entries in the Genre table

select "GenreId", "Label"
from Genre;


-- Using the INSERT statement, add one of your favorite artists to the Artist table.
insert into Artist (ArtistId, ArtistName, YearEstablished)
values (null, "Joe Lizzo", 2019);

-- Using the INSERT statement, add one, or more, albums by your artist to the Album table.
insert into Album (AlbumId, Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId)
values (null, "I am Awesome", "09/12/2019", 234590, "NSS Records", 31, 5);

insert into Album (AlbumId, Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId)
values (null, "You are Not Awesome", "09/12/2019", 234598, "NSS Records", 31, 5);

-- Using the INSERT statement, add some songs that are on that album to the Song table.
insert into Song (SongId, Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
values (null, "What Day Is It?", 101, "09/12/2019", 1, 31, 25);
insert into Song (SongId, Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
values (null, "It's Your Birthday", 101, "09/14/2019", 1, 31, 25);

-- Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.

-- The following query displays the album title with song titles and artist name where the album ID matches as well as where the artist ID matches the album artist ID
-- Select the column names you want to display
select  a.Title, s.Title, ar.ArtistName
-- choose from which table you want to display the column headers above and assign it an alias
from Song s 
-- choose the other table you want to display column headers from and assign it another alias
left join Album a 
-- choose which column header will have the common information between the two tables
on s.AlbumId = a.AlbumId
-- choose another table you want to display data from the select query line
left join Artist ar 
-- choose which column header will have the common information between the two tables. Use table aliases
on a.ArtistId = ar.ArtistId
-- choose the column data that will be common amongst all three tables being compared
where s.ArtistId = 31;

-- Reminder: Direction of join matters. Try the following statements and see the difference in results.

-- Displays all album titles "left table" and the song titles where the album ID matches along with songs 
-- where there is no match and NULL is displayed
SELECT a.Title, s.Title 
FROM Album a 
LEFT JOIN Song s 
ON s.AlbumId = a.AlbumId;

-- Displays all the song titles "left table" and the album titles where the album ID matches along with albums
-- where there is no match and NULL is displayed
SELECT a.Title, s.Title 
FROM Song s 
LEFT JOIN Album a 
ON s.AlbumId = a.AlbumId;

-- Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
-- decide what column headers you want to display. Use the as method to name them whatever you want
select count(*)as "Song Count", a.Title as "Album Title"
-- Which tables do you want to join together?
from Song s  
-- Left join will give you the song count but NULL for album title since there are no corresponding album titles in the album table for those songs
left join Album a  
-- What data is the same between the two table you have joined above?
on s.AlbumId = a.AlbumId
-- What are you using to identify the songs are from the same place and add them together to get a count?
group by s.AlbumId;


-- Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
select count(*) as "Song Count", ArtistName
from Song s 
join Artist a 
on s.ArtistId = a.ArtistId
group by a.ArtistId;

-- Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
select count(*) as "Song Count", Label 
from Song s 
join Genre g 
on s.GenreId = g.GenreId
group by g.GenreId;


-- Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.
select max(AlbumLength), Title, AlbumLength
from Album;
-- Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.
select max(SongLength) as "Longest Song", Title, SongLength
from Song;

-- Modify the previous query to also display the title of the album.
select max(SongLength) as "Longest Song", s.Title, SongLength, a.Title
from Album a  
left join Song s  
on a.AlbumId = s.AlbumId;

