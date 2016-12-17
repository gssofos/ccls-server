--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: sql; Type: SCHEMA; Schema: -; Owner: sos
--

CREATE SCHEMA sql;


ALTER SCHEMA sql OWNER TO sos;

SET search_path = sql, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ls_monumentation; Type: TABLE; Schema: sql; Owner: sos; Tablespace: 
--

CREATE TABLE ls_monumentation (
    value integer NOT NULL,
    key character varying(45) DEFAULT NULL::character varying
);


ALTER TABLE sql.ls_monumentation OWNER TO sos;

--
-- Name: ls_observation; Type: TABLE; Schema: sql; Owner: sos; Tablespace: 
--

CREATE TABLE ls_observation (
    _id integer NOT NULL,
    phenomenontime date,
    resulttime date,
    fk_point integer,
    code character varying(45) DEFAULT NULL::character varying,
    description character varying(45) DEFAULT NULL::character varying,
    height double precision,
    fk_process integer,
    geometry public.geometry(LineString,4326),
    point_geometry public.geometry(Point,4326),
    dist double precision
);


ALTER TABLE sql.ls_observation OWNER TO sos;

--
-- Name: ls_operator; Type: TABLE; Schema: sql; Owner: sos; Tablespace: 
--

CREATE TABLE ls_operator (
    _id integer NOT NULL,
    name character varying(45) DEFAULT NULL::character varying,
    contact character varying(45) DEFAULT NULL::character varying,
    expertize character varying(45) DEFAULT NULL::character varying,
    experience integer
);


ALTER TABLE sql.ls_operator OWNER TO sos;

--
-- Name: ls_point; Type: TABLE; Schema: sql; Owner: sos; Tablespace: 
--

CREATE TABLE ls_point (
    _id integer NOT NULL,
    coor point,
    description character varying(45) DEFAULT NULL::character varying,
    tmpcode character varying(45) DEFAULT NULL::character varying,
    geom public.geometry
);


ALTER TABLE sql.ls_point OWNER TO sos;

--
-- Name: ls_point_is_of_ls_monumentation; Type: TABLE; Schema: sql; Owner: sos; Tablespace: 
--

CREATE TABLE ls_point_is_of_ls_monumentation (
    ls_point__id integer NOT NULL,
    ls_monumentation_value integer NOT NULL
);


ALTER TABLE sql.ls_point_is_of_ls_monumentation OWNER TO sos;

--
-- Name: ls_point_is_of_ls_pointtype; Type: TABLE; Schema: sql; Owner: sos; Tablespace: 
--

CREATE TABLE ls_point_is_of_ls_pointtype (
    ls_point__id integer DEFAULT 0 NOT NULL,
    ls_pointtype_value integer DEFAULT 0 NOT NULL
);


ALTER TABLE sql.ls_point_is_of_ls_pointtype OWNER TO sos;

--
-- Name: ls_pointtype; Type: TABLE; Schema: sql; Owner: sos; Tablespace: 
--

CREATE TABLE ls_pointtype (
    value integer NOT NULL,
    key character varying(45) DEFAULT NULL::character varying
);


ALTER TABLE sql.ls_pointtype OWNER TO sos;

--
-- Name: ls_process; Type: TABLE; Schema: sql; Owner: sos; Tablespace: 
--

CREATE TABLE ls_process (
    _id integer NOT NULL,
    setpointcode character varying(45) DEFAULT NULL::character varying,
    setpointheight double precision,
    settime date,
    fk_setpoint integer,
    fk_operator integer,
    fk_totalstation integer,
    poly_geometry public.geometry(Polygon,4326)
);


ALTER TABLE sql.ls_process OWNER TO sos;

--
-- Name: ls_recordtype; Type: TABLE; Schema: sql; Owner: sos; Tablespace: 
--

CREATE TABLE ls_recordtype (
    _id integer NOT NULL,
    name character varying(45) DEFAULT NULL::character varying
);


ALTER TABLE sql.ls_recordtype OWNER TO sos;

--
-- Name: ls_result; Type: TABLE; Schema: sql; Owner: sos; Tablespace: 
--

CREATE TABLE ls_result (
    _id integer NOT NULL,
    fk_observation integer,
    value double precision,
    fk_record_type integer
);


ALTER TABLE sql.ls_result OWNER TO sos;

--
-- Name: ls_totalstation; Type: TABLE; Schema: sql; Owner: sos; Tablespace: 
--

CREATE TABLE ls_totalstation (
    _id integer NOT NULL,
    model character varying(45) DEFAULT NULL::character varying,
    angularaccuracyfixed double precision,
    angularaccuracyppm double precision,
    distanceprismaccuracyfixed double precision,
    distanceprismaccuracyppm double precision,
    distancenoprismaccuracyfixed double precision,
    distancenoprismaccuracyppm double precision
);


ALTER TABLE sql.ls_totalstation OWNER TO sos;

--
-- Name: ls_monumentation_pkey; Type: CONSTRAINT; Schema: sql; Owner: sos; Tablespace: 
--

ALTER TABLE ONLY ls_monumentation
    ADD CONSTRAINT ls_monumentation_pkey PRIMARY KEY (value);


--
-- Name: ls_observation_pkey; Type: CONSTRAINT; Schema: sql; Owner: sos; Tablespace: 
--

ALTER TABLE ONLY ls_observation
    ADD CONSTRAINT ls_observation_pkey PRIMARY KEY (_id);


--
-- Name: ls_operator_pkey; Type: CONSTRAINT; Schema: sql; Owner: sos; Tablespace: 
--

ALTER TABLE ONLY ls_operator
    ADD CONSTRAINT ls_operator_pkey PRIMARY KEY (_id);


--
-- Name: ls_point_is_of_ls_monumentation_pkey; Type: CONSTRAINT; Schema: sql; Owner: sos; Tablespace: 
--

ALTER TABLE ONLY ls_point_is_of_ls_monumentation
    ADD CONSTRAINT ls_point_is_of_ls_monumentation_pkey PRIMARY KEY (ls_point__id, ls_monumentation_value);


--
-- Name: ls_point_is_of_ls_pointtype_pkey; Type: CONSTRAINT; Schema: sql; Owner: sos; Tablespace: 
--

ALTER TABLE ONLY ls_point_is_of_ls_pointtype
    ADD CONSTRAINT ls_point_is_of_ls_pointtype_pkey PRIMARY KEY (ls_point__id, ls_pointtype_value);


--
-- Name: ls_point_pkey; Type: CONSTRAINT; Schema: sql; Owner: sos; Tablespace: 
--

ALTER TABLE ONLY ls_point
    ADD CONSTRAINT ls_point_pkey PRIMARY KEY (_id);


--
-- Name: ls_pointtype_pkey; Type: CONSTRAINT; Schema: sql; Owner: sos; Tablespace: 
--

ALTER TABLE ONLY ls_pointtype
    ADD CONSTRAINT ls_pointtype_pkey PRIMARY KEY (value);


--
-- Name: ls_process_pkey; Type: CONSTRAINT; Schema: sql; Owner: sos; Tablespace: 
--

ALTER TABLE ONLY ls_process
    ADD CONSTRAINT ls_process_pkey PRIMARY KEY (_id);


--
-- Name: ls_recordtype_pkey; Type: CONSTRAINT; Schema: sql; Owner: sos; Tablespace: 
--

ALTER TABLE ONLY ls_recordtype
    ADD CONSTRAINT ls_recordtype_pkey PRIMARY KEY (_id);


--
-- Name: ls_result_pkey; Type: CONSTRAINT; Schema: sql; Owner: sos; Tablespace: 
--

ALTER TABLE ONLY ls_result
    ADD CONSTRAINT ls_result_pkey PRIMARY KEY (_id);


--
-- Name: ls_totalstation_pkey; Type: CONSTRAINT; Schema: sql; Owner: sos; Tablespace: 
--

ALTER TABLE ONLY ls_totalstation
    ADD CONSTRAINT ls_totalstation_pkey PRIMARY KEY (_id);


--
-- PostgreSQL database dump complete
--

