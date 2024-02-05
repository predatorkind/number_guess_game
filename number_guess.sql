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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    score integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 10, 21);
INSERT INTO public.games VALUES (2, 17, 760);
INSERT INTO public.games VALUES (3, 17, 364);
INSERT INTO public.games VALUES (4, 18, 998);
INSERT INTO public.games VALUES (5, 18, 411);
INSERT INTO public.games VALUES (6, 17, 316);
INSERT INTO public.games VALUES (7, 17, 754);
INSERT INTO public.games VALUES (8, 17, 81);
INSERT INTO public.games VALUES (9, 10, 9);
INSERT INTO public.games VALUES (10, 19, 720);
INSERT INTO public.games VALUES (11, 19, 259);
INSERT INTO public.games VALUES (12, 20, 813);
INSERT INTO public.games VALUES (13, 20, 628);
INSERT INTO public.games VALUES (14, 19, 503);
INSERT INTO public.games VALUES (15, 19, 956);
INSERT INTO public.games VALUES (16, 19, 990);
INSERT INTO public.games VALUES (17, 21, 153);
INSERT INTO public.games VALUES (18, 21, 845);
INSERT INTO public.games VALUES (19, 22, 545);
INSERT INTO public.games VALUES (20, 22, 241);
INSERT INTO public.games VALUES (21, 21, 629);
INSERT INTO public.games VALUES (22, 21, 261);
INSERT INTO public.games VALUES (23, 21, 408);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (8, 'user_1707093350371');
INSERT INTO public.users VALUES (9, 'user_1707093350370');
INSERT INTO public.users VALUES (10, 'Tom');
INSERT INTO public.users VALUES (11, 'user_1707095697368');
INSERT INTO public.users VALUES (12, 'user_1707095697367');
INSERT INTO public.users VALUES (13, 'user_1707096018449');
INSERT INTO public.users VALUES (14, 'user_1707096018448');
INSERT INTO public.users VALUES (15, 'user_1707096421789');
INSERT INTO public.users VALUES (16, 'user_1707096421788');
INSERT INTO public.users VALUES (17, 'user_1707096790837');
INSERT INTO public.users VALUES (18, 'user_1707096790836');
INSERT INTO public.users VALUES (19, 'user_1707097041402');
INSERT INTO public.users VALUES (20, 'user_1707097041401');
INSERT INTO public.users VALUES (21, 'user_1707097112768');
INSERT INTO public.users VALUES (22, 'user_1707097112767');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 23, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 22, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

