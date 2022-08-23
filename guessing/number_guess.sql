
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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: gamers; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.gamers (
    user_id integer NOT NULL,
    name character varying(30) NOT NULL,
    games_played integer DEFAULT 0 NOT NULL,
    best_game integer
);


ALTER TABLE public.gamers OWNER TO freecodecamp;

--
-- Name: gamers_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.gamers_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gamers_user_id_seq OWNER TO freecodecamp;

--
-- Name: gamers_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.gamers_user_id_seq OWNED BY public.gamers.user_id;


--
-- Name: gamers user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.gamers ALTER COLUMN user_id SET DEFAULT nextval('public.gamers_user_id_seq'::regclass);


--
-- Data for Name: gamers; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.gamers VALUES (17, 'user_1661218498414', 5, 130);
INSERT INTO public.gamers VALUES (2, 'user_1661215642063', 2, 968);
INSERT INTO public.gamers VALUES (1, 'user_1661215642064', 5, 139);
INSERT INTO public.gamers VALUES (5, 'user_1661215860755', 2, 261);
INSERT INTO public.gamers VALUES (4, 'user_1661215860756', 5, 215);
INSERT INTO public.gamers VALUES (6, 'Leeloo', 1, 10);
INSERT INTO public.gamers VALUES (8, 'user_1661215984979', 2, 157);
INSERT INTO public.gamers VALUES (7, 'user_1661215984980', 5, 149);
INSERT INTO public.gamers VALUES (10, 'user_1661216037665', 2, 113);
INSERT INTO public.gamers VALUES (9, 'user_1661216037666', 5, 108);
INSERT INTO public.gamers VALUES (12, 'user_1661216482489', 2, 613);
INSERT INTO public.gamers VALUES (11, 'user_1661216482490', 5, 206);
INSERT INTO public.gamers VALUES (3, 'Liam', 3, 10);
INSERT INTO public.gamers VALUES (14, 'user_1661218442647', 2, 141);
INSERT INTO public.gamers VALUES (13, 'user_1661218442648', 5, 14);
INSERT INTO public.gamers VALUES (16, 'user_1661218474880', 2, 9);
INSERT INTO public.gamers VALUES (15, 'user_1661218474881', 5, 229);
INSERT INTO public.gamers VALUES (18, 'user_1661218498413', 2, 489);


--
-- Name: gamers_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.gamers_user_id_seq', 18, true);


--
-- Name: gamers gamers_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.gamers
    ADD CONSTRAINT gamers_name_key UNIQUE (name);


--
-- Name: gamers gamers_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.gamers
    ADD CONSTRAINT gamers_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

