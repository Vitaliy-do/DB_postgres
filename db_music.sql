--Создание таблицы жанров
CREATE TABLE IF NOT EXISTS Genre (
genre_id serial primary key,
title VARCHAR (90) not null
);

--Создание таблицы исполнителей
CREATE TABLE IF NOT EXISTS Executere (
executere_id serial primary key,
name VARCHAR (90) not null 
);

--Создание промежуточной таблицы жанры_исполнители
CREATE TABLE IF NOT EXISTS GenreExecutere (
genre_id INTEGER not null references Genre (genre_id),
executere_id INTEGER not null references Executere (executere_id),
constraint pk primary key (genre_id, executere_id)
);

--Создание таблицы альбом
CREATE TABLE IF NOT EXISTS Albom (
albom_id serial primary key,
title_albom VARCHAR (90) not null,
year INTEGER
);

--Создание промежуточной таблицы жанры_исполнители
CREATE TABLE IF NOT EXISTS AlbomExecutere (
albom_id INTEGER not null references Albom (albom_id),
executere_id INTEGER not null references Executere (executere_id),
constraint pk1 primary key(albom_id, executere_id)
);

--Создание таблицы трек
CREATE TABLE IF NOT EXISTS Track (
track_id serial primary key,
title_track VARCHAR (90) not null,
duration INTEGER,
albom_id INTEGER not null references Albom (albom_id)
);

--Создание таблицы сборник
CREATE TABLE IF NOT EXISTS Mix (
mix_id serial primary key,
title_mix VARCHAR (90) not null,
year INTEGER
);

--Создание промежуточной таблицы трек_сборник
CREATE TABLE IF NOT EXISTS TrackMix (
track_id INTEGER not null references Track (track_id),
mix_id INTEGER not null references Mix (mix_id),
constraint pk2 primary key (track_id, mix_id)
);

