--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-06-15 15:51:30

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 218 (class 1259 OID 16684)
-- Name: drivers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.drivers (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    surname character varying(100) NOT NULL,
    license_number character varying(50) NOT NULL
);


ALTER TABLE public.drivers OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16683)
-- Name: drivers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.drivers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.drivers_id_seq OWNER TO postgres;

--
-- TOC entry 4818 (class 0 OID 0)
-- Dependencies: 217
-- Name: drivers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.drivers_id_seq OWNED BY public.drivers.id;


--
-- TOC entry 222 (class 1259 OID 16703)
-- Name: services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.services (
    id integer NOT NULL,
    vehicle_id integer NOT NULL,
    service_date date NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.services OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16702)
-- Name: services_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.services_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.services_id_seq OWNER TO postgres;

--
-- TOC entry 4819 (class 0 OID 0)
-- Dependencies: 221
-- Name: services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.services_id_seq OWNED BY public.services.id;


--
-- TOC entry 220 (class 1259 OID 16691)
-- Name: vehicles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vehicles (
    id integer NOT NULL,
    brand character varying(50) NOT NULL,
    model character varying(50) NOT NULL,
    year integer NOT NULL,
    registration_number character varying(20) NOT NULL,
    type character varying(20) NOT NULL,
    status character varying(20) NOT NULL,
    assigned_driver_id integer
);


ALTER TABLE public.vehicles OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16690)
-- Name: vehicles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vehicles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vehicles_id_seq OWNER TO postgres;

--
-- TOC entry 4820 (class 0 OID 0)
-- Dependencies: 219
-- Name: vehicles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vehicles_id_seq OWNED BY public.vehicles.id;


--
-- TOC entry 4651 (class 2604 OID 16687)
-- Name: drivers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drivers ALTER COLUMN id SET DEFAULT nextval('public.drivers_id_seq'::regclass);


--
-- TOC entry 4653 (class 2604 OID 16706)
-- Name: services id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services ALTER COLUMN id SET DEFAULT nextval('public.services_id_seq'::regclass);


--
-- TOC entry 4652 (class 2604 OID 16694)
-- Name: vehicles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicles ALTER COLUMN id SET DEFAULT nextval('public.vehicles_id_seq'::regclass);


--
-- TOC entry 4808 (class 0 OID 16684)
-- Dependencies: 218
-- Data for Name: drivers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.drivers (id, name, surname, license_number) FROM stdin;
1	Jan	Kowalski	ABC123456
2	Anna	Nowak	XYZ987654
3	Maks	Wersztapen	RBR213769
4	Janne	Ahonen	PDK420911
6	Jan	Dzban	ASD321345
5	Piotr	Wiśniewski	LMN654321
8	Ебутин	Ебевденко	RU1917
9	Zbigniew	Wzwodecki	PL102030
10	Laki	Luk	123ABCJP2
11	Nikt	Nędza	TSOD12345
\.


--
-- TOC entry 4812 (class 0 OID 16703)
-- Dependencies: 222
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.services (id, vehicle_id, service_date, description) FROM stdin;
1	1	2024-05-10	Wymiana oleju i filtrów
2	2	2024-06-01	Naprawa układu hamulcowego
5	7	2025-06-13	Montaż układu LPG
3	1	2025-01-15	Przegląd okresowy
4	3	2025-03-20	Wymiana skrzyni biegów
7	11	2025-06-14	Uturbienie
\.


--
-- TOC entry 4810 (class 0 OID 16691)
-- Dependencies: 220
-- Data for Name: vehicles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vehicles (id, brand, model, year, registration_number, type, status, assigned_driver_id) FROM stdin;
4	Saab	AeroX	2006	FIN102	Car	Aktywny	4
8	Yamaha	KMWTW	2011	WA1337	Motorcycle	Aktywny	\N
3	Red Bull Honda	RBPT F1	2025	RBR420	Car	Aktywny	3
1	Toyota	Corolla	2020	KR1234	Car	Aktywny	\N
2	Honda	CB500F	2022	KR4321	Motorcycle	W serwisie	2
7	Volkswagen	Passat	1410	RZ12345	Car	W serwisie	9
9	Kamaz	Kamaz	1943	USSR06	Truck	Aktywny	8
5	Ford	Focus	2019	KR5678	Car	Aktywny	10
11	Volkswagen	Golf 4	1993	WA565758	Car	W serwisie	11
\.


--
-- TOC entry 4821 (class 0 OID 0)
-- Dependencies: 217
-- Name: drivers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.drivers_id_seq', 11, true);


--
-- TOC entry 4822 (class 0 OID 0)
-- Dependencies: 221
-- Name: services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.services_id_seq', 7, true);


--
-- TOC entry 4823 (class 0 OID 0)
-- Dependencies: 219
-- Name: vehicles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vehicles_id_seq', 11, true);


--
-- TOC entry 4655 (class 2606 OID 16689)
-- Name: drivers drivers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drivers
    ADD CONSTRAINT drivers_pkey PRIMARY KEY (id);


--
-- TOC entry 4659 (class 2606 OID 16710)
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- TOC entry 4657 (class 2606 OID 16696)
-- Name: vehicles vehicles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicles
    ADD CONSTRAINT vehicles_pkey PRIMARY KEY (id);


--
-- TOC entry 4660 (class 2606 OID 16697)
-- Name: vehicles fk_driver; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicles
    ADD CONSTRAINT fk_driver FOREIGN KEY (assigned_driver_id) REFERENCES public.drivers(id);


--
-- TOC entry 4661 (class 2606 OID 16711)
-- Name: services fk_vehicle; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT fk_vehicle FOREIGN KEY (vehicle_id) REFERENCES public.vehicles(id);


-- Completed on 2025-06-15 15:51:30

--
-- PostgreSQL database dump complete
--

