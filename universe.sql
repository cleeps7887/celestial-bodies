--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: expert; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.expert (
    expert_id integer NOT NULL,
    name character varying(60),
    country character varying(30),
    email_address character varying(60) NOT NULL,
    phone_number character varying(60)
);


ALTER TABLE public.expert OWNER TO freecodecamp;

--
-- Name: expert_expert_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.expert_expert_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.expert_expert_id_seq OWNER TO freecodecamp;

--
-- Name: expert_expert_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.expert_expert_id_seq OWNED BY public.expert.expert_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_billions_of_years numeric(4,1),
    has_life boolean,
    galaxy_factor integer,
    expert_id integer NOT NULL,
    galaxy_type character varying(60)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean,
    age_in_billions_of_years numeric(4,1),
    planet_id integer NOT NULL,
    expert_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean,
    age_in_billions_of_years numeric(4,1),
    color text,
    star_id integer NOT NULL,
    expert_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_spherical boolean,
    color text,
    age_in_billions_of_years numeric(4,1),
    star_factor integer,
    galaxy_id integer NOT NULL,
    expert_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: expert expert_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.expert ALTER COLUMN expert_id SET DEFAULT nextval('public.expert_expert_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: expert; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.expert VALUES (1, 'Douglas Benjamin', 'Canada', 'dbenjamin@uoft.ca', '519-555-6666');
INSERT INTO public.expert VALUES (2, 'Harold Smith', 'England', 'harold@oxford.edu.uk', '332-457-7855');
INSERT INTO public.expert VALUES (3, 'Fred Perkins', 'USA', 'fperkins@cox.ca', '713-8527-6358');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13.6, true, 3, 1, 'barred spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 25.6, false, 4, 1, 'barred spiral');
INSERT INTO public.galaxy VALUES (3, 'Cartwheel', 122.5, false, 66, 2, 'lenticular');
INSERT INTO public.galaxy VALUES (4, 'Cigar', 452.1, true, 5, 3, 'irregular');
INSERT INTO public.galaxy VALUES (5, 'Backward', 5.2, false, 67, 3, 'barred spiral');
INSERT INTO public.galaxy VALUES (6, 'Fireworks', 185.2, false, 4, 3, 'starburst');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', true, 4.5, 1, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', false, 4.5, 5, 1);
INSERT INTO public.moon VALUES (3, 'Deimos', false, 4.5, 5, 1);
INSERT INTO public.moon VALUES (4, 'Europa', true, 4.6, 4, 1);
INSERT INTO public.moon VALUES (5, 'Io', false, 4.6, 4, 1);
INSERT INTO public.moon VALUES (6, 'Ganymede', false, 4.6, 4, 1);
INSERT INTO public.moon VALUES (7, 'Callisto', false, 4.6, 4, 1);
INSERT INTO public.moon VALUES (8, 'Amalthea', true, 4.6, 4, NULL);
INSERT INTO public.moon VALUES (9, 'Kallichore', false, 4.6, 4, NULL);
INSERT INTO public.moon VALUES (10, 'Titan', true, 4.6, 7, 1);
INSERT INTO public.moon VALUES (11, 'Lapetus', false, 4.6, 7, 1);
INSERT INTO public.moon VALUES (12, 'Epimetheus', false, 4.6, 7, NULL);
INSERT INTO public.moon VALUES (13, 'Enceladus', false, 4.6, 7, NULL);
INSERT INTO public.moon VALUES (14, 'Tethys', false, 4.6, 7, 3);
INSERT INTO public.moon VALUES (15, 'Telesto', false, 4.6, 7, 3);
INSERT INTO public.moon VALUES (16, 'Mimas', false, 4.6, 7, 3);
INSERT INTO public.moon VALUES (17, 'Titania', false, 4.5, 6, NULL);
INSERT INTO public.moon VALUES (18, 'Miranda', false, 4.5, 6, NULL);
INSERT INTO public.moon VALUES (19, 'Bruce II', true, 5.2, 11, 2);
INSERT INTO public.moon VALUES (20, 'Phillip', false, 5.2, 11, 2);
INSERT INTO public.moon VALUES (21, 'Oberon', false, 4.5, 6, 1);
INSERT INTO public.moon VALUES (22, 'Umbriel', false, 4.5, 6, 1);
INSERT INTO public.moon VALUES (23, 'Ariel', false, 4.5, 6, 1);
INSERT INTO public.moon VALUES (24, 'Puck', false, 4.5, 6, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Venus', false, 4.5, 'orange', 1, NULL);
INSERT INTO public.planet VALUES (4, 'Jupiter', false, 4.6, 'brown', 1, NULL);
INSERT INTO public.planet VALUES (5, 'Mars', true, 4.6, 'red', 1, NULL);
INSERT INTO public.planet VALUES (6, 'Uranus', false, 4.5, 'blue', 1, NULL);
INSERT INTO public.planet VALUES (7, 'Saturn', true, 4.5, 'brown', 1, NULL);
INSERT INTO public.planet VALUES (8, 'Neptune', false, 4.5, 'blue', 1, NULL);
INSERT INTO public.planet VALUES (10, 'Douglas', true, 26.6, 'red', 2, NULL);
INSERT INTO public.planet VALUES (11, 'Bradley', true, 5.2, 'blue', 3, NULL);
INSERT INTO public.planet VALUES (9, 'Greg', true, 25.3, 'red', 2, 2);
INSERT INTO public.planet VALUES (12, 'Roger', true, 166.1, 'blue', 4, 2);
INSERT INTO public.planet VALUES (1, 'Earth', true, 4.5, 'blue', 1, 1);
INSERT INTO public.planet VALUES (3, 'Mercury', false, 4.5, 'gray', 1, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', true, 'white', 4.6, 56, 1, 1);
INSERT INTO public.star VALUES (2, 'Hades', true, 'blue', 58.2, 63, 2, 1);
INSERT INTO public.star VALUES (3, 'Crux', true, 'blue', 22.5, 57, 2, 1);
INSERT INTO public.star VALUES (4, 'Cancer', false, 'red', 30.8, NULL, 4, 3);
INSERT INTO public.star VALUES (5, 'Alphard', false, 'white', 365.2, 52, 5, NULL);
INSERT INTO public.star VALUES (6, 'Alpha Hydrae', true, 'green', 488.8, 3, 3, NULL);
INSERT INTO public.star VALUES (7, 'Alphecca', true, 'blue', 1.1, 78, 3, 2);
INSERT INTO public.star VALUES (8, 'Irena', true, 'white', 5.7, 12, 1, 1);


--
-- Name: expert_expert_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.expert_expert_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: expert expert_email_address_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.expert
    ADD CONSTRAINT expert_email_address_key UNIQUE (email_address);


--
-- Name: expert expert_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.expert
    ADD CONSTRAINT expert_pkey PRIMARY KEY (expert_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_expert_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_expert_id_fkey FOREIGN KEY (expert_id) REFERENCES public.expert(expert_id);


--
-- Name: moon moon_expert_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_expert_id_fkey FOREIGN KEY (expert_id) REFERENCES public.expert(expert_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_expert_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_expert_id_fkey FOREIGN KEY (expert_id) REFERENCES public.expert(expert_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_expert_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_expert_id_fkey FOREIGN KEY (expert_id) REFERENCES public.expert(expert_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

