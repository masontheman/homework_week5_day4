create or replace procedure insert_new_film
(
i_title varchar(255) default 'PoopyPants', i_description text default 'dameculo', i_release_year year default '2023',
i_language_id int2 default 1,i_rental_duration int2 default 100, i_renatl_rate numeric(4,2) default 0.99,
i_length int2 default 2,i_replace_cost int2 default 1, i_rating mpaa_rating default 'R'
)
language plpgsql
as $$
begin 
insert into film(title,
description,
release_year,
language_id,
rental_duration,
rental_rate,
length,
replacement_cost,
rating)
values (i_title, i_description, i_release_year,
i_language_id,i_rental_duration, i_renatl_rate,
i_length,i_replace_cost, i_rating);
end
$$;
select * from film order by film_id desc;
call insert_new_film('BobTheBuiler');
-- adding values with the procedure using defualt values and naming it poopypants

create or replace function category_to_number_of_films(cat_id integer)
returns integer
language plpgsql
as $$
declare iamavariable integer;
begin 
	select count(*) into iamavariable
	from film_category fc 
	where category_id = cat_id;
	return iamavariable;
end;
$$;

select category_to_number_of_films(11);


