create database blog;

use blog ;

create table users (
	iduser int primary key auto_increment,
	username varchar(100) not null,
	email varchar(100) unique not null,
	password varchar(50) not null,
	created_at timestamp default current_timestamp,
	idrole int not null,
	foreign key (idrole) references roles(idrole)
	
);

create table roles (
	idrole int primary key auto_increment,
	name varchar(100) not null
);

create table tags (
	idtag int primary key auto_increment,
	name varchar(100)
);

create table articles (
	idarticle int primary key auto_increment,
	title varchar(100) not null,
	content text not null,
	iduser int not null,
	idtag int not null,
	created_at timestamp default current_timestamp,
	foreign key (iduser) references users(iduser),
	foreign key (idtag) references tags(idtag)
	
);

create table comments (
	idcomment int primary key auto_increment,
	idarticle int not null,
	iduser int not null,
	content text not null,
	created_at timestamp default current_timestamp,
	foreign key (idarticle) references articles(idarticle),
	foreign key (iduser) references users(iduser)
);

create table likes (
	idlike int primary key auto_increment,
	iduser int not null,
	idarticle int not null,
	foreign key (iduser) references users(iduser) on delete cascade,
	foreign key (idarticle) references articles(idarticle) on delete cascade
)


