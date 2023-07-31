--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    description character varying(30),
    age_million_years integer,
    galaxy_type character varying(20),
    name character varying(20) NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    planet_id integer NOT NULL,
    description character varying(30),
    is_spherical boolean NOT NULL,
    age_million_years integer NOT NULL,
    earth_distance_lightyears numeric(5,2),
    radius integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_atmosphere; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon_atmosphere (
    moon_atmosphere_id integer NOT NULL,
    supports_life boolean NOT NULL,
    composition text NOT NULL,
    moon_id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.moon_atmosphere OWNER TO freecodecamp;

--
-- Name: moon_atmosphere_moon_atmosphere_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_atmosphere_moon_atmosphere_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_atmosphere_moon_atmosphere_id_seq OWNER TO freecodecamp;

--
-- Name: moon_atmosphere_moon_atmosphere_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_atmosphere_moon_atmosphere_id_seq OWNED BY public.moon_atmosphere.moon_atmosphere_id;


--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    star_id integer NOT NULL,
    description character varying(30),
    is_spherical boolean NOT NULL,
    age_million_years integer NOT NULL,
    earth_distance_lightyears numeric(5,2),
    radius integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    galaxy_id integer NOT NULL,
    description character varying(30),
    is_spherical boolean NOT NULL,
    age_million_years integer NOT NULL,
    earth_distance_lightyears numeric(5,2),
    radius_km integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: moon_atmosphere moon_atmosphere_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_atmosphere ALTER COLUMN moon_atmosphere_id SET DEFAULT nextval('public.moon_atmosphere_moon_atmosphere_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Spiral galaxy', 10000, 'Barred', 'Milky Way');
INSERT INTO public.galaxy VALUES (2, 'irregular galaxy', 5000, 'Dwarf', 'Large Magellanic');
INSERT INTO public.galaxy VALUES (3, 'Elliptical galaxy', 20000, 'Giant', 'Centaurus A');
INSERT INTO public.galaxy VALUES (4, 'Lenticular Galaxy', 15000, 'Intermediate', 'Sombrero');
INSERT INTO public.galaxy VALUES (5, 'Spiral Galaxy', 8000, 'Barred', 'Andromeda');
INSERT INTO public.galaxy VALUES (6, 'Irregular Galaxy', 3000, 'Dwarf', 'Small Magellanic');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Phobos', 4, 'Mars''s moon', true, 3800, 1.52, 11);
INSERT INTO public.moon VALUES (2, 'Deimos', 4, 'Mars''s moon', true, 3800, 1.52, 6);
INSERT INTO public.moon VALUES (3, 'Luna', 3, 'Earth''s moon', true, 4000, 1.00, 18);
INSERT INTO public.moon VALUES (4, 'Titan', 5, 'Saturn''s moon', true, 9000, 1.20, 25);
INSERT INTO public.moon VALUES (5, 'Enceladus', 5, 'Saturn''s moon', true, 8000, 1.25, 10);
INSERT INTO public.moon VALUES (6, 'Ganymede', 6, 'Jupiter''s moon', true, 10000, 1.20, 52);
INSERT INTO public.moon VALUES (7, 'Europa', 6, 'Jupiter''s moon', true, 10000, 1.10, 45);
INSERT INTO public.moon VALUES (8, 'Callisto', 6, 'Jupiter''s moon', true, 9500, 1.18, 37);
INSERT INTO public.moon VALUES (9, 'Phoebe', 6, 'Saturn''s moon', true, 8500, 1.50, 15);
INSERT INTO public.moon VALUES (10, 'Oberon', 7, 'Uranus''s moon', true, 8000, 1.40, 22);
INSERT INTO public.moon VALUES (11, 'Miranda', 7, 'Uranus''s moon', true, 8000, 1.35, 12);
INSERT INTO public.moon VALUES (12, 'Nereid', 7, 'Neptune''s moon', true, 9000, 1.80, 20);
INSERT INTO public.moon VALUES (13, 'Triton', 8, 'Neptune''s moon', true, 8500, 1.75, 24);
INSERT INTO public.moon VALUES (14, 'Pluto Moon 1', 9, 'Pluto''s moon', true, 6000, 1.20, 8);
INSERT INTO public.moon VALUES (15, 'Pluto Moon 2', 9, 'Pluto''s moon', true, 6000, 1.10, 6);
INSERT INTO public.moon VALUES (16, 'Eris Moon 1', 10, 'Eris''s moon', true, 7000, 1.30, 14);
INSERT INTO public.moon VALUES (17, 'Eris Moon 2', 10, 'Eris''s moon', true, 7000, 1.25, 12);
INSERT INTO public.moon VALUES (18, 'Haumea Moon 1', 11, 'Haumea''s moon', true, 6500, 1.25, 7);
INSERT INTO public.moon VALUES (19, 'Haumea Moon 2', 11, 'Haumea''s moon', true, 6500, 1.20, 5);
INSERT INTO public.moon VALUES (20, 'Makemake Moon 1', 12, 'Makemake''s moon', true, 6200, 1.10, 9);


--
-- Data for Name: moon_atmosphere; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon_atmosphere VALUES (1, false, 'Nitrogen, Oxygen', 1, NULL);
INSERT INTO public.moon_atmosphere VALUES (2, false, 'Carbon Dioxide, Nitrogen', 2, NULL);
INSERT INTO public.moon_atmosphere VALUES (3, true, 'Oxygen, Ozone, Hydrogen', 3, NULL);
INSERT INTO public.moon_atmosphere VALUES (4, false, 'Methane, Ethane', 6, NULL);
INSERT INTO public.moon_atmosphere VALUES (5, true, 'Nitrogen, Methane, Ethane', 10, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 2, 'Rocky planet', true, 4500, 0.39, 2439);
INSERT INTO public.planet VALUES (2, 'Venus', 2, 'Terrestrial planet', true, 4200, 0.72, 6051);
INSERT INTO public.planet VALUES (3, 'Earth', 2, 'Terrestrial planet', true, 4000, 1.00, 6371);
INSERT INTO public.planet VALUES (4, 'Mars', 2, 'Terrestrial planet', true, 3800, 1.52, 3389);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas giant planet', false, 10000, 5.20, 69911);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas giant planet', false, 9000, 9.58, 58232);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice giant planet', false, 8500, 19.22, 25362);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice giant planet', false, 8000, 30.05, 24622);
INSERT INTO public.planet VALUES (9, 'Pluto', 1, 'Dwarf planet', true, 6000, 39.48, 1188);
INSERT INTO public.planet VALUES (10, 'Europa', 2, 'Moon of Jupiter', true, 10000, 5.20, 1560);
INSERT INTO public.planet VALUES (11, 'Titan', 1, 'Moon of Saturn', true, 9000, 9.58, 2575);
INSERT INTO public.planet VALUES (12, 'Ganymede', 1, 'Moon of Jupiter', true, 10000, 5.20, 2634);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-type', true, 4600, 0.00, 696340);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'A-type', true, 230, 8.60, 7150000);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 'Red Supergiant', false, 8000, 640.00, 936000000);
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 1, 'G-type', true, 400, 4.37, 6900000);
INSERT INTO public.star VALUES (5, 'Antares', 1, 'Red supergiant', true, 12000, 550.00, 880000000);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 1, 'M-type', true, 600, 4.24, 2000000);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 1, false);


--
-- Name: moon_atmosphere_moon_atmosphere_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_atmosphere_moon_atmosphere_id_seq', 1, false);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 1, false);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 1, false);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 1, false);


--
-- Name: galaxy galaxy_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon_atmosphere moon_atmosphere_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_atmosphere
    ADD CONSTRAINT moon_atmosphere_id_unique UNIQUE (moon_atmosphere_id);


--
-- Name: moon_atmosphere moon_atmosphere_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_atmosphere
    ADD CONSTRAINT moon_atmosphere_pkey PRIMARY KEY (moon_atmosphere_id);


--
-- Name: moon moon_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id_unique UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id_unique UNIQUE (planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id_unique UNIQUE (star_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon_atmosphere moon_atmosphere_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_atmosphere
    ADD CONSTRAINT moon_atmosphere_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

