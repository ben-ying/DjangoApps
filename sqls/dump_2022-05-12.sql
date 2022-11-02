--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)

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

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: ben
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO ben;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: ben
--

CREATE SEQUENCE public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO ben;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ben
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: ben
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO ben;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: ben
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO ben;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ben
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: ben
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO ben;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: ben
--

CREATE SEQUENCE public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO ben;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ben
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: ben
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO ben;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: ben
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO ben;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: ben
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO ben;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ben
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: ben
--

CREATE SEQUENCE public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO ben;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ben
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: ben
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO ben;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: ben
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO ben;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ben
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: ben
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO ben;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: ben
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO ben;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: ben
--

CREATE SEQUENCE public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO ben;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ben
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: ben
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO ben;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: ben
--

CREATE SEQUENCE public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO ben;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ben
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: ben
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO ben;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: ben
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO ben;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ben
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: ben
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO ben;

--
-- Name: iaer_about; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.iaer_about (
    id integer NOT NULL,
    version_name character varying(20),
    version_code integer,
    apk character varying(100) NOT NULL,
    category integer NOT NULL,
    comment text NOT NULL,
    datetime timestamp with time zone,
    apk_json character varying(100) NOT NULL,
    name character varying(20),
    CONSTRAINT iaer_about_category_check CHECK ((category >= 0)),
    CONSTRAINT iaer_about_version_code_check CHECK ((version_code >= 0))
);


ALTER TABLE public.iaer_about OWNER TO root;

--
-- Name: iaer_about_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.iaer_about_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.iaer_about_id_seq OWNER TO root;

--
-- Name: iaer_about_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.iaer_about_id_seq OWNED BY public.iaer_about.id;


--
-- Name: iaer_category; Type: TABLE; Schema: public; Owner: ben
--

CREATE TABLE public.iaer_category (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    sequence smallint NOT NULL,
    created date,
    modified date,
    CONSTRAINT iaer_category_sequence_check CHECK ((sequence >= 0))
);


ALTER TABLE public.iaer_category OWNER TO ben;

--
-- Name: iaer_category_id_seq; Type: SEQUENCE; Schema: public; Owner: ben
--

CREATE SEQUENCE public.iaer_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.iaer_category_id_seq OWNER TO ben;

--
-- Name: iaer_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ben
--

ALTER SEQUENCE public.iaer_category_id_seq OWNED BY public.iaer_category.id;


--
-- Name: iaer_fund; Type: TABLE; Schema: public; Owner: ben
--

CREATE TABLE public.iaer_fund (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    monthly_money smallint NOT NULL,
    yearly_money integer NOT NULL,
    alternate_money integer NOT NULL,
    created date,
    modified date,
    CONSTRAINT iaer_fund_alternate_money_check CHECK ((alternate_money >= 0)),
    CONSTRAINT iaer_fund_monthly_money_check CHECK ((monthly_money >= 0)),
    CONSTRAINT iaer_fund_yearly_money_check CHECK ((yearly_money >= 0))
);


ALTER TABLE public.iaer_fund OWNER TO ben;

--
-- Name: iaer_fund_id_seq; Type: SEQUENCE; Schema: public; Owner: ben
--

CREATE SEQUENCE public.iaer_fund_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.iaer_fund_id_seq OWNER TO ben;

--
-- Name: iaer_fund_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ben
--

ALTER SEQUENCE public.iaer_fund_id_seq OWNED BY public.iaer_fund.id;


--
-- Name: iaer_iaer; Type: TABLE; Schema: public; Owner: ben
--

CREATE TABLE public.iaer_iaer (
    id integer NOT NULL,
    money integer NOT NULL,
    category character varying(30) NOT NULL,
    money_type integer NOT NULL,
    remark character varying(100) NOT NULL,
    created timestamp with time zone,
    type integer NOT NULL,
    chart_type integer NOT NULL,
    format character varying(50),
    datetime timestamp with time zone,
    description text,
    timing character varying(100),
    user_id integer NOT NULL,
    date date
);


ALTER TABLE public.iaer_iaer OWNER TO ben;

--
-- Name: iaer_iaer_id_seq; Type: SEQUENCE; Schema: public; Owner: ben
--

CREATE SEQUENCE public.iaer_iaer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.iaer_iaer_id_seq OWNER TO ben;

--
-- Name: iaer_iaer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ben
--

ALTER SEQUENCE public.iaer_iaer_id_seq OWNED BY public.iaer_iaer.id;


--
-- Name: iaer_redenvelope; Type: TABLE; Schema: public; Owner: ben
--

CREATE TABLE public.iaer_redenvelope (
    id integer NOT NULL,
    money character varying(10),
    money_type integer NOT NULL,
    money_from character varying(100),
    remark character varying(100) NOT NULL,
    created timestamp with time zone,
    user_id integer NOT NULL
);


ALTER TABLE public.iaer_redenvelope OWNER TO ben;

--
-- Name: iaer_redenvelope_id_seq; Type: SEQUENCE; Schema: public; Owner: ben
--

CREATE SEQUENCE public.iaer_redenvelope_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.iaer_redenvelope_id_seq OWNER TO ben;

--
-- Name: iaer_redenvelope_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ben
--

ALTER SEQUENCE public.iaer_redenvelope_id_seq OWNED BY public.iaer_redenvelope.id;


--
-- Name: iaer_setting; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.iaer_setting (
    id integer NOT NULL,
    home_show_current boolean NOT NULL,
    home_show_this_month boolean NOT NULL,
    home_show_this_year boolean NOT NULL,
    created date,
    modified date,
    user_id integer NOT NULL,
    monthly_fund integer NOT NULL,
    yearly_fund integer NOT NULL,
    CONSTRAINT iaer_setting_monthly_fund_check CHECK ((monthly_fund >= 0)),
    CONSTRAINT iaer_setting_yearly_fund_check CHECK ((yearly_fund >= 0))
);


ALTER TABLE public.iaer_setting OWNER TO root;

--
-- Name: iaer_setting_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.iaer_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.iaer_setting_id_seq OWNER TO root;

--
-- Name: iaer_setting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.iaer_setting_id_seq OWNED BY public.iaer_setting.id;


--
-- Name: iaer_test; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.iaer_test (
    id integer NOT NULL,
    test character varying(20) NOT NULL
);


ALTER TABLE public.iaer_test OWNER TO root;

--
-- Name: iaer_test_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.iaer_test_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.iaer_test_id_seq OWNER TO root;

--
-- Name: iaer_test_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.iaer_test_id_seq OWNED BY public.iaer_test.id;


--
-- Name: iaer_user; Type: TABLE; Schema: public; Owner: ben
--

CREATE TABLE public.iaer_user (
    id integer NOT NULL,
    is_master_user boolean NOT NULL,
    phone character varying(30),
    gender smallint NOT NULL,
    profile character varying(200),
    user_type smallint NOT NULL,
    region character varying(100),
    locale character varying(10),
    whats_up character varying(200),
    zone character varying(50),
    birthday timestamp with time zone,
    hobbies text,
    highlighted text,
    created timestamp with time zone,
    modified timestamp with time zone,
    is_email_activate boolean NOT NULL,
    is_phone_activate boolean NOT NULL,
    auth_user_id integer NOT NULL,
    fund_id integer,
    CONSTRAINT iaer_user_gender_check CHECK ((gender >= 0)),
    CONSTRAINT iaer_user_user_type_check CHECK ((user_type >= 0))
);


ALTER TABLE public.iaer_user OWNER TO ben;

--
-- Name: iaer_user_id_seq; Type: SEQUENCE; Schema: public; Owner: ben
--

CREATE SEQUENCE public.iaer_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.iaer_user_id_seq OWNER TO ben;

--
-- Name: iaer_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ben
--

ALTER SEQUENCE public.iaer_user_id_seq OWNED BY public.iaer_user.id;


--
-- Name: iaer_user_slave_user; Type: TABLE; Schema: public; Owner: ben
--

CREATE TABLE public.iaer_user_slave_user (
    id integer NOT NULL,
    from_user_id integer NOT NULL,
    to_user_id integer NOT NULL
);


ALTER TABLE public.iaer_user_slave_user OWNER TO ben;

--
-- Name: iaer_user_slave_user_id_seq; Type: SEQUENCE; Schema: public; Owner: ben
--

CREATE SEQUENCE public.iaer_user_slave_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.iaer_user_slave_user_id_seq OWNER TO ben;

--
-- Name: iaer_user_slave_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ben
--

ALTER SEQUENCE public.iaer_user_slave_user_id_seq OWNED BY public.iaer_user_slave_user.id;


--
-- Name: iaer_verify; Type: TABLE; Schema: public; Owner: ben
--

CREATE TABLE public.iaer_verify (
    id integer NOT NULL,
    email_verify_code character varying(10),
    phone_verify_code character varying(10),
    created timestamp with time zone,
    user_id integer NOT NULL
);


ALTER TABLE public.iaer_verify OWNER TO ben;

--
-- Name: iaer_verify_id_seq; Type: SEQUENCE; Schema: public; Owner: ben
--

CREATE SEQUENCE public.iaer_verify_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.iaer_verify_id_seq OWNER TO ben;

--
-- Name: iaer_verify_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ben
--

ALTER SEQUENCE public.iaer_verify_id_seq OWNED BY public.iaer_verify.id;


--
-- Name: photo_gallery; Type: TABLE; Schema: public; Owner: ben
--

CREATE TABLE public.photo_gallery (
    id integer NOT NULL,
    title character varying(50) NOT NULL,
    date_format character varying(50) NOT NULL,
    description text
);


ALTER TABLE public.photo_gallery OWNER TO ben;

--
-- Name: photo_gallery_id_seq; Type: SEQUENCE; Schema: public; Owner: ben
--

CREATE SEQUENCE public.photo_gallery_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.photo_gallery_id_seq OWNER TO ben;

--
-- Name: photo_gallery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ben
--

ALTER SEQUENCE public.photo_gallery_id_seq OWNED BY public.photo_gallery.id;


--
-- Name: photo_photo; Type: TABLE; Schema: public; Owner: ben
--

CREATE TABLE public.photo_photo (
    id integer NOT NULL,
    exif_image_width smallint,
    exif_image_height smallint,
    exif_make character varying(50),
    exif_model character varying(100),
    exif_lens_make character varying(50),
    exif_lens_model character varying(100),
    exif_version character varying(10),
    exif_subject_location character varying(30),
    exif_datetime date,
    exif_datetime_original date,
    exif_datetime_digitized date,
    name character varying(50) NOT NULL,
    labels character varying(50)[],
    sub_dir character varying(10) NOT NULL,
    duration interval NOT NULL,
    sha1sum character varying(50) NOT NULL,
    category smallint NOT NULL,
    version smallint NOT NULL,
    description text,
    pub_date timestamp with time zone NOT NULL,
    modify_date timestamp with time zone NOT NULL,
    user_id integer,
    size integer NOT NULL,
    CONSTRAINT photo_photo_category_check CHECK ((category >= 0)),
    CONSTRAINT photo_photo_exif_image_height_check CHECK ((exif_image_height >= 0)),
    CONSTRAINT photo_photo_exif_image_width_check CHECK ((exif_image_width >= 0)),
    CONSTRAINT photo_photo_size_check CHECK ((size >= 0)),
    CONSTRAINT photo_photo_version_check CHECK ((version >= 0))
);


ALTER TABLE public.photo_photo OWNER TO ben;

--
-- Name: photo_photo_galleries; Type: TABLE; Schema: public; Owner: ben
--

CREATE TABLE public.photo_photo_galleries (
    id integer NOT NULL,
    photo_id integer NOT NULL,
    gallery_id integer NOT NULL
);


ALTER TABLE public.photo_photo_galleries OWNER TO ben;

--
-- Name: photo_photo_galleries_id_seq; Type: SEQUENCE; Schema: public; Owner: ben
--

CREATE SEQUENCE public.photo_photo_galleries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.photo_photo_galleries_id_seq OWNER TO ben;

--
-- Name: photo_photo_galleries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ben
--

ALTER SEQUENCE public.photo_photo_galleries_id_seq OWNED BY public.photo_photo_galleries.id;


--
-- Name: photo_photo_id_seq; Type: SEQUENCE; Schema: public; Owner: ben
--

CREATE SEQUENCE public.photo_photo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.photo_photo_id_seq OWNER TO ben;

--
-- Name: photo_photo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ben
--

ALTER SEQUENCE public.photo_photo_id_seq OWNED BY public.photo_photo.id;


--
-- Name: photo_user; Type: TABLE; Schema: public; Owner: ben
--

CREATE TABLE public.photo_user (
    id integer NOT NULL,
    phone character varying(30),
    gender smallint NOT NULL,
    profile character varying(200),
    user_type smallint NOT NULL,
    region character varying(100),
    locale character varying(10),
    whats_up character varying(200),
    zone character varying(50),
    birthday timestamp with time zone,
    hobbies text,
    highlighted text,
    created timestamp with time zone,
    modified timestamp with time zone,
    is_email_activate boolean NOT NULL,
    is_phone_activate boolean NOT NULL,
    auth_user_id integer NOT NULL,
    date_format character varying(50) NOT NULL,
    CONSTRAINT photo_user_gender_check CHECK ((gender >= 0)),
    CONSTRAINT photo_user_user_type_check CHECK ((user_type >= 0))
);


ALTER TABLE public.photo_user OWNER TO ben;

--
-- Name: photo_user_id_seq; Type: SEQUENCE; Schema: public; Owner: ben
--

CREATE SEQUENCE public.photo_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.photo_user_id_seq OWNER TO ben;

--
-- Name: photo_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ben
--

ALTER SEQUENCE public.photo_user_id_seq OWNED BY public.photo_user.id;


--
-- Name: tools_commonexchange; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.tools_commonexchange (
    id integer NOT NULL,
    transaction_unit integer NOT NULL,
    f_buy_price double precision NOT NULL,
    m_buy_price double precision NOT NULL,
    f_sell_price double precision NOT NULL,
    m_sell_price double precision NOT NULL,
    bank_conversion_price double precision NOT NULL,
    is_common boolean NOT NULL,
    created timestamp with time zone,
    modified timestamp with time zone NOT NULL,
    from_currency_id integer NOT NULL,
    to_currency_id integer NOT NULL,
    CONSTRAINT tools_commonexchange_transaction_unit_check CHECK ((transaction_unit >= 0))
);


ALTER TABLE public.tools_commonexchange OWNER TO root;

--
-- Name: tools_commonexchange_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.tools_commonexchange_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tools_commonexchange_id_seq OWNER TO root;

--
-- Name: tools_commonexchange_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.tools_commonexchange_id_seq OWNED BY public.tools_commonexchange.id;


--
-- Name: tools_currency; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.tools_currency (
    id integer NOT NULL,
    code character varying(10) NOT NULL,
    name character varying(50) NOT NULL,
    sequence integer NOT NULL,
    created timestamp with time zone,
    modified timestamp with time zone NOT NULL
);


ALTER TABLE public.tools_currency OWNER TO root;

--
-- Name: tools_currency_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.tools_currency_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tools_currency_id_seq OWNER TO root;

--
-- Name: tools_currency_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.tools_currency_id_seq OWNED BY public.tools_currency.id;


--
-- Name: tools_exchangerate; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.tools_exchangerate (
    id integer NOT NULL,
    exchange double precision NOT NULL,
    result double precision NOT NULL,
    update_time character varying(30) NOT NULL,
    created timestamp with time zone,
    modified timestamp with time zone NOT NULL,
    from_currency_id integer NOT NULL,
    to_currency_id integer NOT NULL
);


ALTER TABLE public.tools_exchangerate OWNER TO root;

--
-- Name: tools_exchangerate_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.tools_exchangerate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tools_exchangerate_id_seq OWNER TO root;

--
-- Name: tools_exchangerate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.tools_exchangerate_id_seq OWNED BY public.tools_exchangerate.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: iaer_about id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.iaer_about ALTER COLUMN id SET DEFAULT nextval('public.iaer_about_id_seq'::regclass);


--
-- Name: iaer_category id; Type: DEFAULT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.iaer_category ALTER COLUMN id SET DEFAULT nextval('public.iaer_category_id_seq'::regclass);


--
-- Name: iaer_fund id; Type: DEFAULT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.iaer_fund ALTER COLUMN id SET DEFAULT nextval('public.iaer_fund_id_seq'::regclass);


--
-- Name: iaer_iaer id; Type: DEFAULT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.iaer_iaer ALTER COLUMN id SET DEFAULT nextval('public.iaer_iaer_id_seq'::regclass);


--
-- Name: iaer_redenvelope id; Type: DEFAULT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.iaer_redenvelope ALTER COLUMN id SET DEFAULT nextval('public.iaer_redenvelope_id_seq'::regclass);


--
-- Name: iaer_setting id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.iaer_setting ALTER COLUMN id SET DEFAULT nextval('public.iaer_setting_id_seq'::regclass);


--
-- Name: iaer_test id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.iaer_test ALTER COLUMN id SET DEFAULT nextval('public.iaer_test_id_seq'::regclass);


--
-- Name: iaer_user id; Type: DEFAULT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.iaer_user ALTER COLUMN id SET DEFAULT nextval('public.iaer_user_id_seq'::regclass);


--
-- Name: iaer_user_slave_user id; Type: DEFAULT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.iaer_user_slave_user ALTER COLUMN id SET DEFAULT nextval('public.iaer_user_slave_user_id_seq'::regclass);


--
-- Name: iaer_verify id; Type: DEFAULT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.iaer_verify ALTER COLUMN id SET DEFAULT nextval('public.iaer_verify_id_seq'::regclass);


--
-- Name: photo_gallery id; Type: DEFAULT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.photo_gallery ALTER COLUMN id SET DEFAULT nextval('public.photo_gallery_id_seq'::regclass);


--
-- Name: photo_photo id; Type: DEFAULT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.photo_photo ALTER COLUMN id SET DEFAULT nextval('public.photo_photo_id_seq'::regclass);


--
-- Name: photo_photo_galleries id; Type: DEFAULT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.photo_photo_galleries ALTER COLUMN id SET DEFAULT nextval('public.photo_photo_galleries_id_seq'::regclass);


--
-- Name: photo_user id; Type: DEFAULT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.photo_user ALTER COLUMN id SET DEFAULT nextval('public.photo_user_id_seq'::regclass);


--
-- Name: tools_commonexchange id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.tools_commonexchange ALTER COLUMN id SET DEFAULT nextval('public.tools_commonexchange_id_seq'::regclass);


--
-- Name: tools_currency id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.tools_currency ALTER COLUMN id SET DEFAULT nextval('public.tools_currency_id_seq'::regclass);


--
-- Name: tools_exchangerate id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.tools_exchangerate ALTER COLUMN id SET DEFAULT nextval('public.tools_exchangerate_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: ben
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: ben
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: ben
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add user	2	add_user
5	Can change user	2	change_user
6	Can delete user	2	delete_user
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add permission	4	add_permission
11	Can change permission	4	change_permission
12	Can delete permission	4	delete_permission
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add photo	7	add_photo
20	Can change photo	7	change_photo
21	Can delete photo	7	delete_photo
22	Can add user	8	add_user
23	Can change user	8	change_user
24	Can delete user	8	delete_user
25	Can add gallery	9	add_gallery
26	Can change gallery	9	change_gallery
27	Can delete gallery	9	delete_gallery
28	Can add red envelope	10	add_redenvelope
29	Can change red envelope	10	change_redenvelope
30	Can delete red envelope	10	delete_redenvelope
31	Can add user	11	add_user
32	Can change user	11	change_user
33	Can delete user	11	delete_user
34	Can add iaer	12	add_iaer
35	Can change iaer	12	change_iaer
36	Can delete iaer	12	delete_iaer
37	Can add fund	13	add_fund
38	Can change fund	13	change_fund
39	Can delete fund	13	delete_fund
40	Can add verify	14	add_verify
41	Can change verify	14	change_verify
42	Can delete verify	14	delete_verify
43	Can add category	15	add_category
44	Can change category	15	change_category
45	Can delete category	15	delete_category
46	Can add Token	16	add_token
47	Can change Token	16	change_token
48	Can delete Token	16	delete_token
49	Can add setting	17	add_setting
50	Can change setting	17	change_setting
51	Can delete setting	17	delete_setting
52	Can add about	18	add_about
53	Can change about	18	change_about
54	Can delete about	18	delete_about
55	Can add test	19	add_test
56	Can change test	19	change_test
57	Can delete test	19	delete_test
58	Can add common exchange	20	add_commonexchange
59	Can change common exchange	20	change_commonexchange
60	Can delete common exchange	20	delete_commonexchange
61	Can add currency	21	add_currency
62	Can change currency	21	change_currency
63	Can delete currency	21	delete_currency
64	Can add exchange rate	22	add_exchangerate
65	Can change exchange rate	22	change_exchangerate
66	Can delete exchange rate	22	delete_exchangerate
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: ben
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
3	pbkdf2_sha256$100000$SABjp1Y6rBBg$h1Y3cmommkotw/LrDo04qiKBczb7IlgRYKAqjnZIGRg=	\N	f	dudu				f	t	2018-11-14 14:57:08+08
1	pbkdf2_sha256$100000$LSq0zdu7Ff86$VIuxIS/NtkfTyocPYuw9pLyQ2phAJ1YJAZ2wVGGJAmo=	2018-11-20 16:57:17.924281+08	t	ben			benying1988@gmail.com	t	t	2018-11-14 13:56:53.874445+08
2	pbkdf2_sha256$100000$TzVSNSCItUQg$mnbv4eC/RCBnyiJ7hf0kAbC/l8OQduc+tgiHPh0/hw8=	\N	f	emily				f	t	2018-11-14 14:21:13+08
4	pbkdf2_sha256$100000$wJAFdVCMDAc1$aJ/WKhuWY6SxeS/iNx3zHgSDSNvEsH51osrRYllCuaU=	2021-09-23 13:38:50.55878+08	t	admin	Ben	Ying	benying1988@gmail.com	t	t	2018-11-20 16:59:15+08
21	pbkdf2_sha256$100000$5Q1YRDo3KlgC$gaqXLOvyd7nox3nNgSMPsyTKbWvG2ardDO1gG2THk/Q=	\N	f	test			380668771@qq.com	t	t	2020-10-15 13:23:18+08
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: ben
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: ben
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
1	4	1
2	4	2
3	4	3
4	4	4
5	4	5
6	4	6
7	4	7
8	4	8
9	4	9
10	4	10
11	4	11
12	4	12
13	4	13
14	4	14
15	4	15
16	4	16
17	4	17
18	4	18
19	4	19
20	4	20
21	4	21
22	4	22
23	4	23
24	4	24
25	4	25
26	4	26
27	4	27
28	4	28
29	4	29
30	4	30
31	4	31
32	4	32
33	4	33
34	4	34
35	4	35
36	4	36
37	4	37
38	4	38
39	4	39
40	4	40
41	4	41
42	4	42
43	4	43
44	4	44
45	4	45
46	4	46
47	4	47
48	4	48
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: ben
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
69f31e3c77384c4ab4d1c1f2d145f9dddaba17df	2018-11-14 15:15:33.934495+08	1
83cd0f7a0483db73ce4223658cb61deac6531e85	2018-11-14 15:15:38.737136+08	3
379a22b0cf5f772960ac6677d165eaf85d9cd8e2	2018-11-14 15:15:44.31914+08	2
dcbf4d25188e2746ae69b58303f32eff9882fa5a	2020-10-15 13:23:18.301897+08	21
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: ben
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2018-11-14 14:21:14.682353+08	2	Emily	1	[{"added": {}}]	2	1
2	2018-11-14 14:23:10.162651+08	1	2018.11	1	[{"added": {}}]	13	1
3	2018-11-14 14:23:20.885913+08	1	ben	1	[{"added": {}}]	11	1
4	2018-11-14 14:23:36.983065+08	2	Emily	1	[{"added": {}}]	11	1
5	2018-11-14 14:24:03.207741+08	1	ben	2	[{"changed": {"fields": ["is_master_user", "slave_user"]}}]	11	1
6	2018-11-14 14:56:54.701479+08	2	emily	2	[{"changed": {"fields": ["username"]}}]	2	1
7	2018-11-14 14:57:09.183161+08	3	dudu	1	[{"added": {}}]	2	1
8	2018-11-14 14:57:16.886333+08	3	dudu	2	[]	2	1
9	2018-11-14 15:09:51.935138+08	2	emily	2	[{"changed": {"fields": ["fund"]}}]	11	1
10	2018-11-14 15:15:23.011156+08	4	dudu	1	[{"added": {}}]	11	1
11	2018-11-14 15:15:33.937726+08	69f31e3c77384c4ab4d1c1f2d145f9dddaba17df	69f31e3c77384c4ab4d1c1f2d145f9dddaba17df	1	[{"added": {}}]	16	1
12	2018-11-14 15:15:38.739829+08	83cd0f7a0483db73ce4223658cb61deac6531e85	83cd0f7a0483db73ce4223658cb61deac6531e85	1	[{"added": {}}]	16	1
13	2018-11-14 15:15:44.321859+08	379a22b0cf5f772960ac6677d165eaf85d9cd8e2	379a22b0cf5f772960ac6677d165eaf85d9cd8e2	1	[{"added": {}}]	16	1
14	2018-11-14 15:24:22.800374+08	1	Category object (1)	1	[{"added": {}}]	15	1
15	2018-11-14 15:24:41.073215+08	2	Category object (2)	1	[{"added": {}}]	15	1
16	2018-11-14 15:24:48.969149+08	2	Category object (2)	2	[{"changed": {"fields": ["sequence"]}}]	15	1
17	2018-11-14 15:25:04.238577+08	3	Category object (3)	1	[{"added": {}}]	15	1
18	2018-11-14 15:25:21.574873+08	4	Category object (4)	1	[{"added": {}}]	15	1
19	2018-11-14 15:25:31.251969+08	3	Category object (3)	2	[{"changed": {"fields": ["name"]}}]	15	1
20	2018-11-14 15:26:08.583799+08	5	Category object (5)	1	[{"added": {}}]	15	1
21	2018-11-14 15:26:22.700524+08	6	Category object (6)	1	[{"added": {}}]	15	1
22	2018-11-14 15:26:31.891079+08	7	Category object (7)	1	[{"added": {}}]	15	1
23	2018-11-14 15:26:44.936486+08	8	Category object (8)	1	[{"added": {}}]	15	1
24	2018-11-14 15:26:59.664538+08	9	Category object (9)	1	[{"added": {}}]	15	1
25	2018-11-14 15:28:12.276275+08	10	Category object (10)	1	[{"added": {}}]	15	1
26	2018-11-14 15:28:59.564074+08	8	Category object (8)	2	[{"changed": {"fields": ["name"]}}]	15	1
27	2018-11-14 15:29:30.708988+08	11	Category object (11)	1	[{"added": {}}]	15	1
28	2018-11-14 15:29:39.859225+08	12	Category object (12)	1	[{"added": {}}]	15	1
29	2018-11-14 15:29:47.354043+08	13	Category object (13)	1	[{"added": {}}]	15	1
30	2018-11-14 15:30:20.094294+08	13	Category object (13)	2	[{"changed": {"fields": ["name"]}}]	15	1
31	2018-11-14 15:30:32.334763+08	14	Category object (14)	1	[{"added": {}}]	15	1
32	2018-11-14 15:30:45.31747+08	14	Category object (14)	2	[{"changed": {"fields": ["name"]}}]	15	1
33	2018-11-14 15:30:56.89538+08	15	Category object (15)	1	[{"added": {}}]	15	1
34	2018-11-14 15:31:54.954542+08	16	Category object (16)	1	[{"added": {}}]	15	1
35	2018-11-14 15:32:03.021295+08	2	Category object (2)	2	[{"changed": {"fields": ["sequence"]}}]	15	1
36	2018-11-14 15:32:09.260467+08	3	Category object (3)	2	[{"changed": {"fields": ["sequence"]}}]	15	1
37	2018-11-14 15:32:15.643672+08	4	Category object (4)	2	[{"changed": {"fields": ["sequence"]}}]	15	1
38	2018-11-14 15:32:21.225008+08	5	Category object (5)	2	[{"changed": {"fields": ["sequence"]}}]	15	1
39	2018-11-14 15:32:27.251946+08	6	Category object (6)	2	[{"changed": {"fields": ["sequence"]}}]	15	1
40	2018-11-14 15:32:33.723955+08	7	Category object (7)	2	[{"changed": {"fields": ["sequence"]}}]	15	1
41	2018-11-14 15:32:39.685293+08	8	Category object (8)	2	[{"changed": {"fields": ["sequence"]}}]	15	1
42	2018-11-14 15:32:44.86605+08	9	Category object (9)	2	[{"changed": {"fields": ["sequence"]}}]	15	1
43	2018-11-14 15:32:49.54209+08	10	Category object (10)	2	[{"changed": {"fields": ["sequence"]}}]	15	1
44	2018-11-14 15:33:06.470783+08	11	Category object (11)	2	[{"changed": {"fields": ["sequence"]}}]	15	1
45	2018-11-14 15:33:12.178224+08	12	Category object (12)	2	[{"changed": {"fields": ["sequence"]}}]	15	1
46	2018-11-14 15:33:18.12206+08	13	Category object (13)	2	[{"changed": {"fields": ["sequence"]}}]	15	1
47	2018-11-14 15:33:23.816153+08	14	Category object (14)	2	[{"changed": {"fields": ["sequence"]}}]	15	1
48	2018-11-14 15:33:29.711382+08	15	Category object (15)	2	[{"changed": {"fields": ["sequence"]}}]	15	1
49	2018-11-14 15:33:44.212801+08	16	Category object (16)	2	[{"changed": {"fields": ["sequence"]}}]	15	1
50	2018-11-15 17:51:59.148594+08	6	Iaer object (6)	1	[{"added": {}}]	12	1
51	2018-11-15 17:55:55.652532+08	6	Iaer object (6)	2	[{"changed": {"fields": ["money"]}}]	12	1
52	2018-11-15 18:07:13.326318+08	6	Iaer object (6)	2	[{"changed": {"fields": ["remark"]}}]	12	1
53	2018-11-15 18:11:35.973832+08	6	Iaer object (6)	3		12	1
54	2018-11-16 11:25:04.396738+08	9	Category object (9)	3		15	1
55	2018-11-16 11:25:24.529119+08	10	Category object (10)	2	[{"changed": {"fields": ["sequence"]}}]	15	1
56	2018-11-16 11:25:57.033848+08	17	Category object (17)	1	[{"added": {}}]	15	1
57	2018-11-16 11:26:59.74316+08	18	Category object (18)	1	[{"added": {}}]	15	1
58	2018-11-16 11:49:28.061933+08	962	Iaer object (962)	2	[{"changed": {"fields": ["category"]}}]	12	1
59	2018-11-16 11:49:48.969347+08	877	Iaer object (877)	2	[{"changed": {"fields": ["category"]}}]	12	1
60	2018-11-16 11:50:06.499795+08	961	Iaer object (961)	2	[{"changed": {"fields": ["category"]}}]	12	1
61	2018-11-16 11:50:19.829147+08	876	Iaer object (876)	2	[{"changed": {"fields": ["category"]}}]	12	1
62	2018-11-16 11:54:01.960049+08	174	RedEnvelope object (174)	3		10	1
63	2018-11-16 11:54:01.974596+08	173	RedEnvelope object (173)	3		10	1
64	2018-11-16 11:54:01.988937+08	172	RedEnvelope object (172)	3		10	1
65	2018-11-16 11:54:02.001534+08	171	RedEnvelope object (171)	3		10	1
66	2018-11-16 11:54:02.012008+08	170	RedEnvelope object (170)	3		10	1
67	2018-11-16 11:54:02.022192+08	169	RedEnvelope object (169)	3		10	1
68	2018-11-16 11:54:02.032496+08	167	RedEnvelope object (167)	3		10	1
69	2018-11-16 11:54:02.051418+08	166	RedEnvelope object (166)	3		10	1
70	2018-11-16 11:54:02.061024+08	165	RedEnvelope object (165)	3		10	1
71	2018-11-16 11:54:02.068943+08	164	RedEnvelope object (164)	3		10	1
72	2018-11-16 11:54:02.08071+08	163	RedEnvelope object (163)	3		10	1
73	2018-11-16 11:54:02.091925+08	162	RedEnvelope object (162)	3		10	1
74	2018-11-16 11:54:02.099599+08	161	RedEnvelope object (161)	3		10	1
75	2018-11-16 11:54:02.107714+08	160	RedEnvelope object (160)	3		10	1
76	2018-11-16 11:54:02.117983+08	159	RedEnvelope object (159)	3		10	1
77	2018-11-16 11:54:02.125394+08	158	RedEnvelope object (158)	3		10	1
78	2018-11-16 11:54:02.134347+08	157	RedEnvelope object (157)	3		10	1
79	2018-11-16 11:54:02.145314+08	156	RedEnvelope object (156)	3		10	1
80	2018-11-16 11:54:02.155835+08	155	RedEnvelope object (155)	3		10	1
81	2018-11-16 11:54:02.171643+08	154	RedEnvelope object (154)	3		10	1
82	2018-11-16 11:54:02.179189+08	153	RedEnvelope object (153)	3		10	1
83	2018-11-16 11:54:02.187612+08	152	RedEnvelope object (152)	3		10	1
84	2018-11-16 11:54:02.197384+08	151	RedEnvelope object (151)	3		10	1
85	2018-11-16 11:54:02.205405+08	149	RedEnvelope object (149)	3		10	1
86	2018-11-16 11:54:02.218351+08	148	RedEnvelope object (148)	3		10	1
87	2018-11-16 11:54:02.238683+08	147	RedEnvelope object (147)	3		10	1
88	2018-11-16 11:54:02.245739+08	146	RedEnvelope object (146)	3		10	1
89	2018-11-16 11:54:02.253239+08	145	RedEnvelope object (145)	3		10	1
90	2018-11-16 11:54:02.264443+08	144	RedEnvelope object (144)	3		10	1
91	2018-11-16 11:54:02.273422+08	143	RedEnvelope object (143)	3		10	1
92	2018-11-16 11:54:02.292158+08	45	RedEnvelope object (45)	3		10	1
93	2018-11-16 11:54:02.299469+08	44	RedEnvelope object (44)	3		10	1
94	2018-11-16 11:54:02.306688+08	43	RedEnvelope object (43)	3		10	1
95	2018-11-16 11:54:02.313617+08	42	RedEnvelope object (42)	3		10	1
96	2018-11-16 11:54:02.326901+08	40	RedEnvelope object (40)	3		10	1
97	2018-11-16 11:54:02.338268+08	39	RedEnvelope object (39)	3		10	1
98	2018-11-16 11:54:02.348367+08	38	RedEnvelope object (38)	3		10	1
99	2018-11-16 11:54:02.355429+08	36	RedEnvelope object (36)	3		10	1
100	2018-11-16 11:54:02.362632+08	34	RedEnvelope object (34)	3		10	1
101	2018-11-16 11:54:02.376679+08	33	RedEnvelope object (33)	3		10	1
102	2018-11-16 11:54:02.389054+08	32	RedEnvelope object (32)	3		10	1
103	2018-11-16 11:54:02.396006+08	31	RedEnvelope object (31)	3		10	1
104	2018-11-16 11:54:02.403488+08	30	RedEnvelope object (30)	3		10	1
105	2018-11-16 11:54:02.411419+08	29	RedEnvelope object (29)	3		10	1
106	2018-11-16 11:54:02.418822+08	28	RedEnvelope object (28)	3		10	1
107	2018-11-16 11:54:02.427141+08	27	RedEnvelope object (27)	3		10	1
108	2018-11-16 11:54:02.434578+08	26	RedEnvelope object (26)	3		10	1
109	2018-11-16 11:54:02.444756+08	25	RedEnvelope object (25)	3		10	1
110	2018-11-16 11:54:02.451887+08	24	RedEnvelope object (24)	3		10	1
111	2018-11-16 11:54:02.45903+08	18	RedEnvelope object (18)	3		10	1
112	2018-11-16 11:54:02.466426+08	17	RedEnvelope object (17)	3		10	1
113	2018-11-16 11:54:02.477032+08	16	RedEnvelope object (16)	3		10	1
114	2018-11-16 11:54:02.484327+08	15	RedEnvelope object (15)	3		10	1
115	2018-11-16 11:54:02.493746+08	14	RedEnvelope object (14)	3		10	1
116	2018-11-16 11:54:02.503853+08	13	RedEnvelope object (13)	3		10	1
117	2018-11-16 11:54:02.511266+08	12	RedEnvelope object (12)	3		10	1
118	2018-11-16 11:54:02.518888+08	11	RedEnvelope object (11)	3		10	1
119	2018-11-16 11:54:02.526822+08	10	RedEnvelope object (10)	3		10	1
120	2018-11-16 11:54:02.542276+08	9	RedEnvelope object (9)	3		10	1
121	2018-11-16 11:54:02.556097+08	8	RedEnvelope object (8)	3		10	1
122	2018-11-16 11:54:02.569606+08	7	RedEnvelope object (7)	3		10	1
123	2018-11-16 11:54:02.587109+08	6	RedEnvelope object (6)	3		10	1
124	2018-11-16 11:54:02.600279+08	5	RedEnvelope object (5)	3		10	1
125	2018-11-16 11:54:02.609523+08	4	RedEnvelope object (4)	3		10	1
126	2018-11-16 11:54:02.619093+08	3	RedEnvelope object (3)	3		10	1
127	2018-11-16 11:54:02.629026+08	2	RedEnvelope object (2)	3		10	1
128	2018-11-16 11:54:34.88695+08	963	Iaer object (963)	3		12	1
129	2018-11-16 11:54:34.907783+08	878	Iaer object (878)	3		12	1
130	2018-11-16 11:54:34.918509+08	962	Iaer object (962)	3		12	1
131	2018-11-16 11:54:34.928895+08	877	Iaer object (877)	3		12	1
132	2018-11-16 11:54:34.946565+08	961	Iaer object (961)	3		12	1
133	2018-11-16 11:54:34.96266+08	876	Iaer object (876)	3		12	1
134	2018-11-16 11:54:34.973586+08	960	Iaer object (960)	3		12	1
135	2018-11-16 11:54:34.988238+08	875	Iaer object (875)	3		12	1
136	2018-11-16 11:54:35.001926+08	959	Iaer object (959)	3		12	1
137	2018-11-16 11:54:35.052453+08	874	Iaer object (874)	3		12	1
138	2018-11-16 11:54:35.062371+08	958	Iaer object (958)	3		12	1
139	2018-11-16 11:54:35.091773+08	873	Iaer object (873)	3		12	1
140	2018-11-16 11:54:35.11253+08	957	Iaer object (957)	3		12	1
141	2018-11-16 11:54:35.144552+08	872	Iaer object (872)	3		12	1
142	2018-11-16 11:54:35.163157+08	956	Iaer object (956)	3		12	1
143	2018-11-16 11:54:35.175635+08	871	Iaer object (871)	3		12	1
144	2018-11-16 11:54:35.186419+08	955	Iaer object (955)	3		12	1
145	2018-11-16 11:54:35.197255+08	870	Iaer object (870)	3		12	1
146	2018-11-16 11:54:35.20793+08	954	Iaer object (954)	3		12	1
147	2018-11-16 11:54:35.219318+08	869	Iaer object (869)	3		12	1
148	2018-11-16 11:54:35.230153+08	953	Iaer object (953)	3		12	1
149	2018-11-16 11:54:35.240934+08	868	Iaer object (868)	3		12	1
150	2018-11-16 11:54:35.253654+08	952	Iaer object (952)	3		12	1
151	2018-11-16 11:54:35.266258+08	867	Iaer object (867)	3		12	1
152	2018-11-16 11:54:35.277594+08	951	Iaer object (951)	3		12	1
153	2018-11-16 11:54:35.296255+08	866	Iaer object (866)	3		12	1
154	2018-11-16 11:54:35.310194+08	950	Iaer object (950)	3		12	1
155	2018-11-16 11:54:35.320212+08	865	Iaer object (865)	3		12	1
156	2018-11-16 11:54:35.336947+08	949	Iaer object (949)	3		12	1
157	2018-11-16 11:54:35.345249+08	864	Iaer object (864)	3		12	1
158	2018-11-16 11:54:35.360726+08	948	Iaer object (948)	3		12	1
159	2018-11-16 11:54:35.373186+08	863	Iaer object (863)	3		12	1
160	2018-11-16 11:54:35.388899+08	947	Iaer object (947)	3		12	1
161	2018-11-16 11:54:35.403457+08	862	Iaer object (862)	3		12	1
162	2018-11-16 11:54:35.41738+08	946	Iaer object (946)	3		12	1
163	2018-11-16 11:54:35.430074+08	861	Iaer object (861)	3		12	1
164	2018-11-16 11:54:35.446995+08	945	Iaer object (945)	3		12	1
165	2018-11-16 11:54:35.460717+08	860	Iaer object (860)	3		12	1
166	2018-11-16 11:54:35.48483+08	944	Iaer object (944)	3		12	1
167	2018-11-16 11:54:35.498641+08	859	Iaer object (859)	3		12	1
168	2018-11-16 11:54:35.51819+08	943	Iaer object (943)	3		12	1
169	2018-11-16 11:54:35.530063+08	858	Iaer object (858)	3		12	1
170	2018-11-16 11:54:35.541662+08	942	Iaer object (942)	3		12	1
171	2018-11-16 11:54:35.556594+08	857	Iaer object (857)	3		12	1
172	2018-11-16 11:54:35.567745+08	941	Iaer object (941)	3		12	1
173	2018-11-16 11:54:35.576431+08	856	Iaer object (856)	3		12	1
174	2018-11-16 11:54:35.596161+08	940	Iaer object (940)	3		12	1
175	2018-11-16 11:54:35.608799+08	855	Iaer object (855)	3		12	1
176	2018-11-16 11:54:35.620764+08	939	Iaer object (939)	3		12	1
177	2018-11-16 11:54:35.638334+08	854	Iaer object (854)	3		12	1
178	2018-11-16 11:54:35.645612+08	938	Iaer object (938)	3		12	1
179	2018-11-16 11:54:35.658712+08	853	Iaer object (853)	3		12	1
180	2018-11-16 11:54:35.671117+08	937	Iaer object (937)	3		12	1
181	2018-11-16 11:54:35.678207+08	852	Iaer object (852)	3		12	1
182	2018-11-16 11:54:35.692802+08	936	Iaer object (936)	3		12	1
183	2018-11-16 11:54:35.703094+08	851	Iaer object (851)	3		12	1
184	2018-11-16 11:54:35.71354+08	935	Iaer object (935)	3		12	1
185	2018-11-16 11:54:35.720952+08	850	Iaer object (850)	3		12	1
186	2018-11-16 11:54:35.728447+08	934	Iaer object (934)	3		12	1
187	2018-11-16 11:54:35.738708+08	849	Iaer object (849)	3		12	1
188	2018-11-16 11:54:35.752012+08	933	Iaer object (933)	3		12	1
189	2018-11-16 11:54:35.761317+08	848	Iaer object (848)	3		12	1
190	2018-11-16 11:54:35.7692+08	932	Iaer object (932)	3		12	1
191	2018-11-16 11:54:35.786092+08	847	Iaer object (847)	3		12	1
192	2018-11-16 11:54:35.805065+08	931	Iaer object (931)	3		12	1
193	2018-11-16 11:54:35.81737+08	846	Iaer object (846)	3		12	1
194	2018-11-16 11:54:35.82447+08	930	Iaer object (930)	3		12	1
195	2018-11-16 11:54:35.831954+08	845	Iaer object (845)	3		12	1
196	2018-11-16 11:54:35.84525+08	929	Iaer object (929)	3		12	1
197	2018-11-16 11:54:35.85331+08	844	Iaer object (844)	3		12	1
198	2018-11-16 11:54:35.860392+08	928	Iaer object (928)	3		12	1
199	2018-11-16 11:54:35.871008+08	843	Iaer object (843)	3		12	1
200	2018-11-16 11:54:35.882313+08	927	Iaer object (927)	3		12	1
201	2018-11-16 11:54:35.892563+08	842	Iaer object (842)	3		12	1
202	2018-11-16 11:54:35.905605+08	926	Iaer object (926)	3		12	1
203	2018-11-16 11:54:35.934264+08	841	Iaer object (841)	3		12	1
204	2018-11-16 11:54:35.945463+08	925	Iaer object (925)	3		12	1
205	2018-11-16 11:54:35.952561+08	840	Iaer object (840)	3		12	1
206	2018-11-16 11:54:35.960442+08	924	Iaer object (924)	3		12	1
207	2018-11-16 11:54:35.972121+08	839	Iaer object (839)	3		12	1
208	2018-11-16 11:54:35.98726+08	923	Iaer object (923)	3		12	1
209	2018-11-16 11:54:35.997596+08	838	Iaer object (838)	3		12	1
210	2018-11-16 11:54:36.00523+08	922	Iaer object (922)	3		12	1
211	2018-11-16 11:54:36.012477+08	837	Iaer object (837)	3		12	1
212	2018-11-16 11:54:36.020285+08	921	Iaer object (921)	3		12	1
213	2018-11-16 11:54:36.028148+08	836	Iaer object (836)	3		12	1
214	2018-11-16 11:54:36.035627+08	920	Iaer object (920)	3		12	1
215	2018-11-16 11:54:36.042747+08	835	Iaer object (835)	3		12	1
216	2018-11-16 11:54:36.050731+08	919	Iaer object (919)	3		12	1
217	2018-11-16 11:54:36.05976+08	834	Iaer object (834)	3		12	1
218	2018-11-16 11:54:36.067315+08	918	Iaer object (918)	3		12	1
219	2018-11-16 11:54:36.074726+08	833	Iaer object (833)	3		12	1
220	2018-11-16 11:54:36.082547+08	917	Iaer object (917)	3		12	1
221	2018-11-16 11:54:36.090108+08	832	Iaer object (832)	3		12	1
222	2018-11-16 11:54:36.097481+08	916	Iaer object (916)	3		12	1
223	2018-11-16 11:54:36.105147+08	831	Iaer object (831)	3		12	1
224	2018-11-16 11:54:36.113079+08	915	Iaer object (915)	3		12	1
225	2018-11-16 11:54:36.12527+08	830	Iaer object (830)	3		12	1
226	2018-11-16 11:54:36.133234+08	914	Iaer object (914)	3		12	1
227	2018-11-16 11:54:36.141127+08	829	Iaer object (829)	3		12	1
228	2018-11-16 11:54:52.526946+08	913	Iaer object (913)	3		12	1
229	2018-11-16 11:54:52.546311+08	828	Iaer object (828)	3		12	1
230	2018-11-16 11:54:52.559048+08	912	Iaer object (912)	3		12	1
231	2018-11-16 11:54:52.569603+08	827	Iaer object (827)	3		12	1
232	2018-11-16 11:54:52.577017+08	911	Iaer object (911)	3		12	1
233	2018-11-16 11:54:52.584868+08	826	Iaer object (826)	3		12	1
234	2018-11-16 11:54:52.594742+08	910	Iaer object (910)	3		12	1
235	2018-11-16 11:54:52.601717+08	825	Iaer object (825)	3		12	1
236	2018-11-16 11:54:52.609777+08	909	Iaer object (909)	3		12	1
237	2018-11-16 11:54:52.619892+08	824	Iaer object (824)	3		12	1
238	2018-11-16 11:54:52.627443+08	908	Iaer object (908)	3		12	1
239	2018-11-16 11:54:52.634693+08	823	Iaer object (823)	3		12	1
240	2018-11-16 11:54:52.641852+08	907	Iaer object (907)	3		12	1
241	2018-11-16 11:54:52.6491+08	822	Iaer object (822)	3		12	1
242	2018-11-16 11:54:52.657435+08	906	Iaer object (906)	3		12	1
243	2018-11-16 11:54:52.667171+08	821	Iaer object (821)	3		12	1
244	2018-11-16 11:54:52.675163+08	905	Iaer object (905)	3		12	1
245	2018-11-16 11:54:52.688874+08	820	Iaer object (820)	3		12	1
246	2018-11-16 11:54:52.696886+08	904	Iaer object (904)	3		12	1
247	2018-11-16 11:54:52.713711+08	819	Iaer object (819)	3		12	1
248	2018-11-16 11:54:52.724271+08	903	Iaer object (903)	3		12	1
249	2018-11-16 11:54:52.733681+08	818	Iaer object (818)	3		12	1
250	2018-11-16 11:54:52.741313+08	902	Iaer object (902)	3		12	1
251	2018-11-16 11:54:52.750158+08	817	Iaer object (817)	3		12	1
252	2018-11-16 11:54:52.761491+08	901	Iaer object (901)	3		12	1
253	2018-11-16 11:54:52.772417+08	816	Iaer object (816)	3		12	1
254	2018-11-16 11:54:52.785062+08	900	Iaer object (900)	3		12	1
255	2018-11-16 11:54:52.792275+08	815	Iaer object (815)	3		12	1
256	2018-11-16 11:54:52.799985+08	899	Iaer object (899)	3		12	1
257	2018-11-16 11:54:52.810554+08	814	Iaer object (814)	3		12	1
258	2018-11-16 11:54:52.818731+08	898	Iaer object (898)	3		12	1
259	2018-11-16 11:54:52.825861+08	813	Iaer object (813)	3		12	1
260	2018-11-16 11:54:52.837199+08	897	Iaer object (897)	3		12	1
261	2018-11-16 11:54:52.848346+08	812	Iaer object (812)	3		12	1
262	2018-11-16 11:54:52.861729+08	896	Iaer object (896)	3		12	1
263	2018-11-16 11:54:52.879461+08	811	Iaer object (811)	3		12	1
264	2018-11-16 11:54:52.891257+08	895	Iaer object (895)	3		12	1
265	2018-11-16 11:54:52.903708+08	810	Iaer object (810)	3		12	1
266	2018-11-16 11:54:52.918725+08	894	Iaer object (894)	3		12	1
267	2018-11-16 11:54:52.929259+08	809	Iaer object (809)	3		12	1
268	2018-11-16 11:54:52.942793+08	893	Iaer object (893)	3		12	1
269	2018-11-16 11:54:52.953427+08	808	Iaer object (808)	3		12	1
270	2018-11-16 11:54:52.967562+08	892	Iaer object (892)	3		12	1
271	2018-11-16 11:54:52.977085+08	807	Iaer object (807)	3		12	1
272	2018-11-16 11:54:52.987434+08	891	Iaer object (891)	3		12	1
273	2018-11-16 11:54:52.99953+08	806	Iaer object (806)	3		12	1
274	2018-11-16 11:54:53.010368+08	890	Iaer object (890)	3		12	1
275	2018-11-16 11:54:53.020871+08	805	Iaer object (805)	3		12	1
276	2018-11-16 11:54:53.034438+08	889	Iaer object (889)	3		12	1
277	2018-11-16 11:54:53.048702+08	804	Iaer object (804)	3		12	1
278	2018-11-16 11:54:53.058775+08	888	Iaer object (888)	3		12	1
279	2018-11-16 11:54:53.073651+08	803	Iaer object (803)	3		12	1
280	2018-11-16 11:54:53.084789+08	887	Iaer object (887)	3		12	1
281	2018-11-16 11:54:53.094672+08	802	Iaer object (802)	3		12	1
282	2018-11-16 11:54:53.102243+08	886	Iaer object (886)	3		12	1
283	2018-11-16 11:54:53.109872+08	801	Iaer object (801)	3		12	1
284	2018-11-16 11:54:53.122362+08	885	Iaer object (885)	3		12	1
285	2018-11-16 11:54:53.147234+08	800	Iaer object (800)	3		12	1
286	2018-11-16 11:54:53.161517+08	884	Iaer object (884)	3		12	1
287	2018-11-16 11:54:53.169721+08	799	Iaer object (799)	3		12	1
288	2018-11-16 11:54:53.186551+08	883	Iaer object (883)	3		12	1
289	2018-11-16 11:54:53.199547+08	798	Iaer object (798)	3		12	1
290	2018-11-16 11:54:53.210881+08	882	Iaer object (882)	3		12	1
291	2018-11-16 11:54:53.223106+08	797	Iaer object (797)	3		12	1
292	2018-11-16 11:54:53.236209+08	881	Iaer object (881)	3		12	1
293	2018-11-16 11:54:53.255651+08	796	Iaer object (796)	3		12	1
294	2018-11-16 11:54:53.265465+08	880	Iaer object (880)	3		12	1
295	2018-11-16 11:54:53.276374+08	795	Iaer object (795)	3		12	1
296	2018-11-16 11:54:53.286581+08	879	Iaer object (879)	3		12	1
297	2018-11-16 11:54:53.294328+08	794	Iaer object (794)	3		12	1
298	2018-11-16 11:54:53.307246+08	793	Iaer object (793)	3		12	1
299	2018-11-16 11:54:53.321158+08	792	Iaer object (792)	3		12	1
300	2018-11-16 11:54:53.328972+08	791	Iaer object (791)	3		12	1
301	2018-11-16 11:54:53.35819+08	790	Iaer object (790)	3		12	1
302	2018-11-16 11:54:53.369204+08	789	Iaer object (789)	3		12	1
303	2018-11-16 11:54:53.379239+08	788	Iaer object (788)	3		12	1
304	2018-11-16 11:54:53.391558+08	787	Iaer object (787)	3		12	1
305	2018-11-16 11:54:53.405789+08	786	Iaer object (786)	3		12	1
306	2018-11-16 11:54:53.418035+08	785	Iaer object (785)	3		12	1
307	2018-11-16 11:54:53.425573+08	784	Iaer object (784)	3		12	1
308	2018-11-16 11:54:53.434166+08	783	Iaer object (783)	3		12	1
309	2018-11-16 11:54:53.443686+08	782	Iaer object (782)	3		12	1
310	2018-11-16 11:54:53.454961+08	781	Iaer object (781)	3		12	1
311	2018-11-16 11:54:53.46534+08	780	Iaer object (780)	3		12	1
312	2018-11-16 11:54:53.473008+08	779	Iaer object (779)	3		12	1
313	2018-11-16 11:54:53.48075+08	778	Iaer object (778)	3		12	1
314	2018-11-16 11:54:53.490744+08	777	Iaer object (777)	3		12	1
315	2018-11-16 11:54:53.504337+08	776	Iaer object (776)	3		12	1
316	2018-11-16 11:54:53.512234+08	775	Iaer object (775)	3		12	1
317	2018-11-16 11:54:53.522573+08	774	Iaer object (774)	3		12	1
318	2018-11-16 11:54:53.547439+08	773	Iaer object (773)	3		12	1
319	2018-11-16 11:54:53.558022+08	772	Iaer object (772)	3		12	1
320	2018-11-16 11:54:53.565635+08	771	Iaer object (771)	3		12	1
321	2018-11-16 11:54:53.574817+08	770	Iaer object (770)	3		12	1
322	2018-11-16 11:54:53.595009+08	769	Iaer object (769)	3		12	1
323	2018-11-16 11:54:53.602656+08	768	Iaer object (768)	3		12	1
324	2018-11-16 11:54:53.610047+08	767	Iaer object (767)	3		12	1
325	2018-11-16 11:54:53.634837+08	766	Iaer object (766)	3		12	1
326	2018-11-16 11:54:53.654832+08	765	Iaer object (765)	3		12	1
327	2018-11-16 11:54:53.665025+08	764	Iaer object (764)	3		12	1
328	2018-11-16 11:55:28.275939+08	763	Iaer object (763)	3		12	1
329	2018-11-16 11:55:28.294816+08	762	Iaer object (762)	3		12	1
330	2018-11-16 11:55:28.3157+08	761	Iaer object (761)	3		12	1
331	2018-11-16 11:55:28.326569+08	760	Iaer object (760)	3		12	1
332	2018-11-16 11:55:28.339024+08	759	Iaer object (759)	3		12	1
333	2018-11-16 11:55:28.351299+08	758	Iaer object (758)	3		12	1
334	2018-11-16 11:55:28.362264+08	757	Iaer object (757)	3		12	1
335	2018-11-16 11:55:28.372135+08	756	Iaer object (756)	3		12	1
336	2018-11-16 11:55:28.382493+08	755	Iaer object (755)	3		12	1
337	2018-11-16 11:55:28.38985+08	754	Iaer object (754)	3		12	1
338	2018-11-16 11:55:28.397829+08	753	Iaer object (753)	3		12	1
339	2018-11-16 11:55:28.409838+08	752	Iaer object (752)	3		12	1
340	2018-11-16 11:55:28.420296+08	751	Iaer object (751)	3		12	1
341	2018-11-16 11:55:28.429636+08	750	Iaer object (750)	3		12	1
342	2018-11-16 11:55:28.44013+08	749	Iaer object (749)	3		12	1
343	2018-11-16 11:55:28.452642+08	748	Iaer object (748)	3		12	1
344	2018-11-16 11:55:28.462864+08	747	Iaer object (747)	3		12	1
345	2018-11-16 11:55:28.47663+08	746	Iaer object (746)	3		12	1
346	2018-11-16 11:55:28.484452+08	745	Iaer object (745)	3		12	1
347	2018-11-16 11:55:28.491786+08	744	Iaer object (744)	3		12	1
348	2018-11-16 11:55:28.502241+08	743	Iaer object (743)	3		12	1
349	2018-11-16 11:55:28.509572+08	742	Iaer object (742)	3		12	1
350	2018-11-16 11:55:28.517242+08	741	Iaer object (741)	3		12	1
351	2018-11-16 11:55:28.524419+08	740	Iaer object (740)	3		12	1
352	2018-11-16 11:55:28.532644+08	739	Iaer object (739)	3		12	1
353	2018-11-16 11:55:28.542092+08	738	Iaer object (738)	3		12	1
354	2018-11-16 11:55:28.549577+08	737	Iaer object (737)	3		12	1
355	2018-11-16 11:55:28.556878+08	736	Iaer object (736)	3		12	1
356	2018-11-16 11:55:28.570436+08	735	Iaer object (735)	3		12	1
357	2018-11-16 11:55:28.582985+08	734	Iaer object (734)	3		12	1
358	2018-11-16 11:55:28.598076+08	733	Iaer object (733)	3		12	1
359	2018-11-16 11:55:28.607928+08	732	Iaer object (732)	3		12	1
360	2018-11-16 11:55:28.617887+08	731	Iaer object (731)	3		12	1
361	2018-11-16 11:55:28.631957+08	730	Iaer object (730)	3		12	1
362	2018-11-16 11:55:28.645776+08	729	Iaer object (729)	3		12	1
363	2018-11-16 11:55:28.653244+08	728	Iaer object (728)	3		12	1
364	2018-11-16 11:55:28.668632+08	727	Iaer object (727)	3		12	1
365	2018-11-16 11:55:28.67812+08	726	Iaer object (726)	3		12	1
366	2018-11-16 11:55:28.685866+08	725	Iaer object (725)	3		12	1
367	2018-11-16 11:55:28.694116+08	724	Iaer object (724)	3		12	1
368	2018-11-16 11:55:28.703358+08	723	Iaer object (723)	3		12	1
369	2018-11-16 11:55:28.710821+08	722	Iaer object (722)	3		12	1
370	2018-11-16 11:55:28.720015+08	721	Iaer object (721)	3		12	1
371	2018-11-16 11:55:28.729503+08	720	Iaer object (720)	3		12	1
372	2018-11-16 11:55:28.739531+08	719	Iaer object (719)	3		12	1
373	2018-11-16 11:55:28.747239+08	718	Iaer object (718)	3		12	1
374	2018-11-16 11:55:28.757775+08	717	Iaer object (717)	3		12	1
375	2018-11-16 11:55:28.771608+08	716	Iaer object (716)	3		12	1
376	2018-11-16 11:55:28.781649+08	715	Iaer object (715)	3		12	1
377	2018-11-16 11:55:28.789253+08	714	Iaer object (714)	3		12	1
378	2018-11-16 11:55:28.800438+08	713	Iaer object (713)	3		12	1
379	2018-11-16 11:55:28.813391+08	712	Iaer object (712)	3		12	1
380	2018-11-16 11:55:28.821118+08	711	Iaer object (711)	3		12	1
381	2018-11-16 11:55:28.828593+08	710	Iaer object (710)	3		12	1
382	2018-11-16 11:55:28.836045+08	709	Iaer object (709)	3		12	1
383	2018-11-16 11:55:28.844823+08	708	Iaer object (708)	3		12	1
384	2018-11-16 11:55:28.854641+08	707	Iaer object (707)	3		12	1
385	2018-11-16 11:55:28.86582+08	706	Iaer object (706)	3		12	1
386	2018-11-16 11:55:28.876848+08	705	Iaer object (705)	3		12	1
387	2018-11-16 11:55:28.884295+08	704	Iaer object (704)	3		12	1
388	2018-11-16 11:55:28.891536+08	703	Iaer object (703)	3		12	1
389	2018-11-16 11:55:28.902251+08	702	Iaer object (702)	3		12	1
390	2018-11-16 11:55:28.909744+08	701	Iaer object (701)	3		12	1
391	2018-11-16 11:55:28.918887+08	700	Iaer object (700)	3		12	1
392	2018-11-16 11:55:28.932292+08	699	Iaer object (699)	3		12	1
393	2018-11-16 11:55:28.942023+08	698	Iaer object (698)	3		12	1
394	2018-11-16 11:55:28.95503+08	697	Iaer object (697)	3		12	1
395	2018-11-16 11:55:28.975917+08	696	Iaer object (696)	3		12	1
396	2018-11-16 11:55:28.985716+08	695	Iaer object (695)	3		12	1
397	2018-11-16 11:55:28.999204+08	694	Iaer object (694)	3		12	1
398	2018-11-16 11:55:29.006345+08	693	Iaer object (693)	3		12	1
399	2018-11-16 11:55:29.014037+08	692	Iaer object (692)	3		12	1
400	2018-11-16 11:55:29.024428+08	691	Iaer object (691)	3		12	1
401	2018-11-16 11:55:29.032035+08	690	Iaer object (690)	3		12	1
402	2018-11-16 11:55:29.039294+08	689	Iaer object (689)	3		12	1
403	2018-11-16 11:55:29.046932+08	688	Iaer object (688)	3		12	1
404	2018-11-16 11:55:29.060302+08	687	Iaer object (687)	3		12	1
405	2018-11-16 11:55:29.075617+08	686	Iaer object (686)	3		12	1
406	2018-11-16 11:55:29.08966+08	685	Iaer object (685)	3		12	1
407	2018-11-16 11:55:29.101588+08	684	Iaer object (684)	3		12	1
408	2018-11-16 11:55:29.119426+08	683	Iaer object (683)	3		12	1
409	2018-11-16 11:55:29.130126+08	682	Iaer object (682)	3		12	1
410	2018-11-16 11:55:29.139647+08	681	Iaer object (681)	3		12	1
411	2018-11-16 11:55:29.152834+08	680	Iaer object (680)	3		12	1
412	2018-11-16 11:55:29.167646+08	679	Iaer object (679)	3		12	1
413	2018-11-16 11:55:29.17803+08	678	Iaer object (678)	3		12	1
414	2018-11-16 11:55:29.187654+08	677	Iaer object (677)	3		12	1
415	2018-11-16 11:55:29.195482+08	676	Iaer object (676)	3		12	1
416	2018-11-16 11:55:29.202893+08	675	Iaer object (675)	3		12	1
417	2018-11-16 11:55:29.222597+08	674	Iaer object (674)	3		12	1
418	2018-11-16 11:55:29.230713+08	673	Iaer object (673)	3		12	1
419	2018-11-16 11:55:29.258145+08	672	Iaer object (672)	3		12	1
420	2018-11-16 11:55:29.26906+08	671	Iaer object (671)	3		12	1
421	2018-11-16 11:55:29.286393+08	670	Iaer object (670)	3		12	1
422	2018-11-16 11:55:29.299333+08	669	Iaer object (669)	3		12	1
423	2018-11-16 11:55:29.310286+08	668	Iaer object (668)	3		12	1
424	2018-11-16 11:55:29.322779+08	667	Iaer object (667)	3		12	1
425	2018-11-16 11:55:29.334291+08	666	Iaer object (666)	3		12	1
426	2018-11-16 11:55:29.345368+08	665	Iaer object (665)	3		12	1
427	2018-11-16 11:55:29.356417+08	664	Iaer object (664)	3		12	1
428	2018-11-16 11:55:29.367551+08	663	Iaer object (663)	3		12	1
429	2018-11-16 11:55:29.378446+08	662	Iaer object (662)	3		12	1
430	2018-11-16 11:55:29.389038+08	661	Iaer object (661)	3		12	1
431	2018-11-16 11:55:29.400123+08	660	Iaer object (660)	3		12	1
432	2018-11-16 11:55:29.415587+08	659	Iaer object (659)	3		12	1
433	2018-11-16 11:55:29.432843+08	658	Iaer object (658)	3		12	1
434	2018-11-16 11:55:29.450366+08	657	Iaer object (657)	3		12	1
435	2018-11-16 11:55:29.501026+08	656	Iaer object (656)	3		12	1
436	2018-11-16 11:55:29.518726+08	655	Iaer object (655)	3		12	1
437	2018-11-16 11:55:29.554568+08	654	Iaer object (654)	3		12	1
438	2018-11-16 11:55:29.566117+08	653	Iaer object (653)	3		12	1
439	2018-11-16 11:55:29.581761+08	652	Iaer object (652)	3		12	1
440	2018-11-16 11:55:29.616819+08	651	Iaer object (651)	3		12	1
441	2018-11-16 11:55:29.629156+08	650	Iaer object (650)	3		12	1
442	2018-11-16 11:55:29.643121+08	649	Iaer object (649)	3		12	1
443	2018-11-16 11:55:29.657699+08	648	Iaer object (648)	3		12	1
444	2018-11-16 11:55:29.678869+08	647	Iaer object (647)	3		12	1
445	2018-11-16 11:55:29.695681+08	646	Iaer object (646)	3		12	1
446	2018-11-16 11:55:29.704469+08	645	Iaer object (645)	3		12	1
447	2018-11-16 11:55:29.714529+08	644	Iaer object (644)	3		12	1
448	2018-11-16 11:55:29.728845+08	643	Iaer object (643)	3		12	1
449	2018-11-16 11:55:29.741778+08	642	Iaer object (642)	3		12	1
450	2018-11-16 11:55:29.754309+08	641	Iaer object (641)	3		12	1
451	2018-11-16 11:55:29.762191+08	640	Iaer object (640)	3		12	1
452	2018-11-16 11:55:29.778516+08	639	Iaer object (639)	3		12	1
453	2018-11-16 11:55:29.790128+08	638	Iaer object (638)	3		12	1
454	2018-11-16 11:55:29.804739+08	637	Iaer object (637)	3		12	1
455	2018-11-16 11:55:29.819581+08	636	Iaer object (636)	3		12	1
456	2018-11-16 11:55:29.841863+08	635	Iaer object (635)	3		12	1
457	2018-11-16 11:55:29.852895+08	634	Iaer object (634)	3		12	1
458	2018-11-16 11:55:29.87556+08	633	Iaer object (633)	3		12	1
459	2018-11-16 11:55:29.894393+08	632	Iaer object (632)	3		12	1
460	2018-11-16 11:55:29.905047+08	631	Iaer object (631)	3		12	1
461	2018-11-16 11:55:29.915331+08	630	Iaer object (630)	3		12	1
462	2018-11-16 11:55:29.92604+08	629	Iaer object (629)	3		12	1
463	2018-11-16 11:55:29.935865+08	628	Iaer object (628)	3		12	1
464	2018-11-16 11:55:29.943621+08	627	Iaer object (627)	3		12	1
465	2018-11-16 11:55:29.95403+08	626	Iaer object (626)	3		12	1
466	2018-11-16 11:55:29.964553+08	625	Iaer object (625)	3		12	1
467	2018-11-16 11:55:29.973129+08	624	Iaer object (624)	3		12	1
468	2018-11-16 11:55:29.980909+08	623	Iaer object (623)	3		12	1
469	2018-11-16 11:55:29.991095+08	622	Iaer object (622)	3		12	1
470	2018-11-16 11:55:29.998812+08	621	Iaer object (621)	3		12	1
471	2018-11-16 11:55:30.006017+08	620	Iaer object (620)	3		12	1
472	2018-11-16 11:55:30.014064+08	619	Iaer object (619)	3		12	1
473	2018-11-16 11:55:30.0214+08	618	Iaer object (618)	3		12	1
474	2018-11-16 11:55:30.032239+08	617	Iaer object (617)	3		12	1
475	2018-11-16 11:55:30.043168+08	616	Iaer object (616)	3		12	1
476	2018-11-16 11:55:30.053639+08	615	Iaer object (615)	3		12	1
477	2018-11-16 11:55:30.0646+08	614	Iaer object (614)	3		12	1
478	2018-11-16 11:55:30.0747+08	613	Iaer object (613)	3		12	1
479	2018-11-16 11:55:30.088783+08	612	Iaer object (612)	3		12	1
480	2018-11-16 11:55:30.099698+08	611	Iaer object (611)	3		12	1
481	2018-11-16 11:55:30.109798+08	610	Iaer object (610)	3		12	1
482	2018-11-16 11:55:30.120184+08	609	Iaer object (609)	3		12	1
483	2018-11-16 11:55:30.127759+08	608	Iaer object (608)	3		12	1
484	2018-11-16 11:55:30.135906+08	607	Iaer object (607)	3		12	1
485	2018-11-16 11:55:30.145281+08	606	Iaer object (606)	3		12	1
486	2018-11-16 11:55:30.155173+08	605	Iaer object (605)	3		12	1
487	2018-11-16 11:55:30.162487+08	604	Iaer object (604)	3		12	1
488	2018-11-16 11:55:30.170702+08	603	Iaer object (603)	3		12	1
489	2018-11-16 11:55:30.178095+08	602	Iaer object (602)	3		12	1
490	2018-11-16 11:55:30.185242+08	601	Iaer object (601)	3		12	1
491	2018-11-16 11:55:30.192283+08	600	Iaer object (600)	3		12	1
492	2018-11-16 11:55:30.200579+08	599	Iaer object (599)	3		12	1
493	2018-11-16 11:55:30.211263+08	598	Iaer object (598)	3		12	1
494	2018-11-16 11:55:30.218686+08	597	Iaer object (597)	3		12	1
495	2018-11-16 11:55:30.226437+08	596	Iaer object (596)	3		12	1
496	2018-11-16 11:55:30.234602+08	595	Iaer object (595)	3		12	1
497	2018-11-16 11:55:30.24249+08	594	Iaer object (594)	3		12	1
498	2018-11-16 11:55:30.257778+08	593	Iaer object (593)	3		12	1
499	2018-11-16 11:55:30.268695+08	592	Iaer object (592)	3		12	1
500	2018-11-16 11:55:30.277102+08	591	Iaer object (591)	3		12	1
501	2018-11-16 11:55:30.285718+08	590	Iaer object (590)	3		12	1
502	2018-11-16 11:55:30.294045+08	589	Iaer object (589)	3		12	1
503	2018-11-16 11:55:30.301539+08	588	Iaer object (588)	3		12	1
504	2018-11-16 11:55:30.309125+08	587	Iaer object (587)	3		12	1
505	2018-11-16 11:55:30.319168+08	586	Iaer object (586)	3		12	1
506	2018-11-16 11:55:30.331217+08	585	Iaer object (585)	3		12	1
507	2018-11-16 11:55:30.338651+08	584	Iaer object (584)	3		12	1
508	2018-11-16 11:55:30.346127+08	583	Iaer object (583)	3		12	1
509	2018-11-16 11:55:30.354652+08	582	Iaer object (582)	3		12	1
510	2018-11-16 11:55:30.364173+08	581	Iaer object (581)	3		12	1
511	2018-11-16 11:55:30.37484+08	580	Iaer object (580)	3		12	1
512	2018-11-16 11:55:30.386095+08	579	Iaer object (579)	3		12	1
513	2018-11-16 11:55:30.395612+08	578	Iaer object (578)	3		12	1
514	2018-11-16 11:55:30.403289+08	577	Iaer object (577)	3		12	1
515	2018-11-16 11:55:30.420183+08	576	Iaer object (576)	3		12	1
516	2018-11-16 11:55:30.429832+08	575	Iaer object (575)	3		12	1
517	2018-11-16 11:55:30.437332+08	574	Iaer object (574)	3		12	1
518	2018-11-16 11:55:30.445217+08	573	Iaer object (573)	3		12	1
519	2018-11-16 11:55:30.452452+08	572	Iaer object (572)	3		12	1
520	2018-11-16 11:55:30.459828+08	571	Iaer object (571)	3		12	1
521	2018-11-16 11:55:30.467626+08	570	Iaer object (570)	3		12	1
522	2018-11-16 11:55:30.475925+08	569	Iaer object (569)	3		12	1
523	2018-11-16 11:55:30.485988+08	568	Iaer object (568)	3		12	1
524	2018-11-16 11:55:30.493294+08	567	Iaer object (567)	3		12	1
525	2018-11-16 11:55:30.501187+08	566	Iaer object (566)	3		12	1
526	2018-11-16 11:55:30.511771+08	565	Iaer object (565)	3		12	1
527	2018-11-16 11:55:30.519187+08	564	Iaer object (564)	3		12	1
528	2018-11-16 11:55:30.52655+08	563	Iaer object (563)	3		12	1
529	2018-11-16 11:55:30.534671+08	562	Iaer object (562)	3		12	1
530	2018-11-16 11:55:30.543523+08	561	Iaer object (561)	3		12	1
531	2018-11-16 11:55:30.55126+08	560	Iaer object (560)	3		12	1
532	2018-11-16 11:55:30.559857+08	559	Iaer object (559)	3		12	1
533	2018-11-16 11:55:30.56852+08	558	Iaer object (558)	3		12	1
534	2018-11-16 11:55:30.576071+08	557	Iaer object (557)	3		12	1
535	2018-11-16 11:55:30.583642+08	556	Iaer object (556)	3		12	1
536	2018-11-16 11:55:30.592428+08	555	Iaer object (555)	3		12	1
537	2018-11-16 11:55:30.609915+08	554	Iaer object (554)	3		12	1
538	2018-11-16 11:55:30.623006+08	553	Iaer object (553)	3		12	1
539	2018-11-16 11:55:30.637142+08	552	Iaer object (552)	3		12	1
540	2018-11-16 11:55:30.645076+08	551	Iaer object (551)	3		12	1
541	2018-11-16 11:55:30.653087+08	550	Iaer object (550)	3		12	1
542	2018-11-16 11:55:30.664029+08	549	Iaer object (549)	3		12	1
543	2018-11-16 11:55:30.671444+08	548	Iaer object (548)	3		12	1
544	2018-11-16 11:55:30.679823+08	547	Iaer object (547)	3		12	1
545	2018-11-16 11:55:30.692392+08	546	Iaer object (546)	3		12	1
546	2018-11-16 11:55:30.70222+08	545	Iaer object (545)	3		12	1
547	2018-11-16 11:55:30.709456+08	544	Iaer object (544)	3		12	1
548	2018-11-16 11:55:30.725084+08	543	Iaer object (543)	3		12	1
549	2018-11-16 11:55:30.741561+08	542	Iaer object (542)	3		12	1
550	2018-11-16 11:55:30.754193+08	541	Iaer object (541)	3		12	1
551	2018-11-16 11:55:30.779504+08	540	Iaer object (540)	3		12	1
552	2018-11-16 11:55:30.793672+08	539	Iaer object (539)	3		12	1
553	2018-11-16 11:55:30.804033+08	538	Iaer object (538)	3		12	1
554	2018-11-16 11:55:30.81191+08	537	Iaer object (537)	3		12	1
555	2018-11-16 11:55:30.820182+08	536	Iaer object (536)	3		12	1
556	2018-11-16 11:55:30.829914+08	535	Iaer object (535)	3		12	1
557	2018-11-16 11:55:30.837663+08	534	Iaer object (534)	3		12	1
558	2018-11-16 11:55:30.845594+08	533	Iaer object (533)	3		12	1
559	2018-11-16 11:55:30.855484+08	532	Iaer object (532)	3		12	1
560	2018-11-16 11:55:30.862925+08	531	Iaer object (531)	3		12	1
561	2018-11-16 11:55:30.870607+08	530	Iaer object (530)	3		12	1
562	2018-11-16 11:55:30.881513+08	529	Iaer object (529)	3		12	1
563	2018-11-16 11:55:30.891924+08	528	Iaer object (528)	3		12	1
564	2018-11-16 11:55:30.906394+08	527	Iaer object (527)	3		12	1
565	2018-11-16 11:55:30.915244+08	526	Iaer object (526)	3		12	1
566	2018-11-16 11:55:30.931328+08	525	Iaer object (525)	3		12	1
567	2018-11-16 11:55:30.944259+08	524	Iaer object (524)	3		12	1
568	2018-11-16 11:55:30.957053+08	523	Iaer object (523)	3		12	1
569	2018-11-16 11:55:30.975787+08	522	Iaer object (522)	3		12	1
570	2018-11-16 11:55:30.992067+08	521	Iaer object (521)	3		12	1
571	2018-11-16 11:55:31.008185+08	520	Iaer object (520)	3		12	1
572	2018-11-16 11:55:31.018081+08	519	Iaer object (519)	3		12	1
573	2018-11-16 11:55:31.025871+08	518	Iaer object (518)	3		12	1
574	2018-11-16 11:55:31.041651+08	517	Iaer object (517)	3		12	1
575	2018-11-16 11:55:31.055418+08	516	Iaer object (516)	3		12	1
576	2018-11-16 11:55:31.068904+08	515	Iaer object (515)	3		12	1
577	2018-11-16 11:55:31.081147+08	514	Iaer object (514)	3		12	1
578	2018-11-16 11:55:31.09882+08	513	Iaer object (513)	3		12	1
579	2018-11-16 11:55:31.113369+08	512	Iaer object (512)	3		12	1
580	2018-11-16 11:55:31.123439+08	511	Iaer object (511)	3		12	1
581	2018-11-16 11:55:31.135482+08	510	Iaer object (510)	3		12	1
582	2018-11-16 11:55:31.142972+08	509	Iaer object (509)	3		12	1
583	2018-11-16 11:55:31.15458+08	508	Iaer object (508)	3		12	1
584	2018-11-16 11:55:31.162565+08	507	Iaer object (507)	3		12	1
585	2018-11-16 11:55:31.172728+08	506	Iaer object (506)	3		12	1
586	2018-11-16 11:55:31.180574+08	505	Iaer object (505)	3		12	1
587	2018-11-16 11:55:31.196442+08	504	Iaer object (504)	3		12	1
588	2018-11-16 11:55:31.204907+08	503	Iaer object (503)	3		12	1
589	2018-11-16 11:55:31.213744+08	502	Iaer object (502)	3		12	1
590	2018-11-16 11:55:31.223101+08	501	Iaer object (501)	3		12	1
591	2018-11-16 11:55:31.237279+08	500	Iaer object (500)	3		12	1
592	2018-11-16 11:55:31.249554+08	499	Iaer object (499)	3		12	1
593	2018-11-16 11:55:31.268853+08	498	Iaer object (498)	3		12	1
594	2018-11-16 11:55:31.280526+08	497	Iaer object (497)	3		12	1
595	2018-11-16 11:55:31.29202+08	496	Iaer object (496)	3		12	1
596	2018-11-16 11:55:31.304059+08	495	Iaer object (495)	3		12	1
597	2018-11-16 11:55:31.316357+08	494	Iaer object (494)	3		12	1
598	2018-11-16 11:55:31.326994+08	493	Iaer object (493)	3		12	1
599	2018-11-16 11:55:31.339473+08	492	Iaer object (492)	3		12	1
600	2018-11-16 11:55:31.349823+08	491	Iaer object (491)	3		12	1
601	2018-11-16 11:55:31.36283+08	490	Iaer object (490)	3		12	1
602	2018-11-16 11:55:31.38182+08	489	Iaer object (489)	3		12	1
603	2018-11-16 11:55:31.396151+08	488	Iaer object (488)	3		12	1
604	2018-11-16 11:55:31.421363+08	487	Iaer object (487)	3		12	1
605	2018-11-16 11:55:31.440016+08	486	Iaer object (486)	3		12	1
606	2018-11-16 11:55:31.450468+08	485	Iaer object (485)	3		12	1
607	2018-11-16 11:55:31.461095+08	484	Iaer object (484)	3		12	1
608	2018-11-16 11:55:31.472164+08	483	Iaer object (483)	3		12	1
609	2018-11-16 11:55:31.482367+08	482	Iaer object (482)	3		12	1
610	2018-11-16 11:55:31.493797+08	481	Iaer object (481)	3		12	1
611	2018-11-16 11:55:31.504642+08	480	Iaer object (480)	3		12	1
612	2018-11-16 11:55:31.512702+08	479	Iaer object (479)	3		12	1
613	2018-11-16 11:55:31.532248+08	478	Iaer object (478)	3		12	1
614	2018-11-16 11:55:31.543413+08	477	Iaer object (477)	3		12	1
615	2018-11-16 11:55:31.555773+08	476	Iaer object (476)	3		12	1
616	2018-11-16 11:55:31.566647+08	475	Iaer object (475)	3		12	1
617	2018-11-16 11:55:31.5785+08	474	Iaer object (474)	3		12	1
618	2018-11-16 11:55:31.619977+08	473	Iaer object (473)	3		12	1
619	2018-11-16 11:55:31.631006+08	472	Iaer object (472)	3		12	1
620	2018-11-16 11:55:31.66532+08	471	Iaer object (471)	3		12	1
621	2018-11-16 11:55:31.679057+08	470	Iaer object (470)	3		12	1
622	2018-11-16 11:55:31.690331+08	469	Iaer object (469)	3		12	1
623	2018-11-16 11:55:31.700312+08	468	Iaer object (468)	3		12	1
624	2018-11-16 11:55:31.710354+08	467	Iaer object (467)	3		12	1
625	2018-11-16 11:55:31.717835+08	466	Iaer object (466)	3		12	1
626	2018-11-16 11:55:31.728788+08	465	Iaer object (465)	3		12	1
627	2018-11-16 11:55:31.740972+08	464	Iaer object (464)	3		12	1
628	2018-11-16 11:55:31.752456+08	463	Iaer object (463)	3		12	1
629	2018-11-16 11:55:31.761519+08	462	Iaer object (462)	3		12	1
630	2018-11-16 11:55:31.786584+08	461	Iaer object (461)	3		12	1
631	2018-11-16 11:55:31.803317+08	460	Iaer object (460)	3		12	1
632	2018-11-16 11:55:31.822394+08	459	Iaer object (459)	3		12	1
633	2018-11-16 11:55:31.830365+08	458	Iaer object (458)	3		12	1
634	2018-11-16 11:55:31.840908+08	457	Iaer object (457)	3		12	1
635	2018-11-16 11:55:31.854438+08	456	Iaer object (456)	3		12	1
636	2018-11-16 11:55:31.863414+08	455	Iaer object (455)	3		12	1
637	2018-11-16 11:55:31.874627+08	454	Iaer object (454)	3		12	1
638	2018-11-16 11:55:31.88671+08	453	Iaer object (453)	3		12	1
639	2018-11-16 11:55:31.898468+08	452	Iaer object (452)	3		12	1
640	2018-11-16 11:55:31.909307+08	451	Iaer object (451)	3		12	1
641	2018-11-16 11:55:31.918877+08	450	Iaer object (450)	3		12	1
642	2018-11-16 11:55:31.930019+08	449	Iaer object (449)	3		12	1
643	2018-11-16 11:55:31.940734+08	448	Iaer object (448)	3		12	1
644	2018-11-16 11:55:31.952414+08	447	Iaer object (447)	3		12	1
645	2018-11-16 11:55:31.966516+08	446	Iaer object (446)	3		12	1
646	2018-11-16 11:55:31.977263+08	445	Iaer object (445)	3		12	1
647	2018-11-16 11:55:31.98775+08	444	Iaer object (444)	3		12	1
648	2018-11-16 11:55:31.998963+08	443	Iaer object (443)	3		12	1
649	2018-11-16 11:55:32.008575+08	442	Iaer object (442)	3		12	1
650	2018-11-16 11:55:32.018781+08	441	Iaer object (441)	3		12	1
651	2018-11-16 11:55:32.026706+08	440	Iaer object (440)	3		12	1
652	2018-11-16 11:55:32.034133+08	439	Iaer object (439)	3		12	1
653	2018-11-16 11:55:32.041222+08	438	Iaer object (438)	3		12	1
654	2018-11-16 11:55:32.049642+08	437	Iaer object (437)	3		12	1
655	2018-11-16 11:55:32.059158+08	436	Iaer object (436)	3		12	1
656	2018-11-16 11:55:32.069949+08	435	Iaer object (435)	3		12	1
657	2018-11-16 11:55:32.079991+08	434	Iaer object (434)	3		12	1
658	2018-11-16 11:55:32.087467+08	433	Iaer object (433)	3		12	1
659	2018-11-16 11:55:32.095029+08	432	Iaer object (432)	3		12	1
660	2018-11-16 11:55:32.116494+08	431	Iaer object (431)	3		12	1
661	2018-11-16 11:55:32.126448+08	430	Iaer object (430)	3		12	1
662	2018-11-16 11:55:32.137048+08	429	Iaer object (429)	3		12	1
663	2018-11-16 11:55:32.149333+08	428	Iaer object (428)	3		12	1
664	2018-11-16 11:55:32.156892+08	427	Iaer object (427)	3		12	1
665	2018-11-16 11:55:32.164937+08	426	Iaer object (426)	3		12	1
666	2018-11-16 11:55:32.175483+08	425	Iaer object (425)	3		12	1
667	2018-11-16 11:55:32.182786+08	424	Iaer object (424)	3		12	1
668	2018-11-16 11:55:32.190441+08	423	Iaer object (423)	3		12	1
669	2018-11-16 11:55:32.202554+08	422	Iaer object (422)	3		12	1
670	2018-11-16 11:55:32.212116+08	421	Iaer object (421)	3		12	1
671	2018-11-16 11:55:32.219341+08	420	Iaer object (420)	3		12	1
672	2018-11-16 11:55:32.228357+08	419	Iaer object (419)	3		12	1
673	2018-11-16 11:55:32.242118+08	418	Iaer object (418)	3		12	1
674	2018-11-16 11:55:32.257666+08	417	Iaer object (417)	3		12	1
675	2018-11-16 11:55:32.271856+08	416	Iaer object (416)	3		12	1
676	2018-11-16 11:55:32.284927+08	415	Iaer object (415)	3		12	1
677	2018-11-16 11:55:32.292843+08	414	Iaer object (414)	3		12	1
678	2018-11-16 11:55:32.305815+08	413	Iaer object (413)	3		12	1
679	2018-11-16 11:55:32.315439+08	412	Iaer object (412)	3		12	1
680	2018-11-16 11:55:32.324333+08	411	Iaer object (411)	3		12	1
681	2018-11-16 11:55:32.33246+08	410	Iaer object (410)	3		12	1
682	2018-11-16 11:55:32.339627+08	409	Iaer object (409)	3		12	1
683	2018-11-16 11:55:32.34731+08	408	Iaer object (408)	3		12	1
684	2018-11-16 11:55:32.35518+08	407	Iaer object (407)	3		12	1
685	2018-11-16 11:55:32.365303+08	406	Iaer object (406)	3		12	1
686	2018-11-16 11:55:32.374429+08	405	Iaer object (405)	3		12	1
687	2018-11-16 11:55:32.382555+08	404	Iaer object (404)	3		12	1
688	2018-11-16 11:55:32.391576+08	403	Iaer object (403)	3		12	1
689	2018-11-16 11:55:32.405389+08	402	Iaer object (402)	3		12	1
690	2018-11-16 11:55:32.418388+08	401	Iaer object (401)	3		12	1
691	2018-11-16 11:55:32.435515+08	400	Iaer object (400)	3		12	1
692	2018-11-16 11:55:32.446764+08	399	Iaer object (399)	3		12	1
693	2018-11-16 11:55:32.456821+08	398	Iaer object (398)	3		12	1
694	2018-11-16 11:55:32.464691+08	397	Iaer object (397)	3		12	1
695	2018-11-16 11:55:32.472049+08	396	Iaer object (396)	3		12	1
696	2018-11-16 11:55:32.482783+08	395	Iaer object (395)	3		12	1
697	2018-11-16 11:55:32.491238+08	394	Iaer object (394)	3		12	1
698	2018-11-16 11:55:32.511955+08	393	Iaer object (393)	3		12	1
699	2018-11-16 11:55:32.522146+08	392	Iaer object (392)	3		12	1
700	2018-11-16 11:55:32.530411+08	391	Iaer object (391)	3		12	1
701	2018-11-16 11:55:32.537568+08	390	Iaer object (390)	3		12	1
702	2018-11-16 11:55:32.550344+08	389	Iaer object (389)	3		12	1
703	2018-11-16 11:55:32.55752+08	388	Iaer object (388)	3		12	1
704	2018-11-16 11:55:32.569303+08	387	Iaer object (387)	3		12	1
705	2018-11-16 11:55:32.588605+08	386	Iaer object (386)	3		12	1
706	2018-11-16 11:55:32.601033+08	385	Iaer object (385)	3		12	1
707	2018-11-16 11:55:32.61383+08	384	Iaer object (384)	3		12	1
708	2018-11-16 11:55:32.621238+08	383	Iaer object (383)	3		12	1
709	2018-11-16 11:55:32.629005+08	382	Iaer object (382)	3		12	1
710	2018-11-16 11:55:32.636822+08	381	Iaer object (381)	3		12	1
711	2018-11-16 11:55:32.645005+08	380	Iaer object (380)	3		12	1
712	2018-11-16 11:55:32.655266+08	379	Iaer object (379)	3		12	1
713	2018-11-16 11:55:32.663265+08	378	Iaer object (378)	3		12	1
714	2018-11-16 11:55:32.671692+08	377	Iaer object (377)	3		12	1
715	2018-11-16 11:55:32.681251+08	376	Iaer object (376)	3		12	1
716	2018-11-16 11:55:32.688358+08	375	Iaer object (375)	3		12	1
717	2018-11-16 11:55:32.704762+08	374	Iaer object (374)	3		12	1
718	2018-11-16 11:55:32.717029+08	373	Iaer object (373)	3		12	1
719	2018-11-16 11:55:32.729674+08	372	Iaer object (372)	3		12	1
720	2018-11-16 11:55:32.748876+08	371	Iaer object (371)	3		12	1
721	2018-11-16 11:55:32.760977+08	370	Iaer object (370)	3		12	1
722	2018-11-16 11:55:32.771438+08	369	Iaer object (369)	3		12	1
723	2018-11-16 11:55:32.781544+08	368	Iaer object (368)	3		12	1
724	2018-11-16 11:55:32.791907+08	367	Iaer object (367)	3		12	1
725	2018-11-16 11:55:32.805214+08	366	Iaer object (366)	3		12	1
726	2018-11-16 11:55:32.813166+08	365	Iaer object (365)	3		12	1
727	2018-11-16 11:55:32.826515+08	364	Iaer object (364)	3		12	1
728	2018-11-16 11:55:32.837557+08	363	Iaer object (363)	3		12	1
729	2018-11-16 11:55:32.850743+08	362	Iaer object (362)	3		12	1
730	2018-11-16 11:55:32.861071+08	361	Iaer object (361)	3		12	1
731	2018-11-16 11:55:32.873262+08	360	Iaer object (360)	3		12	1
732	2018-11-16 11:55:32.884129+08	359	Iaer object (359)	3		12	1
733	2018-11-16 11:55:32.894953+08	358	Iaer object (358)	3		12	1
734	2018-11-16 11:55:32.907452+08	357	Iaer object (357)	3		12	1
735	2018-11-16 11:55:32.922108+08	356	Iaer object (356)	3		12	1
736	2018-11-16 11:55:32.932834+08	355	Iaer object (355)	3		12	1
737	2018-11-16 11:55:32.946276+08	354	Iaer object (354)	3		12	1
738	2018-11-16 11:55:32.963194+08	353	Iaer object (353)	3		12	1
739	2018-11-16 11:55:32.97752+08	352	Iaer object (352)	3		12	1
740	2018-11-16 11:55:32.995188+08	351	Iaer object (351)	3		12	1
741	2018-11-16 11:55:33.015249+08	350	Iaer object (350)	3		12	1
742	2018-11-16 11:55:33.033482+08	349	Iaer object (349)	3		12	1
743	2018-11-16 11:55:33.055446+08	348	Iaer object (348)	3		12	1
744	2018-11-16 11:55:33.073748+08	347	Iaer object (347)	3		12	1
745	2018-11-16 11:55:33.095406+08	346	Iaer object (346)	3		12	1
746	2018-11-16 11:55:33.122469+08	345	Iaer object (345)	3		12	1
747	2018-11-16 11:55:33.134923+08	344	Iaer object (344)	3		12	1
748	2018-11-16 11:55:33.145254+08	343	Iaer object (343)	3		12	1
749	2018-11-16 11:55:33.155373+08	342	Iaer object (342)	3		12	1
750	2018-11-16 11:55:33.166194+08	341	Iaer object (341)	3		12	1
751	2018-11-16 11:55:33.177328+08	340	Iaer object (340)	3		12	1
752	2018-11-16 11:55:33.189238+08	339	Iaer object (339)	3		12	1
753	2018-11-16 11:55:33.200132+08	338	Iaer object (338)	3		12	1
754	2018-11-16 11:55:33.214042+08	337	Iaer object (337)	3		12	1
755	2018-11-16 11:55:33.225482+08	336	Iaer object (336)	3		12	1
756	2018-11-16 11:55:33.244412+08	335	Iaer object (335)	3		12	1
757	2018-11-16 11:55:33.255838+08	334	Iaer object (334)	3		12	1
758	2018-11-16 11:55:33.270086+08	333	Iaer object (333)	3		12	1
759	2018-11-16 11:55:33.282476+08	332	Iaer object (332)	3		12	1
760	2018-11-16 11:55:33.300609+08	331	Iaer object (331)	3		12	1
761	2018-11-16 11:55:33.312565+08	330	Iaer object (330)	3		12	1
762	2018-11-16 11:55:33.328057+08	329	Iaer object (329)	3		12	1
763	2018-11-16 11:55:33.341925+08	328	Iaer object (328)	3		12	1
764	2018-11-16 11:55:33.352438+08	327	Iaer object (327)	3		12	1
765	2018-11-16 11:55:33.366091+08	326	Iaer object (326)	3		12	1
766	2018-11-16 11:55:33.376786+08	325	Iaer object (325)	3		12	1
767	2018-11-16 11:55:33.390935+08	324	Iaer object (324)	3		12	1
768	2018-11-16 11:55:33.401407+08	323	Iaer object (323)	3		12	1
769	2018-11-16 11:55:33.421462+08	322	Iaer object (322)	3		12	1
770	2018-11-16 11:55:33.433989+08	321	Iaer object (321)	3		12	1
771	2018-11-16 11:55:33.441+08	320	Iaer object (320)	3		12	1
772	2018-11-16 11:55:33.449181+08	319	Iaer object (319)	3		12	1
773	2018-11-16 11:55:33.461459+08	318	Iaer object (318)	3		12	1
774	2018-11-16 11:55:33.471129+08	317	Iaer object (317)	3		12	1
775	2018-11-16 11:55:33.479444+08	316	Iaer object (316)	3		12	1
776	2018-11-16 11:55:33.488103+08	315	Iaer object (315)	3		12	1
777	2018-11-16 11:55:33.498583+08	314	Iaer object (314)	3		12	1
778	2018-11-16 11:55:33.506274+08	313	Iaer object (313)	3		12	1
779	2018-11-16 11:55:33.517025+08	312	Iaer object (312)	3		12	1
780	2018-11-16 11:55:33.524612+08	311	Iaer object (311)	3		12	1
781	2018-11-16 11:55:33.53255+08	310	Iaer object (310)	3		12	1
782	2018-11-16 11:55:33.54334+08	309	Iaer object (309)	3		12	1
783	2018-11-16 11:55:33.554568+08	308	Iaer object (308)	3		12	1
784	2018-11-16 11:55:33.564316+08	307	Iaer object (307)	3		12	1
785	2018-11-16 11:55:33.575115+08	306	Iaer object (306)	3		12	1
786	2018-11-16 11:55:33.58981+08	305	Iaer object (305)	3		12	1
787	2018-11-16 11:55:33.599777+08	304	Iaer object (304)	3		12	1
788	2018-11-16 11:55:33.614758+08	303	Iaer object (303)	3		12	1
789	2018-11-16 11:55:33.626527+08	302	Iaer object (302)	3		12	1
790	2018-11-16 11:55:33.637152+08	301	Iaer object (301)	3		12	1
791	2018-11-16 11:55:33.653249+08	300	Iaer object (300)	3		12	1
792	2018-11-16 11:55:33.661886+08	299	Iaer object (299)	3		12	1
793	2018-11-16 11:55:33.670597+08	298	Iaer object (298)	3		12	1
794	2018-11-16 11:55:33.684097+08	297	Iaer object (297)	3		12	1
795	2018-11-16 11:55:33.691525+08	296	Iaer object (296)	3		12	1
796	2018-11-16 11:55:33.699701+08	295	Iaer object (295)	3		12	1
797	2018-11-16 11:55:33.713833+08	294	Iaer object (294)	3		12	1
798	2018-11-16 11:55:33.72341+08	293	Iaer object (293)	3		12	1
799	2018-11-16 11:55:33.731364+08	292	Iaer object (292)	3		12	1
800	2018-11-16 11:55:33.739449+08	291	Iaer object (291)	3		12	1
801	2018-11-16 11:55:33.753746+08	290	Iaer object (290)	3		12	1
802	2018-11-16 11:55:33.768704+08	289	Iaer object (289)	3		12	1
803	2018-11-16 11:55:33.780472+08	288	Iaer object (288)	3		12	1
804	2018-11-16 11:55:33.788956+08	287	Iaer object (287)	3		12	1
805	2018-11-16 11:55:33.798547+08	286	Iaer object (286)	3		12	1
806	2018-11-16 11:55:33.806762+08	285	Iaer object (285)	3		12	1
807	2018-11-16 11:55:33.825089+08	284	Iaer object (284)	3		12	1
808	2018-11-16 11:55:33.8355+08	283	Iaer object (283)	3		12	1
809	2018-11-16 11:55:33.842953+08	282	Iaer object (282)	3		12	1
810	2018-11-16 11:55:33.850485+08	281	Iaer object (281)	3		12	1
811	2018-11-16 11:55:33.858336+08	280	Iaer object (280)	3		12	1
812	2018-11-16 11:55:33.871713+08	279	Iaer object (279)	3		12	1
813	2018-11-16 11:55:33.879277+08	278	Iaer object (278)	3		12	1
814	2018-11-16 11:55:33.889645+08	277	Iaer object (277)	3		12	1
815	2018-11-16 11:55:33.900146+08	276	Iaer object (276)	3		12	1
816	2018-11-16 11:55:33.917302+08	275	Iaer object (275)	3		12	1
817	2018-11-16 11:55:33.927459+08	274	Iaer object (274)	3		12	1
818	2018-11-16 11:55:33.934767+08	273	Iaer object (273)	3		12	1
819	2018-11-16 11:55:33.941656+08	272	Iaer object (272)	3		12	1
820	2018-11-16 11:55:33.949243+08	271	Iaer object (271)	3		12	1
821	2018-11-16 11:55:33.960693+08	270	Iaer object (270)	3		12	1
822	2018-11-16 11:55:33.970955+08	269	Iaer object (269)	3		12	1
823	2018-11-16 11:55:33.979079+08	268	Iaer object (268)	3		12	1
824	2018-11-16 11:55:33.992201+08	267	Iaer object (267)	3		12	1
825	2018-11-16 11:55:34.006201+08	266	Iaer object (266)	3		12	1
826	2018-11-16 11:55:34.020483+08	265	Iaer object (265)	3		12	1
827	2018-11-16 11:55:34.039185+08	264	Iaer object (264)	3		12	1
828	2018-11-16 11:55:34.050873+08	263	Iaer object (263)	3		12	1
829	2018-11-16 11:55:34.06124+08	262	Iaer object (262)	3		12	1
830	2018-11-16 11:55:34.07182+08	261	Iaer object (261)	3		12	1
831	2018-11-16 11:55:34.079395+08	260	Iaer object (260)	3		12	1
832	2018-11-16 11:55:34.091857+08	259	Iaer object (259)	3		12	1
833	2018-11-16 11:55:34.104615+08	258	Iaer object (258)	3		12	1
834	2018-11-16 11:55:34.127361+08	257	Iaer object (257)	3		12	1
835	2018-11-16 11:55:34.150103+08	256	Iaer object (256)	3		12	1
836	2018-11-16 11:55:34.158099+08	255	Iaer object (255)	3		12	1
837	2018-11-16 11:55:34.172728+08	254	Iaer object (254)	3		12	1
838	2018-11-16 11:55:34.18767+08	253	Iaer object (253)	3		12	1
839	2018-11-16 11:55:34.197503+08	252	Iaer object (252)	3		12	1
840	2018-11-16 11:55:34.208769+08	251	Iaer object (251)	3		12	1
841	2018-11-16 11:55:34.232998+08	250	Iaer object (250)	3		12	1
842	2018-11-16 11:55:34.270674+08	249	Iaer object (249)	3		12	1
843	2018-11-16 11:55:34.280988+08	248	Iaer object (248)	3		12	1
844	2018-11-16 11:55:34.291677+08	247	Iaer object (247)	3		12	1
845	2018-11-16 11:55:34.303844+08	246	Iaer object (246)	3		12	1
846	2018-11-16 11:55:34.314441+08	245	Iaer object (245)	3		12	1
847	2018-11-16 11:55:34.324734+08	244	Iaer object (244)	3		12	1
848	2018-11-16 11:55:34.334965+08	243	Iaer object (243)	3		12	1
849	2018-11-16 11:55:34.34276+08	242	Iaer object (242)	3		12	1
850	2018-11-16 11:55:34.351392+08	241	Iaer object (241)	3		12	1
851	2018-11-16 11:55:34.364608+08	240	Iaer object (240)	3		12	1
852	2018-11-16 11:55:34.374789+08	239	Iaer object (239)	3		12	1
853	2018-11-16 11:55:34.389216+08	238	Iaer object (238)	3		12	1
854	2018-11-16 11:55:34.403129+08	237	Iaer object (237)	3		12	1
855	2018-11-16 11:55:34.423225+08	236	Iaer object (236)	3		12	1
856	2018-11-16 11:55:34.436448+08	235	Iaer object (235)	3		12	1
857	2018-11-16 11:55:34.460102+08	234	Iaer object (234)	3		12	1
858	2018-11-16 11:55:34.470743+08	233	Iaer object (233)	3		12	1
859	2018-11-16 11:55:34.480733+08	232	Iaer object (232)	3		12	1
860	2018-11-16 11:55:34.491381+08	231	Iaer object (231)	3		12	1
861	2018-11-16 11:55:34.501478+08	230	Iaer object (230)	3		12	1
862	2018-11-16 11:55:34.509428+08	229	Iaer object (229)	3		12	1
863	2018-11-16 11:55:34.519511+08	228	Iaer object (228)	3		12	1
864	2018-11-16 11:55:34.530281+08	227	Iaer object (227)	3		12	1
865	2018-11-16 11:55:34.540712+08	226	Iaer object (226)	3		12	1
866	2018-11-16 11:55:34.552782+08	225	Iaer object (225)	3		12	1
867	2018-11-16 11:55:34.564184+08	224	Iaer object (224)	3		12	1
868	2018-11-16 11:55:34.574409+08	223	Iaer object (223)	3		12	1
869	2018-11-16 11:55:34.588331+08	222	Iaer object (222)	3		12	1
870	2018-11-16 11:55:34.600886+08	221	Iaer object (221)	3		12	1
871	2018-11-16 11:55:34.631086+08	220	Iaer object (220)	3		12	1
872	2018-11-16 11:55:34.641193+08	219	Iaer object (219)	3		12	1
873	2018-11-16 11:55:34.653086+08	218	Iaer object (218)	3		12	1
874	2018-11-16 11:55:34.66353+08	217	Iaer object (217)	3		12	1
875	2018-11-16 11:55:34.673756+08	216	Iaer object (216)	3		12	1
876	2018-11-16 11:55:34.684951+08	215	Iaer object (215)	3		12	1
877	2018-11-16 11:55:34.695411+08	214	Iaer object (214)	3		12	1
878	2018-11-16 11:55:34.70546+08	213	Iaer object (213)	3		12	1
879	2018-11-16 11:55:34.716682+08	212	Iaer object (212)	3		12	1
880	2018-11-16 11:55:34.734985+08	211	Iaer object (211)	3		12	1
881	2018-11-16 11:55:34.745807+08	210	Iaer object (210)	3		12	1
882	2018-11-16 11:55:34.753356+08	209	Iaer object (209)	3		12	1
883	2018-11-16 11:55:34.76175+08	208	Iaer object (208)	3		12	1
884	2018-11-16 11:55:34.772906+08	207	Iaer object (207)	3		12	1
885	2018-11-16 11:55:34.793269+08	206	Iaer object (206)	3		12	1
886	2018-11-16 11:55:34.80513+08	205	Iaer object (205)	3		12	1
887	2018-11-16 11:55:34.816864+08	204	Iaer object (204)	3		12	1
888	2018-11-16 11:55:34.832839+08	203	Iaer object (203)	3		12	1
889	2018-11-16 11:55:34.843816+08	202	Iaer object (202)	3		12	1
890	2018-11-16 11:55:34.855181+08	201	Iaer object (201)	3		12	1
891	2018-11-16 11:55:34.865922+08	200	Iaer object (200)	3		12	1
892	2018-11-16 11:55:34.873644+08	199	Iaer object (199)	3		12	1
893	2018-11-16 11:55:34.881951+08	198	Iaer object (198)	3		12	1
894	2018-11-16 11:55:34.899059+08	197	Iaer object (197)	3		12	1
895	2018-11-16 11:55:34.910199+08	196	Iaer object (196)	3		12	1
896	2018-11-16 11:55:34.920216+08	195	Iaer object (195)	3		12	1
897	2018-11-16 11:55:34.928496+08	194	Iaer object (194)	3		12	1
898	2018-11-16 11:55:34.937185+08	193	Iaer object (193)	3		12	1
899	2018-11-16 11:55:34.960663+08	192	Iaer object (192)	3		12	1
900	2018-11-16 11:55:34.971176+08	191	Iaer object (191)	3		12	1
901	2018-11-16 11:55:34.982304+08	190	Iaer object (190)	3		12	1
902	2018-11-16 11:55:34.99344+08	189	Iaer object (189)	3		12	1
903	2018-11-16 11:55:35.00441+08	188	Iaer object (188)	3		12	1
904	2018-11-16 11:55:35.014519+08	187	Iaer object (187)	3		12	1
905	2018-11-16 11:55:35.023843+08	186	Iaer object (186)	3		12	1
906	2018-11-16 11:55:35.031615+08	185	Iaer object (185)	3		12	1
907	2018-11-16 11:55:35.039987+08	184	Iaer object (184)	3		12	1
908	2018-11-16 11:55:35.050484+08	183	Iaer object (183)	3		12	1
909	2018-11-16 11:55:35.059564+08	182	Iaer object (182)	3		12	1
910	2018-11-16 11:55:35.067329+08	181	Iaer object (181)	3		12	1
911	2018-11-16 11:55:35.074907+08	180	Iaer object (180)	3		12	1
912	2018-11-16 11:55:35.086161+08	179	Iaer object (179)	3		12	1
913	2018-11-16 11:55:35.094651+08	178	Iaer object (178)	3		12	1
914	2018-11-16 11:55:35.108576+08	177	Iaer object (177)	3		12	1
915	2018-11-16 11:55:35.121629+08	176	Iaer object (176)	3		12	1
916	2018-11-16 11:55:35.133119+08	175	Iaer object (175)	3		12	1
917	2018-11-16 11:55:35.143419+08	174	Iaer object (174)	3		12	1
918	2018-11-16 11:55:35.153691+08	173	Iaer object (173)	3		12	1
919	2018-11-16 11:55:35.161139+08	172	Iaer object (172)	3		12	1
920	2018-11-16 11:55:35.168615+08	171	Iaer object (171)	3		12	1
921	2018-11-16 11:55:35.175757+08	170	Iaer object (170)	3		12	1
922	2018-11-16 11:55:35.188069+08	169	Iaer object (169)	3		12	1
923	2018-11-16 11:55:35.197296+08	168	Iaer object (168)	3		12	1
924	2018-11-16 11:55:35.204604+08	167	Iaer object (167)	3		12	1
925	2018-11-16 11:55:35.213335+08	166	Iaer object (166)	3		12	1
926	2018-11-16 11:55:35.223102+08	165	Iaer object (165)	3		12	1
927	2018-11-16 11:55:35.239976+08	164	Iaer object (164)	3		12	1
928	2018-11-16 11:55:35.251416+08	163	Iaer object (163)	3		12	1
929	2018-11-16 11:55:35.265755+08	162	Iaer object (162)	3		12	1
930	2018-11-16 11:55:35.276136+08	161	Iaer object (161)	3		12	1
931	2018-11-16 11:55:35.283512+08	160	Iaer object (160)	3		12	1
932	2018-11-16 11:55:35.291767+08	159	Iaer object (159)	3		12	1
933	2018-11-16 11:55:35.302375+08	158	Iaer object (158)	3		12	1
934	2018-11-16 11:55:35.309776+08	157	Iaer object (157)	3		12	1
935	2018-11-16 11:55:35.317488+08	156	Iaer object (156)	3		12	1
936	2018-11-16 11:55:35.324977+08	155	Iaer object (155)	3		12	1
937	2018-11-16 11:55:35.333096+08	154	Iaer object (154)	3		12	1
938	2018-11-16 11:55:35.342948+08	153	Iaer object (153)	3		12	1
939	2018-11-16 11:55:35.350559+08	152	Iaer object (152)	3		12	1
940	2018-11-16 11:55:35.359877+08	151	Iaer object (151)	3		12	1
941	2018-11-16 11:55:35.374916+08	150	Iaer object (150)	3		12	1
942	2018-11-16 11:55:35.385002+08	149	Iaer object (149)	3		12	1
943	2018-11-16 11:55:35.406775+08	148	Iaer object (148)	3		12	1
944	2018-11-16 11:55:35.430907+08	147	Iaer object (147)	3		12	1
945	2018-11-16 11:55:35.456509+08	146	Iaer object (146)	3		12	1
946	2018-11-16 11:55:35.471214+08	145	Iaer object (145)	3		12	1
947	2018-11-16 11:55:35.479383+08	144	Iaer object (144)	3		12	1
948	2018-11-16 11:55:35.486757+08	143	Iaer object (143)	3		12	1
949	2018-11-16 11:55:35.500774+08	142	Iaer object (142)	3		12	1
950	2018-11-16 11:55:35.511951+08	141	Iaer object (141)	3		12	1
951	2018-11-16 11:55:35.523042+08	140	Iaer object (140)	3		12	1
952	2018-11-16 11:55:35.534028+08	139	Iaer object (139)	3		12	1
953	2018-11-16 11:55:35.541419+08	138	Iaer object (138)	3		12	1
954	2018-11-16 11:55:35.549856+08	137	Iaer object (137)	3		12	1
955	2018-11-16 11:55:35.560998+08	136	Iaer object (136)	3		12	1
956	2018-11-16 11:55:35.57199+08	135	Iaer object (135)	3		12	1
957	2018-11-16 11:55:35.585369+08	134	Iaer object (134)	3		12	1
958	2018-11-16 11:55:35.592537+08	133	Iaer object (133)	3		12	1
959	2018-11-16 11:55:35.600055+08	132	Iaer object (132)	3		12	1
960	2018-11-16 11:55:35.607399+08	131	Iaer object (131)	3		12	1
961	2018-11-16 11:55:35.621206+08	130	Iaer object (130)	3		12	1
962	2018-11-16 11:55:35.62862+08	129	Iaer object (129)	3		12	1
963	2018-11-16 11:55:35.642194+08	128	Iaer object (128)	3		12	1
964	2018-11-16 11:55:35.649892+08	127	Iaer object (127)	3		12	1
965	2018-11-16 11:55:35.657076+08	126	Iaer object (126)	3		12	1
966	2018-11-16 11:55:35.664498+08	125	Iaer object (125)	3		12	1
967	2018-11-16 11:55:35.672813+08	124	Iaer object (124)	3		12	1
968	2018-11-16 11:55:35.683123+08	123	Iaer object (123)	3		12	1
969	2018-11-16 11:55:35.694237+08	122	Iaer object (122)	3		12	1
970	2018-11-16 11:55:35.701711+08	121	Iaer object (121)	3		12	1
971	2018-11-16 11:55:35.70979+08	120	Iaer object (120)	3		12	1
972	2018-11-16 11:55:35.719185+08	119	Iaer object (119)	3		12	1
973	2018-11-16 11:55:35.741681+08	118	Iaer object (118)	3		12	1
974	2018-11-16 11:55:35.7494+08	117	Iaer object (117)	3		12	1
975	2018-11-16 11:55:35.756643+08	116	Iaer object (116)	3		12	1
976	2018-11-16 11:55:35.767825+08	115	Iaer object (115)	3		12	1
977	2018-11-16 11:55:35.779173+08	114	Iaer object (114)	3		12	1
978	2018-11-16 11:55:35.786486+08	113	Iaer object (113)	3		12	1
979	2018-11-16 11:55:35.798012+08	112	Iaer object (112)	3		12	1
980	2018-11-16 11:55:35.807234+08	111	Iaer object (111)	3		12	1
981	2018-11-16 11:55:35.814878+08	110	Iaer object (110)	3		12	1
982	2018-11-16 11:55:35.821897+08	109	Iaer object (109)	3		12	1
983	2018-11-16 11:55:35.842799+08	108	Iaer object (108)	3		12	1
984	2018-11-16 11:55:35.852827+08	107	Iaer object (107)	3		12	1
985	2018-11-16 11:55:35.865558+08	106	Iaer object (106)	3		12	1
986	2018-11-16 11:55:35.875216+08	105	Iaer object (105)	3		12	1
987	2018-11-16 11:55:35.889039+08	104	Iaer object (104)	3		12	1
988	2018-11-16 11:55:35.897079+08	103	Iaer object (103)	3		12	1
989	2018-11-16 11:55:35.904432+08	102	Iaer object (102)	3		12	1
990	2018-11-16 11:55:35.91194+08	101	Iaer object (101)	3		12	1
991	2018-11-16 11:55:35.920702+08	100	Iaer object (100)	3		12	1
992	2018-11-16 11:55:35.930355+08	99	Iaer object (99)	3		12	1
993	2018-11-16 11:55:35.940591+08	98	Iaer object (98)	3		12	1
994	2018-11-16 11:55:35.951577+08	97	Iaer object (97)	3		12	1
995	2018-11-16 11:55:35.961446+08	96	Iaer object (96)	3		12	1
996	2018-11-16 11:55:35.97116+08	95	Iaer object (95)	3		12	1
997	2018-11-16 11:55:35.982499+08	94	Iaer object (94)	3		12	1
998	2018-11-16 11:55:35.995283+08	93	Iaer object (93)	3		12	1
999	2018-11-16 11:55:36.004819+08	92	Iaer object (92)	3		12	1
1000	2018-11-16 11:55:36.017639+08	91	Iaer object (91)	3		12	1
1001	2018-11-16 11:55:36.024627+08	90	Iaer object (90)	3		12	1
1002	2018-11-16 11:55:36.031668+08	89	Iaer object (89)	3		12	1
1003	2018-11-16 11:55:36.040536+08	88	Iaer object (88)	3		12	1
1004	2018-11-16 11:55:36.052276+08	87	Iaer object (87)	3		12	1
1005	2018-11-16 11:55:36.069443+08	86	Iaer object (86)	3		12	1
1006	2018-11-16 11:55:36.084169+08	85	Iaer object (85)	3		12	1
1007	2018-11-16 11:55:36.09498+08	84	Iaer object (84)	3		12	1
1008	2018-11-16 11:55:36.104744+08	83	Iaer object (83)	3		12	1
1009	2018-11-16 11:55:36.117944+08	82	Iaer object (82)	3		12	1
1010	2018-11-16 11:55:36.128299+08	81	Iaer object (81)	3		12	1
1011	2018-11-16 11:55:36.14212+08	80	Iaer object (80)	3		12	1
1012	2018-11-16 11:55:36.15209+08	79	Iaer object (79)	3		12	1
1013	2018-11-16 11:55:36.159885+08	78	Iaer object (78)	3		12	1
1014	2018-11-16 11:55:36.168011+08	77	Iaer object (77)	3		12	1
1015	2018-11-16 11:55:36.179901+08	76	Iaer object (76)	3		12	1
1016	2018-11-16 11:55:36.189887+08	75	Iaer object (75)	3		12	1
1017	2018-11-16 11:55:36.202253+08	74	Iaer object (74)	3		12	1
1018	2018-11-16 11:55:36.212521+08	73	Iaer object (73)	3		12	1
1019	2018-11-16 11:55:36.222709+08	72	Iaer object (72)	3		12	1
1020	2018-11-16 11:55:36.236336+08	71	Iaer object (71)	3		12	1
1021	2018-11-16 11:55:36.251573+08	70	Iaer object (70)	3		12	1
1022	2018-11-16 11:55:36.259725+08	69	Iaer object (69)	3		12	1
1023	2018-11-16 11:55:36.268383+08	68	Iaer object (68)	3		12	1
1024	2018-11-16 11:55:36.278542+08	67	Iaer object (67)	3		12	1
1025	2018-11-16 11:55:36.289138+08	66	Iaer object (66)	3		12	1
1026	2018-11-16 11:55:36.300553+08	65	Iaer object (65)	3		12	1
1027	2018-11-16 11:55:36.311701+08	64	Iaer object (64)	3		12	1
1028	2018-11-16 11:55:36.322258+08	63	Iaer object (63)	3		12	1
1029	2018-11-16 11:55:36.334629+08	62	Iaer object (62)	3		12	1
1030	2018-11-16 11:55:36.3458+08	61	Iaer object (61)	3		12	1
1031	2018-11-16 11:55:36.356137+08	60	Iaer object (60)	3		12	1
1032	2018-11-16 11:55:36.368705+08	59	Iaer object (59)	3		12	1
1033	2018-11-16 11:55:36.378875+08	58	Iaer object (58)	3		12	1
1034	2018-11-16 11:55:36.389828+08	57	Iaer object (57)	3		12	1
1035	2018-11-16 11:55:36.400435+08	56	Iaer object (56)	3		12	1
1036	2018-11-16 11:55:36.424956+08	55	Iaer object (55)	3		12	1
1037	2018-11-16 11:55:36.440318+08	54	Iaer object (54)	3		12	1
1038	2018-11-16 11:55:36.451493+08	53	Iaer object (53)	3		12	1
1039	2018-11-16 11:55:36.462604+08	52	Iaer object (52)	3		12	1
1040	2018-11-16 11:55:36.477018+08	51	Iaer object (51)	3		12	1
1041	2018-11-16 11:55:36.495743+08	50	Iaer object (50)	3		12	1
1042	2018-11-16 11:55:36.506298+08	49	Iaer object (49)	3		12	1
1043	2018-11-16 11:55:36.544562+08	48	Iaer object (48)	3		12	1
1044	2018-11-16 11:55:36.600629+08	47	Iaer object (47)	3		12	1
1045	2018-11-16 11:55:36.61225+08	46	Iaer object (46)	3		12	1
1046	2018-11-16 11:55:36.626496+08	45	Iaer object (45)	3		12	1
1047	2018-11-16 11:55:36.638665+08	44	Iaer object (44)	3		12	1
1048	2018-11-16 11:55:36.653039+08	43	Iaer object (43)	3		12	1
1049	2018-11-16 11:55:36.664661+08	42	Iaer object (42)	3		12	1
1050	2018-11-16 11:55:36.678046+08	41	Iaer object (41)	3		12	1
1051	2018-11-16 11:55:36.691613+08	40	Iaer object (40)	3		12	1
1052	2018-11-16 11:55:36.706883+08	39	Iaer object (39)	3		12	1
1053	2018-11-16 11:55:36.715109+08	38	Iaer object (38)	3		12	1
1054	2018-11-16 11:55:36.7233+08	37	Iaer object (37)	3		12	1
1055	2018-11-16 11:55:36.734455+08	36	Iaer object (36)	3		12	1
1056	2018-11-16 11:55:36.749056+08	35	Iaer object (35)	3		12	1
1057	2018-11-16 11:55:36.760589+08	34	Iaer object (34)	3		12	1
1058	2018-11-16 11:55:36.770421+08	33	Iaer object (33)	3		12	1
1059	2018-11-16 11:55:36.778898+08	32	Iaer object (32)	3		12	1
1060	2018-11-16 11:55:36.787385+08	31	Iaer object (31)	3		12	1
1061	2018-11-16 11:55:36.798506+08	30	Iaer object (30)	3		12	1
1062	2018-11-16 11:55:36.805996+08	29	Iaer object (29)	3		12	1
1063	2018-11-16 11:55:36.813765+08	28	Iaer object (28)	3		12	1
1064	2018-11-16 11:55:36.824587+08	27	Iaer object (27)	3		12	1
1065	2018-11-16 11:55:36.832471+08	26	Iaer object (26)	3		12	1
1066	2018-11-16 11:55:36.840184+08	25	Iaer object (25)	3		12	1
1067	2018-11-16 11:55:36.851276+08	24	Iaer object (24)	3		12	1
1068	2018-11-16 11:55:36.858806+08	23	Iaer object (23)	3		12	1
1069	2018-11-16 11:55:36.867077+08	22	Iaer object (22)	3		12	1
1070	2018-11-16 11:55:36.878404+08	21	Iaer object (21)	3		12	1
1071	2018-11-16 11:55:36.888961+08	20	Iaer object (20)	3		12	1
1072	2018-11-16 11:55:36.896374+08	19	Iaer object (19)	3		12	1
1073	2018-11-16 11:55:36.920049+08	18	Iaer object (18)	3		12	1
1074	2018-11-16 11:55:36.929824+08	17	Iaer object (17)	3		12	1
1075	2018-11-16 11:55:36.93845+08	16	Iaer object (16)	3		12	1
1076	2018-11-16 11:55:36.946969+08	15	Iaer object (15)	3		12	1
1077	2018-11-16 11:55:36.954829+08	14	Iaer object (14)	3		12	1
1078	2018-11-16 11:55:36.962187+08	13	Iaer object (13)	3		12	1
1079	2018-11-16 11:55:36.969935+08	12	Iaer object (12)	3		12	1
1080	2018-11-16 11:55:36.986691+08	11	Iaer object (11)	3		12	1
1081	2018-11-16 11:55:36.996466+08	10	Iaer object (10)	3		12	1
1082	2018-11-16 11:55:37.006578+08	9	Iaer object (9)	3		12	1
1083	2018-11-16 11:55:37.014209+08	8	Iaer object (8)	3		12	1
1084	2018-11-16 11:55:37.021459+08	7	Iaer object (7)	3		12	1
1085	2018-11-16 11:55:37.029182+08	6	Iaer object (6)	3		12	1
1086	2018-11-16 11:55:37.038756+08	5	Iaer object (5)	3		12	1
1087	2018-11-16 11:55:37.046964+08	4	Iaer object (4)	3		12	1
1088	2018-11-16 11:55:37.054282+08	3	Iaer object (3)	3		12	1
1089	2018-11-16 11:55:37.063167+08	2	Iaer object (2)	3		12	1
1090	2018-11-16 11:55:37.075105+08	1	Iaer object (1)	3		12	1
1091	2018-11-16 13:28:10.959604+08	963	Iaer object (963)	3		12	1
1092	2018-11-16 13:28:10.981185+08	878	Iaer object (878)	3		12	1
1093	2018-11-16 13:28:10.997095+08	962	Iaer object (962)	3		12	1
1094	2018-11-16 13:28:11.00712+08	877	Iaer object (877)	3		12	1
1095	2018-11-16 13:28:11.017213+08	961	Iaer object (961)	3		12	1
1096	2018-11-16 13:28:11.032469+08	876	Iaer object (876)	3		12	1
1097	2018-11-16 13:28:11.042641+08	960	Iaer object (960)	3		12	1
1098	2018-11-16 13:28:11.063293+08	875	Iaer object (875)	3		12	1
1099	2018-11-16 13:28:11.074155+08	959	Iaer object (959)	3		12	1
1100	2018-11-16 13:28:11.0896+08	874	Iaer object (874)	3		12	1
1101	2018-11-16 13:28:11.099703+08	958	Iaer object (958)	3		12	1
1102	2018-11-16 13:28:11.111129+08	873	Iaer object (873)	3		12	1
1103	2018-11-16 13:28:11.121081+08	957	Iaer object (957)	3		12	1
1104	2018-11-16 13:28:11.132073+08	872	Iaer object (872)	3		12	1
1105	2018-11-16 13:28:11.142929+08	956	Iaer object (956)	3		12	1
1106	2018-11-16 13:28:11.151072+08	871	Iaer object (871)	3		12	1
1107	2018-11-16 13:28:11.159079+08	955	Iaer object (955)	3		12	1
1108	2018-11-16 13:28:11.1697+08	870	Iaer object (870)	3		12	1
1109	2018-11-16 13:28:11.18199+08	954	Iaer object (954)	3		12	1
1110	2018-11-16 13:28:11.189894+08	869	Iaer object (869)	3		12	1
1111	2018-11-16 13:28:11.200619+08	953	Iaer object (953)	3		12	1
1112	2018-11-16 13:28:11.211168+08	868	Iaer object (868)	3		12	1
1113	2018-11-16 13:28:11.234791+08	952	Iaer object (952)	3		12	1
1114	2018-11-16 13:28:11.244396+08	867	Iaer object (867)	3		12	1
1115	2018-11-16 13:28:11.252727+08	951	Iaer object (951)	3		12	1
1116	2018-11-16 13:28:11.281257+08	866	Iaer object (866)	3		12	1
1117	2018-11-16 13:28:11.295077+08	950	Iaer object (950)	3		12	1
1118	2018-11-16 13:28:11.313375+08	865	Iaer object (865)	3		12	1
1119	2018-11-16 13:28:11.323729+08	949	Iaer object (949)	3		12	1
1120	2018-11-16 13:28:11.337163+08	864	Iaer object (864)	3		12	1
1121	2018-11-16 13:28:11.347634+08	948	Iaer object (948)	3		12	1
1122	2018-11-16 13:28:11.360645+08	863	Iaer object (863)	3		12	1
1123	2018-11-16 13:28:11.387633+08	947	Iaer object (947)	3		12	1
1124	2018-11-16 13:28:11.414246+08	862	Iaer object (862)	3		12	1
1125	2018-11-16 13:28:11.434952+08	946	Iaer object (946)	3		12	1
1126	2018-11-16 13:28:11.459623+08	861	Iaer object (861)	3		12	1
1127	2018-11-16 13:28:11.470538+08	945	Iaer object (945)	3		12	1
1128	2018-11-16 13:28:11.489528+08	860	Iaer object (860)	3		12	1
1129	2018-11-16 13:28:11.502228+08	944	Iaer object (944)	3		12	1
1130	2018-11-16 13:28:11.520526+08	859	Iaer object (859)	3		12	1
1131	2018-11-16 13:28:11.53186+08	943	Iaer object (943)	3		12	1
1132	2018-11-16 13:28:11.548605+08	858	Iaer object (858)	3		12	1
1133	2018-11-16 13:28:11.558605+08	942	Iaer object (942)	3		12	1
1134	2018-11-16 13:28:11.570159+08	857	Iaer object (857)	3		12	1
1135	2018-11-16 13:28:11.581068+08	941	Iaer object (941)	3		12	1
1136	2018-11-16 13:28:11.592212+08	856	Iaer object (856)	3		12	1
1137	2018-11-16 13:28:11.610558+08	940	Iaer object (940)	3		12	1
1138	2018-11-16 13:28:11.623074+08	855	Iaer object (855)	3		12	1
1139	2018-11-16 13:28:11.636893+08	939	Iaer object (939)	3		12	1
1140	2018-11-16 13:28:11.645279+08	854	Iaer object (854)	3		12	1
1141	2018-11-16 13:28:11.656411+08	938	Iaer object (938)	3		12	1
1142	2018-11-16 13:28:11.667347+08	853	Iaer object (853)	3		12	1
1143	2018-11-16 13:28:11.67799+08	937	Iaer object (937)	3		12	1
1144	2018-11-16 13:28:11.688483+08	852	Iaer object (852)	3		12	1
1145	2018-11-16 13:28:11.696117+08	936	Iaer object (936)	3		12	1
1146	2018-11-16 13:28:11.703603+08	851	Iaer object (851)	3		12	1
1147	2018-11-16 13:28:11.713082+08	935	Iaer object (935)	3		12	1
1148	2018-11-16 13:28:11.721028+08	850	Iaer object (850)	3		12	1
1149	2018-11-16 13:28:11.732109+08	934	Iaer object (934)	3		12	1
1150	2018-11-16 13:28:11.741805+08	849	Iaer object (849)	3		12	1
1151	2018-11-16 13:28:11.753668+08	933	Iaer object (933)	3		12	1
1152	2018-11-16 13:28:11.765518+08	848	Iaer object (848)	3		12	1
1153	2018-11-16 13:28:11.772988+08	932	Iaer object (932)	3		12	1
1154	2018-11-16 13:28:11.78079+08	847	Iaer object (847)	3		12	1
1155	2018-11-16 13:28:11.790615+08	931	Iaer object (931)	3		12	1
1156	2018-11-16 13:28:11.797863+08	846	Iaer object (846)	3		12	1
1157	2018-11-16 13:28:11.805575+08	930	Iaer object (930)	3		12	1
1158	2018-11-16 13:28:11.81667+08	845	Iaer object (845)	3		12	1
1159	2018-11-16 13:28:11.831132+08	929	Iaer object (929)	3		12	1
1160	2018-11-16 13:28:11.841679+08	844	Iaer object (844)	3		12	1
1161	2018-11-16 13:28:11.851698+08	928	Iaer object (928)	3		12	1
1162	2018-11-16 13:28:11.859562+08	843	Iaer object (843)	3		12	1
1163	2018-11-16 13:28:11.867449+08	927	Iaer object (927)	3		12	1
1164	2018-11-16 13:28:11.878012+08	842	Iaer object (842)	3		12	1
1165	2018-11-16 13:28:11.887908+08	926	Iaer object (926)	3		12	1
1166	2018-11-16 13:28:11.897308+08	841	Iaer object (841)	3		12	1
1167	2018-11-16 13:28:11.905358+08	925	Iaer object (925)	3		12	1
1168	2018-11-16 13:28:11.913449+08	840	Iaer object (840)	3		12	1
1169	2018-11-16 13:28:11.923031+08	924	Iaer object (924)	3		12	1
1170	2018-11-16 13:28:11.931576+08	839	Iaer object (839)	3		12	1
1171	2018-11-16 13:28:11.940833+08	923	Iaer object (923)	3		12	1
1172	2018-11-16 13:28:11.948598+08	838	Iaer object (838)	3		12	1
1173	2018-11-16 13:28:11.958617+08	922	Iaer object (922)	3		12	1
1174	2018-11-16 13:28:11.968791+08	837	Iaer object (837)	3		12	1
1175	2018-11-16 13:28:11.982524+08	921	Iaer object (921)	3		12	1
1176	2018-11-16 13:28:11.994652+08	836	Iaer object (836)	3		12	1
1177	2018-11-16 13:28:12.004749+08	920	Iaer object (920)	3		12	1
1178	2018-11-16 13:28:12.014939+08	835	Iaer object (835)	3		12	1
1179	2018-11-16 13:28:12.022755+08	919	Iaer object (919)	3		12	1
1180	2018-11-16 13:28:12.031174+08	834	Iaer object (834)	3		12	1
1181	2018-11-16 13:28:12.040766+08	918	Iaer object (918)	3		12	1
1182	2018-11-16 13:28:12.063706+08	833	Iaer object (833)	3		12	1
1183	2018-11-16 13:28:12.0716+08	917	Iaer object (917)	3		12	1
1184	2018-11-16 13:28:12.079741+08	832	Iaer object (832)	3		12	1
1185	2018-11-16 13:28:12.08955+08	916	Iaer object (916)	3		12	1
1186	2018-11-16 13:28:12.101224+08	831	Iaer object (831)	3		12	1
1187	2018-11-16 13:28:12.111+08	915	Iaer object (915)	3		12	1
1188	2018-11-16 13:28:12.118749+08	830	Iaer object (830)	3		12	1
1189	2018-11-16 13:28:12.128903+08	914	Iaer object (914)	3		12	1
1190	2018-11-16 13:28:12.143394+08	829	Iaer object (829)	3		12	1
1191	2018-11-16 13:28:12.15575+08	913	Iaer object (913)	3		12	1
1192	2018-11-16 13:28:12.163325+08	828	Iaer object (828)	3		12	1
1193	2018-11-16 13:28:12.170663+08	912	Iaer object (912)	3		12	1
1194	2018-11-16 13:28:12.178576+08	827	Iaer object (827)	3		12	1
1195	2018-11-16 13:28:12.186677+08	911	Iaer object (911)	3		12	1
1196	2018-11-16 13:28:12.196097+08	826	Iaer object (826)	3		12	1
1197	2018-11-16 13:28:12.204253+08	910	Iaer object (910)	3		12	1
1198	2018-11-16 13:28:12.212166+08	825	Iaer object (825)	3		12	1
1199	2018-11-16 13:28:12.221752+08	909	Iaer object (909)	3		12	1
1200	2018-11-16 13:28:12.229375+08	824	Iaer object (824)	3		12	1
1201	2018-11-16 13:28:12.249088+08	908	Iaer object (908)	3		12	1
1202	2018-11-16 13:28:12.261925+08	823	Iaer object (823)	3		12	1
1203	2018-11-16 13:28:12.269903+08	907	Iaer object (907)	3		12	1
1204	2018-11-16 13:28:12.278367+08	822	Iaer object (822)	3		12	1
1205	2018-11-16 13:28:12.287686+08	906	Iaer object (906)	3		12	1
1206	2018-11-16 13:28:12.305443+08	821	Iaer object (821)	3		12	1
1207	2018-11-16 13:28:12.314966+08	905	Iaer object (905)	3		12	1
1208	2018-11-16 13:28:12.322804+08	820	Iaer object (820)	3		12	1
1209	2018-11-16 13:28:12.334595+08	904	Iaer object (904)	3		12	1
1210	2018-11-16 13:28:12.345205+08	819	Iaer object (819)	3		12	1
1211	2018-11-16 13:28:12.352158+08	903	Iaer object (903)	3		12	1
1212	2018-11-16 13:28:12.364845+08	818	Iaer object (818)	3		12	1
1213	2018-11-16 13:28:12.374654+08	902	Iaer object (902)	3		12	1
1214	2018-11-16 13:28:12.381625+08	817	Iaer object (817)	3		12	1
1215	2018-11-16 13:28:12.392515+08	901	Iaer object (901)	3		12	1
1216	2018-11-16 13:28:12.401369+08	816	Iaer object (816)	3		12	1
1217	2018-11-16 13:28:12.410918+08	900	Iaer object (900)	3		12	1
1218	2018-11-16 13:28:12.418701+08	815	Iaer object (815)	3		12	1
1219	2018-11-16 13:28:12.431989+08	899	Iaer object (899)	3		12	1
1220	2018-11-16 13:28:12.440005+08	814	Iaer object (814)	3		12	1
1221	2018-11-16 13:28:12.447383+08	898	Iaer object (898)	3		12	1
1222	2018-11-16 13:28:12.455049+08	813	Iaer object (813)	3		12	1
1223	2018-11-16 13:28:12.474806+08	897	Iaer object (897)	3		12	1
1224	2018-11-16 13:28:12.48238+08	812	Iaer object (812)	3		12	1
1225	2018-11-16 13:28:12.490975+08	896	Iaer object (896)	3		12	1
1226	2018-11-16 13:28:12.505246+08	811	Iaer object (811)	3		12	1
1227	2018-11-16 13:28:12.515598+08	895	Iaer object (895)	3		12	1
1228	2018-11-16 13:28:12.525917+08	810	Iaer object (810)	3		12	1
1229	2018-11-16 13:28:12.53357+08	894	Iaer object (894)	3		12	1
1230	2018-11-16 13:28:12.541549+08	809	Iaer object (809)	3		12	1
1231	2018-11-16 13:28:12.552003+08	893	Iaer object (893)	3		12	1
1232	2018-11-16 13:28:12.559755+08	808	Iaer object (808)	3		12	1
1233	2018-11-16 13:28:12.567425+08	892	Iaer object (892)	3		12	1
1234	2018-11-16 13:28:12.575329+08	807	Iaer object (807)	3		12	1
1235	2018-11-16 13:28:12.585791+08	891	Iaer object (891)	3		12	1
1236	2018-11-16 13:28:12.595796+08	806	Iaer object (806)	3		12	1
1237	2018-11-16 13:28:12.60338+08	890	Iaer object (890)	3		12	1
1238	2018-11-16 13:28:12.612142+08	805	Iaer object (805)	3		12	1
1239	2018-11-16 13:28:12.625503+08	889	Iaer object (889)	3		12	1
1240	2018-11-16 13:28:12.641695+08	804	Iaer object (804)	3		12	1
1241	2018-11-16 13:28:12.652367+08	888	Iaer object (888)	3		12	1
1242	2018-11-16 13:28:12.662702+08	803	Iaer object (803)	3		12	1
1243	2018-11-16 13:28:12.675748+08	887	Iaer object (887)	3		12	1
1244	2018-11-16 13:28:12.683758+08	802	Iaer object (802)	3		12	1
1245	2018-11-16 13:28:12.694719+08	886	Iaer object (886)	3		12	1
1246	2018-11-16 13:28:12.711177+08	801	Iaer object (801)	3		12	1
1247	2018-11-16 13:28:12.724081+08	885	Iaer object (885)	3		12	1
1248	2018-11-16 13:28:12.738604+08	800	Iaer object (800)	3		12	1
1249	2018-11-16 13:28:12.763605+08	884	Iaer object (884)	3		12	1
1250	2018-11-16 13:28:12.777618+08	799	Iaer object (799)	3		12	1
1251	2018-11-16 13:28:12.799771+08	883	Iaer object (883)	3		12	1
1252	2018-11-16 13:28:12.822111+08	798	Iaer object (798)	3		12	1
1253	2018-11-16 13:28:12.832751+08	882	Iaer object (882)	3		12	1
1254	2018-11-16 13:28:12.842955+08	797	Iaer object (797)	3		12	1
1255	2018-11-16 13:28:12.850628+08	881	Iaer object (881)	3		12	1
1256	2018-11-16 13:28:12.864604+08	796	Iaer object (796)	3		12	1
1257	2018-11-16 13:28:12.874388+08	880	Iaer object (880)	3		12	1
1258	2018-11-16 13:28:12.884655+08	795	Iaer object (795)	3		12	1
1259	2018-11-16 13:28:12.897934+08	879	Iaer object (879)	3		12	1
1260	2018-11-16 13:28:12.909044+08	794	Iaer object (794)	3		12	1
1261	2018-11-16 13:28:12.924946+08	793	Iaer object (793)	3		12	1
1262	2018-11-16 13:28:12.932821+08	792	Iaer object (792)	3		12	1
1263	2018-11-16 13:28:12.959399+08	791	Iaer object (791)	3		12	1
1264	2018-11-16 13:28:12.974352+08	790	Iaer object (790)	3		12	1
1265	2018-11-16 13:28:12.982512+08	789	Iaer object (789)	3		12	1
1266	2018-11-16 13:28:12.990968+08	788	Iaer object (788)	3		12	1
1267	2018-11-16 13:28:13.000551+08	787	Iaer object (787)	3		12	1
1268	2018-11-16 13:28:13.009549+08	786	Iaer object (786)	3		12	1
1269	2018-11-16 13:28:13.019247+08	785	Iaer object (785)	3		12	1
1270	2018-11-16 13:28:13.027174+08	784	Iaer object (784)	3		12	1
1271	2018-11-16 13:28:13.043681+08	783	Iaer object (783)	3		12	1
1272	2018-11-16 13:28:13.065595+08	782	Iaer object (782)	3		12	1
1273	2018-11-16 13:28:13.089757+08	781	Iaer object (781)	3		12	1
1274	2018-11-16 13:28:13.105191+08	780	Iaer object (780)	3		12	1
1275	2018-11-16 13:28:13.114794+08	779	Iaer object (779)	3		12	1
1276	2018-11-16 13:28:13.131177+08	778	Iaer object (778)	3		12	1
1277	2018-11-16 13:28:13.140214+08	777	Iaer object (777)	3		12	1
1278	2018-11-16 13:28:13.149784+08	776	Iaer object (776)	3		12	1
1279	2018-11-16 13:28:13.160379+08	775	Iaer object (775)	3		12	1
1280	2018-11-16 13:28:13.171892+08	774	Iaer object (774)	3		12	1
1281	2018-11-16 13:28:13.183257+08	773	Iaer object (773)	3		12	1
1282	2018-11-16 13:28:13.196794+08	772	Iaer object (772)	3		12	1
1283	2018-11-16 13:28:13.20735+08	771	Iaer object (771)	3		12	1
1284	2018-11-16 13:28:13.214934+08	770	Iaer object (770)	3		12	1
1285	2018-11-16 13:28:13.222863+08	769	Iaer object (769)	3		12	1
1286	2018-11-16 13:28:13.239771+08	768	Iaer object (768)	3		12	1
1287	2018-11-16 13:28:13.24979+08	767	Iaer object (767)	3		12	1
1288	2018-11-16 13:28:13.260134+08	766	Iaer object (766)	3		12	1
1289	2018-11-16 13:28:13.271053+08	765	Iaer object (765)	3		12	1
1290	2018-11-16 13:28:13.282065+08	764	Iaer object (764)	3		12	1
1291	2018-11-16 13:28:13.292705+08	763	Iaer object (763)	3		12	1
1292	2018-11-16 13:28:13.303362+08	762	Iaer object (762)	3		12	1
1293	2018-11-16 13:28:13.348216+08	761	Iaer object (761)	3		12	1
1294	2018-11-16 13:28:13.371221+08	760	Iaer object (760)	3		12	1
1295	2018-11-16 13:28:13.38522+08	759	Iaer object (759)	3		12	1
1296	2018-11-16 13:28:13.397034+08	758	Iaer object (758)	3		12	1
1297	2018-11-16 13:28:13.405317+08	757	Iaer object (757)	3		12	1
1298	2018-11-16 13:28:13.413092+08	756	Iaer object (756)	3		12	1
1299	2018-11-16 13:28:13.423754+08	755	Iaer object (755)	3		12	1
1300	2018-11-16 13:28:13.431409+08	754	Iaer object (754)	3		12	1
1301	2018-11-16 13:28:13.438863+08	753	Iaer object (753)	3		12	1
1302	2018-11-16 13:28:13.446356+08	752	Iaer object (752)	3		12	1
1303	2018-11-16 13:28:13.456087+08	751	Iaer object (751)	3		12	1
1304	2018-11-16 13:28:13.463724+08	750	Iaer object (750)	3		12	1
1305	2018-11-16 13:28:13.471612+08	749	Iaer object (749)	3		12	1
1306	2018-11-16 13:28:13.481833+08	748	Iaer object (748)	3		12	1
1307	2018-11-16 13:28:13.492605+08	747	Iaer object (747)	3		12	1
1308	2018-11-16 13:28:13.500439+08	746	Iaer object (746)	3		12	1
1309	2018-11-16 13:28:13.5106+08	745	Iaer object (745)	3		12	1
1310	2018-11-16 13:28:13.517891+08	744	Iaer object (744)	3		12	1
1311	2018-11-16 13:28:13.527125+08	743	Iaer object (743)	3		12	1
1312	2018-11-16 13:28:13.541435+08	742	Iaer object (742)	3		12	1
1313	2018-11-16 13:28:13.548929+08	741	Iaer object (741)	3		12	1
1314	2018-11-16 13:28:13.556581+08	740	Iaer object (740)	3		12	1
1315	2018-11-16 13:28:13.564048+08	739	Iaer object (739)	3		12	1
1316	2018-11-16 13:28:13.577258+08	738	Iaer object (738)	3		12	1
1317	2018-11-16 13:28:13.584522+08	737	Iaer object (737)	3		12	1
1318	2018-11-16 13:28:13.5925+08	736	Iaer object (736)	3		12	1
1319	2018-11-16 13:28:13.603111+08	735	Iaer object (735)	3		12	1
1320	2018-11-16 13:28:13.613014+08	734	Iaer object (734)	3		12	1
1321	2018-11-16 13:28:13.623351+08	733	Iaer object (733)	3		12	1
1322	2018-11-16 13:28:13.634619+08	732	Iaer object (732)	3		12	1
1323	2018-11-16 13:28:13.645002+08	731	Iaer object (731)	3		12	1
1324	2018-11-16 13:28:13.655637+08	730	Iaer object (730)	3		12	1
1325	2018-11-16 13:28:13.665905+08	729	Iaer object (729)	3		12	1
1326	2018-11-16 13:28:13.675941+08	728	Iaer object (728)	3		12	1
1327	2018-11-16 13:28:13.687245+08	727	Iaer object (727)	3		12	1
1328	2018-11-16 13:28:13.705121+08	726	Iaer object (726)	3		12	1
1329	2018-11-16 13:28:13.712817+08	725	Iaer object (725)	3		12	1
1330	2018-11-16 13:28:13.720206+08	724	Iaer object (724)	3		12	1
1331	2018-11-16 13:28:13.731104+08	723	Iaer object (723)	3		12	1
1332	2018-11-16 13:28:13.738561+08	722	Iaer object (722)	3		12	1
1333	2018-11-16 13:28:13.746898+08	721	Iaer object (721)	3		12	1
1334	2018-11-16 13:28:13.756629+08	720	Iaer object (720)	3		12	1
1335	2018-11-16 13:28:13.766394+08	719	Iaer object (719)	3		12	1
1336	2018-11-16 13:28:13.773855+08	718	Iaer object (718)	3		12	1
1337	2018-11-16 13:28:13.817609+08	717	Iaer object (717)	3		12	1
1338	2018-11-16 13:28:13.827242+08	716	Iaer object (716)	3		12	1
1339	2018-11-16 13:28:13.835734+08	715	Iaer object (715)	3		12	1
1340	2018-11-16 13:28:13.843771+08	714	Iaer object (714)	3		12	1
1341	2018-11-16 13:28:13.854109+08	713	Iaer object (713)	3		12	1
1342	2018-11-16 13:28:13.862015+08	712	Iaer object (712)	3		12	1
1343	2018-11-16 13:28:13.884001+08	711	Iaer object (711)	3		12	1
1344	2018-11-16 13:28:13.902701+08	710	Iaer object (710)	3		12	1
1345	2018-11-16 13:28:13.915694+08	709	Iaer object (709)	3		12	1
1346	2018-11-16 13:28:13.922937+08	708	Iaer object (708)	3		12	1
1347	2018-11-16 13:28:13.930613+08	707	Iaer object (707)	3		12	1
1348	2018-11-16 13:28:13.938457+08	706	Iaer object (706)	3		12	1
1349	2018-11-16 13:28:13.94782+08	705	Iaer object (705)	3		12	1
1350	2018-11-16 13:28:13.955105+08	704	Iaer object (704)	3		12	1
1351	2018-11-16 13:28:13.962995+08	703	Iaer object (703)	3		12	1
1352	2018-11-16 13:28:13.973392+08	702	Iaer object (702)	3		12	1
1353	2018-11-16 13:28:13.985727+08	701	Iaer object (701)	3		12	1
1354	2018-11-16 13:28:13.996673+08	700	Iaer object (700)	3		12	1
1355	2018-11-16 13:28:14.009095+08	699	Iaer object (699)	3		12	1
1356	2018-11-16 13:28:14.019163+08	698	Iaer object (698)	3		12	1
1357	2018-11-16 13:28:14.036876+08	697	Iaer object (697)	3		12	1
1358	2018-11-16 13:28:14.044084+08	696	Iaer object (696)	3		12	1
1359	2018-11-16 13:28:14.052604+08	695	Iaer object (695)	3		12	1
1360	2018-11-16 13:28:14.062944+08	694	Iaer object (694)	3		12	1
1361	2018-11-16 13:28:14.07098+08	693	Iaer object (693)	3		12	1
1362	2018-11-16 13:28:14.078899+08	692	Iaer object (692)	3		12	1
1363	2018-11-16 13:28:14.088405+08	691	Iaer object (691)	3		12	1
1364	2018-11-16 13:28:14.098854+08	690	Iaer object (690)	3		12	1
1365	2018-11-16 13:28:14.109151+08	689	Iaer object (689)	3		12	1
1366	2018-11-16 13:28:14.119513+08	688	Iaer object (688)	3		12	1
1367	2018-11-16 13:28:14.132722+08	687	Iaer object (687)	3		12	1
1368	2018-11-16 13:28:14.141107+08	686	Iaer object (686)	3		12	1
1369	2018-11-16 13:28:14.150964+08	685	Iaer object (685)	3		12	1
1370	2018-11-16 13:28:14.161224+08	684	Iaer object (684)	3		12	1
1371	2018-11-16 13:28:14.168631+08	683	Iaer object (683)	3		12	1
1372	2018-11-16 13:28:14.181279+08	682	Iaer object (682)	3		12	1
1373	2018-11-16 13:28:14.192133+08	681	Iaer object (681)	3		12	1
1374	2018-11-16 13:28:14.209057+08	680	Iaer object (680)	3		12	1
1375	2018-11-16 13:28:14.218959+08	679	Iaer object (679)	3		12	1
1376	2018-11-16 13:28:14.229547+08	678	Iaer object (678)	3		12	1
1377	2018-11-16 13:28:14.239423+08	677	Iaer object (677)	3		12	1
1378	2018-11-16 13:28:14.247455+08	676	Iaer object (676)	3		12	1
1379	2018-11-16 13:28:14.255233+08	675	Iaer object (675)	3		12	1
1380	2018-11-16 13:28:14.265209+08	674	Iaer object (674)	3		12	1
1381	2018-11-16 13:28:14.275184+08	673	Iaer object (673)	3		12	1
1382	2018-11-16 13:28:14.285537+08	672	Iaer object (672)	3		12	1
1383	2018-11-16 13:28:14.293362+08	671	Iaer object (671)	3		12	1
1384	2018-11-16 13:28:14.303801+08	670	Iaer object (670)	3		12	1
1385	2018-11-16 13:28:14.312547+08	669	Iaer object (669)	3		12	1
1386	2018-11-16 13:28:14.321329+08	668	Iaer object (668)	3		12	1
1387	2018-11-16 13:28:14.334902+08	667	Iaer object (667)	3		12	1
1388	2018-11-16 13:28:14.345156+08	666	Iaer object (666)	3		12	1
1389	2018-11-16 13:28:14.352745+08	665	Iaer object (665)	3		12	1
1390	2018-11-16 13:28:14.361404+08	664	Iaer object (664)	3		12	1
1391	2018-11-16 13:28:14.375889+08	663	Iaer object (663)	3		12	1
1392	2018-11-16 13:28:14.387724+08	662	Iaer object (662)	3		12	1
1393	2018-11-16 13:28:14.397745+08	661	Iaer object (661)	3		12	1
1394	2018-11-16 13:28:14.420305+08	660	Iaer object (660)	3		12	1
1395	2018-11-16 13:28:14.434352+08	659	Iaer object (659)	3		12	1
1396	2018-11-16 13:28:14.447078+08	658	Iaer object (658)	3		12	1
1397	2018-11-16 13:28:14.454888+08	657	Iaer object (657)	3		12	1
1398	2018-11-16 13:28:14.468747+08	656	Iaer object (656)	3		12	1
1399	2018-11-16 13:28:14.479384+08	655	Iaer object (655)	3		12	1
1400	2018-11-16 13:28:14.487029+08	654	Iaer object (654)	3		12	1
1401	2018-11-16 13:28:14.502136+08	653	Iaer object (653)	3		12	1
1402	2018-11-16 13:28:14.514473+08	652	Iaer object (652)	3		12	1
1403	2018-11-16 13:28:14.525233+08	651	Iaer object (651)	3		12	1
1404	2018-11-16 13:28:14.5405+08	650	Iaer object (650)	3		12	1
1405	2018-11-16 13:28:14.559057+08	649	Iaer object (649)	3		12	1
1406	2018-11-16 13:28:14.569302+08	648	Iaer object (648)	3		12	1
1407	2018-11-16 13:28:14.58047+08	647	Iaer object (647)	3		12	1
1408	2018-11-16 13:28:14.593862+08	646	Iaer object (646)	3		12	1
1409	2018-11-16 13:28:14.601441+08	645	Iaer object (645)	3		12	1
1410	2018-11-16 13:28:14.609921+08	644	Iaer object (644)	3		12	1
1411	2018-11-16 13:28:14.622514+08	643	Iaer object (643)	3		12	1
1412	2018-11-16 13:28:14.632928+08	642	Iaer object (642)	3		12	1
1413	2018-11-16 13:28:14.645269+08	641	Iaer object (641)	3		12	1
1414	2018-11-16 13:28:14.656871+08	640	Iaer object (640)	3		12	1
1415	2018-11-16 13:28:14.664848+08	639	Iaer object (639)	3		12	1
1416	2018-11-16 13:28:14.672974+08	638	Iaer object (638)	3		12	1
1417	2018-11-16 13:28:14.690105+08	637	Iaer object (637)	3		12	1
1418	2018-11-16 13:28:14.701522+08	636	Iaer object (636)	3		12	1
1419	2018-11-16 13:28:14.726151+08	635	Iaer object (635)	3		12	1
1420	2018-11-16 13:28:14.735699+08	634	Iaer object (634)	3		12	1
1421	2018-11-16 13:28:14.745114+08	633	Iaer object (633)	3		12	1
1422	2018-11-16 13:28:14.752931+08	632	Iaer object (632)	3		12	1
1423	2018-11-16 13:28:14.763627+08	631	Iaer object (631)	3		12	1
1424	2018-11-16 13:28:14.774728+08	630	Iaer object (630)	3		12	1
1425	2018-11-16 13:28:14.786423+08	629	Iaer object (629)	3		12	1
1426	2018-11-16 13:28:14.796927+08	628	Iaer object (628)	3		12	1
1427	2018-11-16 13:28:14.812901+08	627	Iaer object (627)	3		12	1
1428	2018-11-16 13:28:14.826426+08	626	Iaer object (626)	3		12	1
1429	2018-11-16 13:28:14.842824+08	625	Iaer object (625)	3		12	1
1430	2018-11-16 13:28:14.853682+08	624	Iaer object (624)	3		12	1
1431	2018-11-16 13:28:14.873724+08	623	Iaer object (623)	3		12	1
1432	2018-11-16 13:28:14.892381+08	622	Iaer object (622)	3		12	1
1433	2018-11-16 13:28:14.934812+08	621	Iaer object (621)	3		12	1
1434	2018-11-16 13:28:14.962473+08	620	Iaer object (620)	3		12	1
1435	2018-11-16 13:28:14.973635+08	619	Iaer object (619)	3		12	1
1436	2018-11-16 13:28:14.985669+08	618	Iaer object (618)	3		12	1
1437	2018-11-16 13:28:14.999038+08	617	Iaer object (617)	3		12	1
1438	2018-11-16 13:28:15.010988+08	616	Iaer object (616)	3		12	1
1439	2018-11-16 13:28:15.027245+08	615	Iaer object (615)	3		12	1
1440	2018-11-16 13:28:15.048837+08	614	Iaer object (614)	3		12	1
1441	2018-11-16 13:28:15.090924+08	613	Iaer object (613)	3		12	1
1442	2018-11-16 13:28:15.10559+08	612	Iaer object (612)	3		12	1
1443	2018-11-16 13:28:15.128145+08	611	Iaer object (611)	3		12	1
1444	2018-11-16 13:28:15.138063+08	610	Iaer object (610)	3		12	1
1445	2018-11-16 13:28:15.14735+08	609	Iaer object (609)	3		12	1
1446	2018-11-16 13:28:15.157529+08	608	Iaer object (608)	3		12	1
1447	2018-11-16 13:28:15.165104+08	607	Iaer object (607)	3		12	1
1448	2018-11-16 13:28:15.172581+08	606	Iaer object (606)	3		12	1
1449	2018-11-16 13:28:15.183288+08	605	Iaer object (605)	3		12	1
1450	2018-11-16 13:28:15.193671+08	604	Iaer object (604)	3		12	1
1451	2018-11-16 13:28:15.201489+08	603	Iaer object (603)	3		12	1
1452	2018-11-16 13:28:15.209355+08	602	Iaer object (602)	3		12	1
1453	2018-11-16 13:28:15.218722+08	601	Iaer object (601)	3		12	1
1454	2018-11-16 13:28:15.234876+08	600	Iaer object (600)	3		12	1
1455	2018-11-16 13:28:15.247514+08	599	Iaer object (599)	3		12	1
1456	2018-11-16 13:28:15.257893+08	598	Iaer object (598)	3		12	1
1457	2018-11-16 13:28:15.275222+08	597	Iaer object (597)	3		12	1
1458	2018-11-16 13:28:15.288906+08	596	Iaer object (596)	3		12	1
1459	2018-11-16 13:28:15.305641+08	595	Iaer object (595)	3		12	1
1460	2018-11-16 13:28:15.31589+08	594	Iaer object (594)	3		12	1
1461	2018-11-16 13:28:15.323603+08	593	Iaer object (593)	3		12	1
1462	2018-11-16 13:28:15.331649+08	592	Iaer object (592)	3		12	1
1463	2018-11-16 13:28:15.341559+08	591	Iaer object (591)	3		12	1
1464	2018-11-16 13:28:15.348841+08	590	Iaer object (590)	3		12	1
1465	2018-11-16 13:28:15.356045+08	589	Iaer object (589)	3		12	1
1466	2018-11-16 13:28:15.365062+08	588	Iaer object (588)	3		12	1
1467	2018-11-16 13:28:15.372381+08	587	Iaer object (587)	3		12	1
1468	2018-11-16 13:28:15.381849+08	586	Iaer object (586)	3		12	1
1469	2018-11-16 13:28:15.394615+08	585	Iaer object (585)	3		12	1
1470	2018-11-16 13:28:15.404191+08	584	Iaer object (584)	3		12	1
1471	2018-11-16 13:28:15.414445+08	583	Iaer object (583)	3		12	1
1472	2018-11-16 13:28:15.422808+08	582	Iaer object (582)	3		12	1
1473	2018-11-16 13:28:15.436379+08	581	Iaer object (581)	3		12	1
1474	2018-11-16 13:28:15.447831+08	580	Iaer object (580)	3		12	1
1475	2018-11-16 13:28:15.458113+08	579	Iaer object (579)	3		12	1
1476	2018-11-16 13:28:15.469327+08	578	Iaer object (578)	3		12	1
1477	2018-11-16 13:28:15.476984+08	577	Iaer object (577)	3		12	1
1478	2018-11-16 13:28:15.486833+08	576	Iaer object (576)	3		12	1
1479	2018-11-16 13:28:15.501404+08	575	Iaer object (575)	3		12	1
1480	2018-11-16 13:28:15.511688+08	574	Iaer object (574)	3		12	1
1481	2018-11-16 13:28:15.524042+08	573	Iaer object (573)	3		12	1
1482	2018-11-16 13:28:15.531349+08	572	Iaer object (572)	3		12	1
1483	2018-11-16 13:28:15.539238+08	571	Iaer object (571)	3		12	1
1484	2018-11-16 13:28:15.551819+08	570	Iaer object (570)	3		12	1
1485	2018-11-16 13:28:15.564437+08	569	Iaer object (569)	3		12	1
1486	2018-11-16 13:28:15.571657+08	568	Iaer object (568)	3		12	1
1487	2018-11-16 13:28:15.584754+08	567	Iaer object (567)	3		12	1
1488	2018-11-16 13:28:15.603321+08	566	Iaer object (566)	3		12	1
1489	2018-11-16 13:28:15.615784+08	565	Iaer object (565)	3		12	1
1490	2018-11-16 13:28:15.626754+08	564	Iaer object (564)	3		12	1
1491	2018-11-16 13:28:15.63685+08	563	Iaer object (563)	3		12	1
1492	2018-11-16 13:28:15.647235+08	562	Iaer object (562)	3		12	1
1493	2018-11-16 13:28:15.654634+08	561	Iaer object (561)	3		12	1
1494	2018-11-16 13:28:15.662174+08	560	Iaer object (560)	3		12	1
1495	2018-11-16 13:28:15.669998+08	559	Iaer object (559)	3		12	1
1496	2018-11-16 13:28:15.678056+08	558	Iaer object (558)	3		12	1
1497	2018-11-16 13:28:15.687425+08	557	Iaer object (557)	3		12	1
1498	2018-11-16 13:28:15.702157+08	556	Iaer object (556)	3		12	1
1499	2018-11-16 13:28:15.709916+08	555	Iaer object (555)	3		12	1
1500	2018-11-16 13:28:15.717461+08	554	Iaer object (554)	3		12	1
1501	2018-11-16 13:28:15.728791+08	553	Iaer object (553)	3		12	1
1502	2018-11-16 13:28:15.736505+08	552	Iaer object (552)	3		12	1
1503	2018-11-16 13:28:15.744271+08	551	Iaer object (551)	3		12	1
1504	2018-11-16 13:28:15.751392+08	550	Iaer object (550)	3		12	1
1505	2018-11-16 13:28:15.759021+08	549	Iaer object (549)	3		12	1
1506	2018-11-16 13:28:15.785914+08	548	Iaer object (548)	3		12	1
1507	2018-11-16 13:28:15.804827+08	547	Iaer object (547)	3		12	1
1508	2018-11-16 13:28:15.815634+08	546	Iaer object (546)	3		12	1
1509	2018-11-16 13:28:15.823313+08	545	Iaer object (545)	3		12	1
1510	2018-11-16 13:28:15.838833+08	544	Iaer object (544)	3		12	1
1511	2018-11-16 13:28:15.854552+08	543	Iaer object (543)	3		12	1
1512	2018-11-16 13:28:15.878921+08	542	Iaer object (542)	3		12	1
1513	2018-11-16 13:28:15.888693+08	541	Iaer object (541)	3		12	1
1514	2018-11-16 13:28:15.907416+08	540	Iaer object (540)	3		12	1
1515	2018-11-16 13:28:15.933104+08	539	Iaer object (539)	3		12	1
1516	2018-11-16 13:28:15.948429+08	538	Iaer object (538)	3		12	1
1517	2018-11-16 13:28:15.965223+08	537	Iaer object (537)	3		12	1
1518	2018-11-16 13:28:15.980135+08	536	Iaer object (536)	3		12	1
1519	2018-11-16 13:28:15.990153+08	535	Iaer object (535)	3		12	1
1520	2018-11-16 13:28:16.00092+08	534	Iaer object (534)	3		12	1
1521	2018-11-16 13:28:16.013009+08	533	Iaer object (533)	3		12	1
1522	2018-11-16 13:28:16.036307+08	532	Iaer object (532)	3		12	1
1523	2018-11-16 13:28:16.066416+08	531	Iaer object (531)	3		12	1
1524	2018-11-16 13:28:16.086572+08	530	Iaer object (530)	3		12	1
1525	2018-11-16 13:28:16.101269+08	529	Iaer object (529)	3		12	1
1526	2018-11-16 13:28:16.11964+08	528	Iaer object (528)	3		12	1
1527	2018-11-16 13:28:16.132544+08	527	Iaer object (527)	3		12	1
1528	2018-11-16 13:28:16.152879+08	526	Iaer object (526)	3		12	1
1529	2018-11-16 13:28:16.180142+08	525	Iaer object (525)	3		12	1
1530	2018-11-16 13:28:16.193962+08	524	Iaer object (524)	3		12	1
1531	2018-11-16 13:28:16.215197+08	523	Iaer object (523)	3		12	1
1532	2018-11-16 13:28:16.231051+08	522	Iaer object (522)	3		12	1
1533	2018-11-16 13:28:16.255125+08	521	Iaer object (521)	3		12	1
1534	2018-11-16 13:28:16.285382+08	520	Iaer object (520)	3		12	1
1535	2018-11-16 13:28:16.296285+08	519	Iaer object (519)	3		12	1
1536	2018-11-16 13:28:16.316507+08	518	Iaer object (518)	3		12	1
1537	2018-11-16 13:28:16.333549+08	517	Iaer object (517)	3		12	1
1538	2018-11-16 13:28:16.37558+08	516	Iaer object (516)	3		12	1
1539	2018-11-16 13:28:16.408639+08	515	Iaer object (515)	3		12	1
1540	2018-11-16 13:28:16.419029+08	514	Iaer object (514)	3		12	1
1541	2018-11-16 13:28:16.431957+08	513	Iaer object (513)	3		12	1
1542	2018-11-16 13:28:16.444609+08	512	Iaer object (512)	3		12	1
1543	2018-11-16 13:28:16.455544+08	511	Iaer object (511)	3		12	1
1544	2018-11-16 13:28:16.483632+08	510	Iaer object (510)	3		12	1
1545	2018-11-16 13:28:16.496076+08	509	Iaer object (509)	3		12	1
1546	2018-11-16 13:28:16.506765+08	508	Iaer object (508)	3		12	1
1547	2018-11-16 13:28:16.516979+08	507	Iaer object (507)	3		12	1
1548	2018-11-16 13:28:16.529574+08	506	Iaer object (506)	3		12	1
1549	2018-11-16 13:28:16.537718+08	505	Iaer object (505)	3		12	1
1550	2018-11-16 13:28:16.548786+08	504	Iaer object (504)	3		12	1
1551	2018-11-16 13:28:16.565504+08	503	Iaer object (503)	3		12	1
1552	2018-11-16 13:28:16.576459+08	502	Iaer object (502)	3		12	1
1553	2018-11-16 13:28:16.588239+08	501	Iaer object (501)	3		12	1
1554	2018-11-16 13:28:16.604815+08	500	Iaer object (500)	3		12	1
1555	2018-11-16 13:28:16.615949+08	499	Iaer object (499)	3		12	1
1556	2018-11-16 13:28:16.630238+08	498	Iaer object (498)	3		12	1
1557	2018-11-16 13:28:16.642428+08	497	Iaer object (497)	3		12	1
1558	2018-11-16 13:28:16.652468+08	496	Iaer object (496)	3		12	1
1559	2018-11-16 13:28:16.664207+08	495	Iaer object (495)	3		12	1
1560	2018-11-16 13:28:16.674378+08	494	Iaer object (494)	3		12	1
1561	2018-11-16 13:28:16.685377+08	493	Iaer object (493)	3		12	1
1562	2018-11-16 13:28:16.696081+08	492	Iaer object (492)	3		12	1
1563	2018-11-16 13:28:16.707314+08	491	Iaer object (491)	3		12	1
1564	2018-11-16 13:28:16.719015+08	490	Iaer object (490)	3		12	1
1565	2018-11-16 13:28:16.729336+08	489	Iaer object (489)	3		12	1
1566	2018-11-16 13:28:16.73975+08	488	Iaer object (488)	3		12	1
1567	2018-11-16 13:28:16.760412+08	487	Iaer object (487)	3		12	1
1568	2018-11-16 13:28:16.783085+08	486	Iaer object (486)	3		12	1
1569	2018-11-16 13:28:16.796075+08	485	Iaer object (485)	3		12	1
1570	2018-11-16 13:28:16.815141+08	484	Iaer object (484)	3		12	1
1571	2018-11-16 13:28:16.826505+08	483	Iaer object (483)	3		12	1
1572	2018-11-16 13:28:16.838784+08	482	Iaer object (482)	3		12	1
1573	2018-11-16 13:28:16.855777+08	481	Iaer object (481)	3		12	1
1574	2018-11-16 13:28:16.869226+08	480	Iaer object (480)	3		12	1
1575	2018-11-16 13:28:16.880444+08	479	Iaer object (479)	3		12	1
1576	2018-11-16 13:28:16.889165+08	478	Iaer object (478)	3		12	1
1577	2018-11-16 13:28:16.898094+08	477	Iaer object (477)	3		12	1
1578	2018-11-16 13:28:16.91182+08	476	Iaer object (476)	3		12	1
1579	2018-11-16 13:28:16.919234+08	475	Iaer object (475)	3		12	1
1580	2018-11-16 13:28:16.926901+08	474	Iaer object (474)	3		12	1
1581	2018-11-16 13:28:16.935085+08	473	Iaer object (473)	3		12	1
1582	2018-11-16 13:28:16.942521+08	472	Iaer object (472)	3		12	1
1583	2018-11-16 13:28:16.951944+08	471	Iaer object (471)	3		12	1
1584	2018-11-16 13:28:16.959486+08	470	Iaer object (470)	3		12	1
1585	2018-11-16 13:28:16.967823+08	469	Iaer object (469)	3		12	1
1586	2018-11-16 13:28:16.977504+08	468	Iaer object (468)	3		12	1
1587	2018-11-16 13:28:16.985222+08	467	Iaer object (467)	3		12	1
1588	2018-11-16 13:28:17.004303+08	466	Iaer object (466)	3		12	1
1589	2018-11-16 13:28:17.014544+08	465	Iaer object (465)	3		12	1
1590	2018-11-16 13:28:17.025888+08	464	Iaer object (464)	3		12	1
1591	2018-11-16 13:28:17.041622+08	463	Iaer object (463)	3		12	1
1592	2018-11-16 13:28:17.048751+08	462	Iaer object (462)	3		12	1
1593	2018-11-16 13:28:17.056974+08	461	Iaer object (461)	3		12	1
1594	2018-11-16 13:28:17.067976+08	460	Iaer object (460)	3		12	1
1595	2018-11-16 13:28:17.077645+08	459	Iaer object (459)	3		12	1
1596	2018-11-16 13:28:17.085298+08	458	Iaer object (458)	3		12	1
1597	2018-11-16 13:28:17.093436+08	457	Iaer object (457)	3		12	1
1598	2018-11-16 13:28:17.105927+08	456	Iaer object (456)	3		12	1
1599	2018-11-16 13:28:17.115448+08	455	Iaer object (455)	3		12	1
1600	2018-11-16 13:28:17.127526+08	454	Iaer object (454)	3		12	1
1601	2018-11-16 13:28:17.134981+08	453	Iaer object (453)	3		12	1
1602	2018-11-16 13:28:17.144336+08	452	Iaer object (452)	3		12	1
1603	2018-11-16 13:28:17.164329+08	451	Iaer object (451)	3		12	1
1604	2018-11-16 13:28:17.177221+08	450	Iaer object (450)	3		12	1
1605	2018-11-16 13:28:17.19308+08	449	Iaer object (449)	3		12	1
1606	2018-11-16 13:28:17.209507+08	448	Iaer object (448)	3		12	1
1607	2018-11-16 13:28:17.223578+08	447	Iaer object (447)	3		12	1
1608	2018-11-16 13:28:17.24018+08	446	Iaer object (446)	3		12	1
1609	2018-11-16 13:28:17.24856+08	445	Iaer object (445)	3		12	1
1610	2018-11-16 13:28:17.268718+08	444	Iaer object (444)	3		12	1
1611	2018-11-16 13:28:17.291919+08	443	Iaer object (443)	3		12	1
1612	2018-11-16 13:28:17.304138+08	442	Iaer object (442)	3		12	1
1613	2018-11-16 13:28:17.317443+08	441	Iaer object (441)	3		12	1
1614	2018-11-16 13:28:17.339684+08	440	Iaer object (440)	3		12	1
1615	2018-11-16 13:28:17.356869+08	439	Iaer object (439)	3		12	1
1616	2018-11-16 13:28:17.374521+08	438	Iaer object (438)	3		12	1
1617	2018-11-16 13:28:17.387306+08	437	Iaer object (437)	3		12	1
1618	2018-11-16 13:28:17.409427+08	436	Iaer object (436)	3		12	1
1619	2018-11-16 13:28:17.42947+08	435	Iaer object (435)	3		12	1
1620	2018-11-16 13:28:17.449886+08	434	Iaer object (434)	3		12	1
1621	2018-11-16 13:28:17.459953+08	433	Iaer object (433)	3		12	1
1622	2018-11-16 13:28:17.467842+08	432	Iaer object (432)	3		12	1
1623	2018-11-16 13:28:17.492997+08	431	Iaer object (431)	3		12	1
1624	2018-11-16 13:28:17.509504+08	430	Iaer object (430)	3		12	1
1625	2018-11-16 13:28:17.528987+08	429	Iaer object (429)	3		12	1
1626	2018-11-16 13:28:17.536571+08	428	Iaer object (428)	3		12	1
1627	2018-11-16 13:28:17.54415+08	427	Iaer object (427)	3		12	1
1628	2018-11-16 13:28:17.568485+08	426	Iaer object (426)	3		12	1
1629	2018-11-16 13:28:17.582201+08	425	Iaer object (425)	3		12	1
1630	2018-11-16 13:28:17.59433+08	424	Iaer object (424)	3		12	1
1631	2018-11-16 13:28:17.601613+08	423	Iaer object (423)	3		12	1
1632	2018-11-16 13:28:17.618347+08	422	Iaer object (422)	3		12	1
1633	2018-11-16 13:28:17.631858+08	421	Iaer object (421)	3		12	1
1634	2018-11-16 13:28:17.639605+08	420	Iaer object (420)	3		12	1
1635	2018-11-16 13:28:17.649239+08	419	Iaer object (419)	3		12	1
1636	2018-11-16 13:28:17.656631+08	418	Iaer object (418)	3		12	1
1637	2018-11-16 13:28:17.664429+08	417	Iaer object (417)	3		12	1
1638	2018-11-16 13:28:17.671687+08	416	Iaer object (416)	3		12	1
1639	2018-11-16 13:28:17.68468+08	415	Iaer object (415)	3		12	1
1640	2018-11-16 13:28:17.695196+08	414	Iaer object (414)	3		12	1
1641	2018-11-16 13:28:17.702635+08	413	Iaer object (413)	3		12	1
1642	2018-11-16 13:28:17.726824+08	412	Iaer object (412)	3		12	1
1643	2018-11-16 13:28:17.739058+08	411	Iaer object (411)	3		12	1
1644	2018-11-16 13:28:17.750548+08	410	Iaer object (410)	3		12	1
1645	2018-11-16 13:28:17.76381+08	409	Iaer object (409)	3		12	1
1646	2018-11-16 13:28:17.779277+08	408	Iaer object (408)	3		12	1
1647	2018-11-16 13:28:17.791725+08	407	Iaer object (407)	3		12	1
1648	2018-11-16 13:28:17.799702+08	406	Iaer object (406)	3		12	1
1649	2018-11-16 13:28:17.808829+08	405	Iaer object (405)	3		12	1
1650	2018-11-16 13:28:17.827533+08	404	Iaer object (404)	3		12	1
1651	2018-11-16 13:28:17.838148+08	403	Iaer object (403)	3		12	1
1652	2018-11-16 13:28:17.848271+08	402	Iaer object (402)	3		12	1
1653	2018-11-16 13:28:17.855561+08	401	Iaer object (401)	3		12	1
1654	2018-11-16 13:28:17.863522+08	400	Iaer object (400)	3		12	1
1655	2018-11-16 13:28:17.874368+08	399	Iaer object (399)	3		12	1
1656	2018-11-16 13:28:17.891343+08	398	Iaer object (398)	3		12	1
1657	2018-11-16 13:28:17.903479+08	397	Iaer object (397)	3		12	1
1658	2018-11-16 13:28:17.916074+08	396	Iaer object (396)	3		12	1
1659	2018-11-16 13:28:17.928228+08	395	Iaer object (395)	3		12	1
1660	2018-11-16 13:28:17.938019+08	394	Iaer object (394)	3		12	1
1661	2018-11-16 13:28:17.948876+08	393	Iaer object (393)	3		12	1
1662	2018-11-16 13:28:17.960202+08	392	Iaer object (392)	3		12	1
1663	2018-11-16 13:28:17.972323+08	391	Iaer object (391)	3		12	1
1664	2018-11-16 13:28:17.982692+08	390	Iaer object (390)	3		12	1
1665	2018-11-16 13:28:18.004589+08	389	Iaer object (389)	3		12	1
1666	2018-11-16 13:28:18.015425+08	388	Iaer object (388)	3		12	1
1667	2018-11-16 13:28:18.02916+08	387	Iaer object (387)	3		12	1
1668	2018-11-16 13:28:18.038951+08	386	Iaer object (386)	3		12	1
1669	2018-11-16 13:28:18.047538+08	385	Iaer object (385)	3		12	1
1670	2018-11-16 13:28:18.057583+08	384	Iaer object (384)	3		12	1
1671	2018-11-16 13:28:18.067748+08	383	Iaer object (383)	3		12	1
1672	2018-11-16 13:28:18.080601+08	382	Iaer object (382)	3		12	1
1673	2018-11-16 13:28:18.090747+08	381	Iaer object (381)	3		12	1
1674	2018-11-16 13:28:18.100616+08	380	Iaer object (380)	3		12	1
1675	2018-11-16 13:28:18.111016+08	379	Iaer object (379)	3		12	1
1676	2018-11-16 13:28:18.122915+08	378	Iaer object (378)	3		12	1
1677	2018-11-16 13:28:18.138747+08	377	Iaer object (377)	3		12	1
1678	2018-11-16 13:28:18.147577+08	376	Iaer object (376)	3		12	1
1679	2018-11-16 13:28:18.156588+08	375	Iaer object (375)	3		12	1
1680	2018-11-16 13:28:18.169469+08	374	Iaer object (374)	3		12	1
1681	2018-11-16 13:28:18.186507+08	373	Iaer object (373)	3		12	1
1682	2018-11-16 13:28:18.234991+08	372	Iaer object (372)	3		12	1
1683	2018-11-16 13:28:18.249349+08	371	Iaer object (371)	3		12	1
1684	2018-11-16 13:28:18.259986+08	370	Iaer object (370)	3		12	1
1685	2018-11-16 13:28:18.270054+08	369	Iaer object (369)	3		12	1
1686	2018-11-16 13:28:18.284584+08	368	Iaer object (368)	3		12	1
1687	2018-11-16 13:28:18.306664+08	367	Iaer object (367)	3		12	1
1688	2018-11-16 13:28:18.317927+08	366	Iaer object (366)	3		12	1
1689	2018-11-16 13:28:18.327812+08	365	Iaer object (365)	3		12	1
1690	2018-11-16 13:28:18.336205+08	364	Iaer object (364)	3		12	1
1691	2018-11-16 13:28:18.34459+08	363	Iaer object (363)	3		12	1
1692	2018-11-16 13:28:18.360941+08	362	Iaer object (362)	3		12	1
1693	2018-11-16 13:28:18.374404+08	361	Iaer object (361)	3		12	1
1694	2018-11-16 13:28:18.385168+08	360	Iaer object (360)	3		12	1
1695	2018-11-16 13:28:18.396636+08	359	Iaer object (359)	3		12	1
1696	2018-11-16 13:28:18.40747+08	358	Iaer object (358)	3		12	1
1697	2018-11-16 13:28:18.415412+08	357	Iaer object (357)	3		12	1
1698	2018-11-16 13:28:18.437244+08	356	Iaer object (356)	3		12	1
1699	2018-11-16 13:28:18.448528+08	355	Iaer object (355)	3		12	1
1700	2018-11-16 13:28:18.458259+08	354	Iaer object (354)	3		12	1
1701	2018-11-16 13:28:18.471223+08	353	Iaer object (353)	3		12	1
1702	2018-11-16 13:28:18.481651+08	352	Iaer object (352)	3		12	1
1703	2018-11-16 13:28:18.496452+08	351	Iaer object (351)	3		12	1
1704	2018-11-16 13:28:18.507998+08	350	Iaer object (350)	3		12	1
1705	2018-11-16 13:28:18.519455+08	349	Iaer object (349)	3		12	1
1706	2018-11-16 13:28:18.532512+08	348	Iaer object (348)	3		12	1
1707	2018-11-16 13:28:18.54808+08	347	Iaer object (347)	3		12	1
1708	2018-11-16 13:28:18.55842+08	346	Iaer object (346)	3		12	1
1709	2018-11-16 13:28:18.581204+08	345	Iaer object (345)	3		12	1
1710	2018-11-16 13:28:18.59216+08	344	Iaer object (344)	3		12	1
1711	2018-11-16 13:28:18.602967+08	343	Iaer object (343)	3		12	1
1712	2018-11-16 13:28:18.615426+08	342	Iaer object (342)	3		12	1
1713	2018-11-16 13:28:18.630254+08	341	Iaer object (341)	3		12	1
1714	2018-11-16 13:28:18.639636+08	340	Iaer object (340)	3		12	1
1715	2018-11-16 13:28:18.647667+08	339	Iaer object (339)	3		12	1
1716	2018-11-16 13:28:18.661236+08	338	Iaer object (338)	3		12	1
1717	2018-11-16 13:28:18.672211+08	337	Iaer object (337)	3		12	1
1718	2018-11-16 13:28:18.679788+08	336	Iaer object (336)	3		12	1
1719	2018-11-16 13:28:18.69704+08	335	Iaer object (335)	3		12	1
1720	2018-11-16 13:28:18.726714+08	334	Iaer object (334)	3		12	1
1721	2018-11-16 13:28:18.734831+08	333	Iaer object (333)	3		12	1
1722	2018-11-16 13:28:18.745451+08	332	Iaer object (332)	3		12	1
1723	2018-11-16 13:28:18.755422+08	331	Iaer object (331)	3		12	1
1724	2018-11-16 13:28:18.762576+08	330	Iaer object (330)	3		12	1
1725	2018-11-16 13:28:18.769813+08	329	Iaer object (329)	3		12	1
1726	2018-11-16 13:28:18.786044+08	328	Iaer object (328)	3		12	1
1727	2018-11-16 13:28:18.793744+08	327	Iaer object (327)	3		12	1
1728	2018-11-16 13:28:18.800806+08	326	Iaer object (326)	3		12	1
1729	2018-11-16 13:28:18.811505+08	325	Iaer object (325)	3		12	1
1730	2018-11-16 13:28:18.820081+08	324	Iaer object (324)	3		12	1
1731	2018-11-16 13:28:18.841296+08	323	Iaer object (323)	3		12	1
1732	2018-11-16 13:28:18.848562+08	322	Iaer object (322)	3		12	1
1733	2018-11-16 13:28:18.856183+08	321	Iaer object (321)	3		12	1
1734	2018-11-16 13:28:18.866901+08	320	Iaer object (320)	3		12	1
1735	2018-11-16 13:28:18.879538+08	319	Iaer object (319)	3		12	1
1736	2018-11-16 13:28:18.891812+08	318	Iaer object (318)	3		12	1
1737	2018-11-16 13:28:18.904752+08	317	Iaer object (317)	3		12	1
1738	2018-11-16 13:28:18.912145+08	316	Iaer object (316)	3		12	1
1739	2018-11-16 13:28:18.922434+08	315	Iaer object (315)	3		12	1
1740	2018-11-16 13:28:18.933593+08	314	Iaer object (314)	3		12	1
1741	2018-11-16 13:28:18.941049+08	313	Iaer object (313)	3		12	1
1742	2018-11-16 13:28:18.948441+08	312	Iaer object (312)	3		12	1
1743	2018-11-16 13:28:18.956297+08	311	Iaer object (311)	3		12	1
1744	2018-11-16 13:28:18.964032+08	310	Iaer object (310)	3		12	1
1745	2018-11-16 13:28:18.971421+08	309	Iaer object (309)	3		12	1
1746	2018-11-16 13:28:18.978828+08	308	Iaer object (308)	3		12	1
1747	2018-11-16 13:28:18.986135+08	307	Iaer object (307)	3		12	1
1748	2018-11-16 13:28:18.998422+08	306	Iaer object (306)	3		12	1
1749	2018-11-16 13:28:19.006385+08	305	Iaer object (305)	3		12	1
1750	2018-11-16 13:28:19.014004+08	304	Iaer object (304)	3		12	1
1751	2018-11-16 13:28:19.02496+08	303	Iaer object (303)	3		12	1
1752	2018-11-16 13:28:19.035344+08	302	Iaer object (302)	3		12	1
1753	2018-11-16 13:28:19.049772+08	301	Iaer object (301)	3		12	1
1754	2018-11-16 13:28:19.069615+08	300	Iaer object (300)	3		12	1
1755	2018-11-16 13:28:19.081127+08	299	Iaer object (299)	3		12	1
1756	2018-11-16 13:28:19.090572+08	298	Iaer object (298)	3		12	1
1757	2018-11-16 13:28:19.0979+08	297	Iaer object (297)	3		12	1
1758	2018-11-16 13:28:19.10517+08	296	Iaer object (296)	3		12	1
1759	2018-11-16 13:28:19.118009+08	295	Iaer object (295)	3		12	1
1760	2018-11-16 13:28:19.12799+08	294	Iaer object (294)	3		12	1
1761	2018-11-16 13:28:19.13569+08	293	Iaer object (293)	3		12	1
1762	2018-11-16 13:28:19.14947+08	292	Iaer object (292)	3		12	1
1763	2018-11-16 13:28:19.159922+08	291	Iaer object (291)	3		12	1
1764	2018-11-16 13:28:19.167126+08	290	Iaer object (290)	3		12	1
1765	2018-11-16 13:28:19.181913+08	289	Iaer object (289)	3		12	1
1766	2018-11-16 13:28:19.189845+08	288	Iaer object (288)	3		12	1
1767	2018-11-16 13:28:19.197143+08	287	Iaer object (287)	3		12	1
1768	2018-11-16 13:28:19.212304+08	286	Iaer object (286)	3		12	1
1769	2018-11-16 13:28:19.225913+08	285	Iaer object (285)	3		12	1
1770	2018-11-16 13:28:19.236978+08	284	Iaer object (284)	3		12	1
1771	2018-11-16 13:28:19.24435+08	283	Iaer object (283)	3		12	1
1772	2018-11-16 13:28:19.251537+08	282	Iaer object (282)	3		12	1
1773	2018-11-16 13:28:19.259226+08	281	Iaer object (281)	3		12	1
1774	2018-11-16 13:28:19.267725+08	280	Iaer object (280)	3		12	1
1775	2018-11-16 13:28:19.279362+08	279	Iaer object (279)	3		12	1
1776	2018-11-16 13:28:19.286656+08	278	Iaer object (278)	3		12	1
1777	2018-11-16 13:28:19.295499+08	277	Iaer object (277)	3		12	1
1778	2018-11-16 13:28:19.305483+08	276	Iaer object (276)	3		12	1
1779	2018-11-16 13:28:19.312875+08	275	Iaer object (275)	3		12	1
1780	2018-11-16 13:28:19.320099+08	274	Iaer object (274)	3		12	1
1781	2018-11-16 13:28:19.33134+08	273	Iaer object (273)	3		12	1
1782	2018-11-16 13:28:19.346702+08	272	Iaer object (272)	3		12	1
1783	2018-11-16 13:28:19.355163+08	271	Iaer object (271)	3		12	1
1784	2018-11-16 13:28:19.364044+08	270	Iaer object (270)	3		12	1
1785	2018-11-16 13:28:19.372112+08	269	Iaer object (269)	3		12	1
1786	2018-11-16 13:28:19.3905+08	268	Iaer object (268)	3		12	1
1787	2018-11-16 13:28:19.397537+08	267	Iaer object (267)	3		12	1
1788	2018-11-16 13:28:19.413437+08	266	Iaer object (266)	3		12	1
1789	2018-11-16 13:28:19.42894+08	265	Iaer object (265)	3		12	1
1790	2018-11-16 13:28:19.439422+08	264	Iaer object (264)	3		12	1
1791	2018-11-16 13:28:19.446666+08	263	Iaer object (263)	3		12	1
1792	2018-11-16 13:28:19.455482+08	262	Iaer object (262)	3		12	1
1793	2018-11-16 13:28:19.464702+08	261	Iaer object (261)	3		12	1
1794	2018-11-16 13:28:19.472+08	260	Iaer object (260)	3		12	1
1795	2018-11-16 13:28:19.479536+08	259	Iaer object (259)	3		12	1
1796	2018-11-16 13:28:19.487382+08	258	Iaer object (258)	3		12	1
1797	2018-11-16 13:28:19.494663+08	257	Iaer object (257)	3		12	1
1798	2018-11-16 13:28:19.502117+08	256	Iaer object (256)	3		12	1
1799	2018-11-16 13:28:19.510231+08	255	Iaer object (255)	3		12	1
1800	2018-11-16 13:28:19.521015+08	254	Iaer object (254)	3		12	1
1801	2018-11-16 13:28:19.536092+08	253	Iaer object (253)	3		12	1
1802	2018-11-16 13:28:19.546789+08	252	Iaer object (252)	3		12	1
1803	2018-11-16 13:28:19.568723+08	251	Iaer object (251)	3		12	1
1804	2018-11-16 13:28:19.591293+08	250	Iaer object (250)	3		12	1
1805	2018-11-16 13:28:19.608124+08	249	Iaer object (249)	3		12	1
1806	2018-11-16 13:28:19.625947+08	248	Iaer object (248)	3		12	1
1807	2018-11-16 13:28:19.642293+08	247	Iaer object (247)	3		12	1
1808	2018-11-16 13:28:19.653671+08	246	Iaer object (246)	3		12	1
1809	2018-11-16 13:28:19.664851+08	245	Iaer object (245)	3		12	1
1810	2018-11-16 13:28:19.675834+08	244	Iaer object (244)	3		12	1
1811	2018-11-16 13:28:19.68925+08	243	Iaer object (243)	3		12	1
1812	2018-11-16 13:28:19.700605+08	242	Iaer object (242)	3		12	1
1813	2018-11-16 13:28:19.71156+08	241	Iaer object (241)	3		12	1
1814	2018-11-16 13:28:19.722178+08	240	Iaer object (240)	3		12	1
1815	2018-11-16 13:28:19.746647+08	239	Iaer object (239)	3		12	1
1816	2018-11-16 13:28:19.757096+08	238	Iaer object (238)	3		12	1
1817	2018-11-16 13:28:19.79787+08	237	Iaer object (237)	3		12	1
1818	2018-11-16 13:28:19.840152+08	236	Iaer object (236)	3		12	1
1819	2018-11-16 13:28:19.860928+08	235	Iaer object (235)	3		12	1
1820	2018-11-16 13:28:19.871565+08	234	Iaer object (234)	3		12	1
1821	2018-11-16 13:28:19.895955+08	233	Iaer object (233)	3		12	1
1822	2018-11-16 13:28:19.931874+08	232	Iaer object (232)	3		12	1
1823	2018-11-16 13:28:19.945+08	231	Iaer object (231)	3		12	1
1824	2018-11-16 13:28:19.955619+08	230	Iaer object (230)	3		12	1
1825	2018-11-16 13:28:19.982241+08	229	Iaer object (229)	3		12	1
1826	2018-11-16 13:28:20.004859+08	228	Iaer object (228)	3		12	1
1827	2018-11-16 13:28:20.018223+08	227	Iaer object (227)	3		12	1
1828	2018-11-16 13:28:20.031234+08	226	Iaer object (226)	3		12	1
1829	2018-11-16 13:28:20.050322+08	225	Iaer object (225)	3		12	1
1830	2018-11-16 13:28:20.064962+08	224	Iaer object (224)	3		12	1
1831	2018-11-16 13:28:20.074514+08	223	Iaer object (223)	3		12	1
1832	2018-11-16 13:28:20.090948+08	222	Iaer object (222)	3		12	1
1833	2018-11-16 13:28:20.105152+08	221	Iaer object (221)	3		12	1
1834	2018-11-16 13:28:20.119277+08	220	Iaer object (220)	3		12	1
1835	2018-11-16 13:28:20.128908+08	219	Iaer object (219)	3		12	1
1836	2018-11-16 13:28:20.175656+08	218	Iaer object (218)	3		12	1
1837	2018-11-16 13:28:20.196038+08	217	Iaer object (217)	3		12	1
1838	2018-11-16 13:28:20.214904+08	216	Iaer object (216)	3		12	1
1839	2018-11-16 13:28:20.226868+08	215	Iaer object (215)	3		12	1
1840	2018-11-16 13:28:20.245331+08	214	Iaer object (214)	3		12	1
1841	2018-11-16 13:28:20.257941+08	213	Iaer object (213)	3		12	1
1842	2018-11-16 13:28:20.281915+08	212	Iaer object (212)	3		12	1
1843	2018-11-16 13:28:20.297741+08	211	Iaer object (211)	3		12	1
1844	2018-11-16 13:28:20.312828+08	210	Iaer object (210)	3		12	1
1845	2018-11-16 13:28:20.36819+08	209	Iaer object (209)	3		12	1
1846	2018-11-16 13:28:20.390654+08	208	Iaer object (208)	3		12	1
1847	2018-11-16 13:28:20.434435+08	207	Iaer object (207)	3		12	1
1848	2018-11-16 13:28:20.446785+08	206	Iaer object (206)	3		12	1
1849	2018-11-16 13:28:20.461468+08	205	Iaer object (205)	3		12	1
1850	2018-11-16 13:28:20.495157+08	204	Iaer object (204)	3		12	1
1851	2018-11-16 13:28:20.512219+08	203	Iaer object (203)	3		12	1
1852	2018-11-16 13:28:20.527874+08	202	Iaer object (202)	3		12	1
1853	2018-11-16 13:28:20.542126+08	201	Iaer object (201)	3		12	1
1854	2018-11-16 13:28:20.562109+08	200	Iaer object (200)	3		12	1
1855	2018-11-16 13:28:20.576524+08	199	Iaer object (199)	3		12	1
1856	2018-11-16 13:28:20.586789+08	198	Iaer object (198)	3		12	1
1857	2018-11-16 13:28:20.595037+08	197	Iaer object (197)	3		12	1
1858	2018-11-16 13:28:20.609422+08	196	Iaer object (196)	3		12	1
1859	2018-11-16 13:28:20.617368+08	195	Iaer object (195)	3		12	1
1860	2018-11-16 13:28:20.632606+08	194	Iaer object (194)	3		12	1
1861	2018-11-16 13:28:20.655471+08	193	Iaer object (193)	3		12	1
1862	2018-11-16 13:28:20.666802+08	192	Iaer object (192)	3		12	1
1863	2018-11-16 13:28:20.681433+08	191	Iaer object (191)	3		12	1
1864	2018-11-16 13:28:20.702655+08	190	Iaer object (190)	3		12	1
1865	2018-11-16 13:28:20.712216+08	189	Iaer object (189)	3		12	1
1866	2018-11-16 13:28:20.724891+08	188	Iaer object (188)	3		12	1
1867	2018-11-16 13:28:20.75537+08	187	Iaer object (187)	3		12	1
1868	2018-11-16 13:28:20.767692+08	186	Iaer object (186)	3		12	1
1869	2018-11-16 13:28:20.775541+08	185	Iaer object (185)	3		12	1
1870	2018-11-16 13:28:20.783483+08	184	Iaer object (184)	3		12	1
1871	2018-11-16 13:28:20.80346+08	183	Iaer object (183)	3		12	1
1872	2018-11-16 13:28:20.815233+08	182	Iaer object (182)	3		12	1
1873	2018-11-16 13:28:20.825897+08	181	Iaer object (181)	3		12	1
1874	2018-11-16 13:28:20.835657+08	180	Iaer object (180)	3		12	1
1875	2018-11-16 13:28:20.843679+08	179	Iaer object (179)	3		12	1
1876	2018-11-16 13:28:20.863591+08	178	Iaer object (178)	3		12	1
1877	2018-11-16 13:28:20.876456+08	177	Iaer object (177)	3		12	1
1878	2018-11-16 13:28:20.886366+08	176	Iaer object (176)	3		12	1
1879	2018-11-16 13:28:20.89364+08	175	Iaer object (175)	3		12	1
1880	2018-11-16 13:28:20.905201+08	174	Iaer object (174)	3		12	1
1881	2018-11-16 13:28:20.914475+08	173	Iaer object (173)	3		12	1
1882	2018-11-16 13:28:20.938417+08	172	Iaer object (172)	3		12	1
1883	2018-11-16 13:28:20.955267+08	171	Iaer object (171)	3		12	1
1884	2018-11-16 13:28:20.995856+08	170	Iaer object (170)	3		12	1
1885	2018-11-16 13:28:21.007025+08	169	Iaer object (169)	3		12	1
1886	2018-11-16 13:28:21.017693+08	168	Iaer object (168)	3		12	1
1887	2018-11-16 13:28:21.043838+08	167	Iaer object (167)	3		12	1
1888	2018-11-16 13:28:21.056419+08	166	Iaer object (166)	3		12	1
1889	2018-11-16 13:28:21.066586+08	165	Iaer object (165)	3		12	1
1890	2018-11-16 13:28:21.080652+08	164	Iaer object (164)	3		12	1
1891	2018-11-16 13:28:21.101197+08	163	Iaer object (163)	3		12	1
1892	2018-11-16 13:28:21.111389+08	162	Iaer object (162)	3		12	1
1893	2018-11-16 13:28:21.121695+08	161	Iaer object (161)	3		12	1
1894	2018-11-16 13:28:21.131885+08	160	Iaer object (160)	3		12	1
1895	2018-11-16 13:28:21.142406+08	159	Iaer object (159)	3		12	1
1896	2018-11-16 13:28:21.15091+08	158	Iaer object (158)	3		12	1
1897	2018-11-16 13:28:21.164906+08	157	Iaer object (157)	3		12	1
1898	2018-11-16 13:28:21.176612+08	156	Iaer object (156)	3		12	1
1899	2018-11-16 13:28:21.190326+08	155	Iaer object (155)	3		12	1
1900	2018-11-16 13:28:21.201356+08	154	Iaer object (154)	3		12	1
1901	2018-11-16 13:28:21.211527+08	153	Iaer object (153)	3		12	1
1902	2018-11-16 13:28:21.22184+08	152	Iaer object (152)	3		12	1
1903	2018-11-16 13:28:21.237251+08	151	Iaer object (151)	3		12	1
1904	2018-11-16 13:28:21.249508+08	150	Iaer object (150)	3		12	1
1905	2018-11-16 13:28:21.259827+08	149	Iaer object (149)	3		12	1
1906	2018-11-16 13:28:21.270077+08	148	Iaer object (148)	3		12	1
1907	2018-11-16 13:28:21.284073+08	147	Iaer object (147)	3		12	1
1908	2018-11-16 13:28:21.294687+08	146	Iaer object (146)	3		12	1
1909	2018-11-16 13:28:21.306196+08	145	Iaer object (145)	3		12	1
1910	2018-11-16 13:28:21.315828+08	144	Iaer object (144)	3		12	1
1911	2018-11-16 13:28:21.32342+08	143	Iaer object (143)	3		12	1
1912	2018-11-16 13:28:21.331449+08	142	Iaer object (142)	3		12	1
1913	2018-11-16 13:28:21.345134+08	141	Iaer object (141)	3		12	1
1914	2018-11-16 13:28:21.356597+08	140	Iaer object (140)	3		12	1
1915	2018-11-16 13:28:21.384119+08	139	Iaer object (139)	3		12	1
1916	2018-11-16 13:28:21.395943+08	138	Iaer object (138)	3		12	1
1917	2018-11-16 13:28:21.406048+08	137	Iaer object (137)	3		12	1
1918	2018-11-16 13:28:21.418358+08	136	Iaer object (136)	3		12	1
1919	2018-11-16 13:28:21.431144+08	135	Iaer object (135)	3		12	1
1920	2018-11-16 13:28:21.441626+08	134	Iaer object (134)	3		12	1
1921	2018-11-16 13:28:21.449528+08	133	Iaer object (133)	3		12	1
1922	2018-11-16 13:28:21.458496+08	132	Iaer object (132)	3		12	1
1923	2018-11-16 13:28:21.468274+08	131	Iaer object (131)	3		12	1
1924	2018-11-16 13:28:21.478077+08	130	Iaer object (130)	3		12	1
1925	2018-11-16 13:28:21.488822+08	129	Iaer object (129)	3		12	1
1926	2018-11-16 13:28:21.498349+08	128	Iaer object (128)	3		12	1
1927	2018-11-16 13:28:21.506131+08	127	Iaer object (127)	3		12	1
1928	2018-11-16 13:28:21.513503+08	126	Iaer object (126)	3		12	1
1929	2018-11-16 13:28:21.53164+08	125	Iaer object (125)	3		12	1
1930	2018-11-16 13:28:21.544604+08	124	Iaer object (124)	3		12	1
1931	2018-11-16 13:28:21.555661+08	123	Iaer object (123)	3		12	1
1932	2018-11-16 13:28:21.565611+08	122	Iaer object (122)	3		12	1
1933	2018-11-16 13:28:21.574586+08	121	Iaer object (121)	3		12	1
1934	2018-11-16 13:28:21.582933+08	120	Iaer object (120)	3		12	1
1935	2018-11-16 13:28:21.593086+08	119	Iaer object (119)	3		12	1
1936	2018-11-16 13:28:21.606985+08	118	Iaer object (118)	3		12	1
1937	2018-11-16 13:28:21.632182+08	117	Iaer object (117)	3		12	1
1938	2018-11-16 13:28:21.644479+08	116	Iaer object (116)	3		12	1
1939	2018-11-16 13:28:21.664332+08	115	Iaer object (115)	3		12	1
1940	2018-11-16 13:28:21.67517+08	114	Iaer object (114)	3		12	1
1941	2018-11-16 13:28:21.685215+08	113	Iaer object (113)	3		12	1
1942	2018-11-16 13:28:21.695061+08	112	Iaer object (112)	3		12	1
1943	2018-11-16 13:28:21.712288+08	111	Iaer object (111)	3		12	1
1944	2018-11-16 13:28:21.720102+08	110	Iaer object (110)	3		12	1
1945	2018-11-16 13:28:21.730825+08	109	Iaer object (109)	3		12	1
1946	2018-11-16 13:28:21.745129+08	108	Iaer object (108)	3		12	1
1947	2018-11-16 13:28:21.756583+08	107	Iaer object (107)	3		12	1
1948	2018-11-16 13:28:21.771802+08	106	Iaer object (106)	3		12	1
1949	2018-11-16 13:28:21.785642+08	105	Iaer object (105)	3		12	1
1950	2018-11-16 13:28:21.816482+08	104	Iaer object (104)	3		12	1
1951	2018-11-16 13:28:21.825554+08	103	Iaer object (103)	3		12	1
1952	2018-11-16 13:28:21.835832+08	102	Iaer object (102)	3		12	1
1953	2018-11-16 13:28:21.846153+08	101	Iaer object (101)	3		12	1
1954	2018-11-16 13:28:21.860857+08	100	Iaer object (100)	3		12	1
1955	2018-11-16 13:28:21.872018+08	99	Iaer object (99)	3		12	1
1956	2018-11-16 13:28:21.882406+08	98	Iaer object (98)	3		12	1
1957	2018-11-16 13:28:21.893468+08	97	Iaer object (97)	3		12	1
1958	2018-11-16 13:28:21.903632+08	96	Iaer object (96)	3		12	1
1959	2018-11-16 13:28:21.916528+08	95	Iaer object (95)	3		12	1
1960	2018-11-16 13:28:21.930451+08	94	Iaer object (94)	3		12	1
1961	2018-11-16 13:28:21.945072+08	93	Iaer object (93)	3		12	1
1962	2018-11-16 13:28:21.97049+08	92	Iaer object (92)	3		12	1
1963	2018-11-16 13:28:21.981019+08	91	Iaer object (91)	3		12	1
1964	2018-11-16 13:28:21.996789+08	90	Iaer object (90)	3		12	1
1965	2018-11-16 13:28:22.00906+08	89	Iaer object (89)	3		12	1
1966	2018-11-16 13:28:22.017692+08	88	Iaer object (88)	3		12	1
1967	2018-11-16 13:28:22.028943+08	87	Iaer object (87)	3		12	1
1968	2018-11-16 13:28:22.051861+08	86	Iaer object (86)	3		12	1
1969	2018-11-16 13:28:22.074596+08	85	Iaer object (85)	3		12	1
1970	2018-11-16 13:28:22.094081+08	84	Iaer object (84)	3		12	1
1971	2018-11-16 13:28:22.114057+08	83	Iaer object (83)	3		12	1
1972	2018-11-16 13:28:22.126772+08	82	Iaer object (82)	3		12	1
1973	2018-11-16 13:28:22.143617+08	81	Iaer object (81)	3		12	1
1974	2018-11-16 13:28:22.167377+08	80	Iaer object (80)	3		12	1
1975	2018-11-16 13:28:22.194421+08	79	Iaer object (79)	3		12	1
1976	2018-11-16 13:28:22.222282+08	78	Iaer object (78)	3		12	1
1977	2018-11-16 13:28:22.277823+08	77	Iaer object (77)	3		12	1
1978	2018-11-16 13:28:22.30657+08	76	Iaer object (76)	3		12	1
1979	2018-11-16 13:28:22.321248+08	75	Iaer object (75)	3		12	1
1980	2018-11-16 13:28:22.339953+08	74	Iaer object (74)	3		12	1
1981	2018-11-16 13:28:22.359768+08	73	Iaer object (73)	3		12	1
1982	2018-11-16 13:28:22.382592+08	72	Iaer object (72)	3		12	1
1983	2018-11-16 13:28:22.394118+08	71	Iaer object (71)	3		12	1
1984	2018-11-16 13:28:22.405943+08	70	Iaer object (70)	3		12	1
1985	2018-11-16 13:28:22.426517+08	69	Iaer object (69)	3		12	1
1986	2018-11-16 13:28:22.477196+08	68	Iaer object (68)	3		12	1
1987	2018-11-16 13:28:22.488868+08	67	Iaer object (67)	3		12	1
1988	2018-11-16 13:28:22.506415+08	66	Iaer object (66)	3		12	1
1989	2018-11-16 13:28:22.520737+08	65	Iaer object (65)	3		12	1
1990	2018-11-16 13:28:22.528514+08	64	Iaer object (64)	3		12	1
1991	2018-11-16 13:28:22.535625+08	63	Iaer object (63)	3		12	1
1992	2018-11-16 13:28:22.546211+08	62	Iaer object (62)	3		12	1
1993	2018-11-16 13:28:22.585584+08	61	Iaer object (61)	3		12	1
1994	2018-11-16 13:28:22.595644+08	60	Iaer object (60)	3		12	1
1995	2018-11-16 13:28:22.625933+08	59	Iaer object (59)	3		12	1
1996	2018-11-16 13:28:22.634238+08	58	Iaer object (58)	3		12	1
1997	2018-11-16 13:28:22.647918+08	57	Iaer object (57)	3		12	1
1998	2018-11-16 13:28:22.655495+08	56	Iaer object (56)	3		12	1
1999	2018-11-16 13:28:22.664853+08	55	Iaer object (55)	3		12	1
2000	2018-11-16 13:28:22.677468+08	54	Iaer object (54)	3		12	1
2001	2018-11-16 13:28:22.685473+08	53	Iaer object (53)	3		12	1
2002	2018-11-16 13:28:22.705743+08	52	Iaer object (52)	3		12	1
2003	2018-11-16 13:28:22.715685+08	51	Iaer object (51)	3		12	1
2004	2018-11-16 13:28:22.723013+08	50	Iaer object (50)	3		12	1
2005	2018-11-16 13:28:22.732362+08	49	Iaer object (49)	3		12	1
2006	2018-11-16 13:28:22.748447+08	48	Iaer object (48)	3		12	1
2007	2018-11-16 13:28:22.762705+08	47	Iaer object (47)	3		12	1
2008	2018-11-16 13:28:22.777305+08	46	Iaer object (46)	3		12	1
2009	2018-11-16 13:28:22.787235+08	45	Iaer object (45)	3		12	1
2010	2018-11-16 13:28:22.797674+08	44	Iaer object (44)	3		12	1
2011	2018-11-16 13:28:22.805212+08	43	Iaer object (43)	3		12	1
2012	2018-11-16 13:28:22.816237+08	42	Iaer object (42)	3		12	1
2013	2018-11-16 13:28:22.823842+08	41	Iaer object (41)	3		12	1
2014	2018-11-16 13:28:22.833539+08	40	Iaer object (40)	3		12	1
2015	2018-11-16 13:28:22.844553+08	39	Iaer object (39)	3		12	1
2016	2018-11-16 13:28:22.857049+08	38	Iaer object (38)	3		12	1
2017	2018-11-16 13:28:22.872909+08	37	Iaer object (37)	3		12	1
2018	2018-11-16 13:28:22.880388+08	36	Iaer object (36)	3		12	1
2019	2018-11-16 13:28:22.901021+08	35	Iaer object (35)	3		12	1
2020	2018-11-16 13:28:22.911599+08	34	Iaer object (34)	3		12	1
2021	2018-11-16 13:28:22.923369+08	33	Iaer object (33)	3		12	1
2022	2018-11-16 13:28:22.934023+08	32	Iaer object (32)	3		12	1
2023	2018-11-16 13:28:22.941688+08	31	Iaer object (31)	3		12	1
2024	2018-11-16 13:28:22.955865+08	30	Iaer object (30)	3		12	1
2025	2018-11-16 13:28:22.970063+08	29	Iaer object (29)	3		12	1
2026	2018-11-16 13:28:22.993121+08	28	Iaer object (28)	3		12	1
2027	2018-11-16 13:28:23.004275+08	27	Iaer object (27)	3		12	1
2028	2018-11-16 13:28:23.015093+08	26	Iaer object (26)	3		12	1
2029	2018-11-16 13:28:23.02256+08	25	Iaer object (25)	3		12	1
2030	2018-11-16 13:28:23.030186+08	24	Iaer object (24)	3		12	1
2031	2018-11-16 13:28:23.038076+08	23	Iaer object (23)	3		12	1
2032	2018-11-16 13:28:23.047578+08	22	Iaer object (22)	3		12	1
2033	2018-11-16 13:28:23.055098+08	21	Iaer object (21)	3		12	1
2034	2018-11-16 13:28:23.06522+08	20	Iaer object (20)	3		12	1
2035	2018-11-16 13:28:23.073181+08	19	Iaer object (19)	3		12	1
2036	2018-11-16 13:28:23.081238+08	18	Iaer object (18)	3		12	1
2037	2018-11-16 13:28:23.091473+08	17	Iaer object (17)	3		12	1
2038	2018-11-16 13:28:23.103408+08	16	Iaer object (16)	3		12	1
2039	2018-11-16 13:28:23.113125+08	15	Iaer object (15)	3		12	1
2040	2018-11-16 13:28:23.120482+08	14	Iaer object (14)	3		12	1
2041	2018-11-16 13:28:23.127973+08	13	Iaer object (13)	3		12	1
2042	2018-11-16 13:28:23.136985+08	12	Iaer object (12)	3		12	1
2043	2018-11-16 13:28:23.150138+08	11	Iaer object (11)	3		12	1
2044	2018-11-16 13:28:23.15804+08	10	Iaer object (10)	3		12	1
2045	2018-11-16 13:28:23.165911+08	9	Iaer object (9)	3		12	1
2046	2018-11-16 13:28:23.180426+08	8	Iaer object (8)	3		12	1
2047	2018-11-16 13:28:23.187807+08	7	Iaer object (7)	3		12	1
2048	2018-11-16 13:28:23.195781+08	6	Iaer object (6)	3		12	1
2049	2018-11-16 13:28:23.203185+08	5	Iaer object (5)	3		12	1
2050	2018-11-16 13:28:23.21138+08	4	Iaer object (4)	3		12	1
2051	2018-11-16 13:28:23.220824+08	3	Iaer object (3)	3		12	1
2052	2018-11-16 13:28:23.231572+08	2	Iaer object (2)	3		12	1
2053	2018-11-16 13:28:23.238977+08	1	Iaer object (1)	3		12	1
2054	2018-11-16 13:35:04.037393+08	963	Iaer object (963)	3		12	1
2055	2018-11-16 13:35:04.053603+08	878	Iaer object (878)	3		12	1
2056	2018-11-16 13:35:04.064581+08	962	Iaer object (962)	3		12	1
2057	2018-11-16 13:35:04.074694+08	877	Iaer object (877)	3		12	1
2058	2018-11-16 13:35:04.082125+08	961	Iaer object (961)	3		12	1
2059	2018-11-16 13:35:04.090648+08	876	Iaer object (876)	3		12	1
2060	2018-11-16 13:35:04.100326+08	960	Iaer object (960)	3		12	1
2061	2018-11-16 13:35:04.107908+08	875	Iaer object (875)	3		12	1
2062	2018-11-16 13:35:04.115007+08	959	Iaer object (959)	3		12	1
2063	2018-11-16 13:35:04.128059+08	874	Iaer object (874)	3		12	1
2064	2018-11-16 13:35:04.139153+08	958	Iaer object (958)	3		12	1
2065	2018-11-16 13:35:04.15006+08	873	Iaer object (873)	3		12	1
2066	2018-11-16 13:35:04.162515+08	957	Iaer object (957)	3		12	1
2067	2018-11-16 13:35:04.180886+08	872	Iaer object (872)	3		12	1
2068	2018-11-16 13:35:04.193214+08	956	Iaer object (956)	3		12	1
2069	2018-11-16 13:35:04.200604+08	871	Iaer object (871)	3		12	1
2070	2018-11-16 13:35:04.211394+08	955	Iaer object (955)	3		12	1
2071	2018-11-16 13:35:04.220754+08	870	Iaer object (870)	3		12	1
2072	2018-11-16 13:35:04.228232+08	954	Iaer object (954)	3		12	1
2073	2018-11-16 13:35:04.235337+08	869	Iaer object (869)	3		12	1
2074	2018-11-16 13:35:04.248917+08	953	Iaer object (953)	3		12	1
2075	2018-11-16 13:35:04.256137+08	868	Iaer object (868)	3		12	1
2076	2018-11-16 13:35:04.273378+08	952	Iaer object (952)	3		12	1
2077	2018-11-16 13:35:04.282527+08	867	Iaer object (867)	3		12	1
2078	2018-11-16 13:35:04.290158+08	951	Iaer object (951)	3		12	1
2079	2018-11-16 13:35:04.300399+08	866	Iaer object (866)	3		12	1
2080	2018-11-16 13:35:04.310088+08	950	Iaer object (950)	3		12	1
2081	2018-11-16 13:35:04.317417+08	865	Iaer object (865)	3		12	1
2082	2018-11-16 13:35:04.325603+08	949	Iaer object (949)	3		12	1
2083	2018-11-16 13:35:04.348275+08	864	Iaer object (864)	3		12	1
2084	2018-11-16 13:35:04.355237+08	948	Iaer object (948)	3		12	1
2085	2018-11-16 13:35:04.364481+08	863	Iaer object (863)	3		12	1
2086	2018-11-16 13:35:04.374292+08	947	Iaer object (947)	3		12	1
2087	2018-11-16 13:35:04.381712+08	862	Iaer object (862)	3		12	1
2088	2018-11-16 13:35:04.388928+08	946	Iaer object (946)	3		12	1
2089	2018-11-16 13:35:04.39991+08	861	Iaer object (861)	3		12	1
2090	2018-11-16 13:35:04.407268+08	945	Iaer object (945)	3		12	1
2091	2018-11-16 13:35:04.414612+08	860	Iaer object (860)	3		12	1
2092	2018-11-16 13:35:04.421748+08	944	Iaer object (944)	3		12	1
2093	2018-11-16 13:35:04.43238+08	859	Iaer object (859)	3		12	1
2094	2018-11-16 13:35:04.439772+08	943	Iaer object (943)	3		12	1
2095	2018-11-16 13:35:04.44703+08	858	Iaer object (858)	3		12	1
2096	2018-11-16 13:35:04.454545+08	942	Iaer object (942)	3		12	1
2097	2018-11-16 13:35:04.462723+08	857	Iaer object (857)	3		12	1
2098	2018-11-16 13:35:04.470693+08	941	Iaer object (941)	3		12	1
2099	2018-11-16 13:35:04.480449+08	856	Iaer object (856)	3		12	1
2100	2018-11-16 13:35:04.491403+08	940	Iaer object (940)	3		12	1
2101	2018-11-16 13:35:04.502479+08	855	Iaer object (855)	3		12	1
2102	2018-11-16 13:35:04.51735+08	939	Iaer object (939)	3		12	1
2103	2018-11-16 13:35:04.524838+08	854	Iaer object (854)	3		12	1
2104	2018-11-16 13:35:04.532296+08	938	Iaer object (938)	3		12	1
2105	2018-11-16 13:35:04.53985+08	853	Iaer object (853)	3		12	1
2106	2018-11-16 13:35:04.547606+08	937	Iaer object (937)	3		12	1
2107	2018-11-16 13:35:04.55484+08	852	Iaer object (852)	3		12	1
2108	2018-11-16 13:35:04.562393+08	936	Iaer object (936)	3		12	1
2109	2018-11-16 13:35:04.572527+08	851	Iaer object (851)	3		12	1
2110	2018-11-16 13:35:04.582587+08	935	Iaer object (935)	3		12	1
2111	2018-11-16 13:35:04.589948+08	850	Iaer object (850)	3		12	1
2112	2018-11-16 13:35:04.59728+08	934	Iaer object (934)	3		12	1
2113	2018-11-16 13:35:04.604571+08	849	Iaer object (849)	3		12	1
2114	2018-11-16 13:35:04.612719+08	933	Iaer object (933)	3		12	1
2115	2018-11-16 13:35:04.619946+08	848	Iaer object (848)	3		12	1
2116	2018-11-16 13:35:04.627376+08	932	Iaer object (932)	3		12	1
2117	2018-11-16 13:35:04.637875+08	847	Iaer object (847)	3		12	1
2118	2018-11-16 13:35:04.649643+08	931	Iaer object (931)	3		12	1
2119	2018-11-16 13:35:04.660122+08	846	Iaer object (846)	3		12	1
2120	2018-11-16 13:35:04.680171+08	930	Iaer object (930)	3		12	1
2121	2018-11-16 13:35:04.69027+08	845	Iaer object (845)	3		12	1
2122	2018-11-16 13:35:04.701723+08	929	Iaer object (929)	3		12	1
2123	2018-11-16 13:35:04.711435+08	844	Iaer object (844)	3		12	1
2124	2018-11-16 13:35:04.719041+08	928	Iaer object (928)	3		12	1
2125	2018-11-16 13:35:04.726488+08	843	Iaer object (843)	3		12	1
2126	2018-11-16 13:35:04.734597+08	927	Iaer object (927)	3		12	1
2127	2018-11-16 13:35:04.742227+08	842	Iaer object (842)	3		12	1
2128	2018-11-16 13:35:04.751914+08	926	Iaer object (926)	3		12	1
2129	2018-11-16 13:35:04.762564+08	841	Iaer object (841)	3		12	1
2130	2018-11-16 13:35:04.775115+08	925	Iaer object (925)	3		12	1
2131	2018-11-16 13:35:04.782572+08	840	Iaer object (840)	3		12	1
2132	2018-11-16 13:35:04.792723+08	924	Iaer object (924)	3		12	1
2133	2018-11-16 13:35:04.802942+08	839	Iaer object (839)	3		12	1
2134	2018-11-16 13:35:04.813512+08	923	Iaer object (923)	3		12	1
2135	2018-11-16 13:35:04.824542+08	838	Iaer object (838)	3		12	1
2136	2018-11-16 13:35:04.835423+08	922	Iaer object (922)	3		12	1
2137	2018-11-16 13:35:04.856078+08	837	Iaer object (837)	3		12	1
2138	2018-11-16 13:35:04.869385+08	921	Iaer object (921)	3		12	1
2139	2018-11-16 13:35:04.880297+08	836	Iaer object (836)	3		12	1
2140	2018-11-16 13:35:04.89106+08	920	Iaer object (920)	3		12	1
2141	2018-11-16 13:35:04.901289+08	835	Iaer object (835)	3		12	1
2142	2018-11-16 13:35:04.912242+08	919	Iaer object (919)	3		12	1
2143	2018-11-16 13:35:04.92285+08	834	Iaer object (834)	3		12	1
2144	2018-11-16 13:35:04.933345+08	918	Iaer object (918)	3		12	1
2145	2018-11-16 13:35:04.944125+08	833	Iaer object (833)	3		12	1
2146	2018-11-16 13:35:04.955046+08	917	Iaer object (917)	3		12	1
2147	2018-11-16 13:35:04.965361+08	832	Iaer object (832)	3		12	1
2148	2018-11-16 13:35:04.976172+08	916	Iaer object (916)	3		12	1
2149	2018-11-16 13:35:04.988165+08	831	Iaer object (831)	3		12	1
2150	2018-11-16 13:35:05.0006+08	915	Iaer object (915)	3		12	1
2151	2018-11-16 13:35:05.018498+08	830	Iaer object (830)	3		12	1
2152	2018-11-16 13:35:05.042593+08	914	Iaer object (914)	3		12	1
2153	2018-11-16 13:35:05.050881+08	829	Iaer object (829)	3		12	1
2154	2018-11-16 13:35:05.06153+08	913	Iaer object (913)	3		12	1
2155	2018-11-16 13:35:05.091937+08	828	Iaer object (828)	3		12	1
2156	2018-11-16 13:35:05.104534+08	912	Iaer object (912)	3		12	1
2157	2018-11-16 13:35:05.12442+08	827	Iaer object (827)	3		12	1
2158	2018-11-16 13:35:05.13465+08	911	Iaer object (911)	3		12	1
2159	2018-11-16 13:35:05.16221+08	826	Iaer object (826)	3		12	1
2160	2018-11-16 13:35:05.183631+08	910	Iaer object (910)	3		12	1
2161	2018-11-16 13:35:05.194887+08	825	Iaer object (825)	3		12	1
2162	2018-11-16 13:35:05.209152+08	909	Iaer object (909)	3		12	1
2163	2018-11-16 13:35:05.242459+08	824	Iaer object (824)	3		12	1
2164	2018-11-16 13:35:05.25732+08	908	Iaer object (908)	3		12	1
2165	2018-11-16 13:35:05.284267+08	823	Iaer object (823)	3		12	1
2166	2018-11-16 13:35:05.293445+08	907	Iaer object (907)	3		12	1
2167	2018-11-16 13:35:05.302268+08	822	Iaer object (822)	3		12	1
2168	2018-11-16 13:35:05.310552+08	906	Iaer object (906)	3		12	1
2169	2018-11-16 13:35:05.321912+08	821	Iaer object (821)	3		12	1
2170	2018-11-16 13:35:05.336381+08	905	Iaer object (905)	3		12	1
2171	2018-11-16 13:35:05.346695+08	820	Iaer object (820)	3		12	1
2172	2018-11-16 13:35:05.358054+08	904	Iaer object (904)	3		12	1
2173	2018-11-16 13:35:05.371596+08	819	Iaer object (819)	3		12	1
2174	2018-11-16 13:35:05.392515+08	903	Iaer object (903)	3		12	1
2175	2018-11-16 13:35:05.402801+08	818	Iaer object (818)	3		12	1
2176	2018-11-16 13:35:05.415564+08	902	Iaer object (902)	3		12	1
2177	2018-11-16 13:35:05.429094+08	817	Iaer object (817)	3		12	1
2178	2018-11-16 13:35:05.439969+08	901	Iaer object (901)	3		12	1
2179	2018-11-16 13:35:05.448849+08	816	Iaer object (816)	3		12	1
2180	2018-11-16 13:35:05.456294+08	900	Iaer object (900)	3		12	1
2181	2018-11-16 13:35:05.463587+08	815	Iaer object (815)	3		12	1
2182	2018-11-16 13:35:05.476501+08	899	Iaer object (899)	3		12	1
2183	2018-11-16 13:35:05.486307+08	814	Iaer object (814)	3		12	1
2184	2018-11-16 13:35:05.493797+08	898	Iaer object (898)	3		12	1
2185	2018-11-16 13:35:05.501183+08	813	Iaer object (813)	3		12	1
2186	2018-11-16 13:35:05.512209+08	897	Iaer object (897)	3		12	1
2187	2018-11-16 13:35:05.519737+08	812	Iaer object (812)	3		12	1
2188	2018-11-16 13:35:05.526984+08	896	Iaer object (896)	3		12	1
2189	2018-11-16 13:35:05.537939+08	811	Iaer object (811)	3		12	1
2190	2018-11-16 13:35:05.548098+08	895	Iaer object (895)	3		12	1
2191	2018-11-16 13:35:05.555582+08	810	Iaer object (810)	3		12	1
2192	2018-11-16 13:35:05.562817+08	894	Iaer object (894)	3		12	1
2193	2018-11-16 13:35:05.587847+08	809	Iaer object (809)	3		12	1
2194	2018-11-16 13:35:05.597641+08	893	Iaer object (893)	3		12	1
2195	2018-11-16 13:35:05.607098+08	808	Iaer object (808)	3		12	1
2196	2018-11-16 13:35:05.614346+08	892	Iaer object (892)	3		12	1
2197	2018-11-16 13:35:05.623698+08	807	Iaer object (807)	3		12	1
2198	2018-11-16 13:35:05.637349+08	891	Iaer object (891)	3		12	1
2199	2018-11-16 13:35:05.647237+08	806	Iaer object (806)	3		12	1
2200	2018-11-16 13:35:05.654958+08	890	Iaer object (890)	3		12	1
2201	2018-11-16 13:35:05.663524+08	805	Iaer object (805)	3		12	1
2202	2018-11-16 13:35:05.676898+08	889	Iaer object (889)	3		12	1
2203	2018-11-16 13:35:05.686914+08	804	Iaer object (804)	3		12	1
2204	2018-11-16 13:35:05.698953+08	888	Iaer object (888)	3		12	1
2205	2018-11-16 13:35:05.708645+08	803	Iaer object (803)	3		12	1
2206	2018-11-16 13:35:05.716132+08	887	Iaer object (887)	3		12	1
2207	2018-11-16 13:35:05.729077+08	802	Iaer object (802)	3		12	1
2208	2018-11-16 13:35:05.74232+08	886	Iaer object (886)	3		12	1
2209	2018-11-16 13:35:05.749637+08	801	Iaer object (801)	3		12	1
2210	2018-11-16 13:35:05.759836+08	885	Iaer object (885)	3		12	1
2211	2018-11-16 13:35:05.76742+08	800	Iaer object (800)	3		12	1
2212	2018-11-16 13:35:05.774761+08	884	Iaer object (884)	3		12	1
2213	2018-11-16 13:35:05.782854+08	799	Iaer object (799)	3		12	1
2214	2018-11-16 13:35:05.792509+08	883	Iaer object (883)	3		12	1
2215	2018-11-16 13:35:05.800005+08	798	Iaer object (798)	3		12	1
2216	2018-11-16 13:35:05.807591+08	882	Iaer object (882)	3		12	1
2217	2018-11-16 13:35:05.814993+08	797	Iaer object (797)	3		12	1
2218	2018-11-16 13:35:05.822806+08	881	Iaer object (881)	3		12	1
2219	2018-11-16 13:35:05.830822+08	796	Iaer object (796)	3		12	1
2220	2018-11-16 13:35:05.838411+08	880	Iaer object (880)	3		12	1
2221	2018-11-16 13:35:05.848363+08	795	Iaer object (795)	3		12	1
2222	2018-11-16 13:35:05.859101+08	879	Iaer object (879)	3		12	1
2223	2018-11-16 13:35:05.866271+08	794	Iaer object (794)	3		12	1
2224	2018-11-16 13:35:05.873383+08	793	Iaer object (793)	3		12	1
2225	2018-11-16 13:35:05.894363+08	792	Iaer object (792)	3		12	1
2226	2018-11-16 13:35:05.904036+08	791	Iaer object (791)	3		12	1
2227	2018-11-16 13:35:05.911588+08	790	Iaer object (790)	3		12	1
2228	2018-11-16 13:35:05.920334+08	789	Iaer object (789)	3		12	1
2229	2018-11-16 13:35:05.929715+08	788	Iaer object (788)	3		12	1
2230	2018-11-16 13:35:05.937148+08	787	Iaer object (787)	3		12	1
2231	2018-11-16 13:35:05.94676+08	786	Iaer object (786)	3		12	1
2232	2018-11-16 13:35:05.956265+08	785	Iaer object (785)	3		12	1
2233	2018-11-16 13:35:05.963329+08	784	Iaer object (784)	3		12	1
2234	2018-11-16 13:35:05.970911+08	783	Iaer object (783)	3		12	1
2235	2018-11-16 13:35:05.981667+08	782	Iaer object (782)	3		12	1
2236	2018-11-16 13:35:05.992003+08	781	Iaer object (781)	3		12	1
2237	2018-11-16 13:35:06.002854+08	780	Iaer object (780)	3		12	1
2238	2018-11-16 13:35:06.021115+08	779	Iaer object (779)	3		12	1
2239	2018-11-16 13:35:06.033488+08	778	Iaer object (778)	3		12	1
2240	2018-11-16 13:35:06.04408+08	777	Iaer object (777)	3		12	1
2241	2018-11-16 13:35:06.062398+08	776	Iaer object (776)	3		12	1
2242	2018-11-16 13:35:06.07203+08	775	Iaer object (775)	3		12	1
2243	2018-11-16 13:35:06.085745+08	774	Iaer object (774)	3		12	1
2244	2018-11-16 13:35:06.095753+08	773	Iaer object (773)	3		12	1
2245	2018-11-16 13:35:06.108744+08	772	Iaer object (772)	3		12	1
2246	2018-11-16 13:35:06.115904+08	771	Iaer object (771)	3		12	1
2247	2018-11-16 13:35:06.123232+08	770	Iaer object (770)	3		12	1
2248	2018-11-16 13:35:06.136263+08	769	Iaer object (769)	3		12	1
2249	2018-11-16 13:35:06.143515+08	768	Iaer object (768)	3		12	1
2250	2018-11-16 13:35:06.151173+08	767	Iaer object (767)	3		12	1
2251	2018-11-16 13:35:06.163439+08	766	Iaer object (766)	3		12	1
2252	2018-11-16 13:35:06.180248+08	765	Iaer object (765)	3		12	1
2253	2018-11-16 13:35:06.18987+08	764	Iaer object (764)	3		12	1
2254	2018-11-16 13:35:06.200388+08	763	Iaer object (763)	3		12	1
2255	2018-11-16 13:35:06.210266+08	762	Iaer object (762)	3		12	1
2256	2018-11-16 13:35:06.229291+08	761	Iaer object (761)	3		12	1
2257	2018-11-16 13:35:06.236899+08	760	Iaer object (760)	3		12	1
2258	2018-11-16 13:35:06.252903+08	759	Iaer object (759)	3		12	1
2259	2018-11-16 13:35:06.263392+08	758	Iaer object (758)	3		12	1
2260	2018-11-16 13:35:06.28095+08	757	Iaer object (757)	3		12	1
2261	2018-11-16 13:35:06.292522+08	756	Iaer object (756)	3		12	1
2262	2018-11-16 13:35:06.300067+08	755	Iaer object (755)	3		12	1
2263	2018-11-16 13:35:06.308561+08	754	Iaer object (754)	3		12	1
2264	2018-11-16 13:35:06.320791+08	753	Iaer object (753)	3		12	1
2265	2018-11-16 13:35:06.328801+08	752	Iaer object (752)	3		12	1
2266	2018-11-16 13:35:06.336616+08	751	Iaer object (751)	3		12	1
2267	2018-11-16 13:35:06.348808+08	750	Iaer object (750)	3		12	1
2268	2018-11-16 13:35:06.359057+08	749	Iaer object (749)	3		12	1
2269	2018-11-16 13:35:06.369323+08	748	Iaer object (748)	3		12	1
2270	2018-11-16 13:35:06.388716+08	747	Iaer object (747)	3		12	1
2271	2018-11-16 13:35:06.399117+08	746	Iaer object (746)	3		12	1
2272	2018-11-16 13:35:06.410814+08	745	Iaer object (745)	3		12	1
2273	2018-11-16 13:35:06.420353+08	744	Iaer object (744)	3		12	1
2274	2018-11-16 13:35:06.427598+08	743	Iaer object (743)	3		12	1
2275	2018-11-16 13:35:06.43474+08	742	Iaer object (742)	3		12	1
2276	2018-11-16 13:35:06.45086+08	741	Iaer object (741)	3		12	1
2277	2018-11-16 13:35:06.461169+08	740	Iaer object (740)	3		12	1
2278	2018-11-16 13:35:06.473158+08	739	Iaer object (739)	3		12	1
2279	2018-11-16 13:35:06.483701+08	738	Iaer object (738)	3		12	1
2280	2018-11-16 13:35:06.495094+08	737	Iaer object (737)	3		12	1
2281	2018-11-16 13:35:06.510025+08	736	Iaer object (736)	3		12	1
2282	2018-11-16 13:35:06.520501+08	735	Iaer object (735)	3		12	1
2283	2018-11-16 13:35:06.534184+08	734	Iaer object (734)	3		12	1
2284	2018-11-16 13:35:06.570531+08	733	Iaer object (733)	3		12	1
2285	2018-11-16 13:35:06.581093+08	732	Iaer object (732)	3		12	1
2286	2018-11-16 13:35:06.591532+08	731	Iaer object (731)	3		12	1
2287	2018-11-16 13:35:06.602736+08	730	Iaer object (730)	3		12	1
2288	2018-11-16 13:35:06.614179+08	729	Iaer object (729)	3		12	1
2289	2018-11-16 13:35:06.624444+08	728	Iaer object (728)	3		12	1
2290	2018-11-16 13:35:06.635378+08	727	Iaer object (727)	3		12	1
2291	2018-11-16 13:35:06.645371+08	726	Iaer object (726)	3		12	1
2292	2018-11-16 13:35:06.656573+08	725	Iaer object (725)	3		12	1
2293	2018-11-16 13:35:06.670946+08	724	Iaer object (724)	3		12	1
2294	2018-11-16 13:35:06.681662+08	723	Iaer object (723)	3		12	1
2295	2018-11-16 13:35:06.692107+08	722	Iaer object (722)	3		12	1
2296	2018-11-16 13:35:06.704147+08	721	Iaer object (721)	3		12	1
2297	2018-11-16 13:35:06.718319+08	720	Iaer object (720)	3		12	1
2298	2018-11-16 13:35:06.729121+08	719	Iaer object (719)	3		12	1
2299	2018-11-16 13:35:06.73933+08	718	Iaer object (718)	3		12	1
2300	2018-11-16 13:35:06.747347+08	717	Iaer object (717)	3		12	1
2301	2018-11-16 13:35:06.756129+08	716	Iaer object (716)	3		12	1
2302	2018-11-16 13:35:06.764366+08	715	Iaer object (715)	3		12	1
2303	2018-11-16 13:35:06.774647+08	714	Iaer object (714)	3		12	1
2304	2018-11-16 13:35:06.796498+08	713	Iaer object (713)	3		12	1
2305	2018-11-16 13:35:06.806394+08	712	Iaer object (712)	3		12	1
2306	2018-11-16 13:35:06.816709+08	711	Iaer object (711)	3		12	1
2307	2018-11-16 13:35:06.824217+08	710	Iaer object (710)	3		12	1
2308	2018-11-16 13:35:06.831701+08	709	Iaer object (709)	3		12	1
2309	2018-11-16 13:35:06.839536+08	708	Iaer object (708)	3		12	1
2310	2018-11-16 13:35:06.848187+08	707	Iaer object (707)	3		12	1
2311	2018-11-16 13:35:06.865609+08	706	Iaer object (706)	3		12	1
2312	2018-11-16 13:35:06.876216+08	705	Iaer object (705)	3		12	1
2313	2018-11-16 13:35:06.886854+08	704	Iaer object (704)	3		12	1
2314	2018-11-16 13:35:06.899196+08	703	Iaer object (703)	3		12	1
2315	2018-11-16 13:35:06.914115+08	702	Iaer object (702)	3		12	1
2316	2018-11-16 13:35:06.924556+08	701	Iaer object (701)	3		12	1
2317	2018-11-16 13:35:06.936727+08	700	Iaer object (700)	3		12	1
2318	2018-11-16 13:35:06.959705+08	699	Iaer object (699)	3		12	1
2319	2018-11-16 13:35:06.971295+08	698	Iaer object (698)	3		12	1
2320	2018-11-16 13:35:06.981801+08	697	Iaer object (697)	3		12	1
2321	2018-11-16 13:35:06.993368+08	696	Iaer object (696)	3		12	1
2322	2018-11-16 13:35:07.004525+08	695	Iaer object (695)	3		12	1
2323	2018-11-16 13:35:07.017648+08	694	Iaer object (694)	3		12	1
2324	2018-11-16 13:35:07.030313+08	693	Iaer object (693)	3		12	1
2325	2018-11-16 13:35:07.048073+08	692	Iaer object (692)	3		12	1
2326	2018-11-16 13:35:07.055887+08	691	Iaer object (691)	3		12	1
2327	2018-11-16 13:35:07.063297+08	690	Iaer object (690)	3		12	1
2328	2018-11-16 13:35:07.070751+08	689	Iaer object (689)	3		12	1
2329	2018-11-16 13:35:07.098392+08	688	Iaer object (688)	3		12	1
2330	2018-11-16 13:35:07.106379+08	687	Iaer object (687)	3		12	1
2331	2018-11-16 13:35:07.114531+08	686	Iaer object (686)	3		12	1
2332	2018-11-16 13:35:07.135395+08	685	Iaer object (685)	3		12	1
2333	2018-11-16 13:35:07.14607+08	684	Iaer object (684)	3		12	1
2334	2018-11-16 13:35:07.154108+08	683	Iaer object (683)	3		12	1
2335	2018-11-16 13:35:07.162629+08	682	Iaer object (682)	3		12	1
2336	2018-11-16 13:35:07.17261+08	681	Iaer object (681)	3		12	1
2337	2018-11-16 13:35:07.180242+08	680	Iaer object (680)	3		12	1
2338	2018-11-16 13:35:07.193644+08	679	Iaer object (679)	3		12	1
2339	2018-11-16 13:35:07.205053+08	678	Iaer object (678)	3		12	1
2340	2018-11-16 13:35:07.215694+08	677	Iaer object (677)	3		12	1
2341	2018-11-16 13:35:07.223078+08	676	Iaer object (676)	3		12	1
2342	2018-11-16 13:35:07.236559+08	675	Iaer object (675)	3		12	1
2343	2018-11-16 13:35:07.251598+08	674	Iaer object (674)	3		12	1
2344	2018-11-16 13:35:07.26262+08	673	Iaer object (673)	3		12	1
2345	2018-11-16 13:35:07.270019+08	672	Iaer object (672)	3		12	1
2346	2018-11-16 13:35:07.277774+08	671	Iaer object (671)	3		12	1
2347	2018-11-16 13:35:07.292492+08	670	Iaer object (670)	3		12	1
2348	2018-11-16 13:35:07.303823+08	669	Iaer object (669)	3		12	1
2349	2018-11-16 13:35:07.315678+08	668	Iaer object (668)	3		12	1
2350	2018-11-16 13:35:07.328756+08	667	Iaer object (667)	3		12	1
2351	2018-11-16 13:35:07.336122+08	666	Iaer object (666)	3		12	1
2352	2018-11-16 13:35:07.344612+08	665	Iaer object (665)	3		12	1
2353	2018-11-16 13:35:07.354618+08	664	Iaer object (664)	3		12	1
2354	2018-11-16 13:35:07.366136+08	663	Iaer object (663)	3		12	1
2355	2018-11-16 13:35:07.374006+08	662	Iaer object (662)	3		12	1
2356	2018-11-16 13:35:07.385563+08	661	Iaer object (661)	3		12	1
2357	2018-11-16 13:35:07.399603+08	660	Iaer object (660)	3		12	1
2358	2018-11-16 13:35:07.420403+08	659	Iaer object (659)	3		12	1
2359	2018-11-16 13:35:07.430608+08	658	Iaer object (658)	3		12	1
2360	2018-11-16 13:35:07.44077+08	657	Iaer object (657)	3		12	1
2361	2018-11-16 13:35:07.454401+08	656	Iaer object (656)	3		12	1
2362	2018-11-16 13:35:07.46466+08	655	Iaer object (655)	3		12	1
2363	2018-11-16 13:35:07.476937+08	654	Iaer object (654)	3		12	1
2364	2018-11-16 13:35:07.493643+08	653	Iaer object (653)	3		12	1
2365	2018-11-16 13:35:07.508024+08	652	Iaer object (652)	3		12	1
2366	2018-11-16 13:35:07.520024+08	651	Iaer object (651)	3		12	1
2367	2018-11-16 13:35:07.540513+08	650	Iaer object (650)	3		12	1
2368	2018-11-16 13:35:07.554742+08	649	Iaer object (649)	3		12	1
2369	2018-11-16 13:35:07.572946+08	648	Iaer object (648)	3		12	1
2370	2018-11-16 13:35:07.589184+08	647	Iaer object (647)	3		12	1
2371	2018-11-16 13:35:07.61339+08	646	Iaer object (646)	3		12	1
2372	2018-11-16 13:35:07.624668+08	645	Iaer object (645)	3		12	1
2373	2018-11-16 13:35:07.637304+08	644	Iaer object (644)	3		12	1
2374	2018-11-16 13:35:07.650243+08	643	Iaer object (643)	3		12	1
2375	2018-11-16 13:35:07.665656+08	642	Iaer object (642)	3		12	1
2376	2018-11-16 13:35:07.675777+08	641	Iaer object (641)	3		12	1
2377	2018-11-16 13:35:07.687124+08	640	Iaer object (640)	3		12	1
2378	2018-11-16 13:35:07.698336+08	639	Iaer object (639)	3		12	1
2379	2018-11-16 13:35:07.711544+08	638	Iaer object (638)	3		12	1
2380	2018-11-16 13:35:07.722935+08	637	Iaer object (637)	3		12	1
2381	2018-11-16 13:35:07.733354+08	636	Iaer object (636)	3		12	1
2382	2018-11-16 13:35:07.746587+08	635	Iaer object (635)	3		12	1
2383	2018-11-16 13:35:07.776738+08	634	Iaer object (634)	3		12	1
2384	2018-11-16 13:35:07.784793+08	633	Iaer object (633)	3		12	1
2385	2018-11-16 13:35:07.800115+08	632	Iaer object (632)	3		12	1
2386	2018-11-16 13:35:07.810695+08	631	Iaer object (631)	3		12	1
2387	2018-11-16 13:35:07.821123+08	630	Iaer object (630)	3		12	1
2388	2018-11-16 13:35:07.83228+08	629	Iaer object (629)	3		12	1
2389	2018-11-16 13:35:07.847214+08	628	Iaer object (628)	3		12	1
2390	2018-11-16 13:35:07.859673+08	627	Iaer object (627)	3		12	1
2391	2018-11-16 13:35:07.874086+08	626	Iaer object (626)	3		12	1
2392	2018-11-16 13:35:07.883336+08	625	Iaer object (625)	3		12	1
2393	2018-11-16 13:35:07.896443+08	624	Iaer object (624)	3		12	1
2394	2018-11-16 13:35:07.908472+08	623	Iaer object (623)	3		12	1
2395	2018-11-16 13:35:07.918195+08	622	Iaer object (622)	3		12	1
2396	2018-11-16 13:35:07.92969+08	621	Iaer object (621)	3		12	1
2397	2018-11-16 13:35:07.946107+08	620	Iaer object (620)	3		12	1
2398	2018-11-16 13:35:07.955865+08	619	Iaer object (619)	3		12	1
2399	2018-11-16 13:35:07.967304+08	618	Iaer object (618)	3		12	1
2400	2018-11-16 13:35:07.979091+08	617	Iaer object (617)	3		12	1
2401	2018-11-16 13:35:07.992027+08	616	Iaer object (616)	3		12	1
2402	2018-11-16 13:35:08.004159+08	615	Iaer object (615)	3		12	1
2403	2018-11-16 13:35:08.015374+08	614	Iaer object (614)	3		12	1
2404	2018-11-16 13:35:08.026386+08	613	Iaer object (613)	3		12	1
2405	2018-11-16 13:35:08.03798+08	612	Iaer object (612)	3		12	1
2406	2018-11-16 13:35:08.05235+08	611	Iaer object (611)	3		12	1
2407	2018-11-16 13:35:08.072773+08	610	Iaer object (610)	3		12	1
2408	2018-11-16 13:35:08.080828+08	609	Iaer object (609)	3		12	1
2409	2018-11-16 13:35:08.097016+08	608	Iaer object (608)	3		12	1
2410	2018-11-16 13:35:08.111303+08	607	Iaer object (607)	3		12	1
2411	2018-11-16 13:35:08.122223+08	606	Iaer object (606)	3		12	1
2412	2018-11-16 13:35:08.133283+08	605	Iaer object (605)	3		12	1
2413	2018-11-16 13:35:08.143636+08	604	Iaer object (604)	3		12	1
2414	2018-11-16 13:35:08.153741+08	603	Iaer object (603)	3		12	1
2415	2018-11-16 13:35:08.164903+08	602	Iaer object (602)	3		12	1
2416	2018-11-16 13:35:08.175094+08	601	Iaer object (601)	3		12	1
2417	2018-11-16 13:35:08.182796+08	600	Iaer object (600)	3		12	1
2418	2018-11-16 13:35:08.206771+08	599	Iaer object (599)	3		12	1
2419	2018-11-16 13:35:08.222614+08	598	Iaer object (598)	3		12	1
2420	2018-11-16 13:35:08.230317+08	597	Iaer object (597)	3		12	1
2421	2018-11-16 13:35:08.243212+08	596	Iaer object (596)	3		12	1
2422	2018-11-16 13:35:08.255194+08	595	Iaer object (595)	3		12	1
2423	2018-11-16 13:35:08.266163+08	594	Iaer object (594)	3		12	1
2424	2018-11-16 13:35:08.27614+08	593	Iaer object (593)	3		12	1
2425	2018-11-16 13:35:08.296328+08	592	Iaer object (592)	3		12	1
2426	2018-11-16 13:35:08.307647+08	591	Iaer object (591)	3		12	1
2427	2018-11-16 13:35:08.3186+08	590	Iaer object (590)	3		12	1
2428	2018-11-16 13:35:08.326478+08	589	Iaer object (589)	3		12	1
2429	2018-11-16 13:35:08.334255+08	588	Iaer object (588)	3		12	1
2430	2018-11-16 13:35:08.344424+08	587	Iaer object (587)	3		12	1
2431	2018-11-16 13:35:08.359261+08	586	Iaer object (586)	3		12	1
2432	2018-11-16 13:35:08.367072+08	585	Iaer object (585)	3		12	1
2433	2018-11-16 13:35:08.376021+08	584	Iaer object (584)	3		12	1
2434	2018-11-16 13:35:08.389047+08	583	Iaer object (583)	3		12	1
2435	2018-11-16 13:35:08.397831+08	582	Iaer object (582)	3		12	1
2436	2018-11-16 13:35:08.413575+08	581	Iaer object (581)	3		12	1
2437	2018-11-16 13:35:08.423388+08	580	Iaer object (580)	3		12	1
2438	2018-11-16 13:35:08.434921+08	579	Iaer object (579)	3		12	1
2439	2018-11-16 13:35:08.445479+08	578	Iaer object (578)	3		12	1
2440	2018-11-16 13:35:08.456389+08	577	Iaer object (577)	3		12	1
2441	2018-11-16 13:35:08.468107+08	576	Iaer object (576)	3		12	1
2442	2018-11-16 13:35:08.497796+08	575	Iaer object (575)	3		12	1
2443	2018-11-16 13:35:08.525444+08	574	Iaer object (574)	3		12	1
2444	2018-11-16 13:35:08.536598+08	573	Iaer object (573)	3		12	1
2445	2018-11-16 13:35:08.552192+08	572	Iaer object (572)	3		12	1
2446	2018-11-16 13:35:08.56292+08	571	Iaer object (571)	3		12	1
2447	2018-11-16 13:35:08.57362+08	570	Iaer object (570)	3		12	1
2448	2018-11-16 13:35:08.584258+08	569	Iaer object (569)	3		12	1
2449	2018-11-16 13:35:08.594894+08	568	Iaer object (568)	3		12	1
2450	2018-11-16 13:35:08.610549+08	567	Iaer object (567)	3		12	1
2451	2018-11-16 13:35:08.626498+08	566	Iaer object (566)	3		12	1
2452	2018-11-16 13:35:08.638169+08	565	Iaer object (565)	3		12	1
2453	2018-11-16 13:35:08.647724+08	564	Iaer object (564)	3		12	1
2454	2018-11-16 13:35:08.664786+08	563	Iaer object (563)	3		12	1
2455	2018-11-16 13:35:08.6786+08	562	Iaer object (562)	3		12	1
2456	2018-11-16 13:35:08.694981+08	561	Iaer object (561)	3		12	1
2457	2018-11-16 13:35:08.712106+08	560	Iaer object (560)	3		12	1
2458	2018-11-16 13:35:08.727026+08	559	Iaer object (559)	3		12	1
2459	2018-11-16 13:35:08.737125+08	558	Iaer object (558)	3		12	1
2460	2018-11-16 13:35:08.750468+08	557	Iaer object (557)	3		12	1
2461	2018-11-16 13:35:08.76117+08	556	Iaer object (556)	3		12	1
2462	2018-11-16 13:35:08.771069+08	555	Iaer object (555)	3		12	1
2463	2018-11-16 13:35:08.783376+08	554	Iaer object (554)	3		12	1
2464	2018-11-16 13:35:08.793466+08	553	Iaer object (553)	3		12	1
2465	2018-11-16 13:35:08.801342+08	552	Iaer object (552)	3		12	1
2466	2018-11-16 13:35:08.812521+08	551	Iaer object (551)	3		12	1
2467	2018-11-16 13:35:08.822882+08	550	Iaer object (550)	3		12	1
2468	2018-11-16 13:35:08.830168+08	549	Iaer object (549)	3		12	1
2469	2018-11-16 13:35:08.83754+08	548	Iaer object (548)	3		12	1
2470	2018-11-16 13:35:08.846584+08	547	Iaer object (547)	3		12	1
2471	2018-11-16 13:35:08.859558+08	546	Iaer object (546)	3		12	1
2472	2018-11-16 13:35:08.869883+08	545	Iaer object (545)	3		12	1
2473	2018-11-16 13:35:08.880565+08	544	Iaer object (544)	3		12	1
2474	2018-11-16 13:35:08.888096+08	543	Iaer object (543)	3		12	1
2475	2018-11-16 13:35:08.89541+08	542	Iaer object (542)	3		12	1
2476	2018-11-16 13:35:08.909555+08	541	Iaer object (541)	3		12	1
2477	2018-11-16 13:35:08.918785+08	540	Iaer object (540)	3		12	1
2478	2018-11-16 13:35:08.927213+08	539	Iaer object (539)	3		12	1
2479	2018-11-16 13:35:08.940121+08	538	Iaer object (538)	3		12	1
2480	2018-11-16 13:35:08.947561+08	537	Iaer object (537)	3		12	1
2481	2018-11-16 13:35:08.95486+08	536	Iaer object (536)	3		12	1
2482	2018-11-16 13:35:08.965626+08	535	Iaer object (535)	3		12	1
2483	2018-11-16 13:35:08.9759+08	534	Iaer object (534)	3		12	1
2484	2018-11-16 13:35:08.987391+08	533	Iaer object (533)	3		12	1
2485	2018-11-16 13:35:08.999987+08	532	Iaer object (532)	3		12	1
2486	2018-11-16 13:35:09.010677+08	531	Iaer object (531)	3		12	1
2487	2018-11-16 13:35:09.031981+08	530	Iaer object (530)	3		12	1
2488	2018-11-16 13:35:09.040249+08	529	Iaer object (529)	3		12	1
2489	2018-11-16 13:35:09.047715+08	528	Iaer object (528)	3		12	1
2490	2018-11-16 13:35:09.058079+08	527	Iaer object (527)	3		12	1
2491	2018-11-16 13:35:09.067386+08	526	Iaer object (526)	3		12	1
2492	2018-11-16 13:35:09.075195+08	525	Iaer object (525)	3		12	1
2493	2018-11-16 13:35:09.086704+08	524	Iaer object (524)	3		12	1
2494	2018-11-16 13:35:09.094496+08	523	Iaer object (523)	3		12	1
2495	2018-11-16 13:35:09.102102+08	522	Iaer object (522)	3		12	1
2496	2018-11-16 13:35:09.118891+08	521	Iaer object (521)	3		12	1
2497	2018-11-16 13:35:09.129017+08	520	Iaer object (520)	3		12	1
2498	2018-11-16 13:35:09.145361+08	519	Iaer object (519)	3		12	1
2499	2018-11-16 13:35:09.159182+08	518	Iaer object (518)	3		12	1
2500	2018-11-16 13:35:09.169077+08	517	Iaer object (517)	3		12	1
2501	2018-11-16 13:35:09.180408+08	516	Iaer object (516)	3		12	1
2502	2018-11-16 13:35:09.198142+08	515	Iaer object (515)	3		12	1
2503	2018-11-16 13:35:09.21738+08	514	Iaer object (514)	3		12	1
2504	2018-11-16 13:35:09.224916+08	513	Iaer object (513)	3		12	1
2505	2018-11-16 13:35:09.232947+08	512	Iaer object (512)	3		12	1
2506	2018-11-16 13:35:09.243343+08	511	Iaer object (511)	3		12	1
2507	2018-11-16 13:35:09.252994+08	510	Iaer object (510)	3		12	1
2508	2018-11-16 13:35:09.262965+08	509	Iaer object (509)	3		12	1
2509	2018-11-16 13:35:09.273141+08	508	Iaer object (508)	3		12	1
2510	2018-11-16 13:35:09.280515+08	507	Iaer object (507)	3		12	1
2511	2018-11-16 13:35:09.288127+08	506	Iaer object (506)	3		12	1
2512	2018-11-16 13:35:09.297147+08	505	Iaer object (505)	3		12	1
2513	2018-11-16 13:35:09.319081+08	504	Iaer object (504)	3		12	1
2514	2018-11-16 13:35:09.326198+08	503	Iaer object (503)	3		12	1
2515	2018-11-16 13:35:09.334212+08	502	Iaer object (502)	3		12	1
2516	2018-11-16 13:35:09.341399+08	501	Iaer object (501)	3		12	1
2517	2018-11-16 13:35:09.361789+08	500	Iaer object (500)	3		12	1
2518	2018-11-16 13:35:09.373655+08	499	Iaer object (499)	3		12	1
2519	2018-11-16 13:35:09.38715+08	498	Iaer object (498)	3		12	1
2520	2018-11-16 13:35:09.395235+08	497	Iaer object (497)	3		12	1
2521	2018-11-16 13:35:09.402949+08	496	Iaer object (496)	3		12	1
2522	2018-11-16 13:35:09.415412+08	495	Iaer object (495)	3		12	1
2523	2018-11-16 13:35:09.424203+08	494	Iaer object (494)	3		12	1
2524	2018-11-16 13:35:09.432157+08	493	Iaer object (493)	3		12	1
2525	2018-11-16 13:35:09.441698+08	492	Iaer object (492)	3		12	1
2526	2018-11-16 13:35:09.453401+08	491	Iaer object (491)	3		12	1
2527	2018-11-16 13:35:09.474203+08	490	Iaer object (490)	3		12	1
2528	2018-11-16 13:35:09.485287+08	489	Iaer object (489)	3		12	1
2529	2018-11-16 13:35:09.496405+08	488	Iaer object (488)	3		12	1
2530	2018-11-16 13:35:09.508428+08	487	Iaer object (487)	3		12	1
2531	2018-11-16 13:35:09.520956+08	486	Iaer object (486)	3		12	1
2532	2018-11-16 13:35:09.53755+08	485	Iaer object (485)	3		12	1
2533	2018-11-16 13:35:09.550851+08	484	Iaer object (484)	3		12	1
2534	2018-11-16 13:35:09.561163+08	483	Iaer object (483)	3		12	1
2535	2018-11-16 13:35:09.574451+08	482	Iaer object (482)	3		12	1
2536	2018-11-16 13:35:09.584579+08	481	Iaer object (481)	3		12	1
2537	2018-11-16 13:35:09.612781+08	480	Iaer object (480)	3		12	1
2538	2018-11-16 13:35:09.636297+08	479	Iaer object (479)	3		12	1
2539	2018-11-16 13:35:09.648515+08	478	Iaer object (478)	3		12	1
2540	2018-11-16 13:35:09.660507+08	477	Iaer object (477)	3		12	1
2541	2018-11-16 13:35:09.681249+08	476	Iaer object (476)	3		12	1
2542	2018-11-16 13:35:09.696584+08	475	Iaer object (475)	3		12	1
2543	2018-11-16 13:35:09.707787+08	474	Iaer object (474)	3		12	1
2544	2018-11-16 13:35:09.718732+08	473	Iaer object (473)	3		12	1
2545	2018-11-16 13:35:09.729426+08	472	Iaer object (472)	3		12	1
2546	2018-11-16 13:35:09.740493+08	471	Iaer object (471)	3		12	1
2547	2018-11-16 13:35:09.748204+08	470	Iaer object (470)	3		12	1
2548	2018-11-16 13:35:09.756079+08	469	Iaer object (469)	3		12	1
2549	2018-11-16 13:35:09.77517+08	468	Iaer object (468)	3		12	1
2550	2018-11-16 13:35:09.794865+08	467	Iaer object (467)	3		12	1
2551	2018-11-16 13:35:09.807092+08	466	Iaer object (466)	3		12	1
2552	2018-11-16 13:35:09.843234+08	465	Iaer object (465)	3		12	1
2553	2018-11-16 13:35:09.858326+08	464	Iaer object (464)	3		12	1
2554	2018-11-16 13:35:09.871488+08	463	Iaer object (463)	3		12	1
2555	2018-11-16 13:35:09.88479+08	462	Iaer object (462)	3		12	1
2556	2018-11-16 13:35:09.896355+08	461	Iaer object (461)	3		12	1
2557	2018-11-16 13:35:09.931622+08	460	Iaer object (460)	3		12	1
2558	2018-11-16 13:35:09.955312+08	459	Iaer object (459)	3		12	1
2559	2018-11-16 13:35:09.970581+08	458	Iaer object (458)	3		12	1
2560	2018-11-16 13:35:09.987738+08	457	Iaer object (457)	3		12	1
2561	2018-11-16 13:35:09.999441+08	456	Iaer object (456)	3		12	1
2562	2018-11-16 13:35:10.017993+08	455	Iaer object (455)	3		12	1
2563	2018-11-16 13:35:10.02982+08	454	Iaer object (454)	3		12	1
2564	2018-11-16 13:35:10.041493+08	453	Iaer object (453)	3		12	1
2565	2018-11-16 13:35:10.053619+08	452	Iaer object (452)	3		12	1
2566	2018-11-16 13:35:10.065631+08	451	Iaer object (451)	3		12	1
2567	2018-11-16 13:35:10.078476+08	450	Iaer object (450)	3		12	1
2568	2018-11-16 13:35:10.090684+08	449	Iaer object (449)	3		12	1
2569	2018-11-16 13:35:10.105724+08	448	Iaer object (448)	3		12	1
2570	2018-11-16 13:35:10.116323+08	447	Iaer object (447)	3		12	1
2571	2018-11-16 13:35:10.129681+08	446	Iaer object (446)	3		12	1
2572	2018-11-16 13:35:10.13969+08	445	Iaer object (445)	3		12	1
2573	2018-11-16 13:35:10.149468+08	444	Iaer object (444)	3		12	1
2574	2018-11-16 13:35:10.1611+08	443	Iaer object (443)	3		12	1
2575	2018-11-16 13:35:10.173709+08	442	Iaer object (442)	3		12	1
2576	2018-11-16 13:35:10.187197+08	441	Iaer object (441)	3		12	1
2577	2018-11-16 13:35:10.200963+08	440	Iaer object (440)	3		12	1
2578	2018-11-16 13:35:10.213473+08	439	Iaer object (439)	3		12	1
2579	2018-11-16 13:35:10.227036+08	438	Iaer object (438)	3		12	1
2580	2018-11-16 13:35:10.256741+08	437	Iaer object (437)	3		12	1
2581	2018-11-16 13:35:10.268279+08	436	Iaer object (436)	3		12	1
2582	2018-11-16 13:35:10.282138+08	435	Iaer object (435)	3		12	1
2583	2018-11-16 13:35:10.294224+08	434	Iaer object (434)	3		12	1
2584	2018-11-16 13:35:10.307233+08	433	Iaer object (433)	3		12	1
2585	2018-11-16 13:35:10.319345+08	432	Iaer object (432)	3		12	1
2586	2018-11-16 13:35:10.331506+08	431	Iaer object (431)	3		12	1
2587	2018-11-16 13:35:10.341966+08	430	Iaer object (430)	3		12	1
2588	2018-11-16 13:35:10.355704+08	429	Iaer object (429)	3		12	1
2589	2018-11-16 13:35:10.366209+08	428	Iaer object (428)	3		12	1
2590	2018-11-16 13:35:10.376273+08	427	Iaer object (427)	3		12	1
2591	2018-11-16 13:35:10.390074+08	426	Iaer object (426)	3		12	1
2592	2018-11-16 13:35:10.404445+08	425	Iaer object (425)	3		12	1
2593	2018-11-16 13:35:10.413483+08	424	Iaer object (424)	3		12	1
2594	2018-11-16 13:35:10.429077+08	423	Iaer object (423)	3		12	1
2595	2018-11-16 13:35:10.439504+08	422	Iaer object (422)	3		12	1
2596	2018-11-16 13:35:10.449645+08	421	Iaer object (421)	3		12	1
2597	2018-11-16 13:35:10.459348+08	420	Iaer object (420)	3		12	1
2598	2018-11-16 13:35:10.470157+08	419	Iaer object (419)	3		12	1
2599	2018-11-16 13:35:10.480179+08	418	Iaer object (418)	3		12	1
2600	2018-11-16 13:35:10.49112+08	417	Iaer object (417)	3		12	1
2601	2018-11-16 13:35:10.501964+08	416	Iaer object (416)	3		12	1
2602	2018-11-16 13:35:10.511875+08	415	Iaer object (415)	3		12	1
2603	2018-11-16 13:35:10.522998+08	414	Iaer object (414)	3		12	1
2604	2018-11-16 13:35:10.533528+08	413	Iaer object (413)	3		12	1
2605	2018-11-16 13:35:10.544464+08	412	Iaer object (412)	3		12	1
2606	2018-11-16 13:35:10.552246+08	411	Iaer object (411)	3		12	1
2607	2018-11-16 13:35:10.560629+08	410	Iaer object (410)	3		12	1
2608	2018-11-16 13:35:10.571104+08	409	Iaer object (409)	3		12	1
2609	2018-11-16 13:35:10.578846+08	408	Iaer object (408)	3		12	1
2610	2018-11-16 13:35:10.587238+08	407	Iaer object (407)	3		12	1
2611	2018-11-16 13:35:10.59805+08	406	Iaer object (406)	3		12	1
2612	2018-11-16 13:35:10.605073+08	405	Iaer object (405)	3		12	1
2613	2018-11-16 13:35:10.612361+08	404	Iaer object (404)	3		12	1
2614	2018-11-16 13:35:10.619738+08	403	Iaer object (403)	3		12	1
2615	2018-11-16 13:35:10.62837+08	402	Iaer object (402)	3		12	1
2616	2018-11-16 13:35:10.635368+08	401	Iaer object (401)	3		12	1
2617	2018-11-16 13:35:10.644542+08	400	Iaer object (400)	3		12	1
2618	2018-11-16 13:35:10.654339+08	399	Iaer object (399)	3		12	1
2619	2018-11-16 13:35:10.663591+08	398	Iaer object (398)	3		12	1
2620	2018-11-16 13:35:10.671743+08	397	Iaer object (397)	3		12	1
2621	2018-11-16 13:35:10.678878+08	396	Iaer object (396)	3		12	1
2622	2018-11-16 13:35:10.68947+08	395	Iaer object (395)	3		12	1
2623	2018-11-16 13:35:10.696658+08	394	Iaer object (394)	3		12	1
2624	2018-11-16 13:35:10.704095+08	393	Iaer object (393)	3		12	1
2625	2018-11-16 13:35:10.71105+08	392	Iaer object (392)	3		12	1
2626	2018-11-16 13:35:10.721387+08	391	Iaer object (391)	3		12	1
2627	2018-11-16 13:35:10.728665+08	390	Iaer object (390)	3		12	1
2628	2018-11-16 13:35:10.736316+08	389	Iaer object (389)	3		12	1
2629	2018-11-16 13:35:10.743568+08	388	Iaer object (388)	3		12	1
2630	2018-11-16 13:35:10.754438+08	387	Iaer object (387)	3		12	1
2631	2018-11-16 13:35:10.763526+08	386	Iaer object (386)	3		12	1
2632	2018-11-16 13:35:10.770596+08	385	Iaer object (385)	3		12	1
2633	2018-11-16 13:35:10.781098+08	384	Iaer object (384)	3		12	1
2634	2018-11-16 13:35:10.78869+08	383	Iaer object (383)	3		12	1
2635	2018-11-16 13:35:10.796627+08	382	Iaer object (382)	3		12	1
2636	2018-11-16 13:35:10.803506+08	381	Iaer object (381)	3		12	1
2637	2018-11-16 13:35:10.811798+08	380	Iaer object (380)	3		12	1
2638	2018-11-16 13:35:10.823605+08	379	Iaer object (379)	3		12	1
2639	2018-11-16 13:35:10.832477+08	378	Iaer object (378)	3		12	1
2640	2018-11-16 13:35:10.84032+08	377	Iaer object (377)	3		12	1
2641	2018-11-16 13:35:10.847711+08	376	Iaer object (376)	3		12	1
2642	2018-11-16 13:35:10.854994+08	375	Iaer object (375)	3		12	1
2643	2018-11-16 13:35:10.862127+08	374	Iaer object (374)	3		12	1
2644	2018-11-16 13:35:10.869741+08	373	Iaer object (373)	3		12	1
2645	2018-11-16 13:35:10.87929+08	372	Iaer object (372)	3		12	1
2646	2018-11-16 13:35:10.886949+08	371	Iaer object (371)	3		12	1
2647	2018-11-16 13:35:10.895336+08	370	Iaer object (370)	3		12	1
2648	2018-11-16 13:35:10.906136+08	369	Iaer object (369)	3		12	1
2649	2018-11-16 13:35:10.913455+08	368	Iaer object (368)	3		12	1
2650	2018-11-16 13:35:10.928118+08	367	Iaer object (367)	3		12	1
2651	2018-11-16 13:35:10.949175+08	366	Iaer object (366)	3		12	1
2652	2018-11-16 13:35:10.974402+08	365	Iaer object (365)	3		12	1
2653	2018-11-16 13:35:10.984456+08	364	Iaer object (364)	3		12	1
2654	2018-11-16 13:35:10.999354+08	363	Iaer object (363)	3		12	1
2655	2018-11-16 13:35:11.009431+08	362	Iaer object (362)	3		12	1
2656	2018-11-16 13:35:11.017003+08	361	Iaer object (361)	3		12	1
2657	2018-11-16 13:35:11.028219+08	360	Iaer object (360)	3		12	1
2658	2018-11-16 13:35:11.04104+08	359	Iaer object (359)	3		12	1
2659	2018-11-16 13:35:11.050844+08	358	Iaer object (358)	3		12	1
2660	2018-11-16 13:35:11.061392+08	357	Iaer object (357)	3		12	1
2661	2018-11-16 13:35:11.068795+08	356	Iaer object (356)	3		12	1
2662	2018-11-16 13:35:11.076307+08	355	Iaer object (355)	3		12	1
2663	2018-11-16 13:35:11.091408+08	354	Iaer object (354)	3		12	1
2664	2018-11-16 13:35:11.1012+08	353	Iaer object (353)	3		12	1
2665	2018-11-16 13:35:11.112107+08	352	Iaer object (352)	3		12	1
2666	2018-11-16 13:35:11.129932+08	351	Iaer object (351)	3		12	1
2667	2018-11-16 13:35:11.142533+08	350	Iaer object (350)	3		12	1
2668	2018-11-16 13:35:11.153321+08	349	Iaer object (349)	3		12	1
2669	2018-11-16 13:35:11.163544+08	348	Iaer object (348)	3		12	1
2670	2018-11-16 13:35:11.173333+08	347	Iaer object (347)	3		12	1
2671	2018-11-16 13:35:11.181468+08	346	Iaer object (346)	3		12	1
2672	2018-11-16 13:35:11.189615+08	345	Iaer object (345)	3		12	1
2673	2018-11-16 13:35:11.19945+08	344	Iaer object (344)	3		12	1
2674	2018-11-16 13:35:11.207111+08	343	Iaer object (343)	3		12	1
2675	2018-11-16 13:35:11.215323+08	342	Iaer object (342)	3		12	1
2676	2018-11-16 13:35:11.229283+08	341	Iaer object (341)	3		12	1
2677	2018-11-16 13:35:11.238896+08	340	Iaer object (340)	3		12	1
2678	2018-11-16 13:35:11.252347+08	339	Iaer object (339)	3		12	1
2679	2018-11-16 13:35:11.270436+08	338	Iaer object (338)	3		12	1
2680	2018-11-16 13:35:11.283139+08	337	Iaer object (337)	3		12	1
2681	2018-11-16 13:35:11.290427+08	336	Iaer object (336)	3		12	1
2682	2018-11-16 13:35:11.297592+08	335	Iaer object (335)	3		12	1
2683	2018-11-16 13:35:11.30497+08	334	Iaer object (334)	3		12	1
2684	2018-11-16 13:35:11.315926+08	333	Iaer object (333)	3		12	1
2685	2018-11-16 13:35:11.323556+08	332	Iaer object (332)	3		12	1
2686	2018-11-16 13:35:11.33236+08	331	Iaer object (331)	3		12	1
2687	2018-11-16 13:35:11.347774+08	330	Iaer object (330)	3		12	1
2688	2018-11-16 13:35:11.355463+08	329	Iaer object (329)	3		12	1
2689	2018-11-16 13:35:11.362561+08	328	Iaer object (328)	3		12	1
2690	2018-11-16 13:35:11.370836+08	327	Iaer object (327)	3		12	1
2691	2018-11-16 13:35:11.379569+08	326	Iaer object (326)	3		12	1
2692	2018-11-16 13:35:11.389047+08	325	Iaer object (325)	3		12	1
2693	2018-11-16 13:35:11.398634+08	324	Iaer object (324)	3		12	1
2694	2018-11-16 13:35:11.413299+08	323	Iaer object (323)	3		12	1
2695	2018-11-16 13:35:11.421868+08	322	Iaer object (322)	3		12	1
2696	2018-11-16 13:35:11.432865+08	321	Iaer object (321)	3		12	1
2697	2018-11-16 13:35:11.465491+08	320	Iaer object (320)	3		12	1
2698	2018-11-16 13:35:11.477051+08	319	Iaer object (319)	3		12	1
2699	2018-11-16 13:35:11.487829+08	318	Iaer object (318)	3		12	1
2700	2018-11-16 13:35:11.498489+08	317	Iaer object (317)	3		12	1
2701	2018-11-16 13:35:11.510185+08	316	Iaer object (316)	3		12	1
2702	2018-11-16 13:35:11.520606+08	315	Iaer object (315)	3		12	1
2703	2018-11-16 13:35:11.539253+08	314	Iaer object (314)	3		12	1
2704	2018-11-16 13:35:11.549505+08	313	Iaer object (313)	3		12	1
2705	2018-11-16 13:35:11.560004+08	312	Iaer object (312)	3		12	1
2706	2018-11-16 13:35:11.580043+08	311	Iaer object (311)	3		12	1
2707	2018-11-16 13:35:11.589748+08	310	Iaer object (310)	3		12	1
2708	2018-11-16 13:35:11.600167+08	309	Iaer object (309)	3		12	1
2709	2018-11-16 13:35:11.616648+08	308	Iaer object (308)	3		12	1
2710	2018-11-16 13:35:11.635312+08	307	Iaer object (307)	3		12	1
2711	2018-11-16 13:35:11.648601+08	306	Iaer object (306)	3		12	1
2712	2018-11-16 13:35:11.662617+08	305	Iaer object (305)	3		12	1
2713	2018-11-16 13:35:11.671137+08	304	Iaer object (304)	3		12	1
2714	2018-11-16 13:35:11.67908+08	303	Iaer object (303)	3		12	1
2715	2018-11-16 13:35:11.689431+08	302	Iaer object (302)	3		12	1
2716	2018-11-16 13:35:11.699771+08	301	Iaer object (301)	3		12	1
2717	2018-11-16 13:35:11.71009+08	300	Iaer object (300)	3		12	1
2718	2018-11-16 13:35:11.721388+08	299	Iaer object (299)	3		12	1
2719	2018-11-16 13:35:11.733453+08	298	Iaer object (298)	3		12	1
2720	2018-11-16 13:35:11.744498+08	297	Iaer object (297)	3		12	1
2721	2018-11-16 13:35:11.755905+08	296	Iaer object (296)	3		12	1
2722	2018-11-16 13:35:11.763739+08	295	Iaer object (295)	3		12	1
2723	2018-11-16 13:35:11.771518+08	294	Iaer object (294)	3		12	1
2724	2018-11-16 13:35:11.786545+08	293	Iaer object (293)	3		12	1
2725	2018-11-16 13:35:11.797927+08	292	Iaer object (292)	3		12	1
2726	2018-11-16 13:35:11.810835+08	291	Iaer object (291)	3		12	1
2727	2018-11-16 13:35:11.820849+08	290	Iaer object (290)	3		12	1
2728	2018-11-16 13:35:11.831225+08	289	Iaer object (289)	3		12	1
2729	2018-11-16 13:35:11.842475+08	288	Iaer object (288)	3		12	1
2730	2018-11-16 13:35:11.852934+08	287	Iaer object (287)	3		12	1
2731	2018-11-16 13:35:11.863534+08	286	Iaer object (286)	3		12	1
2732	2018-11-16 13:35:11.879031+08	285	Iaer object (285)	3		12	1
2733	2018-11-16 13:35:11.890587+08	284	Iaer object (284)	3		12	1
2734	2018-11-16 13:35:11.903991+08	283	Iaer object (283)	3		12	1
2735	2018-11-16 13:35:11.912198+08	282	Iaer object (282)	3		12	1
2736	2018-11-16 13:35:11.935194+08	281	Iaer object (281)	3		12	1
2737	2018-11-16 13:35:11.945392+08	280	Iaer object (280)	3		12	1
2738	2018-11-16 13:35:11.953536+08	279	Iaer object (279)	3		12	1
2739	2018-11-16 13:35:11.972925+08	278	Iaer object (278)	3		12	1
2740	2018-11-16 13:35:11.989343+08	277	Iaer object (277)	3		12	1
2741	2018-11-16 13:35:12.004692+08	276	Iaer object (276)	3		12	1
2742	2018-11-16 13:35:12.019684+08	275	Iaer object (275)	3		12	1
2743	2018-11-16 13:35:12.0311+08	274	Iaer object (274)	3		12	1
2744	2018-11-16 13:35:12.04288+08	273	Iaer object (273)	3		12	1
2745	2018-11-16 13:35:12.051272+08	272	Iaer object (272)	3		12	1
2746	2018-11-16 13:35:12.059714+08	271	Iaer object (271)	3		12	1
2747	2018-11-16 13:35:12.06744+08	270	Iaer object (270)	3		12	1
2748	2018-11-16 13:35:12.077465+08	269	Iaer object (269)	3		12	1
2749	2018-11-16 13:35:12.088513+08	268	Iaer object (268)	3		12	1
2750	2018-11-16 13:35:12.099818+08	267	Iaer object (267)	3		12	1
2751	2018-11-16 13:35:12.14106+08	266	Iaer object (266)	3		12	1
2752	2018-11-16 13:35:12.18352+08	265	Iaer object (265)	3		12	1
2753	2018-11-16 13:35:12.194248+08	264	Iaer object (264)	3		12	1
2754	2018-11-16 13:35:12.208386+08	263	Iaer object (263)	3		12	1
2755	2018-11-16 13:35:12.217898+08	262	Iaer object (262)	3		12	1
2756	2018-11-16 13:35:12.231629+08	261	Iaer object (261)	3		12	1
2757	2018-11-16 13:35:12.242863+08	260	Iaer object (260)	3		12	1
2758	2018-11-16 13:35:12.253113+08	259	Iaer object (259)	3		12	1
2759	2018-11-16 13:35:12.266366+08	258	Iaer object (258)	3		12	1
2760	2018-11-16 13:35:12.277535+08	257	Iaer object (257)	3		12	1
2761	2018-11-16 13:35:12.290878+08	256	Iaer object (256)	3		12	1
2762	2018-11-16 13:35:12.300504+08	255	Iaer object (255)	3		12	1
2763	2018-11-16 13:35:12.308276+08	254	Iaer object (254)	3		12	1
2764	2018-11-16 13:35:12.328126+08	253	Iaer object (253)	3		12	1
2765	2018-11-16 13:35:12.335408+08	252	Iaer object (252)	3		12	1
2766	2018-11-16 13:35:12.342876+08	251	Iaer object (251)	3		12	1
2767	2018-11-16 13:35:12.35246+08	250	Iaer object (250)	3		12	1
2768	2018-11-16 13:35:12.359994+08	249	Iaer object (249)	3		12	1
2769	2018-11-16 13:35:12.36778+08	248	Iaer object (248)	3		12	1
2770	2018-11-16 13:35:12.375291+08	247	Iaer object (247)	3		12	1
2771	2018-11-16 13:35:12.387957+08	246	Iaer object (246)	3		12	1
2772	2018-11-16 13:35:12.39646+08	245	Iaer object (245)	3		12	1
2773	2018-11-16 13:35:12.40378+08	244	Iaer object (244)	3		12	1
2774	2018-11-16 13:35:12.418821+08	243	Iaer object (243)	3		12	1
2775	2018-11-16 13:35:12.426281+08	242	Iaer object (242)	3		12	1
2776	2018-11-16 13:35:12.433227+08	241	Iaer object (241)	3		12	1
2777	2018-11-16 13:35:12.44485+08	240	Iaer object (240)	3		12	1
2778	2018-11-16 13:35:12.452074+08	239	Iaer object (239)	3		12	1
2779	2018-11-16 13:35:12.459942+08	238	Iaer object (238)	3		12	1
2780	2018-11-16 13:35:12.467719+08	237	Iaer object (237)	3		12	1
2781	2018-11-16 13:35:12.482857+08	236	Iaer object (236)	3		12	1
2782	2018-11-16 13:35:12.493265+08	235	Iaer object (235)	3		12	1
2783	2018-11-16 13:35:12.500769+08	234	Iaer object (234)	3		12	1
2784	2018-11-16 13:35:12.508591+08	233	Iaer object (233)	3		12	1
2785	2018-11-16 13:35:12.51574+08	232	Iaer object (232)	3		12	1
2786	2018-11-16 13:35:12.52415+08	231	Iaer object (231)	3		12	1
2787	2018-11-16 13:35:12.533696+08	230	Iaer object (230)	3		12	1
2788	2018-11-16 13:35:12.543448+08	229	Iaer object (229)	3		12	1
2789	2018-11-16 13:35:12.551703+08	228	Iaer object (228)	3		12	1
2790	2018-11-16 13:35:12.559277+08	227	Iaer object (227)	3		12	1
2791	2018-11-16 13:35:12.569329+08	226	Iaer object (226)	3		12	1
2792	2018-11-16 13:35:12.576835+08	225	Iaer object (225)	3		12	1
2793	2018-11-16 13:35:12.584175+08	224	Iaer object (224)	3		12	1
2794	2018-11-16 13:35:12.592022+08	223	Iaer object (223)	3		12	1
2795	2018-11-16 13:35:12.600241+08	222	Iaer object (222)	3		12	1
2796	2018-11-16 13:35:12.60984+08	221	Iaer object (221)	3		12	1
2797	2018-11-16 13:35:12.623851+08	220	Iaer object (220)	3		12	1
2798	2018-11-16 13:35:12.634095+08	219	Iaer object (219)	3		12	1
2799	2018-11-16 13:35:12.647636+08	218	Iaer object (218)	3		12	1
2800	2018-11-16 13:35:12.656872+08	217	Iaer object (217)	3		12	1
2801	2018-11-16 13:35:12.671765+08	216	Iaer object (216)	3		12	1
2802	2018-11-16 13:35:12.679361+08	215	Iaer object (215)	3		12	1
2803	2018-11-16 13:35:12.688209+08	214	Iaer object (214)	3		12	1
2804	2018-11-16 13:35:12.697982+08	213	Iaer object (213)	3		12	1
2805	2018-11-16 13:35:12.705685+08	212	Iaer object (212)	3		12	1
2806	2018-11-16 13:35:12.712691+08	211	Iaer object (211)	3		12	1
2807	2018-11-16 13:35:12.726666+08	210	Iaer object (210)	3		12	1
2808	2018-11-16 13:35:12.735916+08	209	Iaer object (209)	3		12	1
2809	2018-11-16 13:35:12.746845+08	208	Iaer object (208)	3		12	1
2810	2018-11-16 13:35:12.756828+08	207	Iaer object (207)	3		12	1
2811	2018-11-16 13:35:12.764395+08	206	Iaer object (206)	3		12	1
2812	2018-11-16 13:35:12.774007+08	205	Iaer object (205)	3		12	1
2813	2018-11-16 13:35:12.786469+08	204	Iaer object (204)	3		12	1
2814	2018-11-16 13:35:12.793773+08	203	Iaer object (203)	3		12	1
2815	2018-11-16 13:35:12.801334+08	202	Iaer object (202)	3		12	1
2816	2018-11-16 13:35:12.809104+08	201	Iaer object (201)	3		12	1
2817	2018-11-16 13:35:12.81936+08	200	Iaer object (200)	3		12	1
2818	2018-11-16 13:35:12.832028+08	199	Iaer object (199)	3		12	1
2819	2018-11-16 13:35:12.846655+08	198	Iaer object (198)	3		12	1
2820	2018-11-16 13:35:12.854171+08	197	Iaer object (197)	3		12	1
2821	2018-11-16 13:35:12.861953+08	196	Iaer object (196)	3		12	1
2822	2018-11-16 13:35:12.872838+08	195	Iaer object (195)	3		12	1
2823	2018-11-16 13:35:12.882217+08	194	Iaer object (194)	3		12	1
2824	2018-11-16 13:35:12.890536+08	193	Iaer object (193)	3		12	1
2825	2018-11-16 13:35:12.898052+08	192	Iaer object (192)	3		12	1
2826	2018-11-16 13:35:12.910951+08	191	Iaer object (191)	3		12	1
2827	2018-11-16 13:35:12.91853+08	190	Iaer object (190)	3		12	1
2828	2018-11-16 13:35:12.92611+08	189	Iaer object (189)	3		12	1
2829	2018-11-16 13:35:12.935438+08	188	Iaer object (188)	3		12	1
2830	2018-11-16 13:35:12.944992+08	187	Iaer object (187)	3		12	1
2831	2018-11-16 13:35:12.952371+08	186	Iaer object (186)	3		12	1
2832	2018-11-16 13:35:12.963104+08	185	Iaer object (185)	3		12	1
2833	2018-11-16 13:35:12.974115+08	184	Iaer object (184)	3		12	1
2834	2018-11-16 13:35:12.986928+08	183	Iaer object (183)	3		12	1
2835	2018-11-16 13:35:12.99724+08	182	Iaer object (182)	3		12	1
2836	2018-11-16 13:35:13.004811+08	181	Iaer object (181)	3		12	1
2837	2018-11-16 13:35:13.012766+08	180	Iaer object (180)	3		12	1
2838	2018-11-16 13:35:13.023397+08	179	Iaer object (179)	3		12	1
2839	2018-11-16 13:35:13.034164+08	178	Iaer object (178)	3		12	1
2840	2018-11-16 13:35:13.045783+08	177	Iaer object (177)	3		12	1
2841	2018-11-16 13:35:13.055537+08	176	Iaer object (176)	3		12	1
2842	2018-11-16 13:35:13.06787+08	175	Iaer object (175)	3		12	1
2843	2018-11-16 13:35:13.079224+08	174	Iaer object (174)	3		12	1
2844	2018-11-16 13:35:13.090747+08	173	Iaer object (173)	3		12	1
2845	2018-11-16 13:35:13.101566+08	172	Iaer object (172)	3		12	1
2846	2018-11-16 13:35:13.112536+08	171	Iaer object (171)	3		12	1
2847	2018-11-16 13:35:13.133348+08	170	Iaer object (170)	3		12	1
2848	2018-11-16 13:35:13.145959+08	169	Iaer object (169)	3		12	1
2849	2018-11-16 13:35:13.157679+08	168	Iaer object (168)	3		12	1
2850	2018-11-16 13:35:13.165342+08	167	Iaer object (167)	3		12	1
2851	2018-11-16 13:35:13.173428+08	166	Iaer object (166)	3		12	1
2852	2018-11-16 13:35:13.18356+08	165	Iaer object (165)	3		12	1
2853	2018-11-16 13:35:13.193535+08	164	Iaer object (164)	3		12	1
2854	2018-11-16 13:35:13.203474+08	163	Iaer object (163)	3		12	1
2855	2018-11-16 13:35:13.211435+08	162	Iaer object (162)	3		12	1
2856	2018-11-16 13:35:13.219175+08	161	Iaer object (161)	3		12	1
2857	2018-11-16 13:35:13.228902+08	160	Iaer object (160)	3		12	1
2858	2018-11-16 13:35:13.264989+08	159	Iaer object (159)	3		12	1
2859	2018-11-16 13:35:13.283389+08	158	Iaer object (158)	3		12	1
2860	2018-11-16 13:35:13.292442+08	157	Iaer object (157)	3		12	1
2861	2018-11-16 13:35:13.300321+08	156	Iaer object (156)	3		12	1
2862	2018-11-16 13:35:13.314376+08	155	Iaer object (155)	3		12	1
2863	2018-11-16 13:35:13.324486+08	154	Iaer object (154)	3		12	1
2864	2018-11-16 13:35:13.339187+08	153	Iaer object (153)	3		12	1
2865	2018-11-16 13:35:13.349778+08	152	Iaer object (152)	3		12	1
2866	2018-11-16 13:35:13.36038+08	151	Iaer object (151)	3		12	1
2867	2018-11-16 13:35:13.374125+08	150	Iaer object (150)	3		12	1
2868	2018-11-16 13:35:13.38223+08	149	Iaer object (149)	3		12	1
2869	2018-11-16 13:35:13.390165+08	148	Iaer object (148)	3		12	1
2870	2018-11-16 13:35:13.399906+08	147	Iaer object (147)	3		12	1
2871	2018-11-16 13:35:13.407669+08	146	Iaer object (146)	3		12	1
2872	2018-11-16 13:35:13.417323+08	145	Iaer object (145)	3		12	1
2873	2018-11-16 13:35:13.433854+08	144	Iaer object (144)	3		12	1
2874	2018-11-16 13:35:13.446742+08	143	Iaer object (143)	3		12	1
2875	2018-11-16 13:35:13.457543+08	142	Iaer object (142)	3		12	1
2876	2018-11-16 13:35:13.467734+08	141	Iaer object (141)	3		12	1
2877	2018-11-16 13:35:13.477868+08	140	Iaer object (140)	3		12	1
2878	2018-11-16 13:35:13.48869+08	139	Iaer object (139)	3		12	1
2879	2018-11-16 13:35:13.500356+08	138	Iaer object (138)	3		12	1
2880	2018-11-16 13:35:13.510652+08	137	Iaer object (137)	3		12	1
2881	2018-11-16 13:35:13.522707+08	136	Iaer object (136)	3		12	1
2882	2018-11-16 13:35:13.532899+08	135	Iaer object (135)	3		12	1
2883	2018-11-16 13:35:13.543488+08	134	Iaer object (134)	3		12	1
2884	2018-11-16 13:35:13.555542+08	133	Iaer object (133)	3		12	1
2885	2018-11-16 13:35:13.572002+08	132	Iaer object (132)	3		12	1
2886	2018-11-16 13:35:13.588113+08	131	Iaer object (131)	3		12	1
2887	2018-11-16 13:35:13.598968+08	130	Iaer object (130)	3		12	1
2888	2018-11-16 13:35:13.606694+08	129	Iaer object (129)	3		12	1
2889	2018-11-16 13:35:13.61458+08	128	Iaer object (128)	3		12	1
2890	2018-11-16 13:35:13.623793+08	127	Iaer object (127)	3		12	1
2891	2018-11-16 13:35:13.630945+08	126	Iaer object (126)	3		12	1
2892	2018-11-16 13:35:13.637953+08	125	Iaer object (125)	3		12	1
2893	2018-11-16 13:35:13.65188+08	124	Iaer object (124)	3		12	1
2894	2018-11-16 13:35:13.659167+08	123	Iaer object (123)	3		12	1
2895	2018-11-16 13:35:13.66782+08	122	Iaer object (122)	3		12	1
2896	2018-11-16 13:35:13.677887+08	121	Iaer object (121)	3		12	1
2897	2018-11-16 13:35:13.684754+08	120	Iaer object (120)	3		12	1
2898	2018-11-16 13:35:13.692725+08	119	Iaer object (119)	3		12	1
2899	2018-11-16 13:35:13.700116+08	118	Iaer object (118)	3		12	1
2900	2018-11-16 13:35:13.709369+08	117	Iaer object (117)	3		12	1
2901	2018-11-16 13:35:13.718912+08	116	Iaer object (116)	3		12	1
2902	2018-11-16 13:35:13.725887+08	115	Iaer object (115)	3		12	1
2903	2018-11-16 13:35:13.732771+08	114	Iaer object (114)	3		12	1
2904	2018-11-16 13:35:13.740703+08	113	Iaer object (113)	3		12	1
2905	2018-11-16 13:35:13.748934+08	112	Iaer object (112)	3		12	1
2906	2018-11-16 13:35:13.760071+08	111	Iaer object (111)	3		12	1
2907	2018-11-16 13:35:13.767676+08	110	Iaer object (110)	3		12	1
2908	2018-11-16 13:35:13.774946+08	109	Iaer object (109)	3		12	1
2909	2018-11-16 13:35:13.782036+08	108	Iaer object (108)	3		12	1
2910	2018-11-16 13:35:13.789398+08	107	Iaer object (107)	3		12	1
2911	2018-11-16 13:35:13.796578+08	106	Iaer object (106)	3		12	1
2912	2018-11-16 13:35:13.80596+08	105	Iaer object (105)	3		12	1
2913	2018-11-16 13:35:13.813087+08	104	Iaer object (104)	3		12	1
2914	2018-11-16 13:35:13.82004+08	103	Iaer object (103)	3		12	1
2915	2018-11-16 13:35:13.827515+08	102	Iaer object (102)	3		12	1
2916	2018-11-16 13:35:13.836693+08	101	Iaer object (101)	3		12	1
2917	2018-11-16 13:35:13.843353+08	100	Iaer object (100)	3		12	1
2918	2018-11-16 13:35:13.852514+08	99	Iaer object (99)	3		12	1
2919	2018-11-16 13:35:13.860516+08	98	Iaer object (98)	3		12	1
2920	2018-11-16 13:35:13.867894+08	97	Iaer object (97)	3		12	1
2921	2018-11-16 13:35:13.874737+08	96	Iaer object (96)	3		12	1
2922	2018-11-16 13:35:13.881328+08	95	Iaer object (95)	3		12	1
2923	2018-11-16 13:35:13.891094+08	94	Iaer object (94)	3		12	1
2924	2018-11-16 13:35:13.898472+08	93	Iaer object (93)	3		12	1
2925	2018-11-16 13:35:13.912033+08	92	Iaer object (92)	3		12	1
2926	2018-11-16 13:35:13.925771+08	91	Iaer object (91)	3		12	1
2927	2018-11-16 13:35:13.936474+08	90	Iaer object (90)	3		12	1
2928	2018-11-16 13:35:13.944395+08	89	Iaer object (89)	3		12	1
2929	2018-11-16 13:35:13.953062+08	88	Iaer object (88)	3		12	1
2930	2018-11-16 13:35:13.96302+08	87	Iaer object (87)	3		12	1
2931	2018-11-16 13:35:13.970908+08	86	Iaer object (86)	3		12	1
2932	2018-11-16 13:35:13.980645+08	85	Iaer object (85)	3		12	1
2933	2018-11-16 13:35:13.993375+08	84	Iaer object (84)	3		12	1
2934	2018-11-16 13:35:14.00178+08	83	Iaer object (83)	3		12	1
2935	2018-11-16 13:35:14.009696+08	82	Iaer object (82)	3		12	1
2936	2018-11-16 13:35:14.020247+08	81	Iaer object (81)	3		12	1
2937	2018-11-16 13:35:14.027908+08	80	Iaer object (80)	3		12	1
2938	2018-11-16 13:35:14.036255+08	79	Iaer object (79)	3		12	1
2939	2018-11-16 13:35:14.047551+08	78	Iaer object (78)	3		12	1
2940	2018-11-16 13:35:14.057233+08	77	Iaer object (77)	3		12	1
2941	2018-11-16 13:35:14.065976+08	76	Iaer object (76)	3		12	1
2942	2018-11-16 13:35:14.077796+08	75	Iaer object (75)	3		12	1
2943	2018-11-16 13:35:14.091419+08	74	Iaer object (74)	3		12	1
2944	2018-11-16 13:35:14.111425+08	73	Iaer object (73)	3		12	1
2945	2018-11-16 13:35:14.119151+08	72	Iaer object (72)	3		12	1
2946	2018-11-16 13:35:14.127253+08	71	Iaer object (71)	3		12	1
2947	2018-11-16 13:35:14.139921+08	70	Iaer object (70)	3		12	1
2948	2018-11-16 13:35:14.147742+08	69	Iaer object (69)	3		12	1
2949	2018-11-16 13:35:14.16579+08	68	Iaer object (68)	3		12	1
2950	2018-11-16 13:35:14.175637+08	67	Iaer object (67)	3		12	1
2951	2018-11-16 13:35:14.182821+08	66	Iaer object (66)	3		12	1
2952	2018-11-16 13:35:14.190752+08	65	Iaer object (65)	3		12	1
2953	2018-11-16 13:35:14.20129+08	64	Iaer object (64)	3		12	1
2954	2018-11-16 13:35:14.209154+08	63	Iaer object (63)	3		12	1
2955	2018-11-16 13:35:14.216474+08	62	Iaer object (62)	3		12	1
2956	2018-11-16 13:35:14.224304+08	61	Iaer object (61)	3		12	1
2957	2018-11-16 13:35:14.233399+08	60	Iaer object (60)	3		12	1
2958	2018-11-16 13:35:14.241339+08	59	Iaer object (59)	3		12	1
2959	2018-11-16 13:35:14.257635+08	58	Iaer object (58)	3		12	1
2960	2018-11-16 13:35:14.271346+08	57	Iaer object (57)	3		12	1
2961	2018-11-16 13:35:14.283678+08	56	Iaer object (56)	3		12	1
2962	2018-11-16 13:35:14.29491+08	55	Iaer object (55)	3		12	1
2963	2018-11-16 13:35:14.302321+08	54	Iaer object (54)	3		12	1
2964	2018-11-16 13:35:14.309959+08	53	Iaer object (53)	3		12	1
2965	2018-11-16 13:35:14.320265+08	52	Iaer object (52)	3		12	1
2966	2018-11-16 13:35:14.327962+08	51	Iaer object (51)	3		12	1
2967	2018-11-16 13:35:14.335317+08	50	Iaer object (50)	3		12	1
2968	2018-11-16 13:35:14.342839+08	49	Iaer object (49)	3		12	1
2969	2018-11-16 13:35:14.358019+08	48	Iaer object (48)	3		12	1
2970	2018-11-16 13:35:14.36546+08	47	Iaer object (47)	3		12	1
2971	2018-11-16 13:35:14.373259+08	46	Iaer object (46)	3		12	1
2972	2018-11-16 13:35:14.38359+08	45	Iaer object (45)	3		12	1
2973	2018-11-16 13:35:14.391102+08	44	Iaer object (44)	3		12	1
2974	2018-11-16 13:35:14.398917+08	43	Iaer object (43)	3		12	1
2975	2018-11-16 13:35:14.409747+08	42	Iaer object (42)	3		12	1
2976	2018-11-16 13:35:14.419486+08	41	Iaer object (41)	3		12	1
2977	2018-11-16 13:35:14.427499+08	40	Iaer object (40)	3		12	1
2978	2018-11-16 13:35:14.434872+08	39	Iaer object (39)	3		12	1
2979	2018-11-16 13:35:14.461191+08	38	Iaer object (38)	3		12	1
2980	2018-11-16 13:35:14.46909+08	37	Iaer object (37)	3		12	1
2981	2018-11-16 13:35:14.478339+08	36	Iaer object (36)	3		12	1
2982	2018-11-16 13:35:14.48587+08	35	Iaer object (35)	3		12	1
2983	2018-11-16 13:35:14.493665+08	34	Iaer object (34)	3		12	1
2984	2018-11-16 13:35:14.508492+08	33	Iaer object (33)	3		12	1
2985	2018-11-16 13:35:14.51651+08	32	Iaer object (32)	3		12	1
2986	2018-11-16 13:35:14.52487+08	31	Iaer object (31)	3		12	1
2987	2018-11-16 13:35:14.535982+08	30	Iaer object (30)	3		12	1
2988	2018-11-16 13:35:14.546802+08	29	Iaer object (29)	3		12	1
2989	2018-11-16 13:35:14.56318+08	28	Iaer object (28)	3		12	1
2990	2018-11-16 13:35:14.573729+08	27	Iaer object (27)	3		12	1
2991	2018-11-16 13:35:14.584034+08	26	Iaer object (26)	3		12	1
2992	2018-11-16 13:35:14.591759+08	25	Iaer object (25)	3		12	1
2993	2018-11-16 13:35:14.604197+08	24	Iaer object (24)	3		12	1
2994	2018-11-16 13:35:14.613129+08	23	Iaer object (23)	3		12	1
2995	2018-11-16 13:35:14.621929+08	22	Iaer object (22)	3		12	1
2996	2018-11-16 13:35:14.631424+08	21	Iaer object (21)	3		12	1
2997	2018-11-16 13:35:14.639827+08	20	Iaer object (20)	3		12	1
2998	2018-11-16 13:35:14.649447+08	19	Iaer object (19)	3		12	1
2999	2018-11-16 13:35:14.657491+08	18	Iaer object (18)	3		12	1
3000	2018-11-16 13:35:14.665351+08	17	Iaer object (17)	3		12	1
3001	2018-11-16 13:35:14.675027+08	16	Iaer object (16)	3		12	1
3002	2018-11-16 13:35:14.682639+08	15	Iaer object (15)	3		12	1
3003	2018-11-16 13:35:14.691115+08	14	Iaer object (14)	3		12	1
3004	2018-11-16 13:35:14.701521+08	13	Iaer object (13)	3		12	1
3005	2018-11-16 13:35:14.710394+08	12	Iaer object (12)	3		12	1
3006	2018-11-16 13:35:14.718183+08	11	Iaer object (11)	3		12	1
3007	2018-11-16 13:35:14.730098+08	10	Iaer object (10)	3		12	1
3008	2018-11-16 13:35:14.737527+08	9	Iaer object (9)	3		12	1
3009	2018-11-16 13:35:14.745129+08	8	Iaer object (8)	3		12	1
3010	2018-11-16 13:35:14.759487+08	7	Iaer object (7)	3		12	1
3011	2018-11-16 13:35:14.770768+08	6	Iaer object (6)	3		12	1
3012	2018-11-16 13:35:14.780896+08	5	Iaer object (5)	3		12	1
3013	2018-11-16 13:35:14.78871+08	4	Iaer object (4)	3		12	1
3014	2018-11-16 13:35:14.79677+08	3	Iaer object (3)	3		12	1
3015	2018-11-16 13:35:14.806607+08	2	Iaer object (2)	3		12	1
3016	2018-11-16 13:35:14.819874+08	1	Iaer object (1)	3		12	1
3017	2018-11-16 13:49:30.198243+08	877	Iaer object (877)	2	[{"changed": {"fields": ["category"]}}]	12	1
3018	2018-11-16 13:49:53.041487+08	877	Iaer object (877)	2	[{"changed": {"fields": ["category"]}}]	12	1
3019	2018-11-16 13:50:06.544021+08	875	Iaer object (875)	2	[{"changed": {"fields": ["category"]}}]	12	1
3020	2018-11-16 13:50:25.692542+08	876	Iaer object (876)	2	[{"changed": {"fields": ["category"]}}]	12	1
3021	2018-11-16 13:51:25.846056+08	762	Iaer object (762)	2	[{"changed": {"fields": ["category"]}}]	12	1
3022	2018-11-16 13:51:40.604647+08	746	Iaer object (746)	2	[{"changed": {"fields": ["category"]}}]	12	1
3023	2018-11-16 13:52:35.804013+08	724	Iaer object (724)	2	[{"changed": {"fields": ["category"]}}]	12	1
3024	2018-11-16 13:52:55.503718+08	716	Iaer object (716)	2	[{"changed": {"fields": ["category"]}}]	12	1
3025	2018-11-16 13:53:32.043484+08	712	Iaer object (712)	2	[{"changed": {"fields": ["category", "remark"]}}]	12	1
3026	2018-11-16 13:53:48.06067+08	688	Iaer object (688)	2	[{"changed": {"fields": ["category"]}}]	12	1
3027	2018-11-16 13:54:05.368639+08	686	Iaer object (686)	2	[{"changed": {"fields": ["category"]}}]	12	1
3028	2018-11-16 13:54:20.856949+08	682	Iaer object (682)	2	[{"changed": {"fields": ["category"]}}]	12	1
3029	2018-11-16 13:54:39.341339+08	676	Iaer object (676)	2	[{"changed": {"fields": ["category"]}}]	12	1
3030	2018-11-16 13:55:01.277593+08	627	Iaer object (627)	2	[{"changed": {"fields": ["category"]}}]	12	1
3031	2018-11-16 13:55:22.485846+08	625	Iaer object (625)	2	[{"changed": {"fields": ["category"]}}]	12	1
3032	2018-11-16 13:55:36.563749+08	607	Iaer object (607)	2	[{"changed": {"fields": ["category"]}}]	12	1
3033	2018-11-16 13:55:50.876904+08	575	Iaer object (575)	2	[{"changed": {"fields": ["category"]}}]	12	1
3034	2018-11-16 13:56:05.791674+08	534	Iaer object (534)	2	[{"changed": {"fields": ["category"]}}]	12	1
3035	2018-11-16 13:56:21.077877+08	622	Iaer object (622)	2	[{"changed": {"fields": ["category"]}}]	12	1
3036	2018-11-16 13:56:34.831279+08	484	Iaer object (484)	2	[{"changed": {"fields": ["category"]}}]	12	1
3037	2018-11-16 13:56:49.592871+08	452	Iaer object (452)	2	[{"changed": {"fields": ["category"]}}]	12	1
3038	2018-11-16 13:57:03.934283+08	451	Iaer object (451)	2	[{"changed": {"fields": ["category"]}}]	12	1
3039	2018-11-16 13:57:34.987126+08	606	Iaer object (606)	2	[{"changed": {"fields": ["category"]}}]	12	1
3040	2018-11-16 13:57:50.328353+08	449	Iaer object (449)	2	[{"changed": {"fields": ["category"]}}]	12	1
3041	2018-11-16 13:58:08.552279+08	419	Iaer object (419)	2	[{"changed": {"fields": ["category"]}}]	12	1
3042	2018-11-16 13:58:22.273098+08	413	Iaer object (413)	2	[{"changed": {"fields": ["category"]}}]	12	1
3043	2018-11-16 13:59:04.174395+08	330	Iaer object (330)	2	[{"changed": {"fields": ["category"]}}]	12	1
3044	2018-11-16 13:59:21.393563+08	389	Iaer object (389)	2	[{"changed": {"fields": ["category"]}}]	12	1
3045	2018-11-16 13:59:40.153604+08	405	Iaer object (405)	2	[{"changed": {"fields": ["category"]}}]	12	1
3046	2018-11-16 13:59:56.614478+08	366	Iaer object (366)	2	[{"changed": {"fields": ["category"]}}]	12	1
3047	2018-11-16 14:00:12.554026+08	339	Iaer object (339)	2	[{"changed": {"fields": ["category"]}}]	12	1
3048	2018-11-16 14:00:37.329096+08	401	Iaer object (401)	2	[{"changed": {"fields": ["category"]}}]	12	1
3049	2018-11-16 14:00:56.489893+08	283	Iaer object (283)	2	[{"changed": {"fields": ["category"]}}]	12	1
3050	2018-11-16 14:01:16.656951+08	390	Iaer object (390)	2	[{"changed": {"fields": ["category"]}}]	12	1
3051	2018-11-16 14:01:44.08174+08	1	Iaer object (1)	2	[{"changed": {"fields": ["category"]}}]	12	1
3052	2018-11-16 14:02:19.512102+08	302	Iaer object (302)	2	[{"changed": {"fields": ["category"]}}]	12	1
3053	2018-11-16 14:02:35.641118+08	241	Iaer object (241)	2	[{"changed": {"fields": ["category"]}}]	12	1
3054	2018-11-16 14:03:00.076182+08	190	Iaer object (190)	2	[{"changed": {"fields": ["category"]}}]	12	1
3055	2018-11-16 14:03:16.945877+08	285	Iaer object (285)	2	[{"changed": {"fields": ["category"]}}]	12	1
3056	2018-11-16 14:03:35.893676+08	264	Iaer object (264)	2	[{"changed": {"fields": ["category"]}}]	12	1
3057	2018-11-16 14:35:30.314305+08	55	Iaer object (55)	2	[{"changed": {"fields": ["category"]}}]	12	1
3058	2018-11-16 14:35:47.864338+08	284	Iaer object (284)	2	[{"changed": {"fields": ["category"]}}]	12	1
3059	2018-11-16 14:36:10.742212+08	79	Iaer object (79)	2	[{"changed": {"fields": ["category"]}}]	12	1
3060	2018-11-16 14:38:40.977219+08	206	Iaer object (206)	2	[{"changed": {"fields": ["category"]}}]	12	1
3061	2018-11-16 14:39:01.425787+08	184	Iaer object (184)	2	[{"changed": {"fields": ["category"]}}]	12	1
3062	2018-11-16 14:39:31.016222+08	201	Iaer object (201)	2	[{"changed": {"fields": ["category"]}}]	12	1
3063	2018-11-16 14:39:49.412514+08	736	Iaer object (736)	2	[{"changed": {"fields": ["category"]}}]	12	1
3064	2018-11-16 14:40:05.287756+08	687	Iaer object (687)	2	[{"changed": {"fields": ["category"]}}]	12	1
3065	2018-11-16 14:40:23.350646+08	582	Iaer object (582)	2	[{"changed": {"fields": ["category"]}}]	12	1
3066	2018-11-16 14:40:41.51232+08	295	Iaer object (295)	2	[{"changed": {"fields": ["category"]}}]	12	1
3067	2018-11-16 14:41:13.916124+08	106	Iaer object (106)	2	[{"changed": {"fields": ["category"]}}]	12	1
3068	2018-11-16 14:41:34.529912+08	105	Iaer object (105)	2	[{"changed": {"fields": ["category"]}}]	12	1
3069	2018-11-16 14:42:01.525982+08	118	Iaer object (118)	2	[{"changed": {"fields": ["category"]}}]	12	1
3070	2018-11-16 14:42:36.393031+08	6	Iaer object (6)	2	[{"changed": {"fields": ["category"]}}]	12	1
3071	2018-11-16 14:43:12.474647+08	5	Iaer object (5)	2	[{"changed": {"fields": ["category"]}}]	12	1
3072	2018-11-16 14:43:20.000602+08	4	Iaer object (4)	2	[{"changed": {"fields": ["category"]}}]	12	1
3073	2018-11-16 14:43:27.77882+08	3	Iaer object (3)	2	[{"changed": {"fields": ["category"]}}]	12	1
3074	2018-11-16 14:44:16.955355+08	481	Iaer object (481)	2	[{"changed": {"fields": ["category"]}}]	12	1
3075	2018-11-16 14:44:23.947132+08	318	Iaer object (318)	2	[{"changed": {"fields": ["category"]}}]	12	1
3076	2018-11-16 14:45:20.784291+08	872	Iaer object (872)	2	[{"changed": {"fields": ["category"]}}]	12	1
3077	2018-11-16 14:45:30.834676+08	871	Iaer object (871)	2	[]	12	1
3078	2018-11-16 14:45:41.711458+08	869	Iaer object (869)	2	[{"changed": {"fields": ["category"]}}]	12	1
3079	2018-11-16 14:46:46.828293+08	19	Category object (19)	1	[{"added": {}}]	15	1
3080	2018-11-16 14:47:07.648457+08	15	Category object (15)	2	[{"changed": {"fields": ["sequence"]}}]	15	1
3081	2018-11-16 14:47:24.147616+08	19	Category object (19)	2	[{"changed": {"fields": ["sequence"]}}]	15	1
3082	2018-11-16 14:47:35.326698+08	18	Category object (18)	2	[{"changed": {"fields": ["sequence"]}}]	15	1
3083	2018-11-16 14:50:39.91412+08	20	Category object (20)	1	[{"added": {}}]	15	1
3084	2018-11-16 14:52:36.721108+08	666	Iaer object (666)	2	[{"changed": {"fields": ["category"]}}]	12	1
3085	2018-11-16 14:52:48.919905+08	664	Iaer object (664)	2	[{"changed": {"fields": ["category"]}}]	12	1
3086	2018-11-16 14:53:00.641906+08	663	Iaer object (663)	2	[{"changed": {"fields": ["category"]}}]	12	1
3087	2018-11-16 14:53:12.426024+08	662	Iaer object (662)	2	[{"changed": {"fields": ["category"]}}]	12	1
3088	2018-11-16 14:53:25.109598+08	660	Iaer object (660)	2	[{"changed": {"fields": ["category"]}}]	12	1
3089	2018-11-16 14:53:51.245271+08	658	Iaer object (658)	2	[{"changed": {"fields": ["category"]}}]	12	1
3090	2018-11-16 14:54:00.295497+08	657	Iaer object (657)	2	[{"changed": {"fields": ["category"]}}]	12	1
3091	2018-11-16 14:55:02.077464+08	508	Iaer object (508)	2	[{"changed": {"fields": ["category"]}}]	12	1
3092	2018-11-16 14:55:14.309477+08	507	Iaer object (507)	2	[{"changed": {"fields": ["category"]}}]	12	1
3093	2018-11-16 14:55:26.367475+08	505	Iaer object (505)	2	[{"changed": {"fields": ["category"]}}]	12	1
3094	2018-11-16 14:55:34.189806+08	496	Iaer object (496)	2	[{"changed": {"fields": ["category"]}}]	12	1
3095	2018-11-16 14:55:42.419039+08	487	Iaer object (487)	2	[{"changed": {"fields": ["category"]}}]	12	1
3096	2018-11-16 14:55:49.970058+08	477	Iaer object (477)	2	[{"changed": {"fields": ["category"]}}]	12	1
3097	2018-11-16 14:55:58.768512+08	464	Iaer object (464)	2	[{"changed": {"fields": ["category"]}}]	12	1
3098	2018-11-16 14:56:16.018197+08	443	Iaer object (443)	2	[{"changed": {"fields": ["category"]}}]	12	1
3099	2018-11-16 14:56:25.971255+08	439	Iaer object (439)	2	[{"changed": {"fields": ["category"]}}]	12	1
3100	2018-11-16 14:56:33.715987+08	427	Iaer object (427)	2	[{"changed": {"fields": ["category"]}}]	12	1
3101	2018-11-16 14:56:46.810452+08	416	Iaer object (416)	2	[{"changed": {"fields": ["category"]}}]	12	1
3102	2018-11-16 14:56:56.29286+08	406	Iaer object (406)	2	[{"changed": {"fields": ["category"]}}]	12	1
3103	2018-11-16 14:57:04.653089+08	403	Iaer object (403)	2	[{"changed": {"fields": ["category"]}}]	12	1
3104	2018-11-16 14:57:12.971181+08	395	Iaer object (395)	2	[{"changed": {"fields": ["category"]}}]	12	1
3105	2018-11-16 14:57:29.610462+08	386	Iaer object (386)	2	[{"changed": {"fields": ["category"]}}]	12	1
3106	2018-11-16 14:57:37.130314+08	384	Iaer object (384)	2	[{"changed": {"fields": ["category"]}}]	12	1
3107	2018-11-16 14:57:51.525508+08	378	Iaer object (378)	2	[{"changed": {"fields": ["category"]}}]	12	1
3108	2018-11-16 14:58:06.354329+08	376	Iaer object (376)	2	[{"changed": {"fields": ["category"]}}]	12	1
3109	2018-11-16 14:59:05.900014+08	871	Iaer object (871)	2	[{"changed": {"fields": ["category"]}}]	12	1
3110	2018-11-16 14:59:13.699317+08	866	Iaer object (866)	2	[{"changed": {"fields": ["category"]}}]	12	1
3111	2018-11-16 14:59:20.457708+08	864	Iaer object (864)	2	[{"changed": {"fields": ["category"]}}]	12	1
3112	2018-11-16 14:59:36.153862+08	858	Iaer object (858)	2	[{"changed": {"fields": ["category"]}}]	12	1
3113	2018-11-16 14:59:44.555467+08	844	Iaer object (844)	2	[{"changed": {"fields": ["category"]}}]	12	1
3114	2018-11-16 14:59:51.469433+08	840	Iaer object (840)	2	[{"changed": {"fields": ["category"]}}]	12	1
3115	2018-11-16 14:59:59.026663+08	825	Iaer object (825)	2	[{"changed": {"fields": ["category"]}}]	12	1
3116	2018-11-16 15:00:19.258643+08	814	Iaer object (814)	2	[{"changed": {"fields": ["category"]}}]	12	1
3117	2018-11-16 15:00:26.94346+08	809	Iaer object (809)	2	[{"changed": {"fields": ["category"]}}]	12	1
3118	2018-11-16 15:00:48.59761+08	804	Iaer object (804)	2	[{"changed": {"fields": ["category"]}}]	12	1
3119	2018-11-16 15:00:56.745297+08	800	Iaer object (800)	2	[{"changed": {"fields": ["category"]}}]	12	1
3120	2018-11-16 15:01:03.517657+08	789	Iaer object (789)	2	[{"changed": {"fields": ["category"]}}]	12	1
3121	2018-11-16 15:01:10.24175+08	743	Iaer object (743)	2	[{"changed": {"fields": ["category"]}}]	12	1
3122	2018-11-16 15:01:16.549799+08	742	Iaer object (742)	2	[{"changed": {"fields": ["category"]}}]	12	1
3123	2018-11-16 15:01:21.621752+08	728	Iaer object (728)	2	[{"changed": {"fields": ["category"]}}]	12	1
3124	2018-11-16 15:01:29.049815+08	721	Iaer object (721)	2	[{"changed": {"fields": ["category"]}}]	12	1
3125	2018-11-16 15:01:36.365356+08	719	Iaer object (719)	2	[{"changed": {"fields": ["category"]}}]	12	1
3126	2018-11-16 15:02:37.427124+08	269	Iaer object (269)	2	[{"changed": {"fields": ["category"]}}]	12	1
3127	2018-11-16 15:02:48.042616+08	270	Iaer object (270)	2	[{"changed": {"fields": ["category"]}}]	12	1
3128	2018-11-16 15:02:56.368906+08	275	Iaer object (275)	2	[{"changed": {"fields": ["category"]}}]	12	1
3129	2018-11-16 15:03:04.264476+08	279	Iaer object (279)	2	[{"changed": {"fields": ["category"]}}]	12	1
3130	2018-11-16 15:03:36.913426+08	294	Iaer object (294)	2	[{"changed": {"fields": ["category"]}}]	12	1
3131	2018-11-16 15:04:00.804803+08	322	Iaer object (322)	2	[{"changed": {"fields": ["category"]}}]	12	1
3132	2018-11-16 15:04:25.597295+08	21	Category object (21)	1	[{"added": {}}]	15	1
3133	2018-11-16 15:05:07.524516+08	323	Iaer object (323)	2	[{"changed": {"fields": ["category"]}}]	12	1
3134	2018-11-16 15:05:44.136911+08	333	Iaer object (333)	2	[{"changed": {"fields": ["category"]}}]	12	1
3135	2018-11-16 15:06:05.651459+08	22	Category object (22)	1	[{"added": {}}]	15	1
3136	2018-11-16 15:06:18.379739+08	334	Iaer object (334)	2	[{"changed": {"fields": ["category"]}}]	12	1
3137	2018-11-16 15:06:25.146896+08	338	Iaer object (338)	2	[{"changed": {"fields": ["category"]}}]	12	1
3138	2018-11-16 15:06:32.28632+08	342	Iaer object (342)	2	[{"changed": {"fields": ["category"]}}]	12	1
3139	2018-11-16 15:06:40.292487+08	343	Iaer object (343)	2	[{"changed": {"fields": ["category"]}}]	12	1
3140	2018-11-16 15:06:48.053714+08	352	Iaer object (352)	2	[{"changed": {"fields": ["category"]}}]	12	1
3141	2018-11-16 15:08:16.754841+08	708	Iaer object (708)	2	[{"changed": {"fields": ["category"]}}]	12	1
3142	2018-11-16 15:08:24.08983+08	667	Iaer object (667)	2	[{"changed": {"fields": ["category"]}}]	12	1
3143	2018-11-16 15:08:36.15681+08	619	Iaer object (619)	2	[{"changed": {"fields": ["category"]}}]	12	1
3144	2018-11-16 15:08:44.216563+08	617	Iaer object (617)	2	[{"changed": {"fields": ["category"]}}]	12	1
3145	2018-11-16 15:08:54.470838+08	598	Iaer object (598)	2	[{"changed": {"fields": ["category"]}}]	12	1
3146	2018-11-16 15:09:02.442273+08	597	Iaer object (597)	2	[{"changed": {"fields": ["category"]}}]	12	1
3147	2018-11-16 15:09:12.740177+08	596	Iaer object (596)	2	[{"changed": {"fields": ["category"]}}]	12	1
3148	2018-11-16 15:09:29.321202+08	594	Iaer object (594)	2	[{"changed": {"fields": ["category"]}}]	12	1
3149	2018-11-16 15:09:37.040516+08	591	Iaer object (591)	2	[{"changed": {"fields": ["category"]}}]	12	1
3150	2018-11-16 15:09:42.655299+08	585	Iaer object (585)	2	[{"changed": {"fields": ["category"]}}]	12	1
3151	2018-11-16 15:09:49.42413+08	581	Iaer object (581)	2	[{"changed": {"fields": ["category"]}}]	12	1
3152	2018-11-16 15:09:57.204815+08	574	Iaer object (574)	2	[{"changed": {"fields": ["category"]}}]	12	1
3153	2018-11-16 15:11:36.601389+08	303	Iaer object (303)	2	[{"changed": {"fields": ["category"]}}]	12	1
3154	2018-11-16 15:11:51.69678+08	200	Iaer object (200)	2	[{"changed": {"fields": ["category"]}}]	12	1
3155	2018-11-16 15:11:59.773484+08	199	Iaer object (199)	2	[{"changed": {"fields": ["category"]}}]	12	1
3156	2018-11-16 15:12:07.630765+08	185	Iaer object (185)	2	[{"changed": {"fields": ["category"]}}]	12	1
3157	2018-11-16 15:12:14.583839+08	183	Iaer object (183)	2	[{"changed": {"fields": ["category"]}}]	12	1
3158	2018-11-16 15:12:24.769569+08	166	Iaer object (166)	2	[{"changed": {"fields": ["category"]}}]	12	1
3159	2018-11-16 15:12:30.641677+08	153	Iaer object (153)	2	[{"changed": {"fields": ["category"]}}]	12	1
3160	2018-11-16 15:12:44.207814+08	142	Iaer object (142)	2	[{"changed": {"fields": ["category"]}}]	12	1
3161	2018-11-16 15:13:40.846154+08	109	Iaer object (109)	2	[{"changed": {"fields": ["category"]}}]	12	1
3162	2018-11-16 15:13:46.703686+08	122	Iaer object (122)	2	[{"changed": {"fields": ["category"]}}]	12	1
3163	2018-11-16 15:13:53.272347+08	127	Iaer object (127)	2	[{"changed": {"fields": ["category"]}}]	12	1
3164	2018-11-16 15:14:07.359376+08	141	Iaer object (141)	2	[{"changed": {"fields": ["category"]}}]	12	1
3165	2018-11-16 15:14:30.72619+08	242	Iaer object (242)	2	[{"changed": {"fields": ["category"]}}]	12	1
3166	2018-11-16 15:14:41.902896+08	252	Iaer object (252)	2	[{"changed": {"fields": ["category"]}}]	12	1
3167	2018-11-16 15:14:47.701452+08	253	Iaer object (253)	2	[{"changed": {"fields": ["category"]}}]	12	1
3168	2018-11-16 15:14:56.500327+08	254	Iaer object (254)	2	[{"changed": {"fields": ["category"]}}]	12	1
3169	2018-11-16 15:15:12.463624+08	267	Iaer object (267)	2	[{"changed": {"fields": ["category"]}}]	12	1
3170	2018-11-16 15:17:19.822863+08	74	Iaer object (74)	2	[{"changed": {"fields": ["category"]}}]	12	1
3171	2018-11-16 15:17:39.368902+08	86	Iaer object (86)	2	[{"changed": {"fields": ["category"]}}]	12	1
3172	2018-11-16 15:17:46.620782+08	89	Iaer object (89)	2	[{"changed": {"fields": ["category"]}}]	12	1
3173	2018-11-16 15:17:56.427484+08	103	Iaer object (103)	2	[{"changed": {"fields": ["category"]}}]	12	1
3174	2018-11-16 15:18:11.769069+08	108	Iaer object (108)	2	[{"changed": {"fields": ["category"]}}]	12	1
3175	2018-11-16 15:18:19.443022+08	110	Iaer object (110)	2	[{"changed": {"fields": ["category"]}}]	12	1
3176	2018-11-16 15:18:27.346286+08	139	Iaer object (139)	2	[{"changed": {"fields": ["category"]}}]	12	1
3177	2018-11-16 15:18:44.423778+08	148	Iaer object (148)	2	[{"changed": {"fields": ["category"]}}]	12	1
3178	2018-11-16 15:19:05.049824+08	176	Iaer object (176)	2	[{"changed": {"fields": ["category"]}}]	12	1
3179	2018-11-16 15:19:11.781786+08	220	Iaer object (220)	2	[{"changed": {"fields": ["category"]}}]	12	1
3180	2018-11-16 15:19:16.881128+08	233	Iaer object (233)	2	[{"changed": {"fields": ["category"]}}]	12	1
3181	2018-11-16 15:19:23.191618+08	240	Iaer object (240)	2	[{"changed": {"fields": ["category"]}}]	12	1
3182	2018-11-16 15:19:29.096041+08	265	Iaer object (265)	2	[{"changed": {"fields": ["category"]}}]	12	1
3183	2018-11-16 15:19:35.266055+08	268	Iaer object (268)	2	[{"changed": {"fields": ["category"]}}]	12	1
3184	2018-11-16 15:20:42.901528+08	15	Iaer object (15)	2	[{"changed": {"fields": ["category"]}}]	12	1
3185	2018-11-16 15:20:49.786285+08	16	Iaer object (16)	2	[{"changed": {"fields": ["category"]}}]	12	1
3186	2018-11-16 15:20:56.095377+08	17	Iaer object (17)	2	[{"changed": {"fields": ["category"]}}]	12	1
3187	2018-11-16 15:21:05.818996+08	25	Iaer object (25)	2	[{"changed": {"fields": ["category"]}}]	12	1
3188	2018-11-16 15:21:13.391401+08	31	Iaer object (31)	2	[{"changed": {"fields": ["category"]}}]	12	1
3189	2018-11-16 15:21:19.347948+08	32	Iaer object (32)	2	[{"changed": {"fields": ["category"]}}]	12	1
3190	2018-11-16 15:21:27.134646+08	33	Iaer object (33)	2	[{"changed": {"fields": ["category"]}}]	12	1
3191	2018-11-16 15:21:33.01615+08	49	Iaer object (49)	2	[{"changed": {"fields": ["category"]}}]	12	1
3192	2018-11-16 15:21:39.298621+08	57	Iaer object (57)	2	[{"changed": {"fields": ["category"]}}]	12	1
3193	2018-11-16 15:21:47.803118+08	59	Iaer object (59)	2	[{"changed": {"fields": ["category"]}}]	12	1
3194	2018-11-16 15:21:54.846497+08	65	Iaer object (65)	2	[{"changed": {"fields": ["category"]}}]	12	1
3195	2018-11-16 15:22:01.753663+08	66	Iaer object (66)	2	[{"changed": {"fields": ["category"]}}]	12	1
3196	2018-11-16 15:22:08.751188+08	69	Iaer object (69)	2	[{"changed": {"fields": ["category"]}}]	12	1
3197	2018-11-16 15:22:14.43985+08	73	Iaer object (73)	2	[{"changed": {"fields": ["category"]}}]	12	1
3198	2018-11-16 15:23:09.621048+08	510	Iaer object (510)	2	[{"changed": {"fields": ["category"]}}]	12	1
3199	2018-11-16 15:23:17.516556+08	509	Iaer object (509)	2	[{"changed": {"fields": ["category"]}}]	12	1
3200	2018-11-16 15:23:23.836033+08	447	Iaer object (447)	2	[{"changed": {"fields": ["category"]}}]	12	1
3201	2018-11-16 15:23:29.753115+08	407	Iaer object (407)	2	[{"changed": {"fields": ["category"]}}]	12	1
3202	2018-11-16 15:23:35.91257+08	377	Iaer object (377)	2	[{"changed": {"fields": ["category"]}}]	12	1
3203	2018-11-16 15:23:49.500516+08	372	Iaer object (372)	2	[{"changed": {"fields": ["category"]}}]	12	1
3204	2018-11-16 15:23:55.826686+08	371	Iaer object (371)	2	[{"changed": {"fields": ["category"]}}]	12	1
3205	2018-11-16 15:24:01.793201+08	370	Iaer object (370)	2	[{"changed": {"fields": ["category"]}}]	12	1
3206	2018-11-16 15:24:16.568175+08	368	Iaer object (368)	2	[{"changed": {"fields": ["category"]}}]	12	1
3207	2018-11-16 15:24:23.813505+08	367	Iaer object (367)	2	[{"changed": {"fields": ["category"]}}]	12	1
3208	2018-11-16 15:24:30.33372+08	364	Iaer object (364)	2	[{"changed": {"fields": ["category"]}}]	12	1
3209	2018-11-16 15:24:36.648493+08	363	Iaer object (363)	2	[{"changed": {"fields": ["category"]}}]	12	1
3210	2018-11-16 15:24:43.301634+08	362	Iaer object (362)	2	[{"changed": {"fields": ["category"]}}]	12	1
3211	2018-11-16 15:24:50.625726+08	360	Iaer object (360)	2	[{"changed": {"fields": ["category"]}}]	12	1
3212	2018-11-16 15:24:57.535564+08	356	Iaer object (356)	2	[{"changed": {"fields": ["category"]}}]	12	1
3213	2018-11-16 15:25:53.678872+08	608	Iaer object (608)	2	[{"changed": {"fields": ["category"]}}]	12	1
3214	2018-11-16 15:26:00.251575+08	595	Iaer object (595)	2	[{"changed": {"fields": ["category"]}}]	12	1
3215	2018-11-16 15:26:17.50649+08	570	Iaer object (570)	2	[{"changed": {"fields": ["category"]}}]	12	1
3216	2018-11-16 15:26:24.697521+08	568	Iaer object (568)	2	[{"changed": {"fields": ["category"]}}]	12	1
3217	2018-11-16 15:26:31.076959+08	563	Iaer object (563)	2	[{"changed": {"fields": ["category"]}}]	12	1
3218	2018-11-16 15:26:37.639927+08	562	Iaer object (562)	2	[{"changed": {"fields": ["category"]}}]	12	1
3219	2018-11-16 15:27:03.361137+08	561	Iaer object (561)	2	[{"changed": {"fields": ["category"]}}]	12	1
3220	2018-11-16 15:27:10.135573+08	555	Iaer object (555)	2	[{"changed": {"fields": ["category"]}}]	12	1
3221	2018-11-16 15:27:17.015617+08	530	Iaer object (530)	2	[{"changed": {"fields": ["category"]}}]	12	1
3222	2018-11-16 15:27:24.37678+08	369	Iaer object (369)	2	[{"changed": {"fields": ["category"]}}]	12	1
3223	2018-11-16 15:27:30.176377+08	331	Iaer object (331)	2	[{"changed": {"fields": ["category"]}}]	12	1
3224	2018-11-16 15:27:36.252216+08	329	Iaer object (329)	2	[{"changed": {"fields": ["category"]}}]	12	1
3225	2018-11-16 15:27:41.971942+08	324	Iaer object (324)	2	[{"changed": {"fields": ["category"]}}]	12	1
3226	2018-11-16 15:27:54.411196+08	292	Iaer object (292)	2	[{"changed": {"fields": ["category"]}}]	12	1
3227	2018-11-16 15:28:00.022825+08	280	Iaer object (280)	2	[{"changed": {"fields": ["category"]}}]	12	1
3228	2018-11-16 15:28:48.592571+08	863	Iaer object (863)	2	[{"changed": {"fields": ["category"]}}]	12	1
3229	2018-11-16 15:28:54.480266+08	824	Iaer object (824)	2	[{"changed": {"fields": ["category"]}}]	12	1
3230	2018-11-16 15:29:01.198305+08	717	Iaer object (717)	2	[{"changed": {"fields": ["category"]}}]	12	1
3231	2018-11-16 15:29:06.973375+08	140	Iaer object (140)	2	[{"changed": {"fields": ["category"]}}]	12	1
3232	2018-11-16 15:31:54.770862+08	839	Iaer object (839)	2	[{"changed": {"fields": ["category"]}}]	12	1
3233	2018-11-16 15:32:01.935913+08	871	Iaer object (871)	2	[{"changed": {"fields": ["category"]}}]	12	1
3234	2018-11-16 15:32:09.4554+08	864	Iaer object (864)	2	[{"changed": {"fields": ["category"]}}]	12	1
3235	2018-11-16 15:32:16.143054+08	507	Iaer object (507)	2	[{"changed": {"fields": ["category"]}}]	12	1
3236	2018-11-16 15:32:22.046841+08	386	Iaer object (386)	2	[{"changed": {"fields": ["category"]}}]	12	1
3237	2018-11-16 15:32:27.461693+08	378	Iaer object (378)	2	[{"changed": {"fields": ["category"]}}]	12	1
3238	2018-11-16 15:32:33.345656+08	666	Iaer object (666)	2	[{"changed": {"fields": ["category"]}}]	12	1
3239	2018-11-16 15:34:36.827949+08	596	Iaer object (596)	2	[{"changed": {"fields": ["category"]}}]	12	1
3240	2018-11-16 15:54:24.007901+08	854	Iaer object (854)	2	[{"changed": {"fields": ["category"]}}]	12	1
3241	2018-11-16 15:54:35.216461+08	868	Iaer object (868)	2	[{"changed": {"fields": ["category"]}}]	12	1
3242	2018-11-16 15:54:42.205764+08	852	Iaer object (852)	2	[{"changed": {"fields": ["category"]}}]	12	1
3243	2018-11-16 15:54:52.513809+08	829	Iaer object (829)	2	[{"changed": {"fields": ["category"]}}]	12	1
3244	2018-11-16 15:55:00.618379+08	815	Iaer object (815)	2	[{"changed": {"fields": ["category"]}}]	12	1
3245	2018-11-16 15:55:07.898014+08	803	Iaer object (803)	2	[{"changed": {"fields": ["category"]}}]	12	1
3246	2018-11-16 15:55:16.882898+08	794	Iaer object (794)	2	[{"changed": {"fields": ["category"]}}]	12	1
3247	2018-11-16 15:55:26.1948+08	793	Iaer object (793)	2	[{"changed": {"fields": ["category"]}}]	12	1
3248	2018-11-16 15:55:36.20379+08	783	Iaer object (783)	2	[{"changed": {"fields": ["category"]}}]	12	1
3249	2018-11-16 15:55:43.875206+08	773	Iaer object (773)	2	[{"changed": {"fields": ["category"]}}]	12	1
3250	2018-11-16 15:56:14.103609+08	772	Iaer object (772)	2	[{"changed": {"fields": ["category"]}}]	12	1
3251	2018-11-16 15:57:03.380655+08	770	Iaer object (770)	2	[{"changed": {"fields": ["category"]}}]	12	1
3252	2018-11-16 15:57:15.133632+08	760	Iaer object (760)	2	[{"changed": {"fields": ["category"]}}]	12	1
3253	2018-11-16 15:57:23.675107+08	722	Iaer object (722)	2	[{"changed": {"fields": ["category"]}}]	12	1
3254	2018-11-16 15:57:31.850498+08	713	Iaer object (713)	2	[{"changed": {"fields": ["category"]}}]	12	1
3255	2018-11-16 15:57:39.247748+08	704	Iaer object (704)	2	[{"changed": {"fields": ["category"]}}]	12	1
3256	2018-11-16 15:57:45.195395+08	703	Iaer object (703)	2	[{"changed": {"fields": ["category"]}}]	12	1
3257	2018-11-16 15:57:56.059449+08	702	Iaer object (702)	2	[{"changed": {"fields": ["category"]}}]	12	1
3258	2018-11-16 15:58:04.98918+08	685	Iaer object (685)	2	[{"changed": {"fields": ["category"]}}]	12	1
3259	2018-11-16 15:58:14.822185+08	672	Iaer object (672)	2	[{"changed": {"fields": ["category"]}}]	12	1
3260	2018-11-16 15:58:26.361267+08	665	Iaer object (665)	2	[{"changed": {"fields": ["category"]}}]	12	1
3261	2018-11-16 15:58:36.411718+08	654	Iaer object (654)	2	[{"changed": {"fields": ["category"]}}]	12	1
3262	2018-11-16 15:58:47.183024+08	653	Iaer object (653)	2	[{"changed": {"fields": ["category"]}}]	12	1
3263	2018-11-16 15:58:54.959544+08	652	Iaer object (652)	2	[{"changed": {"fields": ["category"]}}]	12	1
3264	2018-11-16 15:59:01.878745+08	651	Iaer object (651)	2	[{"changed": {"fields": ["category"]}}]	12	1
3265	2018-11-16 15:59:10.606469+08	649	Iaer object (649)	2	[{"changed": {"fields": ["category"]}}]	12	1
3266	2018-11-16 15:59:17.537996+08	648	Iaer object (648)	2	[{"changed": {"fields": ["category"]}}]	12	1
3267	2018-11-16 15:59:23.86652+08	647	Iaer object (647)	2	[{"changed": {"fields": ["category"]}}]	12	1
3268	2018-11-16 15:59:32.516936+08	643	Iaer object (643)	2	[{"changed": {"fields": ["category"]}}]	12	1
3269	2018-11-16 15:59:42.726774+08	642	Iaer object (642)	2	[{"changed": {"fields": ["category"]}}]	12	1
3270	2018-11-16 15:59:48.572488+08	641	Iaer object (641)	2	[{"changed": {"fields": ["category"]}}]	12	1
3271	2018-11-16 15:59:54.700343+08	638	Iaer object (638)	2	[{"changed": {"fields": ["category"]}}]	12	1
3272	2018-11-16 16:02:28.100451+08	747	Iaer object (747)	2	[{"changed": {"fields": ["category"]}}]	12	1
3273	2018-11-16 16:02:50.391937+08	738	Iaer object (738)	2	[{"changed": {"fields": ["category"]}}]	12	1
3274	2018-11-16 16:02:58.078422+08	678	Iaer object (678)	2	[{"changed": {"fields": ["category"]}}]	12	1
3275	2018-11-16 16:03:09.262955+08	629	Iaer object (629)	2	[{"changed": {"fields": ["category"]}}]	12	1
3276	2018-11-16 16:03:15.118508+08	609	Iaer object (609)	2	[{"changed": {"fields": ["category"]}}]	12	1
3277	2018-11-16 16:03:26.638988+08	611	Iaer object (611)	2	[{"changed": {"fields": ["category"]}}]	12	1
3278	2018-11-16 16:03:33.454771+08	609	Iaer object (609)	2	[]	12	1
3279	2018-11-16 16:03:43.335785+08	567	Iaer object (567)	2	[{"changed": {"fields": ["category"]}}]	12	1
3280	2018-11-16 16:03:51.864722+08	560	Iaer object (560)	2	[{"changed": {"fields": ["category"]}}]	12	1
3281	2018-11-16 16:03:58.789688+08	559	Iaer object (559)	2	[{"changed": {"fields": ["category"]}}]	12	1
3282	2018-11-16 16:10:20.012278+08	517	Iaer object (517)	2	[{"changed": {"fields": ["category"]}}]	12	1
3283	2018-11-16 16:10:27.440885+08	518	Iaer object (518)	2	[{"changed": {"fields": ["category"]}}]	12	1
3284	2018-11-16 16:10:34.602218+08	519	Iaer object (519)	2	[{"changed": {"fields": ["category"]}}]	12	1
3285	2018-11-16 16:10:48.125354+08	525	Iaer object (525)	2	[{"changed": {"fields": ["category"]}}]	12	1
3286	2018-11-16 16:10:56.838147+08	494	Iaer object (494)	2	[{"changed": {"fields": ["category"]}}]	12	1
3287	2018-11-16 16:11:02.966344+08	493	Iaer object (493)	2	[{"changed": {"fields": ["category"]}}]	12	1
3288	2018-11-16 16:11:08.543414+08	480	Iaer object (480)	2	[{"changed": {"fields": ["category"]}}]	12	1
3289	2018-11-16 16:12:16.685626+08	479	Iaer object (479)	2	[{"changed": {"fields": ["category"]}}]	12	1
3290	2018-11-16 16:12:24.229922+08	474	Iaer object (474)	2	[{"changed": {"fields": ["category"]}}]	12	1
3291	2018-11-16 16:12:32.350645+08	472	Iaer object (472)	2	[{"changed": {"fields": ["category"]}}]	12	1
3292	2018-11-16 16:12:38.633864+08	467	Iaer object (467)	2	[{"changed": {"fields": ["category"]}}]	12	1
3293	2018-11-16 16:12:45.594921+08	466	Iaer object (466)	2	[{"changed": {"fields": ["category"]}}]	12	1
3294	2018-11-16 16:12:58.917888+08	463	Iaer object (463)	2	[{"changed": {"fields": ["category"]}}]	12	1
3295	2018-11-16 16:13:07.823867+08	458	Iaer object (458)	2	[{"changed": {"fields": ["category"]}}]	12	1
3296	2018-11-16 16:13:14.403094+08	440	Iaer object (440)	2	[{"changed": {"fields": ["category"]}}]	12	1
3297	2018-11-16 16:13:25.458208+08	421	Iaer object (421)	2	[{"changed": {"fields": ["category"]}}]	12	1
3298	2018-11-16 16:13:43.861727+08	417	Iaer object (417)	2	[{"changed": {"fields": ["category"]}}]	12	1
3299	2018-11-16 16:13:52.092981+08	410	Iaer object (410)	2	[{"changed": {"fields": ["category"]}}]	12	1
3300	2018-11-16 16:13:59.989981+08	353	Iaer object (353)	2	[{"changed": {"fields": ["category"]}}]	12	1
3301	2018-11-16 16:14:20.671649+08	312	Iaer object (312)	2	[{"changed": {"fields": ["category"]}}]	12	1
3302	2018-11-16 16:14:27.789929+08	311	Iaer object (311)	2	[{"changed": {"fields": ["category"]}}]	12	1
3303	2018-11-16 16:14:34.23551+08	310	Iaer object (310)	2	[{"changed": {"fields": ["category"]}}]	12	1
3304	2018-11-16 16:14:40.669997+08	309	Iaer object (309)	2	[{"changed": {"fields": ["category"]}}]	12	1
3305	2018-11-16 16:14:57.996956+08	281	Iaer object (281)	2	[{"changed": {"fields": ["category"]}}]	12	1
3306	2018-11-16 16:15:12.509581+08	274	Iaer object (274)	2	[{"changed": {"fields": ["category"]}}]	12	1
3307	2018-11-16 16:15:33.971743+08	259	Iaer object (259)	2	[{"changed": {"fields": ["category"]}}]	12	1
3308	2018-11-16 16:15:44.946934+08	245	Iaer object (245)	2	[{"changed": {"fields": ["category"]}}]	12	1
3309	2018-11-16 16:15:57.817147+08	245	Iaer object (245)	2	[{"changed": {"fields": ["category"]}}]	12	1
3310	2018-11-16 16:16:04.983738+08	243	Iaer object (243)	2	[{"changed": {"fields": ["category"]}}]	12	1
3311	2018-11-16 16:16:13.81229+08	234	Iaer object (234)	2	[{"changed": {"fields": ["category"]}}]	12	1
3312	2018-11-16 16:16:27.971555+08	231	Iaer object (231)	2	[{"changed": {"fields": ["category"]}}]	12	1
3313	2018-11-16 16:16:35.031251+08	222	Iaer object (222)	2	[{"changed": {"fields": ["category"]}}]	12	1
3314	2018-11-16 16:16:40.864485+08	202	Iaer object (202)	2	[{"changed": {"fields": ["category"]}}]	12	1
3315	2018-11-16 16:16:59.61893+08	194	Iaer object (194)	2	[{"changed": {"fields": ["category"]}}]	12	1
3316	2018-11-16 16:17:07.442351+08	539	Iaer object (539)	2	[{"changed": {"fields": ["category"]}}]	12	1
3317	2018-11-16 16:17:14.900208+08	558	Iaer object (558)	2	[]	12	1
3318	2018-11-16 16:17:29.220657+08	557	Iaer object (557)	2	[{"changed": {"fields": ["category"]}}]	12	1
3319	2018-11-16 16:17:36.527473+08	558	Iaer object (558)	2	[{"changed": {"fields": ["category"]}}]	12	1
3320	2018-11-16 16:17:42.193817+08	551	Iaer object (551)	2	[{"changed": {"fields": ["category"]}}]	12	1
3321	2018-11-16 16:21:22.761383+08	187	Iaer object (187)	2	[{"changed": {"fields": ["category"]}}]	12	1
3322	2018-11-16 16:21:41.9864+08	167	Iaer object (167)	2	[{"changed": {"fields": ["category"]}}]	12	1
3323	2018-11-16 16:21:53.241543+08	159	Iaer object (159)	2	[{"changed": {"fields": ["category"]}}]	12	1
3324	2018-11-16 16:21:59.865437+08	149	Iaer object (149)	2	[{"changed": {"fields": ["category"]}}]	12	1
3325	2018-11-16 16:22:07.036281+08	147	Iaer object (147)	2	[{"changed": {"fields": ["category"]}}]	12	1
3326	2018-11-16 16:22:17.796894+08	135	Iaer object (135)	2	[{"changed": {"fields": ["category"]}}]	12	1
3327	2018-11-16 16:22:27.698412+08	134	Iaer object (134)	2	[{"changed": {"fields": ["category"]}}]	12	1
3328	2018-11-16 16:22:35.297273+08	131	Iaer object (131)	2	[{"changed": {"fields": ["category"]}}]	12	1
3329	2018-11-16 16:22:54.53763+08	129	Iaer object (129)	2	[{"changed": {"fields": ["category"]}}]	12	1
3330	2018-11-16 16:23:02.060088+08	128	Iaer object (128)	2	[{"changed": {"fields": ["category"]}}]	12	1
3331	2018-11-16 16:23:10.160489+08	91	Iaer object (91)	2	[{"changed": {"fields": ["category"]}}]	12	1
3332	2018-11-16 16:23:26.365615+08	87	Iaer object (87)	2	[{"changed": {"fields": ["category"]}}]	12	1
3333	2018-11-16 16:23:33.840392+08	85	Iaer object (85)	2	[{"changed": {"fields": ["category"]}}]	12	1
3334	2018-11-16 16:24:09.353738+08	58	Iaer object (58)	2	[{"changed": {"fields": ["category"]}}]	12	1
3335	2018-11-16 16:24:16.892076+08	46	Iaer object (46)	2	[{"changed": {"fields": ["category"]}}]	12	1
3336	2018-11-16 16:24:23.073037+08	40	Iaer object (40)	2	[{"changed": {"fields": ["category"]}}]	12	1
3337	2018-11-16 16:24:31.422227+08	30	Iaer object (30)	2	[{"changed": {"fields": ["category"]}}]	12	1
3338	2018-11-16 16:24:40.443436+08	29	Iaer object (29)	2	[{"changed": {"fields": ["category"]}}]	12	1
3339	2018-11-16 16:24:48.220316+08	27	Iaer object (27)	2	[{"changed": {"fields": ["category"]}}]	12	1
3340	2018-11-16 16:24:57.044051+08	24	Iaer object (24)	2	[{"changed": {"fields": ["category"]}}]	12	1
3341	2018-11-16 16:25:04.113562+08	23	Iaer object (23)	2	[{"changed": {"fields": ["category"]}}]	12	1
3342	2018-11-16 16:25:14.157246+08	10	Iaer object (10)	2	[{"changed": {"fields": ["category"]}}]	12	1
3343	2018-11-16 16:29:21.786677+08	870	Iaer object (870)	2	[{"changed": {"fields": ["category"]}}]	12	1
3344	2018-11-16 16:29:27.463629+08	867	Iaer object (867)	2	[{"changed": {"fields": ["category"]}}]	12	1
3345	2018-11-16 16:29:33.638071+08	865	Iaer object (865)	2	[{"changed": {"fields": ["category"]}}]	12	1
3346	2018-11-16 16:29:39.881352+08	552	Iaer object (552)	2	[{"changed": {"fields": ["category"]}}]	12	1
3347	2018-11-16 16:29:46.290799+08	522	Iaer object (522)	2	[{"changed": {"fields": ["category"]}}]	12	1
3348	2018-11-16 16:29:52.678361+08	221	Iaer object (221)	2	[{"changed": {"fields": ["category"]}}]	12	1
3349	2018-11-16 16:30:04.651149+08	5	Iaer object (5)	2	[{"changed": {"fields": ["category"]}}]	12	1
3350	2018-11-20 16:59:15.763235+08	4	admin	1	[{"added": {}}]	2	1
3351	2018-11-20 17:00:20.63146+08	4	admin	2	[{"changed": {"fields": ["first_name", "last_name", "email", "is_staff", "is_superuser", "user_permissions", "last_login"]}}]	2	1
3352	2018-11-21 16:23:40.723843+08	2	emily	2	[{"changed": {"fields": ["fund"]}}]	11	4
3353	2018-11-21 16:23:55.233732+08	4	dudu	2	[{"changed": {"fields": ["fund"]}}]	11	4
3354	2018-11-21 17:05:50.094178+08	10001	Iaer object (10001)	3		12	4
3355	2018-11-21 17:19:52.670767+08	880	Iaer object (880)	3		12	4
3356	2018-11-21 17:19:52.68943+08	879	Iaer object (879)	3		12	4
3357	2018-11-22 09:36:01.790775+08	883	Iaer object (883)	1	[{"added": {}}]	12	4
3358	2018-11-22 10:01:14.236686+08	884	Iaer object (884)	1	[{"added": {}}]	12	4
3359	2018-11-23 11:14:33.938121+08	908	Iaer object (908)	3		12	4
3360	2018-11-23 11:14:33.954013+08	907	Iaer object (907)	3		12	4
3361	2018-11-23 11:14:33.966045+08	906	Iaer object (906)	3		12	4
3362	2018-11-23 11:14:33.973564+08	905	Iaer object (905)	3		12	4
3363	2018-11-23 11:14:33.982059+08	904	Iaer object (904)	3		12	4
3364	2018-11-23 11:14:33.992018+08	903	Iaer object (903)	3		12	4
3365	2018-11-23 11:14:34.000711+08	902	Iaer object (902)	3		12	4
3366	2018-11-23 11:14:34.007831+08	901	Iaer object (901)	3		12	4
3367	2018-11-23 11:14:34.014875+08	900	Iaer object (900)	3		12	4
3368	2018-11-23 11:14:34.023321+08	899	Iaer object (899)	3		12	4
3369	2018-11-23 11:14:34.032547+08	898	Iaer object (898)	3		12	4
3370	2018-11-23 11:14:34.03985+08	897	Iaer object (897)	3		12	4
3371	2018-11-23 11:14:34.046829+08	896	Iaer object (896)	3		12	4
3372	2018-11-23 11:14:34.056014+08	895	Iaer object (895)	3		12	4
3373	2018-11-23 11:14:34.068755+08	894	Iaer object (894)	3		12	4
3374	2018-11-23 11:14:34.075793+08	893	Iaer object (893)	3		12	4
3375	2018-11-23 11:14:34.084808+08	892	Iaer object (892)	3		12	4
3376	2018-11-23 11:14:34.091939+08	891	Iaer object (891)	3		12	4
3377	2018-11-23 11:14:34.099229+08	890	Iaer object (890)	3		12	4
3378	2018-11-23 11:14:34.10622+08	889	Iaer object (889)	3		12	4
3379	2018-11-23 11:14:34.115414+08	888	Iaer object (888)	3		12	4
3380	2018-11-23 11:14:34.122304+08	887	Iaer object (887)	3		12	4
3381	2018-11-23 11:14:34.129422+08	886	Iaer object (886)	3		12	4
3382	2018-11-23 11:14:34.136382+08	885	Iaer object (885)	3		12	4
3383	2018-11-23 16:42:06.47626+08	23	Category object (23)	1	[{"added": {}}]	15	4
3384	2018-11-23 16:42:16.71649+08	1	Category object (1)	2	[{"changed": {"fields": ["sequence"]}}]	15	4
3385	2018-11-23 16:44:32.86329+08	911	Iaer object (911)	3		12	4
3386	2018-11-23 16:44:32.882519+08	910	Iaer object (910)	3		12	4
3387	2018-11-23 16:44:32.892665+08	909	Iaer object (909)	3		12	4
3388	2018-11-23 16:50:58.961752+08	2	1	1	[{"added": {}}]	13	4
3389	2018-11-23 16:51:08.134236+08	3	-1	1	[{"added": {}}]	13	4
3390	2018-11-23 16:51:16.958215+08	4	2	1	[{"added": {}}]	13	4
3391	2018-11-23 17:04:54.756808+08	749	Iaer object (749)	2	[{"changed": {"fields": ["created"]}}]	12	4
3392	2018-11-23 17:08:23.613329+08	727	Iaer object (727)	2	[{"changed": {"fields": ["created"]}}]	12	4
3393	2018-11-23 17:09:06.122541+08	730	Iaer object (730)	2	[{"changed": {"fields": ["created"]}}]	12	4
3394	2018-11-23 17:10:39.744904+08	178	Iaer object (178)	2	[{"changed": {"fields": ["created"]}}]	12	4
3395	2018-11-23 17:11:44.139645+08	335	Iaer object (335)	2	[{"changed": {"fields": ["created"]}}]	12	4
3396	2018-11-23 17:17:52.752074+08	727	Iaer object (727)	2	[{"changed": {"fields": ["created"]}}]	12	4
3397	2018-11-23 17:19:18.347689+08	335	Iaer object (335)	2	[{"changed": {"fields": ["created"]}}]	12	4
3398	2018-11-26 13:34:21.913098+08	70	RedEnvelope object (70)	3		10	4
3399	2018-11-26 13:34:21.940437+08	69	RedEnvelope object (69)	3		10	4
3400	2018-11-26 13:34:21.98787+08	68	RedEnvelope object (68)	3		10	4
3401	2018-11-26 13:34:22.00334+08	67	RedEnvelope object (67)	3		10	4
3402	2018-11-28 12:06:55.593331+08	bb9b3bcc265f9928d7e913b6bfc43b622918d430	bb9b3bcc265f9928d7e913b6bfc43b622918d430	1	[{"added": {}}]	16	4
3403	2018-12-10 14:22:19.161664+08	5	test	3		2	4
3404	2018-12-10 14:41:45.7836+08	6	test	3		2	4
3405	2019-09-07 13:06:25.003618+08	90	RedEnvelope object (90)	2	[{"changed": {"fields": ["money"]}}]	10	4
3406	2019-09-07 13:08:17.88833+08	90	RedEnvelope object (90)	2	[{"changed": {"fields": ["money"]}}]	10	4
3407	2019-09-07 15:18:24.889696+08	90	RedEnvelope object (90)	2	[{"changed": {"fields": ["money"]}}]	10	4
3408	2019-09-07 15:28:28.184146+08	90	RedEnvelope object (90)	2	[{"changed": {"fields": ["money"]}}]	10	4
3409	2019-09-12 17:35:01.074158+08	58	RedEnvelope object (58)	2	[{"changed": {"fields": ["money"]}}]	10	4
3410	2019-09-12 17:37:43.164474+08	58	RedEnvelope object (58)	2	[{"changed": {"fields": ["money"]}}]	10	4
3411	2019-10-09 18:10:51.4137+08	125	RedEnvelope object (125)	3		10	4
3412	2019-10-09 18:10:51.445863+08	124	RedEnvelope object (124)	3		10	4
3413	2019-10-09 18:10:51.460546+08	123	RedEnvelope object (123)	3		10	4
3414	2019-10-09 18:10:51.471856+08	122	RedEnvelope object (122)	3		10	4
3415	2019-10-09 18:10:51.483124+08	121	RedEnvelope object (121)	3		10	4
3416	2019-10-09 18:10:51.495032+08	120	RedEnvelope object (120)	3		10	4
3417	2019-10-10 10:29:37.344092+08	135	RedEnvelope object (135)	3		10	4
3418	2019-10-10 10:29:37.368218+08	134	RedEnvelope object (134)	3		10	4
3419	2019-10-10 11:15:09.413143+08	136	RedEnvelope object (136)	3		10	4
3420	2019-10-10 11:48:30.761264+08	137	RedEnvelope object (137)	3		10	4
3421	2019-10-10 13:17:32.034127+08	138	RedEnvelope object (138)	3		10	4
3422	2019-10-11 10:18:43.539002+08	142	RedEnvelope object (142)	2	[{"changed": {"fields": ["money"]}}]	10	4
3423	2019-10-11 10:19:12.710166+08	142	RedEnvelope object (142)	2	[{"changed": {"fields": ["money"]}}]	10	4
3424	2019-12-23 13:10:52.397021+08	1	About object (1)	1	[{"added": {}}]	18	4
3425	2019-12-23 15:38:03.78961+08	1	About object (1)	3		18	4
3426	2019-12-23 15:38:36.847121+08	2	About object (2)	1	[{"added": {}}]	18	4
3427	2019-12-23 15:45:00.953172+08	3	About object (3)	1	[{"added": {}}]	18	4
3428	2019-12-23 15:45:17.326635+08	2	About object (2)	2	[{"changed": {"fields": ["comment"]}}]	18	4
3429	2019-12-23 15:53:16.207846+08	3	About object (3)	2	[{"changed": {"fields": ["apk", "apk_json"]}}]	18	4
3430	2019-12-23 15:58:06.474326+08	4	About object (4)	1	[{"added": {}}]	18	4
3431	2020-03-05 09:31:10.662357+08	5	About object (5)	1	[{"added": {}}]	18	4
3432	2020-03-12 11:44:34.047384+08	6	About object (6)	1	[{"added": {}}]	18	4
3433	2020-05-11 10:29:50.185512+08	24	Category object (24)	1	[{"added": {}}]	15	4
3434	2020-05-11 10:39:55.221761+08	2412	Iaer object (2412)	1	[{"added": {}}]	12	4
3435	2020-05-11 10:40:12.436066+08	2412	Iaer object (2412)	3		12	4
3436	2020-05-11 11:12:01.234524+08	2385	Iaer object (2385)	2	[{"changed": {"fields": ["category"]}}]	12	4
3437	2020-05-11 11:16:03.280031+08	2384	Iaer object (2384)	2	[{"changed": {"fields": ["category"]}}]	12	4
3438	2020-05-11 11:16:12.719158+08	2383	Iaer object (2383)	2	[{"changed": {"fields": ["category"]}}]	12	4
3439	2020-05-11 11:16:20.716573+08	2382	Iaer object (2382)	2	[{"changed": {"fields": ["category"]}}]	12	4
3440	2020-05-11 11:16:59.832169+08	2377	Iaer object (2377)	2	[{"changed": {"fields": ["category"]}}]	12	4
3441	2020-05-11 11:17:05.21339+08	2379	Iaer object (2379)	2	[{"changed": {"fields": ["category"]}}]	12	4
3442	2020-05-11 11:17:10.921286+08	2380	Iaer object (2380)	2	[{"changed": {"fields": ["category"]}}]	12	4
3443	2020-05-11 11:17:17.35679+08	2381	Iaer object (2381)	2	[{"changed": {"fields": ["category"]}}]	12	4
3444	2020-05-11 11:31:35.695576+08	2433	Iaer object (2433)	2	[{"changed": {"fields": ["category"]}}]	12	4
3445	2020-05-11 11:31:46.518909+08	2428	Iaer object (2428)	2	[{"changed": {"fields": ["category"]}}]	12	4
3446	2020-05-11 11:31:56.838131+08	2427	Iaer object (2427)	2	[{"changed": {"fields": ["category"]}}]	12	4
3447	2020-05-11 11:32:19.388504+08	2417	Iaer object (2417)	2	[{"changed": {"fields": ["category"]}}]	12	4
3448	2020-07-15 10:01:48.617752+08	7	About object (7)	1	[{"added": {}}]	18	4
3449	2020-07-20 13:34:13.871932+08	25	Category object (25)	1	[{"added": {}}]	15	4
3450	2020-07-20 13:34:39.801289+08	25	Category object (25)	2	[{"changed": {"fields": ["sequence"]}}]	15	4
3451	2020-07-20 13:34:50.088322+08	12	Category object (12)	3		15	4
3452	2020-07-20 13:36:03.706731+08	2169	Iaer object (2169)	2	[{"changed": {"fields": ["category"]}}]	12	4
3453	2020-07-22 10:36:28.258474+08	2633	Iaer object (2633)	2	[{"changed": {"fields": ["date"]}}]	12	4
3454	2020-07-22 10:36:49.213936+08	2632	Iaer object (2632)	2	[{"changed": {"fields": ["date"]}}]	12	4
3455	2020-10-15 13:18:28.05261+08	17	111	3		2	4
3456	2020-10-15 13:18:28.055215+08	19	dfsdf	3		2	4
3457	2020-10-15 13:18:28.056926+08	18	eaef	3		2	4
3458	2020-10-15 13:18:28.058689+08	20	rwerew	3		2	4
3459	2020-10-15 13:18:28.060676+08	15	tes	3		2	4
3460	2020-10-15 13:18:28.062172+08	16	tesg	3		2	4
3461	2020-10-15 13:18:28.063548+08	7	test	3		2	4
3462	2020-10-15 13:18:28.064912+08	9	test1	3		2	4
3463	2020-10-15 13:18:28.066322+08	10	test111	3		2	4
3464	2020-10-15 13:18:28.067591+08	11	test1111飞飞飞	3		2	4
3465	2020-10-15 13:18:28.068788+08	12	test1111飞飞飞问问	3		2	4
3466	2020-10-15 13:18:28.070085+08	13	test1111飞飞飞问问答	3		2	4
3467	2020-10-15 13:18:28.071383+08	14	test1111飞飞飞问问答qq	3		2	4
3468	2020-10-15 13:18:28.072629+08	8	test去	3		2	4
3469	2020-10-16 09:47:15.976577+08	21	test	2	[{"changed": {"fields": ["email"]}}]	2	4
3470	2020-10-16 10:58:13.966469+08	8	About object (8)	1	[{"added": {}}]	18	4
3471	2020-11-03 09:20:50.123367+08	2995	Iaer object (2995)	2	[{"changed": {"fields": ["date"]}}]	12	4
3472	2020-11-03 09:21:49.054914+08	2993	Iaer object (2993)	2	[{"changed": {"fields": ["date"]}}]	12	4
3473	2021-06-15 09:32:33.321259+08	3718	Iaer object (3718)	2	[{"changed": {"fields": ["date"]}}]	12	4
3474	2021-07-13 15:39:57.810947+08	3810	Iaer object (3810)	2	[{"changed": {"fields": ["date"]}}]	12	4
3475	2021-09-23 13:39:34.467672+08	4041	Iaer object (4041)	2	[{"changed": {"fields": ["date"]}}]	12	4
3476	2021-09-23 13:39:45.470639+08	4042	Iaer object (4042)	2	[{"changed": {"fields": ["date"]}}]	12	4
3477	2021-09-23 13:39:53.058289+08	4043	Iaer object (4043)	2	[{"changed": {"fields": ["date"]}}]	12	4
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: ben
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	user
3	auth	group
4	auth	permission
5	contenttypes	contenttype
6	sessions	session
7	photo	photo
8	photo	user
9	photo	gallery
10	iaer	redenvelope
11	iaer	user
12	iaer	iaer
13	iaer	fund
14	iaer	verify
15	iaer	category
16	authtoken	token
17	iaer	setting
18	iaer	about
19	iaer	test
20	tools	commonexchange
21	tools	currency
22	tools	exchangerate
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: ben
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2018-11-14 13:55:54.057842+08
2	auth	0001_initial	2018-11-14 13:55:54.479714+08
3	admin	0001_initial	2018-11-14 13:55:54.602742+08
4	admin	0002_logentry_remove_auto_add	2018-11-14 13:55:54.662301+08
5	contenttypes	0002_remove_content_type_name	2018-11-14 13:55:54.788654+08
6	auth	0002_alter_permission_name_max_length	2018-11-14 13:55:54.838806+08
7	auth	0003_alter_user_email_max_length	2018-11-14 13:55:54.908795+08
8	auth	0004_alter_user_username_opts	2018-11-14 13:55:54.979872+08
9	auth	0005_alter_user_last_login_null	2018-11-14 13:55:55.054891+08
10	auth	0006_require_contenttypes_0002	2018-11-14 13:55:55.067313+08
11	auth	0007_alter_validators_add_error_messages	2018-11-14 13:55:55.136767+08
12	auth	0008_alter_user_username_max_length	2018-11-14 13:55:55.272895+08
13	auth	0009_alter_user_last_name_max_length	2018-11-14 13:55:55.350953+08
14	authtoken	0001_initial	2018-11-14 13:55:55.47508+08
15	authtoken	0002_auto_20160226_1747	2018-11-14 13:55:55.741624+08
16	iaer	0001_initial	2018-11-14 13:55:56.402898+08
17	iaer	0002_auto_20181113_2332	2018-11-14 13:55:56.485915+08
18	iaer	0003_auto_20181114_1354	2018-11-14 13:55:56.576516+08
19	photo	0001_initial	2018-11-14 13:55:56.937419+08
20	photo	0002_auto_20181113_2338	2018-11-14 13:55:57.414806+08
21	sessions	0001_initial	2018-11-14 13:55:57.481396+08
22	iaer	0004_auto_20181114_1500	2018-11-14 15:00:49.310546+08
23	iaer	0005_auto_20181114_1508	2018-11-14 15:08:46.438637+08
24	iaer	0006_auto_20181114_1511	2018-11-21 16:24:11.100338+08
25	iaer	0007_auto_20181114_1512	2018-11-21 16:24:11.296605+08
26	iaer	0008_auto_20181121_1622	2018-11-21 16:24:11.630821+08
27	iaer	0009_auto_20181220_1538	2018-12-20 15:39:00.408831+08
28	iaer	0010_auto_20181226_1710	2018-12-26 17:10:17.667599+08
29	iaer	0011_auto_20181227_1418	2018-12-27 14:18:15.49854+08
30	iaer	0012_iaer_date	2019-11-06 13:39:44.37815+08
31	iaer	0013_auto_20191106_1336	2019-11-06 13:39:44.425424+08
32	iaer	0002_test	2019-12-21 15:34:10.654146+08
33	iaer	0002_about	2019-12-21 15:37:32.250789+08
34	iaer	0003_auto_20191221_1650	2019-12-21 16:50:11.691627+08
35	iaer	0004_auto_20191221_1651	2019-12-21 16:52:02.20027+08
36	iaer	0005_auto_20191221_1656	2019-12-21 16:56:09.234588+08
37	iaer	0006_auto_20191223_1537	2019-12-23 15:37:18.033429+08
38	tools	0001_initial	2020-07-21 13:59:44.632736+08
39	tools	0002_auto_20200721_1113	2020-07-21 13:59:44.651045+08
40	iaer	0002_auto_20200721_1401	2020-07-21 14:01:47.34992+08
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: ben
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
7yeukeq6jdssao3ig7guv4xji695n20p	YzgxOGU5ZTg3NmM4ZmQ1ZDJhYTQ4OTlkNGY2MjE0MTg4NmFmMzUxMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjBjMGE5YmFhYmQwYzg3NzEwOTllZWE4ODBlZGUyMWJhZTFkNGNjNSIsInRva2VuIjoiODNjZDBmN2EwNDgzZGI3M2NlNDIyMzY1OGNiNjFkZWFjNjUzMWU4NSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-11-28 15:39:04.09082+08
lh69nkhbcgvk00dy3g5qwu0e1ibv03m7	OGQ2YTc4ZWFiMTZiYzE2ZDIyNjU2Yjk5NTEzYmNkZGJiZDY2YTI1ODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjBjMGE5YmFhYmQwYzg3NzEwOTllZWE4ODBlZGUyMWJhZTFkNGNjNSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-11-29 10:51:06.796637+08
bpjoi1w32zcqtmcfoe82woc3o8jq3jzz	M2RmMmQ2NjExNGYxZWNiYzMyZTQxYTZiZTA2NTZiOGRhNzc5ODAxMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJmMGMwYTliYWFiZDBjODc3MTA5OWVlYTg4MGVkZTIxYmFlMWQ0Y2M1In0=	2018-11-29 17:05:54.639283+08
e2cy6z5c50xsck9nigasqcvdl1g4gqht	M2Y2NDFkYjk4ZmJkOGIwMjE0YWNmYjM0OTE4ZTc5MmY5NmUyMDgyZjp7InRva2VuIjoiMzc5YTIyYjBjZjVmNzcyOTYwYWM2Njc3ZDE2NWVhZjg1ZDljZDhlMiJ9	2018-11-29 17:43:05.606352+08
8lkr37fo4shwo0b26j8owduima60lowk	YjVjZmJmNTI1YzAyMDE1NWI5YmUwZjY2NmE5MjZkMzQwYzQ1NDY3NTp7Il9hdXRoX3VzZXJfaGFzaCI6ImYwYzBhOWJhYWJkMGM4NzcxMDk5ZWVhODgwZWRlMjFiYWUxZDRjYzUiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwidG9rZW4iOiIzNzlhMjJiMGNmNWY3NzI5NjBhYzY2NzdkMTY1ZWFmODVkOWNkOGUyIn0=	2018-11-29 17:58:45.331207+08
84thc5klpod55yl1b7bwzv0bdg0ks54u	OGQ2YTc4ZWFiMTZiYzE2ZDIyNjU2Yjk5NTEzYmNkZGJiZDY2YTI1ODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjBjMGE5YmFhYmQwYzg3NzEwOTllZWE4ODBlZGUyMWJhZTFkNGNjNSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-11-30 11:11:45.238358+08
wdjtw4ry1wzf1s7vkdzuy5zbny0fmb94	NjU2ZGFkYmJjY2U5ZGY2ZjdjOGI2NTRmYjIyMTEwZTZlZTZjNDUzMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjQiLCJfYXV0aF91c2VyX2hhc2giOiIzY2I2NzUzMjVmZDUzNWI0ODdiOGMxMGQ1YjkzMDI5NzBhNTFkM2Y3In0=	2018-12-07 11:13:41.081168+08
tdsuxl6x3ax1koqfxeor0huj4ikuo28r	ZjlmNjllYmQzZGY0ZWI2OWE1ZTEyMGMxYzU5NDllNmYyMmMwNmEyZDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJ0b2tlbiI6IjY5ZjMxZTNjNzczODRjNGFiNGQxYzFmMmQxNDVmOWRkZGFiYTE3ZGYiLCJfYXV0aF91c2VyX2hhc2giOiIzY2I2NzUzMjVmZDUzNWI0ODdiOGMxMGQ1YjkzMDI5NzBhNTFkM2Y3In0=	2018-12-10 13:05:38.406881+08
x88jzo3mnu7p0pfbwevo776pojf4vl3r	NTg4ZDkzNjY4N2Q3MzI5NjcyNDAzNDVmOTZkMDY0NTBiZDExOTcyZTp7InRva2VuIjoiNjlmMzFlM2M3NzM4NGM0YWI0ZDFjMWYyZDE0NWY5ZGRkYWJhMTdkZiJ9	2018-12-10 23:42:37.480239+08
458vbnzvumbl6x6y87voys3w80q44v0n	ZGU5NGEzZjZkMDY2OTc2ZTljNTRlOGI1YWZhYTUxZjFkYzEyYTM2NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjNjYjY3NTMyNWZkNTM1YjQ4N2I4YzEwZDViOTMwMjk3MGE1MWQzZjciLCJfYXV0aF91c2VyX2lkIjoiNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-12-24 14:22:02.498506+08
8ba5qmrr7xs3ow7shz0yxmtihuf4wi13	ZGU5NGEzZjZkMDY2OTc2ZTljNTRlOGI1YWZhYTUxZjFkYzEyYTM2NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjNjYjY3NTMyNWZkNTM1YjQ4N2I4YzEwZDViOTMwMjk3MGE1MWQzZjciLCJfYXV0aF91c2VyX2lkIjoiNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-12-24 14:40:32.059772+08
jk48on46q60ngorax7j8pseuvofln3no	YTRkZjRiMzlhOTE1YmNkNGRmMzhlOTU1NGJlN2FhNjA2YTI0NmNhZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjNjYjY3NTMyNWZkNTM1YjQ4N2I4YzEwZDViOTMwMjk3MGE1MWQzZjciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=	2019-09-03 15:45:18.453427+08
8e95bcal3vdyauj8rw8udiknhgv3e1zv	YTRkZjRiMzlhOTE1YmNkNGRmMzhlOTU1NGJlN2FhNjA2YTI0NmNhZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjNjYjY3NTMyNWZkNTM1YjQ4N2I4YzEwZDViOTMwMjk3MGE1MWQzZjciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=	2019-09-21 13:05:32.284202+08
o6oxvym5xr9sanpt03am452h8yjr4s3v	Yzg0ZjAyNjVlMGQ2MDE2MTI1YWFlNzJkOWFjNGJlYmU2NGUzZjUzMDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzY2I2NzUzMjVmZDUzNWI0ODdiOGMxMGQ1YjkzMDI5NzBhNTFkM2Y3In0=	2019-10-23 18:09:46.190943+08
p04if0hi3xdyl1u5okar5btpgj7hi2uh	YTRkZjRiMzlhOTE1YmNkNGRmMzhlOTU1NGJlN2FhNjA2YTI0NmNhZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjNjYjY3NTMyNWZkNTM1YjQ4N2I4YzEwZDViOTMwMjk3MGE1MWQzZjciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=	2019-10-24 10:29:12.340672+08
i6xry3ya51ph0cro561qywhb0rrwz481	NjU2ZGFkYmJjY2U5ZGY2ZjdjOGI2NTRmYjIyMTEwZTZlZTZjNDUzMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjQiLCJfYXV0aF91c2VyX2hhc2giOiIzY2I2NzUzMjVmZDUzNWI0ODdiOGMxMGQ1YjkzMDI5NzBhNTFkM2Y3In0=	2019-11-19 13:29:55.220175+08
0z250zabjv7u4vro57t1n9qfiqqwdnpw	ZGU5NGEzZjZkMDY2OTc2ZTljNTRlOGI1YWZhYTUxZjFkYzEyYTM2NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjNjYjY3NTMyNWZkNTM1YjQ4N2I4YzEwZDViOTMwMjk3MGE1MWQzZjciLCJfYXV0aF91c2VyX2lkIjoiNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2019-11-19 14:27:44.273377+08
jscoe6nn7ouya07p5v1yko7pi70kyxhj	Yzg0ZjAyNjVlMGQ2MDE2MTI1YWFlNzJkOWFjNGJlYmU2NGUzZjUzMDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzY2I2NzUzMjVmZDUzNWI0ODdiOGMxMGQ1YjkzMDI5NzBhNTFkM2Y3In0=	2019-11-20 13:49:02.987948+08
z85m501ma4fcl42rdjz6ovlct7yacgyl	Yzg0ZjAyNjVlMGQ2MDE2MTI1YWFlNzJkOWFjNGJlYmU2NGUzZjUzMDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzY2I2NzUzMjVmZDUzNWI0ODdiOGMxMGQ1YjkzMDI5NzBhNTFkM2Y3In0=	2019-12-23 16:50:56.375671+08
4d6u4msvtkl9ynduzaa1fg6yoikkvbey	Yzg0ZjAyNjVlMGQ2MDE2MTI1YWFlNzJkOWFjNGJlYmU2NGUzZjUzMDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzY2I2NzUzMjVmZDUzNWI0ODdiOGMxMGQ1YjkzMDI5NzBhNTFkM2Y3In0=	2019-12-23 16:59:32.020393+08
5o78qwus4cimv8kbh5hk4czo0kfwk45b	Yzg0ZjAyNjVlMGQ2MDE2MTI1YWFlNzJkOWFjNGJlYmU2NGUzZjUzMDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzY2I2NzUzMjVmZDUzNWI0ODdiOGMxMGQ1YjkzMDI5NzBhNTFkM2Y3In0=	2020-01-06 15:48:03.924826+08
dty7jubdtgfs6z4krsxzgp72uzviydpz	Yzg0ZjAyNjVlMGQ2MDE2MTI1YWFlNzJkOWFjNGJlYmU2NGUzZjUzMDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzY2I2NzUzMjVmZDUzNWI0ODdiOGMxMGQ1YjkzMDI5NzBhNTFkM2Y3In0=	2020-01-18 20:56:53.792093+08
7nwjnbpb91it5o6ya2lk8l4oep2mepa8	Yzg0ZjAyNjVlMGQ2MDE2MTI1YWFlNzJkOWFjNGJlYmU2NGUzZjUzMDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzY2I2NzUzMjVmZDUzNWI0ODdiOGMxMGQ1YjkzMDI5NzBhNTFkM2Y3In0=	2020-01-22 17:39:33.945938+08
li439xb59z96dgmrrwyk2ph2rtzlcbo1	Yzg0ZjAyNjVlMGQ2MDE2MTI1YWFlNzJkOWFjNGJlYmU2NGUzZjUzMDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzY2I2NzUzMjVmZDUzNWI0ODdiOGMxMGQ1YjkzMDI5NzBhNTFkM2Y3In0=	2020-02-20 13:35:15.564561+08
1pfbrh47ynunllkns86dz5ybbm9t9jq3	Yzg0ZjAyNjVlMGQ2MDE2MTI1YWFlNzJkOWFjNGJlYmU2NGUzZjUzMDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzY2I2NzUzMjVmZDUzNWI0ODdiOGMxMGQ1YjkzMDI5NzBhNTFkM2Y3In0=	2020-03-18 18:02:04.153879+08
p3efkc4m7g1vn0bu5r33te4vf1pwy18c	Yzg0ZjAyNjVlMGQ2MDE2MTI1YWFlNzJkOWFjNGJlYmU2NGUzZjUzMDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzY2I2NzUzMjVmZDUzNWI0ODdiOGMxMGQ1YjkzMDI5NzBhNTFkM2Y3In0=	2020-03-19 09:31:54.686411+08
sohe38nvv4h81fv4lirmm4ttnhxzm9ar	Yzg0ZjAyNjVlMGQ2MDE2MTI1YWFlNzJkOWFjNGJlYmU2NGUzZjUzMDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzY2I2NzUzMjVmZDUzNWI0ODdiOGMxMGQ1YjkzMDI5NzBhNTFkM2Y3In0=	2020-05-25 10:41:15.757424+08
zouzh1jqzio1f0dex6ljuon65hteiid7	Yzg0ZjAyNjVlMGQ2MDE2MTI1YWFlNzJkOWFjNGJlYmU2NGUzZjUzMDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzY2I2NzUzMjVmZDUzNWI0ODdiOGMxMGQ1YjkzMDI5NzBhNTFkM2Y3In0=	2020-05-25 11:36:37.545389+08
u2z0hg2rj02y73fjzplymw6v5eddis3r	Yzg0ZjAyNjVlMGQ2MDE2MTI1YWFlNzJkOWFjNGJlYmU2NGUzZjUzMDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzY2I2NzUzMjVmZDUzNWI0ODdiOGMxMGQ1YjkzMDI5NzBhNTFkM2Y3In0=	2020-07-29 09:54:04.845034+08
zurold84vbpmhsxoexd6gfq87ovhslq2	Yzg0ZjAyNjVlMGQ2MDE2MTI1YWFlNzJkOWFjNGJlYmU2NGUzZjUzMDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzY2I2NzUzMjVmZDUzNWI0ODdiOGMxMGQ1YjkzMDI5NzBhNTFkM2Y3In0=	2020-08-03 10:21:33.430457+08
joj2wbnoh0vtukd72f15q16le74qdadf	Yzg0ZjAyNjVlMGQ2MDE2MTI1YWFlNzJkOWFjNGJlYmU2NGUzZjUzMDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzY2I2NzUzMjVmZDUzNWI0ODdiOGMxMGQ1YjkzMDI5NzBhNTFkM2Y3In0=	2020-08-05 18:03:09.390238+08
zec54fiwwbxx01isz2bzdbh7fwwy922l	Yzg0ZjAyNjVlMGQ2MDE2MTI1YWFlNzJkOWFjNGJlYmU2NGUzZjUzMDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzY2I2NzUzMjVmZDUzNWI0ODdiOGMxMGQ1YjkzMDI5NzBhNTFkM2Y3In0=	2020-10-29 10:56:17.486663+08
m1iwnjgnqvcunazi11frms74p9t2ctyu	Yzg0ZjAyNjVlMGQ2MDE2MTI1YWFlNzJkOWFjNGJlYmU2NGUzZjUzMDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzY2I2NzUzMjVmZDUzNWI0ODdiOGMxMGQ1YjkzMDI5NzBhNTFkM2Y3In0=	2020-10-29 11:08:44.004199+08
ma72evhci57ija4a0omq43qod9up3z95	Yzg0ZjAyNjVlMGQ2MDE2MTI1YWFlNzJkOWFjNGJlYmU2NGUzZjUzMDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzY2I2NzUzMjVmZDUzNWI0ODdiOGMxMGQ1YjkzMDI5NzBhNTFkM2Y3In0=	2020-11-17 09:20:18.140538+08
ith0v6ics5mhl281gzlpkzn576s0iszi	Yzg0ZjAyNjVlMGQ2MDE2MTI1YWFlNzJkOWFjNGJlYmU2NGUzZjUzMDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzY2I2NzUzMjVmZDUzNWI0ODdiOGMxMGQ1YjkzMDI5NzBhNTFkM2Y3In0=	2021-01-19 11:51:01.349509+08
bk5g5fj223nnmnjdpyxjh27vqo51zar2	Yzg0ZjAyNjVlMGQ2MDE2MTI1YWFlNzJkOWFjNGJlYmU2NGUzZjUzMDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzY2I2NzUzMjVmZDUzNWI0ODdiOGMxMGQ1YjkzMDI5NzBhNTFkM2Y3In0=	2021-04-21 14:29:50.836334+08
hmdgg51uobvs8yf0v2zptjxg06fu4b14	Yzg0ZjAyNjVlMGQ2MDE2MTI1YWFlNzJkOWFjNGJlYmU2NGUzZjUzMDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzY2I2NzUzMjVmZDUzNWI0ODdiOGMxMGQ1YjkzMDI5NzBhNTFkM2Y3In0=	2021-05-17 17:54:59.440255+08
oln6aalyia2sr1lqpwvnz1u1c55u4o5d	Yzg0ZjAyNjVlMGQ2MDE2MTI1YWFlNzJkOWFjNGJlYmU2NGUzZjUzMDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzY2I2NzUzMjVmZDUzNWI0ODdiOGMxMGQ1YjkzMDI5NzBhNTFkM2Y3In0=	2021-05-24 10:52:35.896671+08
b1ch1ufadpivm7idc0ndbxpa86beicyy	Yzg0ZjAyNjVlMGQ2MDE2MTI1YWFlNzJkOWFjNGJlYmU2NGUzZjUzMDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzY2I2NzUzMjVmZDUzNWI0ODdiOGMxMGQ1YjkzMDI5NzBhNTFkM2Y3In0=	2021-06-29 09:32:09.806885+08
emblszax8wzyoduaiw1pil65m0tzrd5z	Yzg0ZjAyNjVlMGQ2MDE2MTI1YWFlNzJkOWFjNGJlYmU2NGUzZjUzMDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzY2I2NzUzMjVmZDUzNWI0ODdiOGMxMGQ1YjkzMDI5NzBhNTFkM2Y3In0=	2021-07-27 15:39:01.335932+08
v708imq9em1bedz0pgub5px6cxbir8c1	Yzg0ZjAyNjVlMGQ2MDE2MTI1YWFlNzJkOWFjNGJlYmU2NGUzZjUzMDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzY2I2NzUzMjVmZDUzNWI0ODdiOGMxMGQ1YjkzMDI5NzBhNTFkM2Y3In0=	2021-08-05 19:08:28.056229+08
pbp72ysb4pa665fy8d3wdw0235juwmrg	Yzg0ZjAyNjVlMGQ2MDE2MTI1YWFlNzJkOWFjNGJlYmU2NGUzZjUzMDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzY2I2NzUzMjVmZDUzNWI0ODdiOGMxMGQ1YjkzMDI5NzBhNTFkM2Y3In0=	2021-10-07 13:38:50.561177+08
\.


--
-- Data for Name: iaer_about; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.iaer_about (id, version_name, version_code, apk, category, comment, datetime, apk_json, name) FROM stdin;
2	1	1	apks/Iaer1.apk	1	Init apk.	2019-12-23 15:45:17.325594+08	apks/Iaer1.json	Iaer1.apk
3	1.1	2	apks/app-release_U7AyIPB.apk	1	Add the app info in About.	2019-12-23 15:53:16.206279+08	apks/output.json	Iaer1.1.apk
4	1.2	3	apks/Iaer1.2.apk	1	for test	2019-12-23 15:58:06.47326+08	apks/Iaer1.2.json	Iaer1.2.apk
5	1.3	4	apks/Iaer1.3.apk	1	1. 首页添加APP更新信息。\r\n2. About页面添加APP更新功能。	2020-03-05 09:31:10.661361+08	apks/Iaer1.3.json	Iaer1.3.apk
6	1.4	5	apks/Iaer1.4.apk	1	修复过滤搜索bug	2020-03-12 11:44:34.046376+08	apks/Iaer1.4.json	Iaer1.4.apk
7	1.5	6	apks/Iaer1.5.apk	1	修改域名	2020-07-15 10:01:48.6166+08	apks/Iaer1.5.json	Iaer1.5.apk
8	1.6	7	apks/Iaer1.6.apk	1	1. 修复忘记密码功能。\r\n2. 修复注册账户功能。	2020-10-16 10:58:13.965532+08	apks/Iaer1.6.json	Iaer1.6.apk
\.


--
-- Data for Name: iaer_category; Type: TABLE DATA; Schema: public; Owner: ben
--

COPY public.iaer_category (id, name, sequence, created, modified) FROM stdin;
2	服饰美容	10	\N	2018-11-14
3	生活日用	20	\N	2018-11-14
4	住房缴费	30	\N	2018-11-14
5	交通出行	40	\N	2018-11-14
6	通讯物流	50	\N	2018-11-14
7	文教娱乐	60	\N	2018-11-14
8	健康保险	70	\N	2018-11-14
11	小孩奶粉	100	\N	2018-11-14
13	小孩玩具	120	\N	2018-11-14
14	小孩健康	130	\N	2018-11-14
16	收入	999	\N	2018-11-14
10	人情往来	80	\N	2018-11-16
17	装修	90	\N	2018-11-16
15	小孩其他	300	\N	2018-11-16
19	小孩零食	140	\N	2018-11-16
18	其他消费	400	\N	2018-11-16
20	小孩服饰	150	\N	2018-11-16
21	小孩文具	160	\N	2018-11-16
22	小孩生活用品	170	\N	2018-11-16
23	请选择类型	0	\N	2018-11-23
1	饮食	1	\N	2018-11-23
24	宠物	21	\N	2020-05-11
25	小孩教育	125	\N	2020-07-20
\.


--
-- Data for Name: iaer_fund; Type: TABLE DATA; Schema: public; Owner: ben
--

COPY public.iaer_fund (id, name, monthly_money, yearly_money, alternate_money, created, modified) FROM stdin;
1	2018.11	5000	80000	0	\N	2018-11-14
2	1	0	0	0	\N	2018-11-23
3	-1	0	0	0	\N	2018-11-23
4	2	0	0	0	\N	2018-11-23
\.


--
-- Data for Name: iaer_iaer; Type: TABLE DATA; Schema: public; Owner: ben
--

COPY public.iaer_iaer (id, money, category, money_type, remark, created, type, chart_type, format, datetime, description, timing, user_id, date) FROM stdin;
34	-244	生活日用	0	膳魔师保温杯X2	2017-11-11 09:26:18.38913+08	0	0	\N	2019-11-06 13:49:14.093482+08	\N	\N	2	2017-11-11
55	-8	文教娱乐	0	按摩	2017-11-18 12:40:22+08	0	0	\N	2019-11-06 13:49:14.041335+08	\N	\N	2	2017-11-18
65	-168	小孩生活用品	0	辅食机	2017-11-21 22:07:23+08	0	0	\N	2019-11-06 13:49:14.020212+08	\N	\N	2	2017-11-21
51	-22	饮食	0	肯德基	2017-11-17 21:40:17.193701+08	0	0	\N	2019-11-06 13:49:14.051406+08	\N	\N	2	2017-11-17
71	-3500	装修	0	设计	2017-11-26 21:16:40.25851+08	0	0	\N	2019-11-06 13:49:14.007685+08	\N	\N	1	2017-11-26
43	1000	收入	1	三江卡	2017-11-15 08:07:52.732903+08	0	0	\N	2019-12-09 16:59:22.925955+08	\N	\N	2	2017-11-15
70	-21000	装修	0	半包30%	2017-11-26 21:16:25.384292+08	0	0	\N	2019-11-06 13:49:14.009897+08	\N	\N	1	2017-11-26
68	-31	饮食	0	KFC	2017-11-24 22:00:50.115141+08	0	0	\N	2019-11-06 13:49:14.013968+08	\N	\N	2	2017-11-24
19	-32	饮食	0	2碗泡馍	2017-11-05 13:28:48.392915+08	0	0	\N	2019-11-06 13:49:14.182515+08	\N	\N	1	2017-11-05
78	-8	饮食	0	冬枣	2017-11-28 20:51:26.321286+08	0	0	\N	2019-11-06 13:49:13.991285+08	\N	\N	2	2017-11-28
76	-48	饮食	0	三江购物	2017-11-28 20:50:48.398702+08	0	0	\N	2019-11-06 13:49:13.997344+08	\N	\N	2	2017-11-28
64	-15	生活日用	0	Z5P边角	2017-11-21 12:31:42.831615+08	0	0	\N	2019-11-06 13:49:14.0216+08	\N	\N	1	2017-11-21
62	-22	生活日用	0	理发	2017-11-19 07:36:44.214905+08	0	0	\N	2019-11-06 13:49:14.026177+08	\N	\N	2	2017-11-19
49	-333	小孩生活用品	0	床上7件套	2017-11-16 21:38:27+08	0	0	\N	2019-11-06 13:49:14.057124+08	\N	\N	2	2017-11-16
48	-91	饮食	0	三江购物	2017-11-15 22:02:46.166259+08	0	0	\N	2019-11-06 13:49:14.058568+08	\N	\N	2	2017-11-15
72	-97	服饰美容	0	背心马甲	2017-11-26 21:18:58.327712+08	0	0	\N	2019-11-06 13:49:14.004931+08	\N	\N	2	2017-11-26
58	-9	交通出行	0	停车费	2017-11-18 14:42:40+08	0	0	\N	2019-11-06 13:49:14.035145+08	\N	\N	2	2017-11-18
69	-16	小孩生活用品	0	三角巾	2017-11-24 23:13:42+08	0	0	\N	2019-11-06 13:49:14.011317+08	\N	\N	2	2017-11-24
44	-20	生活日用	0	手机壳	2017-11-15 15:18:19.533071+08	0	0	\N	2019-11-06 13:49:14.066862+08	\N	\N	1	2017-11-15
67	-11	饮食	0	coco奶茶	2017-11-24 21:51:13.178445+08	0	0	\N	2019-11-06 13:49:14.015435+08	\N	\N	2	2017-11-24
66	-34	小孩生活用品	0	奶瓶收纳盒	2017-11-21 22:07:41+08	0	0	\N	2019-11-06 13:49:14.018023+08	\N	\N	2	2017-11-21
40	-15	交通出行	0	高速费用	2017-11-15 08:06:43+08	0	0	\N	2019-11-06 13:49:14.07688+08	\N	\N	2	2017-11-15
63	-6	饮食	0	山东煎饼	2017-11-20 08:02:36.69043+08	0	0	\N	2019-11-06 13:49:14.023631+08	\N	\N	1	2017-11-20
38	-98	生活日用	0	清风抽纸3包x16	2017-11-11 13:46:25.295459+08	0	0	\N	2019-11-06 13:49:14.081741+08	\N	\N	2	2017-11-11
61	-11	饮食	0	coco奶茶	2017-11-18 16:46:21.210381+08	0	0	\N	2019-11-06 13:49:14.027482+08	\N	\N	2	2017-11-18
47	-13	饮食	0	甘蔗	2017-11-15 22:02:19.89842+08	0	0	\N	2019-11-06 13:49:14.061185+08	\N	\N	2	2017-11-15
59	-158	小孩健康	0	乳钙2盒	2017-11-18 15:15:10+08	0	0	\N	2019-11-06 13:49:14.032568+08	\N	\N	2	2017-11-18
46	-100	通讯物流	0	妈妈手机充值	2017-11-15 18:40:16+08	0	0	\N	2019-11-06 13:49:14.063149+08	\N	\N	2	2017-11-15
56	-103	饮食	0	午饭	2017-11-18 14:37:51.283287+08	0	0	\N	2019-11-06 13:49:14.039349+08	\N	\N	2	2017-11-18
42	1400	收入	1	车险报销	2017-11-15 08:07:32.995334+08	0	0	\N	2019-12-09 16:59:22.927994+08	\N	\N	2	2017-11-15
41	-6	饮食	0	肠粉	2017-11-15 08:07:07.564757+08	0	0	\N	2019-11-06 13:49:14.074819+08	\N	\N	2	2017-11-15
53	-102	服饰美容	0	睡衣	2017-11-18 08:40:07.123313+08	0	0	\N	2019-11-06 13:49:14.044837+08	\N	\N	2	2017-11-18
52	-9	饮食	0	水果	2017-11-17 21:40:34.946457+08	0	0	\N	2019-11-06 13:49:14.048858+08	\N	\N	2	2017-11-17
39	-78	生活日用	0	大米5kgx4	2017-11-11 15:53:24.444758+08	0	0	\N	2019-11-06 13:49:14.079804+08	\N	\N	2	2017-11-11
50	-13	饮食	0	甘蔗	2017-11-17 21:40:02.836566+08	0	0	\N	2019-11-06 13:49:14.052813+08	\N	\N	2	2017-11-17
37	-108	生活日用	0	清风卷纸11x10卷	2017-11-11 13:45:38.708949+08	0	0	\N	2019-11-06 13:49:14.08546+08	\N	\N	2	2017-11-11
25	-36	小孩健康	0	嘟嘟看医生	2017-11-09 07:12:36+08	0	0	\N	2019-11-06 13:49:14.164044+08	\N	\N	2	2017-11-09
35	-50	生活日用	0	蓝月亮	2017-11-11 13:38:13.422007+08	0	0	\N	2019-11-06 13:49:14.090201+08	\N	\N	2	2017-11-11
45	-18	生活日用	0	手机后盖	2017-11-15 15:18:32.691316+08	0	0	\N	2019-11-06 13:49:14.065021+08	\N	\N	1	2017-11-15
33	-208	小孩生活用品	0	恒温调温器	2017-11-11 09:24:36+08	0	0	\N	2019-11-06 13:49:14.0964+08	\N	\N	2	2017-11-11
32	-304	小孩生活用品	0	全棉时代柔纸巾	2017-11-11 09:19:13+08	0	0	\N	2019-11-06 13:49:14.098696+08	\N	\N	2	2017-11-11
26	4627	收入	1	工资	2017-11-09 07:13:20.039306+08	0	0	\N	2019-12-09 16:59:22.929733+08	\N	\N	2	2017-11-09
30	-1000	交通出行	0	油卡	2017-11-10 21:20:01+08	0	0	\N	2019-11-06 13:49:14.107015+08	\N	\N	2	2017-11-10
29	-10	交通出行	0	高速费	2017-11-10 21:19:19+08	0	0	\N	2019-11-06 13:49:14.126023+08	\N	\N	2	2017-11-10
28	-30	饮食	0	午餐	2017-11-10 21:19:00.028468+08	0	0	\N	2019-11-06 13:49:14.153301+08	\N	\N	2	2017-11-10
27	-25	交通出行	0	高速费	2017-11-10 21:18:42+08	0	0	\N	2019-11-06 13:49:14.15859+08	\N	\N	2	2017-11-10
36	-103	生活日用	0	食用油3瓶	2017-11-11 13:42:54.766302+08	0	0	\N	2019-11-06 13:49:14.087399+08	\N	\N	2	2017-11-11
13	-31	饮食	0	阿香米线	2017-11-04 14:55:39.884817+08	0	0	\N	2019-11-06 13:49:14.198159+08	\N	\N	2	2017-11-04
12	-36	服饰美容	0	淘宝	2017-11-03 18:40:30.256204+08	0	0	\N	2019-11-06 13:49:14.199496+08	\N	\N	2	2017-11-03
11	-1500	生活日用	0	生活费	2017-11-03 18:39:22.155274+08	0	0	\N	2019-11-06 13:49:14.20317+08	\N	\N	2	2017-11-03
21	-22	生活日用	0	剪头发	2017-11-06 20:04:08.29547+08	0	0	\N	2019-11-06 13:49:14.174398+08	\N	\N	1	2017-11-06
20	-72	生活日用	0	眼镜2付	2017-11-05 20:27:33.211475+08	0	0	\N	2019-11-06 13:49:14.178146+08	\N	\N	1	2017-11-05
6	-199	文教娱乐	0	bandwagon vps	2017-11-02 11:21:48+08	0	0	\N	2019-11-06 13:49:14.211947+08	\N	\N	1	2017-11-02
17	-17	小孩健康	0	挂号费	2017-11-05 09:44:42+08	0	0	\N	2019-11-06 13:49:14.188489+08	\N	\N	1	2017-11-05
16	-183	小孩健康	0	咳嗽，感冒	2017-11-05 09:44:09+08	0	0	\N	2019-11-06 13:49:14.191015+08	\N	\N	1	2017-11-05
15	-11	小孩健康	0	挂号费	2017-11-05 09:43:34+08	0	0	\N	2019-11-06 13:49:14.193075+08	\N	\N	2	2017-11-05
14	-22	饮食	0	KFC早餐	2017-11-05 09:43:16.61815+08	0	0	\N	2019-11-06 13:49:14.195367+08	\N	\N	2	2017-11-05
24	-8	交通出行	0	停车费	2017-11-09 07:11:51+08	0	0	\N	2019-11-06 13:49:14.166071+08	\N	\N	2	2017-11-09
23	-30	交通出行	0	高速收费两趟	2017-11-09 07:11:23+08	0	0	\N	2019-11-06 13:49:14.169596+08	\N	\N	2	2017-11-09
22	-38	生活日用	0	雨刮器	2017-11-09 07:10:53.685936+08	0	0	\N	2019-11-06 13:49:14.172244+08	\N	\N	2	2017-11-09
10	-100	通讯物流	0	话费	2017-11-03 17:34:42+08	0	0	\N	2019-11-06 13:49:14.206435+08	\N	\N	1	2017-11-03
9	-26	饮食	0	零食	2017-11-02 21:34:58.47793+08	0	0	\N	2019-11-06 13:49:14.207853+08	\N	\N	2	2017-11-02
8	-100	饮食	0	老婆大人	2017-11-02 18:40:59.408416+08	0	0	\N	2019-11-06 13:49:14.209268+08	\N	\N	2	2017-11-02
7	-159	生活日用	0	电饭煲	2017-11-02 18:40:40.375058+08	0	0	\N	2019-11-06 13:49:14.210609+08	\N	\N	2	2017-11-02
18	-10	饮食	0	蛋卷	2017-11-05 13:15:42.388377+08	0	0	\N	2019-11-06 13:49:14.184573+08	\N	\N	2	2017-11-05
5	-102	生活日用	0	micro sd卡和零食	2017-10-27 19:44:36+08	0	0	\N	2019-11-06 13:49:14.213242+08	\N	\N	1	2017-10-27
4	-105	文教娱乐	0	SanDisk TF卡	2017-10-26 10:12:48+08	0	0	\N	2019-11-06 13:49:14.214675+08	\N	\N	1	2017-10-26
3	-279	文教娱乐	0	树莓派3b	2017-10-26 10:03:31+08	0	0	\N	2019-11-06 13:49:14.215976+08	\N	\N	1	2017-10-26
2	-55	饮食	0	老婆大人零食	2017-10-26 09:03:24.445768+08	0	0	\N	2019-11-06 13:49:14.217401+08	\N	\N	1	2017-10-26
83	4627	收入	1	工资	2017-11-29 22:44:34.750905+08	0	0	\N	2019-12-09 16:59:22.91832+08	\N	\N	2	2017-11-29
176	-94	小孩生活用品	0	磨牙棒等用品	2018-01-11 21:44:50+08	0	0	\N	2019-11-06 13:49:13.731077+08	\N	\N	2	2018-01-11
157	-35	生活日用	0	空调外机储水架	2018-01-03 20:30:53.911462+08	0	0	\N	2019-11-06 13:49:13.766283+08	\N	\N	2	2018-01-03
156	-10	饮食	0	甘蔗	2018-01-03 20:30:22.760883+08	0	0	\N	2019-11-06 13:49:13.768832+08	\N	\N	2	2018-01-03
155	-22	饮食	0	肯德基早餐	2018-01-01 20:35:41.646533+08	0	0	\N	2019-11-06 13:49:13.780506+08	\N	\N	2	2018-01-01
154	-51	饮食	0	泡芙加米线	2018-01-01 20:34:44.927631+08	0	0	\N	2019-11-06 13:49:13.782796+08	\N	\N	2	2018-01-01
152	-10	饮食	0	coco奶茶	2018-01-01 20:33:35.578728+08	0	0	\N	2019-11-06 13:49:13.790573+08	\N	\N	1	2018-01-01
151	-130	饮食	0	草莓	2018-01-01 20:33:14.219922+08	0	0	\N	2019-11-06 13:49:13.793975+08	\N	\N	1	2018-01-01
150	-150	服饰美容	0	hm衣服	2018-01-01 20:33:01.651728+08	0	0	\N	2019-11-06 13:49:13.796208+08	\N	\N	1	2018-01-01
149	-5	交通出行	0	停车费	2018-01-01 19:30:41+08	0	0	\N	2019-11-06 13:49:13.798209+08	\N	\N	1	2018-01-01
148	-26	小孩生活用品	0	磨牙棒	2018-01-01 19:14:20+08	0	0	\N	2019-11-06 13:49:13.799964+08	\N	\N	1	2018-01-01
147	-280	交通出行	0	汽车保养	2017-12-31 21:03:48+08	0	0	\N	2019-11-06 13:49:13.801673+08	\N	\N	2	2017-12-31
146	-16	饮食	0	蛋糕	2017-12-31 21:03:17.443866+08	0	0	\N	2019-11-06 13:49:13.8034+08	\N	\N	2	2017-12-31
145	-2500	装修	0	奥普吊顶+2个灯	2017-12-31 20:55:05.285167+08	0	0	\N	2019-11-06 13:49:13.805096+08	\N	\N	1	2017-12-31
144	-13	饮食	0	午餐	2017-12-31 20:53:34.078949+08	0	0	\N	2019-11-06 13:49:13.806779+08	\N	\N	2	2017-12-31
143	-188	饮食	0	餐饮	2017-12-30 19:29:43.88078+08	0	0	\N	2019-11-06 13:49:13.808506+08	\N	\N	2	2017-12-30
142	-12	小孩健康	0	A D剂	2017-12-27 21:46:23+08	0	0	\N	2019-11-06 13:49:13.810278+08	\N	\N	2	2017-12-27
140	-143	小孩生活用品	0	膳魔师保温杯	2017-12-27 21:44:48+08	0	0	\N	2019-11-06 13:49:13.81365+08	\N	\N	2	2017-12-27
139	-101	小孩生活用品	0	奶嘴LL3个、牙胶一个	2017-12-27 21:44:12+08	0	0	\N	2019-11-06 13:49:13.815259+08	\N	\N	2	2017-12-27
138	-5	饮食	0	包子	2017-12-27 21:43:16.226116+08	0	0	\N	2019-11-06 13:49:13.816977+08	\N	\N	2	2017-12-27
137	-7	饮食	0	甘蔗	2017-12-27 21:43:02.276259+08	0	0	\N	2019-11-06 13:49:13.818773+08	\N	\N	2	2017-12-27
136	-21000	装修	0	装修半包30%	2017-12-27 20:10:54.1212+08	0	0	\N	2019-11-06 13:49:13.820493+08	\N	\N	1	2017-12-27
135	-100	通讯物流	0	手机话费	2017-12-27 20:07:55+08	0	0	\N	2019-11-06 13:49:13.822454+08	\N	\N	1	2017-12-27
133	-400	装修	0	空调铜管+支架	2017-12-24 18:35:17.730471+08	0	0	\N	2019-11-06 13:49:13.825947+08	\N	\N	1	2017-12-24
132	-12	生活日用	0	忘记了	2017-12-23 20:39:15.709404+08	0	0	\N	2019-11-06 13:49:13.827714+08	\N	\N	2	2017-12-23
131	-840	通讯物流	0	手机充值包一年流量	2017-12-23 20:38:02+08	0	0	\N	2019-11-06 13:49:13.829386+08	\N	\N	2	2017-12-23
130	-10	饮食	0	苹果	2017-12-23 20:37:22.835202+08	0	0	\N	2019-11-06 13:49:13.831214+08	\N	\N	2	2017-12-23
129	-20	通讯物流	0	手机充值	2017-12-23 20:36:53+08	0	0	\N	2019-11-06 13:49:13.832875+08	\N	\N	2	2017-12-23
128	-9	通讯物流	0	快递	2017-12-23 20:35:04+08	0	0	\N	2019-11-06 13:49:13.834653+08	\N	\N	2	2017-12-23
127	-19	小孩服饰	0	松紧带	2017-12-23 20:33:17+08	0	0	\N	2019-11-06 13:49:13.836342+08	\N	\N	2	2017-12-23
126	-28	生活日用	0	手机壳	2017-12-23 19:43:30.489018+08	0	0	\N	2019-11-06 13:49:13.837996+08	\N	\N	2	2017-12-23
125	-13	饮食	0	大饼&奶茶	2017-12-23 19:41:29.352431+08	0	0	\N	2019-11-06 13:49:13.839679+08	\N	\N	2	2017-12-23
124	-50	饮食	0	零食	2017-12-23 19:41:00.504886+08	0	0	\N	2019-11-06 13:49:13.841488+08	\N	\N	2	2017-12-23
123	-8	生活日用	0	洗衣液	2017-12-23 19:40:18.54884+08	0	0	\N	2019-11-06 13:49:13.843192+08	\N	\N	2	2017-12-23
122	-10	小孩服饰	0	袜子3双	2017-12-23 19:39:59+08	0	0	\N	2019-11-06 13:49:13.844787+08	\N	\N	2	2017-12-23
121	-6	生活日用	0	玻璃水	2017-12-23 19:39:25.949935+08	0	0	\N	2019-11-06 13:49:13.846402+08	\N	\N	2	2017-12-23
120	-31	饮食	0	午饭	2017-12-23 19:39:13.399385+08	0	0	\N	2019-11-06 13:49:13.848045+08	\N	\N	2	2017-12-23
119	-12773	装修	0	瓷砖	2017-12-20 21:48:10.642265+08	0	0	\N	2019-11-06 13:49:13.849716+08	\N	\N	1	2017-12-20
82	26858	收入	1	2016提成	2017-11-29 22:43:29.540102+08	0	0	\N	2019-12-09 16:59:22.920279+08	\N	\N	2	2017-11-29
116	-23	饮食	0	晚饭	2017-12-14 22:16:12.03599+08	0	0	\N	2019-11-06 13:49:13.854844+08	\N	\N	2	2017-12-14
115	-159	生活日用	0	京东生活用品	2017-12-14 22:14:48.661791+08	0	0	\N	2019-11-06 13:49:13.856486+08	\N	\N	2	2017-12-14
114	-400	生活日用	0	眼镜	2017-12-14 22:13:18.034112+08	0	0	\N	2019-11-06 13:49:13.858116+08	\N	\N	2	2017-12-14
113	-206	生活日用	0	中石化	2017-12-14 22:13:04.693198+08	0	0	\N	2019-11-06 13:49:13.859798+08	\N	\N	2	2017-12-14
112	-81	饮食	0	老婆大人	2017-12-14 22:12:26.929959+08	0	0	\N	2019-11-06 13:49:13.861775+08	\N	\N	2	2017-12-14
111	-59	生活日用	0	润唇膏	2017-12-12 19:48:05.134375+08	0	0	\N	2019-11-06 13:49:13.863557+08	\N	\N	2	2017-12-12
110	-25	小孩服饰	0	帽子	2017-12-12 19:47:44+08	0	0	\N	2019-11-06 13:49:13.86526+08	\N	\N	2	2017-12-12
109	-129	小孩服饰	0	羽绒服+马甲	2017-12-12 19:47:08+08	0	0	\N	2019-11-06 13:49:13.866868+08	\N	\N	2	2017-12-12
108	-199	小孩生活用品	0	婴儿推车	2017-12-12 19:46:22+08	0	0	\N	2019-11-06 13:49:13.868532+08	\N	\N	2	2017-12-12
107	-6033	装修	0	AO Smith前置+净水器	2017-12-10 15:05:46.270305+08	0	0	\N	2019-11-06 13:49:13.871145+08	\N	\N	1	2017-12-10
105	-100	人情往来	0	泡脚药	2017-12-09 21:19:16+08	0	0	\N	2019-11-06 13:49:13.875193+08	\N	\N	1	2017-12-09
104	-208	生活日用	0	即热水龙头	2017-12-09 21:18:23.443621+08	0	0	\N	2019-11-06 13:49:13.876891+08	\N	\N	2	2017-12-09
103	-58	小孩生活用品	0	围嘴	2017-12-09 21:17:06+08	0	0	\N	2019-11-06 13:49:13.878493+08	\N	\N	2	2017-12-09
102	-5	生活日用	0	西瓜霜含片	2017-12-09 21:16:45.732218+08	0	0	\N	2019-11-06 13:49:13.879903+08	\N	\N	2	2017-12-09
117	11838	收入	1	工资	2017-12-15 22:11:04.518179+08	0	0	\N	2019-12-09 16:59:22.914521+08	\N	\N	1	2017-12-15
95	-69	生活日用	0	生活用品	2017-12-05 19:37:46.098004+08	0	0	\N	2019-11-06 13:49:13.948218+08	\N	\N	1	2017-12-05
94	-108	饮食	0	稻花香米5kg	2017-12-05 15:43:52.450831+08	0	0	\N	2019-11-06 13:49:13.950359+08	\N	\N	1	2017-12-05
93	-11600	装修	0	1.5+2.5风管机	2017-12-03 11:42:18.959408+08	0	0	\N	2019-11-06 13:49:13.953365+08	\N	\N	1	2017-12-03
101	-226	饮食	0	柠檬泰	2017-12-09 14:34:05.884473+08	0	0	\N	2019-11-06 13:49:13.922277+08	\N	\N	1	2017-12-09
91	-17	交通出行	0	停车费	2017-12-02 13:47:08+08	0	0	\N	2019-11-06 13:49:13.958356+08	\N	\N	2	2017-12-02
90	-22	饮食	0	肯德基早餐	2017-12-02 13:45:49.762954+08	0	0	\N	2019-11-06 13:49:13.960399+08	\N	\N	2	2017-12-02
89	-21	小孩健康	0	妇儿医院挂号	2017-12-02 13:45:11+08	0	0	\N	2019-11-06 13:49:13.962413+08	\N	\N	2	2017-12-02
88	-132	饮食	0	涌上外婆桥	2017-12-02 13:44:16.221191+08	0	0	\N	2019-11-06 13:49:13.965242+08	\N	\N	2	2017-12-02
87	-37	饮食	0	红肠	2017-12-02 13:42:59+08	0	0	\N	2019-11-06 13:49:13.967732+08	\N	\N	1	2017-12-02
86	-48	小孩奶粉	0	嘉宝米粉	2017-12-02 13:42:42+08	0	0	\N	2019-11-06 13:49:13.970037+08	\N	\N	1	2017-12-02
96	-27	饮食	0	零食	2017-12-05 20:43:51.993112+08	0	0	\N	2019-11-06 13:49:13.942992+08	\N	\N	1	2017-12-05
85	-100	交通出行	0	油费	2017-11-30 20:21:25+08	0	0	\N	2019-11-06 13:49:13.972206+08	\N	\N	2	2017-11-30
81	5095	收入	1	生育保险	2017-11-29 22:43:01.764796+08	0	0	\N	2019-12-09 16:59:22.922364+08	\N	\N	2	2017-11-29
92	-15	饮食	0	油赞子	2017-12-03 11:40:54.8752+08	0	0	\N	2019-11-06 13:49:13.956248+08	\N	\N	2	2017-12-03
60	-350	服饰美容	0	Jason wood外套	2017-11-18 16:45:59.195976+08	0	0	\N	2019-11-06 13:49:14.031207+08	\N	\N	2	2017-11-18
205	4612	收入	1	工资	2018-01-20 09:59:35.501686+08	0	0	\N	2019-12-09 16:59:22.908935+08	\N	\N	2	2018-01-20
235	-27	饮食	0	KFC	2018-02-07 10:15:38.375999+08	0	0	\N	2019-11-06 13:49:13.64557+08	\N	\N	1	2018-02-07
233	-1840	小孩生活用品	0	cybex安全座椅	2018-02-06 10:29:44+08	0	0	\N	2019-11-06 13:49:13.648259+08	\N	\N	1	2018-02-06
232	-676	饮食	0	团圆饭	2018-02-04 20:46:07.901101+08	0	0	\N	2019-11-06 13:49:13.649736+08	\N	\N	1	2018-02-04
231	-350	交通出行	0	保养	2018-02-04 14:12:58+08	0	0	\N	2019-11-06 13:49:13.651201+08	\N	\N	1	2018-02-04
230	-16	装修	0	饰面板样品邮费	2018-02-04 09:41:33.596913+08	0	0	\N	2019-11-06 13:49:13.652592+08	\N	\N	1	2018-02-04
229	-70	饮食	0	甜品	2018-02-04 09:40:31.264191+08	0	0	\N	2019-11-06 13:49:13.653966+08	\N	\N	1	2018-02-04
228	-2	饮食	0	肉串	2018-02-02 20:34:46.432633+08	0	0	\N	2019-11-06 13:49:13.655288+08	\N	\N	2	2018-02-02
227	-22	饮食	0	西瓜	2018-02-02 20:34:32.341006+08	0	0	\N	2019-11-06 13:49:13.656602+08	\N	\N	2	2018-02-02
226	-38	饮食	0	老婆大人	2018-02-02 20:34:21.369938+08	0	0	\N	2019-11-06 13:49:13.657925+08	\N	\N	2	2018-02-02
225	-23	生活日用	0	云石胶	2018-02-02 20:33:45.198158+08	0	0	\N	2019-11-06 13:49:13.659306+08	\N	\N	2	2018-02-02
224	-22	生活日用	0	挂衣架	2018-01-30 20:56:06.860863+08	0	0	\N	2019-11-06 13:49:13.660608+08	\N	\N	2	2018-01-30
223	-65	生活日用	0	雨刮器x4	2018-01-30 20:55:16.230819+08	0	0	\N	2019-11-06 13:49:13.662032+08	\N	\N	2	2018-01-30
222	-200	交通出行	0	加油	2018-01-30 20:54:55+08	0	0	\N	2019-11-06 13:49:13.663404+08	\N	\N	2	2018-01-30
221	-170	生活日用	0	牛奶x3，大米x4	2018-01-30 20:54:34+08	0	0	\N	2019-11-06 13:49:13.664737+08	\N	\N	2	2018-01-30
219	-25	饮食	0	夜宵	2018-01-30 20:53:27.166761+08	0	0	\N	2019-11-06 13:49:13.66798+08	\N	\N	2	2018-01-30
218	-7560	装修	0	油烟机+煤气灶	2018-01-30 20:52:27.24554+08	0	0	\N	2019-11-06 13:49:13.669499+08	\N	\N	1	2018-01-30
217	-55	饮食	0	宜家	2018-01-30 20:51:18.479903+08	0	0	\N	2019-11-06 13:49:13.671071+08	\N	\N	1	2018-01-30
216	-36	饮食	0	KFC	2018-01-30 20:50:58.138676+08	0	0	\N	2019-11-06 13:49:13.672479+08	\N	\N	1	2018-01-30
213	-66	饮食	0	阿香米线	2018-01-27 11:55:50.113236+08	0	0	\N	2019-11-06 13:49:13.676746+08	\N	\N	1	2018-01-27
211	-20	其他消费	0	公司罚款	2018-01-26 21:54:04.041952+08	0	0	\N	2019-11-06 13:49:13.679577+08	\N	\N	2	2018-01-26
210	-29	服饰美容	0	珍珠项链	2018-01-26 21:51:56.319873+08	0	0	\N	2019-11-06 13:49:13.680907+08	\N	\N	2	2018-01-26
209	-59	生活日用	0	牙膏牙刷	2018-01-26 21:51:13.588052+08	0	0	\N	2019-11-06 13:49:13.682293+08	\N	\N	2	2018-01-26
208	-26	饮食	0	山竹	2018-01-23 21:54:47.799303+08	0	0	\N	2019-11-06 13:49:13.683668+08	\N	\N	2	2018-01-23
207	-53	饮食	0	老婆大人	2018-01-23 21:54:31.559062+08	0	0	\N	2019-11-06 13:49:13.685013+08	\N	\N	2	2018-01-23
206	-15	交通出行	0	停车费	2018-01-23 21:54:13+08	0	0	\N	2019-11-06 13:49:13.686471+08	\N	\N	2	2018-01-23
195	11838	收入	1	工资	2018-01-16 13:09:32.107744+08	0	0	\N	2019-12-09 16:59:22.910668+08	\N	\N	1	2018-01-16
204	-11	饮食	0	鸡块	2018-01-20 09:58:58.417546+08	0	0	\N	2019-11-06 13:49:13.689328+08	\N	\N	2	2018-01-20
203	-18	饮食	0	老北京	2018-01-20 09:56:35.181186+08	0	0	\N	2019-11-06 13:49:13.690727+08	\N	\N	1	2018-01-20
201	-129	人情往来	0	小伯伯礼	2018-01-20 09:54:31+08	0	0	\N	2019-11-06 13:49:13.693414+08	\N	\N	2	2018-01-20
199	-62	小孩服饰	0	内衣	2018-01-20 09:51:51+08	0	0	\N	2019-11-06 13:49:13.696538+08	\N	\N	2	2018-01-20
198	-21	生活日用	0	快递桌架	2018-01-20 09:51:27.258964+08	0	0	\N	2019-11-06 13:49:13.698235+08	\N	\N	2	2018-01-20
197	-160	生活日用	0	桌面版板	2018-01-20 09:50:56.560414+08	0	0	\N	2019-11-06 13:49:13.699985+08	\N	\N	2	2018-01-20
196	-269	饮食	0	榴莲14斤	2018-01-18 19:30:24.710136+08	0	0	\N	2019-11-06 13:49:13.701443+08	\N	\N	1	2018-01-18
160	200	收入	1	车子刮擦	2018-01-03 20:32:04.313747+08	0	0	\N	2019-12-09 16:59:22.912516+08	\N	\N	2	2018-01-03
194	-299	文教娱乐	0	echo dot	2018-01-16 10:06:32+08	0	0	\N	2019-11-06 13:49:13.704336+08	\N	\N	1	2018-01-16
193	-40	服饰美容	0	毛衣链	2018-01-15 19:48:42.188021+08	0	0	\N	2019-11-06 13:49:13.705757+08	\N	\N	2	2018-01-15
192	-29	生活日用	0	收纳袋	2018-01-15 19:48:29.613415+08	0	0	\N	2019-11-06 13:49:13.707927+08	\N	\N	2	2018-01-15
191	-51	饮食	0	肯德基加关东煮	2018-01-15 19:47:47.450392+08	0	0	\N	2019-11-06 13:49:13.709434+08	\N	\N	2	2018-01-15
190	-5	文教娱乐	0	英超直播	2018-01-15 13:31:50+08	0	0	\N	2019-11-06 13:49:13.710769+08	\N	\N	1	2018-01-15
189	-1500	生活日用	0	生活费	2018-01-13 20:33:42.17357+08	0	0	\N	2019-11-06 13:49:13.712068+08	\N	\N	2	2018-01-13
188	-60	生活日用	0	洗衣	2018-01-13 20:33:20.785578+08	0	0	\N	2019-11-06 13:49:13.713436+08	\N	\N	2	2018-01-13
187	-15	饮食	0	甘蔗	2018-01-13 20:33:02+08	0	0	\N	2019-11-06 13:49:13.715032+08	\N	\N	2	2018-01-13
186	-66	饮食	0	o2	2018-01-13 20:32:46.633743+08	0	0	\N	2019-11-06 13:49:13.716393+08	\N	\N	2	2018-01-13
185	-5	小孩服饰	0	泳裤	2018-01-13 20:32:28+08	0	0	\N	2019-11-06 13:49:13.71775+08	\N	\N	2	2018-01-13
184	-10	交通出行	0	停车费	2018-01-13 20:32:15+08	0	0	\N	2019-11-06 13:49:13.719144+08	\N	\N	2	2018-01-13
183	-263	小孩服饰	0	max win连体衣+内衣	2018-01-13 20:31:51+08	0	0	\N	2019-11-06 13:49:13.720464+08	\N	\N	2	2018-01-13
182	-328	饮食	0	黄记煌	2018-01-13 20:31:10.777542+08	0	0	\N	2019-11-06 13:49:13.721821+08	\N	\N	2	2018-01-13
181	-363	装修	0	雷士筒灯21个	2018-01-13 20:29:56.028854+08	0	0	\N	2019-11-06 13:49:13.723222+08	\N	\N	1	2018-01-13
180	-9745	装修	0	窗	2018-01-13 20:28:00.891141+08	0	0	\N	2019-11-06 13:49:13.724645+08	\N	\N	1	2018-01-13
179	-1400	装修	0	奥普浴霸	2018-01-13 20:27:40.896845+08	0	0	\N	2019-11-06 13:49:13.725937+08	\N	\N	1	2018-01-13
177	-55	饮食	0	聚餐	2018-01-12 22:03:19.66514+08	0	0	\N	2019-11-06 13:49:13.729524+08	\N	\N	1	2018-01-12
175	-558	生活日用	0	倒车雷达	2018-01-11 21:43:04.043907+08	0	0	\N	2019-11-06 13:49:13.73403+08	\N	\N	2	2018-01-11
174	-40	饮食	0	三江购物水香蕉梨	2018-01-10 20:11:22.572949+08	0	0	\N	2019-11-06 13:49:13.736121+08	\N	\N	2	2018-01-10
173	-1208	生活日用	0	照片打印机	2018-01-10 20:10:45.560806+08	0	0	\N	2019-11-06 13:49:13.737932+08	\N	\N	2	2018-01-10
172	-5	饮食	0	臭豆腐	2018-01-08 20:28:30.175709+08	0	0	\N	2019-11-06 13:49:13.73971+08	\N	\N	2	2018-01-08
171	-75	饮食	0	老婆大人	2018-01-08 20:28:20.325027+08	0	0	\N	2019-11-06 13:49:13.741524+08	\N	\N	2	2018-01-08
170	-22	饮食	0	粥	2018-01-07 21:44:00.511642+08	0	0	\N	2019-11-06 13:49:13.743051+08	\N	\N	2	2018-01-07
168	-100	饮食	0	螃蟹	2018-01-07 21:41:36.394873+08	0	0	\N	2019-11-06 13:49:13.746605+08	\N	\N	2	2018-01-07
167	-5	交通出行	0	停车费	2018-01-06 16:20:55+08	0	0	\N	2019-11-06 13:49:13.748214+08	\N	\N	1	2018-01-06
166	-269	小孩服饰	0	连体衣	2018-01-06 16:19:57+08	0	0	\N	2019-11-06 13:49:13.74986+08	\N	\N	2	2018-01-06
165	-230	服饰美容	0	鞋+两件T恤+围巾	2018-01-06 16:19:41.537133+08	0	0	\N	2019-11-06 13:49:13.751764+08	\N	\N	2	2018-01-06
164	-9	饮食	0	大饼油条豆腐脑x2	2018-01-06 16:18:52.996059+08	0	0	\N	2019-11-06 13:49:13.753243+08	\N	\N	2	2018-01-06
163	-830	其他消费	0	戒指	2018-01-06 16:18:20.947627+08	0	0	\N	2019-11-06 13:49:13.754713+08	\N	\N	1	2018-01-06
162	-229	饮食	0	自助餐x2	2018-01-05 19:45:47.171477+08	0	0	\N	2019-11-06 13:49:13.756241+08	\N	\N	2	2018-01-05
161	-40	生活日用	0	理发	2018-01-04 22:28:39.660332+08	0	0	\N	2019-11-06 13:49:13.759363+08	\N	\N	2	2018-01-04
178	4627	收入	1	工资	2017-12-12 22:04:54+08	0	0	\N	2019-12-09 16:59:22.916355+08	\N	\N	2	2017-12-12
159	-190	交通出行	0	加油	2018-01-03 20:31:41+08	0	0	\N	2019-11-06 13:49:13.762843+08	\N	\N	2	2018-01-03
158	-500	生活日用	0	三江卡	2018-01-03 20:31:18.286682+08	0	0	\N	2019-11-06 13:49:13.764508+08	\N	\N	2	2018-01-03
153	-40	小孩服饰	0	袜子和衣服	2018-01-01 20:34:13+08	0	0	\N	2019-11-06 13:49:13.786403+08	\N	\N	2	2018-01-01
106	-66	人情往来	0	新人红包	2017-12-10 09:08:54+08	0	0	\N	2019-11-06 13:49:13.872788+08	\N	\N	1	2017-12-10
237	12072	收入	1	工资	2018-02-09 18:11:12.157577+08	0	0	\N	2019-12-09 16:59:22.906846+08	\N	\N	1	2018-02-09
331	-78	小孩生活用品	0	勺子	2018-03-22 20:58:25+08	0	0	\N	2019-11-06 13:49:13.47677+08	\N	\N	2	2018-03-22
322	-84	小孩服饰	0	max win背心	2018-03-17 21:38:43+08	0	0	\N	2019-11-06 13:49:13.488942+08	\N	\N	2	2018-03-17
318	-69	文教娱乐	0	域名	2018-03-16 11:24:13+08	0	0	\N	2019-11-06 13:49:13.494643+08	\N	\N	1	2018-03-16
315	-6	饮食	0	肯德基	2018-03-15 19:56:38.43921+08	0	0	\N	2019-11-06 13:49:13.498544+08	\N	\N	2	2018-03-15
314	-287	饮食	0	牛很鲜火锅	2018-03-15 19:56:24.77846+08	0	0	\N	2019-11-06 13:49:13.499861+08	\N	\N	2	2018-03-15
304	5391	收入	1	工资	2018-03-09 21:01:12.548382+08	0	0	\N	2019-12-09 16:59:22.900056+08	\N	\N	2	2018-03-09
311	-209	文教娱乐	0	羽毛球拍一副	2018-03-15 14:19:44+08	0	0	\N	2019-11-06 13:49:13.503923+08	\N	\N	1	2018-03-15
310	-47	饮食	0	超市	2018-03-12 22:23:47+08	0	0	\N	2019-11-06 13:49:13.50521+08	\N	\N	2	2018-03-12
309	-15	交通出行	0	高速费	2018-03-11 17:07:48+08	0	0	\N	2019-11-06 13:49:13.506647+08	\N	\N	2	2018-03-11
308	-46	饮食	0	新江厦	2018-03-10 17:51:00.351406+08	0	0	\N	2019-11-06 13:49:13.507963+08	\N	\N	2	2018-03-10
307	-20	饮食	0	草莓	2018-03-10 17:50:27.237722+08	0	0	\N	2019-11-06 13:49:13.50933+08	\N	\N	2	2018-03-10
306	-1500	生活日用	0	生活费	2018-03-10 17:50:15.357698+08	0	0	\N	2019-11-06 13:49:13.510679+08	\N	\N	2	2018-03-10
305	-300	装修	0	奥普结余	2018-03-10 10:10:31.269358+08	0	0	\N	2019-11-06 13:49:13.511944+08	\N	\N	1	2018-03-10
251	15000	收入	1	提成	2018-02-14 13:00:34.440716+08	0	0	\N	2019-12-09 16:59:22.902969+08	\N	\N	2	2018-02-14
301	-12	生活日用	0	手机壳	2018-03-09 20:59:02.902386+08	0	0	\N	2019-11-06 13:49:13.517316+08	\N	\N	2	2018-03-09
300	-55	饮食	0	肯德基24＋o216＋鸡本部16	2018-03-09 20:57:56.852463+08	0	0	\N	2019-11-06 13:49:13.518653+08	\N	\N	2	2018-03-09
299	-89	生活日用	0	生活用品	2018-03-09 20:56:50.367298+08	0	0	\N	2019-11-06 13:49:13.519933+08	\N	\N	2	2018-03-09
298	-7000	装修	0	三扇门x1150+5个门套	2018-03-04 17:21:38.465804+08	0	0	\N	2019-11-06 13:49:13.521292+08	\N	\N	1	2018-03-04
296	-105	生活日用	0	洗发水	2018-03-04 17:12:35.327545+08	0	0	\N	2019-11-06 13:49:13.523926+08	\N	\N	2	2018-03-04
293	-14	生活日用	0	钢化膜2张	2018-03-01 21:40:48.251921+08	0	0	\N	2019-11-06 13:49:13.527872+08	\N	\N	2	2018-03-01
291	-37	饮食	0	绿资	2018-03-01 21:36:54.95502+08	0	0	\N	2019-11-06 13:49:13.530438+08	\N	\N	2	2018-03-01
290	-19	饮食	0	老婆大人	2018-03-01 21:36:26.502206+08	0	0	\N	2019-11-06 13:49:13.531699+08	\N	\N	2	2018-03-01
289	-39	生活日用	0	安全坐椅罩	2018-03-01 21:36:11.426702+08	0	0	\N	2019-11-06 13:49:13.532946+08	\N	\N	2	2018-03-01
288	-10	生活日用	0	开水瓶口中子	2018-03-01 21:35:21.828208+08	0	0	\N	2019-11-06 13:49:13.534285+08	\N	\N	2	2018-03-01
287	-8	生活日用	0	遮阳帘车子	2018-03-01 21:35:03.062966+08	0	0	\N	2019-11-06 13:49:13.535554+08	\N	\N	2	2018-03-01
283	-23	文教娱乐	0	鱼食红虫干	2018-02-27 18:14:56+08	0	0	\N	2019-11-06 13:49:13.540908+08	\N	\N	1	2018-02-27
282	-3008	生活日用	0	iPad 128G	2018-02-26 19:07:05.490255+08	0	0	\N	2019-11-06 13:49:13.542179+08	\N	\N	1	2018-02-26
281	-200	交通出行	0	加油	2018-02-26 19:04:33+08	0	0	\N	2019-11-06 13:49:13.543442+08	\N	\N	1	2018-02-26
280	-7	小孩生活用品	0	车上遮阳布	2018-02-26 19:02:59+08	0	0	\N	2019-11-06 13:49:13.544772+08	\N	\N	2	2018-02-26
279	-16	小孩玩具	0	灯笼	2018-02-26 19:02:39+08	0	0	\N	2019-11-06 13:49:13.546082+08	\N	\N	2	2018-02-26
278	-16	饮食	0	牛肉干	2018-02-26 19:02:02.916571+08	0	0	\N	2019-11-06 13:49:13.547464+08	\N	\N	2	2018-02-26
277	-20	饮食	0	草莓	2018-02-26 19:01:51.775254+08	0	0	\N	2019-11-06 13:49:13.548754+08	\N	\N	2	2018-02-26
275	-237	小孩健康	0	小孩看病	2018-02-26 19:01:15+08	0	0	\N	2019-11-06 13:49:13.551659+08	\N	\N	2	2018-02-26
274	-81	文教娱乐	0	鱼缸过滤器	2018-02-23 19:11:01+08	0	0	\N	2019-11-06 13:49:13.552981+08	\N	\N	1	2018-02-23
273	-45	生活日用	0	手机后盖	2018-02-23 19:10:17.59287+08	0	0	\N	2019-11-06 13:49:13.554299+08	\N	\N	1	2018-02-23
272	-41	饮食	0	欧文蛋糕	2018-02-23 07:42:18.768683+08	0	0	\N	2019-11-06 13:49:13.556706+08	\N	\N	2	2018-02-23
271	-107	饮食	0	肯德基套餐	2018-02-23 07:40:54.204119+08	0	0	\N	2019-11-06 13:49:13.558108+08	\N	\N	2	2018-02-23
270	-78	小孩健康	0	钙片爱因保	2018-02-23 07:40:03+08	0	0	\N	2019-11-06 13:49:13.559449+08	\N	\N	2	2018-02-23
269	-100	小孩健康	0	两盒星鲨D剂＋一盒美林	2018-02-23 07:37:41+08	0	0	\N	2019-11-06 13:49:13.560837+08	\N	\N	2	2018-02-23
268	-114	小孩生活用品	0	水杯，温奶器，碗－京东	2018-02-23 07:36:27+08	0	0	\N	2019-11-06 13:49:13.562136+08	\N	\N	2	2018-02-23
267	-115	小孩健康	0	嘟嘟检查	2018-02-23 07:34:53+08	0	0	\N	2019-11-06 13:49:13.563503+08	\N	\N	2	2018-02-23
266	-23	饮食	0	老婆大人	2018-02-23 07:33:27.177025+08	0	0	\N	2019-11-06 13:49:13.564863+08	\N	\N	2	2018-02-23
265	-69	小孩生活用品	0	安抚奶嘴	2018-02-23 07:33:00+08	0	0	\N	2019-11-06 13:49:13.566244+08	\N	\N	2	2018-02-23
264	-100	文教娱乐	0	电影票	2018-02-23 07:32:38+08	0	0	\N	2019-11-06 13:49:13.567667+08	\N	\N	2	2018-02-23
263	-13	饮食	0	coco饮料	2018-02-23 07:32:05.49678+08	0	0	\N	2019-11-06 13:49:13.569008+08	\N	\N	2	2018-02-23
262	-22	饮食	0	KFC早餐	2018-02-20 18:18:53.413374+08	0	0	\N	2019-11-06 13:49:13.570377+08	\N	\N	2	2018-02-20
261	-15	饮食	0	三江购物	2018-02-20 18:18:38.521651+08	0	0	\N	2019-11-06 13:49:13.571689+08	\N	\N	2	2018-02-20
260	-107	饮食	0	KFC	2018-02-20 18:18:17.045178+08	0	0	\N	2019-11-06 13:49:13.573004+08	\N	\N	2	2018-02-20
259	-800	人情往来	0	外婆新年红包	2018-02-16 19:52:52+08	0	0	\N	2019-11-06 13:49:13.574314+08	\N	\N	1	2018-02-16
258	-118	饮食	0	胖二哥午餐	2018-02-14 13:08:58.264507+08	0	0	\N	2019-11-06 13:49:13.575602+08	\N	\N	2	2018-02-14
257	-298	服饰美容	0	羽绒服外套	2018-02-14 13:03:51.849129+08	0	0	\N	2019-11-06 13:49:13.576966+08	\N	\N	2	2018-02-14
256	-6	饮食	0	甜筒	2018-02-14 13:03:24.875836+08	0	0	\N	2019-11-06 13:49:13.578316+08	\N	\N	2	2018-02-14
255	-17	饮食	0	火龙果	2018-02-14 13:03:03.50168+08	0	0	\N	2019-11-06 13:49:13.579745+08	\N	\N	2	2018-02-14
254	-149	小孩服饰	0	爱婴岛衣外套＋卫衣	2018-02-14 13:02:43+08	0	0	\N	2019-11-06 13:49:13.581095+08	\N	\N	2	2018-02-14
253	-49	小孩服饰	0	gap毛衣	2018-02-14 13:01:59+08	0	0	\N	2019-11-06 13:49:13.582433+08	\N	\N	2	2018-02-14
252	-168	小孩服饰	0	优衣库外套	2018-02-14 13:01:20+08	0	0	\N	2019-11-06 13:49:13.584561+08	\N	\N	2	2018-02-14
249	-30	饮食	0	KFC午餐	2018-02-13 11:19:29.948934+08	0	0	\N	2019-11-06 13:49:13.594378+08	\N	\N	1	2018-02-13
248	-1500	生活日用	0	生活费	2018-02-11 07:38:13.052033+08	0	0	\N	2019-11-06 13:49:13.597556+08	\N	\N	2	2018-02-11
246	-109	服饰美容	0	棉裤	2018-02-11 07:36:07.092754+08	0	0	\N	2019-11-06 13:49:13.629927+08	\N	\N	2	2018-02-11
245	-15	小孩生活用品	0	两瓶矿泉水	2018-02-11 07:33:22+08	0	0	\N	2019-11-06 13:49:13.631491+08	\N	\N	2	2018-02-11
244	-20	其他消费	0	捐款	2018-02-11 07:31:53.473747+08	0	0	\N	2019-11-06 13:49:13.632907+08	\N	\N	2	2018-02-11
243	-1000	人情往来	0	烧酒费	2018-02-11 07:31:23+08	0	0	\N	2019-11-06 13:49:13.634374+08	\N	\N	2	2018-02-11
242	-55	小孩健康	0	检查费	2018-02-11 07:30:23+08	0	0	\N	2019-11-06 13:49:13.635868+08	\N	\N	2	2018-02-11
241	-30	交通出行	0	停车费＋高速	2018-02-11 07:29:01+08	0	0	\N	2019-11-06 13:49:13.637378+08	\N	\N	2	2018-02-11
239	-182	饮食	0	午餐	2018-02-10 13:04:52.060615+08	0	0	\N	2019-11-06 13:49:13.640129+08	\N	\N	1	2018-02-10
234	-50	通讯物流	0	无限流量卡	2018-02-07 10:15:25+08	0	0	\N	2019-11-06 13:49:13.646906+08	\N	\N	1	2018-02-07
220	-51	小孩生活用品	0	磨牙棒2盒	2018-01-30 20:53:47+08	0	0	\N	2019-11-06 13:49:13.666152+08	\N	\N	2	2018-01-30
74	-89	小孩生活用品	0	储奶袋	2017-11-26 21:21:50+08	0	0	\N	2019-11-06 13:49:14.000781+08	\N	\N	2	2017-11-26
313	12287	收入	1	工资	2018-03-15 15:35:57.670828+08	0	0	\N	2019-12-09 16:59:22.893981+08	\N	\N	1	2018-03-15
79	-55	文教娱乐	0	域名benying.com	2017-11-28 20:52:10+08	0	0	\N	2019-11-06 13:49:13.98926+08	\N	\N	1	2017-11-28
407	-112	小孩奶粉	0	喜宝奶粉	2018-05-01 21:18:23+08	0	0	\N	2019-11-06 13:49:13.348938+08	\N	\N	2	2018-05-01
405	-216	交通出行	0	汽车票	2018-05-01 21:16:28+08	0	0	\N	2019-11-06 13:49:13.351791+08	\N	\N	2	2018-05-01
401	-650	交通出行	0	象山影视城门票5张	2018-05-01 20:14:32+08	0	0	\N	2019-11-06 13:49:13.359134+08	\N	\N	2	2018-05-01
394	-143	装修	0	地板尾款	2018-04-22 19:14:41.5846+08	0	0	\N	2019-11-06 13:49:13.370311+08	\N	\N	1	2018-04-22
393	-8	饮食	0	饮料	2018-04-22 19:14:25.775841+08	0	0	\N	2019-11-06 13:49:13.371671+08	\N	\N	1	2018-04-22
392	-3500	其他消费	0	合资	2018-04-20 21:53:33.061906+08	0	0	\N	2019-11-06 13:49:13.373047+08	\N	\N	2	2018-04-20
375	12200	收入	1	工资	2018-04-14 17:24:27.511344+08	0	0	\N	2019-12-09 16:59:22.889721+08	\N	\N	1	2018-04-14
388	-18	装修	0	平拉手	2018-04-20 21:51:56.518205+08	0	0	\N	2019-11-06 13:49:13.379062+08	\N	\N	1	2018-04-20
387	-799	装修	0	九牧花洒	2018-04-20 21:51:02.933762+08	0	0	\N	2019-11-06 13:49:13.380399+08	\N	\N	1	2018-04-20
386	-77	小孩生活用品	0	12瓶水	2018-04-20 21:50:12+08	0	0	\N	2019-11-06 13:49:13.381765+08	\N	\N	2	2018-04-20
385	-118	生活日用	0	3瓶油	2018-04-20 21:49:19.759266+08	0	0	\N	2019-11-06 13:49:13.383187+08	\N	\N	2	2018-04-20
384	-151	小孩奶粉	0	奶瓶3个	2018-04-20 21:48:51+08	0	0	\N	2019-11-06 13:49:13.386516+08	\N	\N	2	2018-04-20
382	-636	饮食	0	阿毛饭店	2018-04-20 21:47:26.419906+08	0	0	\N	2019-11-06 13:49:13.390933+08	\N	\N	2	2018-04-20
381	-67	饮食	0	肯德基coco	2018-04-20 21:47:06.794787+08	0	0	\N	2019-11-06 13:49:13.392375+08	\N	\N	2	2018-04-20
380	-14	服饰美容	0	袜子	2018-04-20 21:46:41.428938+08	0	0	\N	2019-11-06 13:49:13.393789+08	\N	\N	2	2018-04-20
379	-57	饮食	0	美团外卖	2018-04-20 21:46:16.464384+08	0	0	\N	2019-11-06 13:49:13.395134+08	\N	\N	2	2018-04-20
376	-23	小孩健康	0	看骨科	2018-04-20 21:40:51+08	0	0	\N	2019-11-06 13:49:13.399177+08	\N	\N	2	2018-04-20
335	5013	收入	1	工资	2018-03-22 21:01:49+08	0	0	\N	2019-12-09 16:59:22.892091+08	\N	\N	2	2018-03-22
373	-11087	装修	0	地板	2018-04-14 17:21:07.188517+08	0	0	\N	2019-11-06 13:49:13.403264+08	\N	\N	1	2018-04-14
372	-56	小孩健康	0	看病	2018-04-11 21:24:32+08	0	0	\N	2019-11-06 13:49:13.404736+08	\N	\N	2	2018-04-11
371	-40	小孩健康	0	退烧药	2018-04-10 21:54:22+08	0	0	\N	2019-11-06 13:49:13.406255+08	\N	\N	2	2018-04-10
370	-39	小孩健康	0	退热贴	2018-04-10 21:54:05+08	0	0	\N	2019-11-06 13:49:13.407645+08	\N	\N	2	2018-04-10
368	-193	小孩玩具	0	爬行垫	2018-04-10 21:53:31+08	0	0	\N	2019-11-06 13:49:13.410746+08	\N	\N	2	2018-04-10
367	-150	小孩生活用品	0	奶瓶x2	2018-04-10 21:53:04+08	0	0	\N	2019-11-06 13:49:13.412443+08	\N	\N	2	2018-04-10
365	-60	饮食	0	西瓜	2018-04-10 21:52:20.227921+08	0	0	\N	2019-11-06 13:49:13.416346+08	\N	\N	2	2018-04-10
364	-325	小孩健康	0	看病	2018-04-10 21:52:07+08	0	0	\N	2019-11-06 13:49:13.418213+08	\N	\N	2	2018-04-10
363	-35	小孩健康	0	退热贴	2018-04-10 21:50:54+08	0	0	\N	2019-11-06 13:49:13.419676+08	\N	\N	2	2018-04-10
362	-216	小孩生活用品	0	被子	2018-04-10 21:50:12+08	0	0	\N	2019-11-06 13:49:13.421013+08	\N	\N	2	2018-04-10
361	-275	饮食	0	湘菜	2018-04-10 21:50:02.166762+08	0	0	\N	2019-11-06 13:49:13.423949+08	\N	\N	2	2018-04-10
359	-350	饮食	0	烧烤	2018-04-10 21:47:12.537877+08	0	0	\N	2019-11-06 13:49:13.431109+08	\N	\N	2	2018-04-10
358	-3	饮食	0	棒冰	2018-04-04 21:46:37.566018+08	0	0	\N	2019-11-06 13:49:13.435168+08	\N	\N	1	2018-04-04
355	-50	饮食	0	烧烤	2018-04-04 21:40:29.365793+08	0	0	\N	2019-11-06 13:49:13.442592+08	\N	\N	2	2018-04-04
354	-6	饮食	0	肯德基	2018-04-04 21:40:15.752301+08	0	0	\N	2019-11-06 13:49:13.443887+08	\N	\N	2	2018-04-04
352	-309	小孩奶粉	0	奶粉零食	2018-04-04 21:39:19+08	0	0	\N	2019-11-06 13:49:13.446756+08	\N	\N	2	2018-04-04
351	-25	饮食	0	美团外卖	2018-04-04 21:38:45.951554+08	0	0	\N	2019-11-06 13:49:13.448143+08	\N	\N	2	2018-04-04
350	-21	服饰美容	0	袜子3条	2018-04-04 21:38:28.500231+08	0	0	\N	2019-11-06 13:49:13.449456+08	\N	\N	2	2018-04-04
349	-50	服饰美容	0	裤子	2018-04-04 21:38:05.818666+08	0	0	\N	2019-11-06 13:49:13.450924+08	\N	\N	2	2018-04-04
348	-15	生活日用	0	勺子筷子	2018-04-04 21:37:34.802246+08	0	0	\N	2019-11-06 13:49:13.452229+08	\N	\N	2	2018-04-04
347	-179	装修	0	凉霸	2018-03-27 21:02:17.603844+08	0	0	\N	2019-11-06 13:49:13.453888+08	\N	\N	1	2018-03-27
346	-14	饮食	0	老婆大人	2018-03-26 22:05:29.433575+08	0	0	\N	2019-11-06 13:49:13.455169+08	\N	\N	2	2018-03-26
345	-48	饮食	0	绿姿	2018-03-26 22:05:17.360084+08	0	0	\N	2019-11-06 13:49:13.456538+08	\N	\N	2	2018-03-26
343	-43	小孩服饰	0	鞋子	2018-03-25 21:26:46+08	0	0	\N	2019-11-06 13:49:13.46043+08	\N	\N	2	2018-03-25
341	-30	饮食	0	o2	2018-03-25 21:25:03.062174+08	0	0	\N	2019-11-06 13:49:13.463305+08	\N	\N	2	2018-03-25
340	-37	饮食	0	o2	2018-03-25 21:24:36.736021+08	0	0	\N	2019-11-06 13:49:13.464668+08	\N	\N	2	2018-03-25
339	-60	交通出行	0	植物园门票	2018-03-25 21:24:12+08	0	0	\N	2019-11-06 13:49:13.466011+08	\N	\N	2	2018-03-25
338	-157	小孩服饰	0	衣服	2018-03-24 14:02:51+08	0	0	\N	2019-11-06 13:49:13.467338+08	\N	\N	2	2018-03-24
337	-338	服饰美容	0	上衣＋裤子	2018-03-24 14:02:33.872851+08	0	0	\N	2019-11-06 13:49:13.468671+08	\N	\N	2	2018-03-24
336	-96	饮食	0	午餐美蛙	2018-03-24 14:01:49.10461+08	0	0	\N	2019-11-06 13:49:13.469997+08	\N	\N	2	2018-03-24
369	-79	小孩生活用品	0	尿不湿	2018-04-10 21:53:53+08	0	0	\N	2020-07-20 13:32:29.251792+08	\N	\N	2	2018-04-10
334	-17	小孩服饰	0	帽子	2018-03-22 21:00:00+08	0	0	\N	2019-11-06 13:49:13.472703+08	\N	\N	2	2018-03-22
333	-17	小孩服饰	0	帽子	2018-03-22 20:59:59+08	0	0	\N	2019-11-06 13:49:13.474093+08	\N	\N	2	2018-03-22
332	-26	饮食	0	茶香香	2018-03-22 20:59:02.873751+08	0	0	\N	2019-11-06 13:49:13.475385+08	\N	\N	2	2018-03-22
330	-200	交通出行	0	加油	2018-03-22 20:58:12+08	0	0	\N	2019-11-06 13:49:13.478118+08	\N	\N	2	2018-03-22
329	-58	小孩生活用品	0	怡宝矿泉水8瓶	2018-03-22 20:58:01+08	0	0	\N	2019-11-06 13:49:13.479482+08	\N	\N	2	2018-03-22
328	-1200	装修	0	欧琳水槽	2018-03-20 07:58:58.428982+08	0	0	\N	2019-11-06 13:49:13.480772+08	\N	\N	1	2018-03-20
327	-250	装修	0	燃气灶安装材料费	2018-03-19 18:27:57.656201+08	0	0	\N	2019-11-06 13:49:13.482145+08	\N	\N	1	2018-03-19
326	-100	装修	0	烟道材料费	2018-03-19 17:59:48.935314+08	0	0	\N	2019-11-06 13:49:13.483462+08	\N	\N	1	2018-03-19
325	-22	生活日用	0	理发	2018-03-17 21:42:22.581668+08	0	0	\N	2019-11-06 13:49:13.484825+08	\N	\N	1	2018-03-17
324	-399	小孩生活用品	0	拍照	2018-03-17 21:39:18+08	0	0	\N	2019-11-06 13:49:13.486173+08	\N	\N	2	2018-03-17
323	-108	小孩零食	0	米粉面条	2018-03-17 21:39:05+08	0	0	\N	2019-11-06 13:49:13.487563+08	\N	\N	2	2018-03-17
321	-19	饮食	0	盐水鸡鱿鱼须	2018-03-17 21:38:15.132558+08	0	0	\N	2019-11-06 13:49:13.490434+08	\N	\N	2	2018-03-17
320	-3798	装修	0	AO Smith热水器	2018-03-17 21:36:41.811631+08	0	0	\N	2019-11-06 13:49:13.491959+08	\N	\N	1	2018-03-17
319	-1450	装修	0	开关插座	2018-03-17 12:54:41.99654+08	0	0	\N	2019-11-06 13:49:13.493331+08	\N	\N	1	2018-03-17
317	-10	饮食	0	薯条	2018-03-15 20:11:29.700135+08	0	0	\N	2019-11-06 13:49:13.495985+08	\N	\N	2	2018-03-15
312	-328	文教娱乐	0	帐篷	2018-03-15 14:57:09+08	0	0	\N	2019-11-06 13:49:13.5026+08	\N	\N	1	2018-03-15
303	-100	小孩文具	0	书	2018-03-09 21:00:26+08	0	0	\N	2019-11-06 13:49:13.514647+08	\N	\N	2	2018-03-09
302	-200	交通出行	0	加油	2018-03-09 20:59:33+08	0	0	\N	2019-11-06 13:49:13.515915+08	\N	\N	2	2018-03-09
295	-21	交通出行	0	滴滴	2018-03-03 10:10:03+08	0	0	\N	2019-11-06 13:49:13.52527+08	\N	\N	2	2018-03-03
292	-198	小孩生活用品	0	全面时代餐巾纸24包	2018-03-01 21:39:14+08	0	0	\N	2019-11-06 13:49:13.529161+08	\N	\N	2	2018-03-01
118	-66	人情往来	0	公司圣诞礼物音乐台灯	2017-12-20 21:47:14+08	0	0	\N	2019-11-06 13:49:13.851446+08	\N	\N	1	2017-12-20
391	7551	收入	1	工资	2018-04-20 21:52:59.652492+08	0	0	\N	2019-12-09 16:59:22.887124+08	\N	\N	2	2018-04-20
494	-1020	人情往来	0	手表	2018-06-10 16:39:13+08	0	0	\N	2019-11-06 13:49:13.201503+08	\N	\N	2	2018-06-10
481	-67	人情往来	0	脚垫	2018-06-05 20:53:03+08	0	0	\N	2019-11-06 13:49:13.222007+08	\N	\N	2	2018-06-05
471	-373	服饰美容	0	服饰鞋子	2018-06-05 20:42:46.134014+08	0	0	\N	2019-11-06 13:49:13.237574+08	\N	\N	2	2018-06-05
470	-14	生活日用	0	窗帘挂钩	2018-06-05 20:40:22.796344+08	0	0	\N	2019-11-06 13:49:13.238985+08	\N	\N	2	2018-06-05
468	-50	饮食	0	绿姿	2018-06-05 20:39:09.778941+08	0	0	\N	2019-11-06 13:49:13.241778+08	\N	\N	2	2018-06-05
467	-45	交通出行	0	高速费	2018-06-03 20:58:52+08	0	0	\N	2019-11-06 13:49:13.243201+08	\N	\N	1	2018-06-03
466	-100	通讯物流	0	手机充值	2018-06-03 20:58:10+08	0	0	\N	2019-11-06 13:49:13.244556+08	\N	\N	1	2018-06-03
465	-58	饮食	0	欧文蛋糕	2018-06-03 20:57:49.961772+08	0	0	\N	2019-11-06 13:49:13.245907+08	\N	\N	1	2018-06-03
463	-100	交通出行	0	加油	2018-06-03 20:56:11+08	0	0	\N	2019-11-06 13:49:13.248662+08	\N	\N	1	2018-06-03
462	-21	生活日用	0	小风扇	2018-05-24 21:09:56.93909+08	0	0	\N	2019-11-06 13:49:13.250084+08	\N	\N	2	2018-05-24
461	-29	生活日用	0	置物架	2018-05-24 21:09:41.992893+08	0	0	\N	2019-11-06 13:49:13.254684+08	\N	\N	2	2018-05-24
460	-216	生活日用	0	帘子	2018-05-24 21:09:22.88405+08	0	0	\N	2019-11-06 13:49:13.256122+08	\N	\N	2	2018-05-24
459	-54	生活日用	0	补漆笔	2018-05-24 21:06:48.395219+08	0	0	\N	2019-11-06 13:49:13.257496+08	\N	\N	1	2018-05-24
458	-9	文教娱乐	0	电影票	2018-05-22 21:15:30+08	0	0	\N	2019-11-06 13:49:13.258885+08	\N	\N	1	2018-05-22
435	13128	收入	1	工资	2018-05-15 19:47:20.008748+08	0	0	\N	2019-12-09 16:59:22.885207+08	\N	\N	1	2018-05-15
456	-46	饮食	0	干脆面	2018-05-22 21:12:23.742701+08	0	0	\N	2019-11-06 13:49:13.261539+08	\N	\N	2	2018-05-22
455	-74	生活日用	0	大米	2018-05-22 21:12:08.89877+08	0	0	\N	2019-11-06 13:49:13.26301+08	\N	\N	2	2018-05-22
454	-113	生活日用	0	餐巾纸	2018-05-22 21:11:48.789755+08	0	0	\N	2019-11-06 13:49:13.264621+08	\N	\N	2	2018-05-22
453	-276	饮食	0	韩宫宴烧烤	2018-05-22 21:10:50.419631+08	0	0	\N	2019-11-06 13:49:13.265985+08	\N	\N	2	2018-05-22
451	-300	交通出行	0	加油	2018-05-22 21:09:47+08	0	0	\N	2019-11-06 13:49:13.268658+08	\N	\N	2	2018-05-22
450	-51	生活日用	0	美购超市	2018-05-22 21:09:34.53729+08	0	0	\N	2019-11-06 13:49:13.270003+08	\N	\N	2	2018-05-22
449	-10	交通出行	0	停车费	2018-05-22 21:08:56+08	0	0	\N	2019-11-06 13:49:13.271459+08	\N	\N	2	2018-05-22
448	-61	饮食	0	春饼	2018-05-22 21:08:43.673408+08	0	0	\N	2019-11-06 13:49:13.272994+08	\N	\N	2	2018-05-22
447	-35	小孩生活用品	0	理发加游泳裤	2018-05-22 21:08:25+08	0	0	\N	2019-11-06 13:49:13.274548+08	\N	\N	2	2018-05-22
446	-59	生活日用	0	伸缩杆	2018-05-22 21:07:54.25265+08	0	0	\N	2019-11-06 13:49:13.275929+08	\N	\N	2	2018-05-22
444	-38	饮食	0	零食	2018-05-20 15:37:28.38857+08	0	0	\N	2019-11-06 13:49:13.278627+08	\N	\N	1	2018-05-20
443	-466	小孩奶粉	0	6罐奶粉	2018-05-17 20:32:14+08	0	0	\N	2019-11-06 13:49:13.279986+08	\N	\N	2	2018-05-17
442	-37	饮食	0	荔枝	2018-05-17 20:31:26.546622+08	0	0	\N	2019-11-06 13:49:13.281435+08	\N	\N	2	2018-05-17
441	-20	饮食	0	棒冰	2018-05-17 20:31:15.433867+08	0	0	\N	2019-11-06 13:49:13.282831+08	\N	\N	2	2018-05-17
440	-196	住房缴费	0	水费	2018-05-17 20:30:05+08	0	0	\N	2019-11-06 13:49:13.284222+08	\N	\N	2	2018-05-17
439	-135	小孩服饰	0	夏装T恤	2018-05-17 20:29:37+08	0	0	\N	2019-11-06 13:49:13.285607+08	\N	\N	2	2018-05-17
438	-7	生活日用	0	头绳	2018-05-17 20:28:14.316813+08	0	0	\N	2019-11-06 13:49:13.286992+08	\N	\N	2	2018-05-17
437	-26	生活日用	0	米桶	2018-05-17 20:28:01.469213+08	0	0	\N	2019-11-06 13:49:13.288396+08	\N	\N	2	2018-05-17
436	-112	饮食	0	烘培	2018-05-17 20:27:37.513723+08	0	0	\N	2019-11-06 13:49:13.28982+08	\N	\N	2	2018-05-17
433	-26	生活日用	0	插座	2018-05-09 22:03:22.475558+08	0	0	\N	2019-11-06 13:49:13.296794+08	\N	\N	2	2018-05-09
432	-26	生活日用	0	门吸	2018-05-09 22:03:08.00259+08	0	0	\N	2019-11-06 13:49:13.298134+08	\N	\N	2	2018-05-09
431	-70	饮食	0	水果	2018-05-09 22:02:27.220239+08	0	0	\N	2019-11-06 13:49:13.299534+08	\N	\N	2	2018-05-09
430	-58	饮食	0	零食	2018-05-09 22:00:12.46867+08	0	0	\N	2019-11-06 13:49:13.300905+08	\N	\N	1	2018-05-09
429	-300	装修	0	门锁	2018-05-07 21:53:01.774947+08	0	0	\N	2019-11-06 13:49:13.302354+08	\N	\N	1	2018-05-07
427	-220	小孩奶粉	0	奶粉	2018-05-07 21:50:49+08	0	0	\N	2019-11-06 13:49:13.305127+08	\N	\N	2	2018-05-07
426	-18	饮食	0	茶香香	2018-05-06 20:32:56.190693+08	0	0	\N	2019-11-06 13:49:13.306542+08	\N	\N	1	2018-05-06
425	-2713	装修	0	衣柜门	2018-05-06 20:25:49.255789+08	0	0	\N	2019-11-06 13:49:13.307975+08	\N	\N	1	2018-05-06
424	-10	生活日用	0	锅盖把手	2018-05-06 20:25:11.987785+08	0	0	\N	2019-11-06 13:49:13.323687+08	\N	\N	2	2018-05-06
423	-66	服饰美容	0	双肩包	2018-05-06 20:24:55.280284+08	0	0	\N	2019-11-06 13:49:13.326319+08	\N	\N	2	2018-05-06
422	-76	生活日用	0	超市	2018-05-06 20:24:36.882661+08	0	0	\N	2019-11-06 13:49:13.327766+08	\N	\N	2	2018-05-06
420	-42	饮食	0	串烧	2018-05-06 20:23:33.841652+08	0	0	\N	2019-11-06 13:49:13.330424+08	\N	\N	2	2018-05-06
419	-4833	健康保险	0	车保	2018-05-06 20:23:08+08	0	0	\N	2019-11-06 13:49:13.331766+08	\N	\N	2	2018-05-06
418	-108	服饰美容	0	裙子	2018-05-06 20:22:53.074198+08	0	0	\N	2019-11-06 13:49:13.33314+08	\N	\N	2	2018-05-06
416	-71	小孩服饰	0	衣服	2018-05-06 20:22:08+08	0	0	\N	2019-11-06 13:49:13.336496+08	\N	\N	2	2018-05-06
415	-28	生活日用	0	袖套	2018-05-06 20:21:57.732779+08	0	0	\N	2019-11-06 13:49:13.337902+08	\N	\N	2	2018-05-06
414	-19	饮食	0	饮料	2018-05-06 20:21:47.658175+08	0	0	\N	2019-11-06 13:49:13.33917+08	\N	\N	2	2018-05-06
413	-300	文教娱乐	0	KTV	2018-05-06 20:21:35+08	0	0	\N	2019-11-06 13:49:13.340517+08	\N	\N	2	2018-05-06
412	-22	饮食	0	茶香香	2018-05-06 20:21:13.873467+08	0	0	\N	2019-11-06 13:49:13.341868+08	\N	\N	2	2018-05-06
411	-22	饮食	0	水果	2018-05-06 20:20:58.855182+08	0	0	\N	2019-11-06 13:49:13.343121+08	\N	\N	2	2018-05-06
410	-200	交通出行	0	加油	2018-05-06 20:20:47+08	0	0	\N	2019-11-06 13:49:13.344486+08	\N	\N	2	2018-05-06
409	-3500	装修	0	大理石	2018-05-06 18:23:12.695054+08	0	0	\N	2019-11-06 13:49:13.34581+08	\N	\N	1	2018-05-06
408	-556	饮食	0	华侨豪生自助餐	2018-05-01 21:21:34.653436+08	0	0	\N	2019-11-06 13:49:13.347076+08	\N	\N	2	2018-05-01
404	-74	饮食	0	零食	2018-05-01 21:15:45.551463+08	0	0	\N	2019-11-06 13:49:13.353097+08	\N	\N	2	2018-05-01
403	-90	小孩服饰	0	睡衣	2018-05-01 21:14:35+08	0	0	\N	2019-11-06 13:49:13.354446+08	\N	\N	2	2018-05-01
402	-3000	生活日用	0	生活费	2018-05-01 21:13:40.78655+08	0	0	\N	2019-11-06 13:49:13.357749+08	\N	\N	2	2018-05-01
400	-53	生活日用	0	蟑螂贴2付	2018-05-01 20:12:24.511682+08	0	0	\N	2019-11-06 13:49:13.360489+08	\N	\N	1	2018-05-01
399	-239	装修	0	yeelight餐厅灯	2018-04-24 22:09:11.963699+08	0	0	\N	2019-11-06 13:49:13.361951+08	\N	\N	1	2018-04-24
398	-1679	装修	0	yeelight三室一厅灯	2018-04-24 22:08:46.47179+08	0	0	\N	2019-11-06 13:49:13.364774+08	\N	\N	1	2018-04-24
397	-20	饮食	0	串烧	2018-04-22 19:32:42.459873+08	0	0	\N	2019-11-06 13:49:13.366264+08	\N	\N	1	2018-04-22
396	-868	饮食	0	奶粉+零食	2018-04-22 19:16:30.511536+08	0	0	\N	2019-11-06 13:49:13.367586+08	\N	\N	2	2018-04-22
395	-100	小孩健康	0	医药费	2018-04-22 19:15:37+08	0	0	\N	2019-11-06 13:49:13.368937+08	\N	\N	2	2018-04-22
390	-15	文教娱乐	0	英超	2018-04-20 21:52:27+08	0	0	\N	2019-11-06 13:49:13.376261+08	\N	\N	1	2018-04-20
389	-100	交通出行	0	罚单	2018-04-20 21:52:15+08	0	0	\N	2019-11-06 13:49:13.377709+08	\N	\N	1	2018-04-20
378	-27	小孩生活用品	0	纱布巾	2018-04-20 21:45:58+08	0	0	\N	2019-11-06 13:49:13.396521+08	\N	\N	2	2018-04-20
377	-39	小孩生活用品	0	饮水杯	2018-04-20 21:45:30+08	0	0	\N	2019-11-06 13:49:13.397845+08	\N	\N	2	2018-04-20
366	-20	交通出行	0	停车费	2018-04-10 21:52:43+08	0	0	\N	2019-11-06 13:49:13.414971+08	\N	\N	2	2018-04-10
457	5391	收入	1	工资	2018-05-22 21:12:56.700776+08	0	0	\N	2019-12-09 16:59:22.883031+08	\N	\N	2	2018-05-22
567	-142	住房缴费	0	水费	2018-07-13 07:43:11+08	0	0	\N	2019-11-06 13:49:13.07431+08	\N	\N	2	2018-07-13
552	-72	生活日用	0	烘培工具	2018-07-06 20:55:39+08	0	0	\N	2019-11-06 13:49:13.098033+08	\N	\N	2	2018-07-06
551	-27	饮食	0	美购	2018-07-06 20:55:21+08	0	0	\N	2019-11-06 13:49:13.099399+08	\N	\N	2	2018-07-06
550	-58	生活日用	0	风扇	2018-07-06 20:54:56.70791+08	0	0	\N	2019-11-06 13:49:13.100789+08	\N	\N	2	2018-07-06
549	-108	生活日用	0	厨房置物架	2018-07-06 20:54:42.85571+08	0	0	\N	2019-11-06 13:49:13.106069+08	\N	\N	2	2018-07-06
548	-30	生活日用	0	毛巾架	2018-07-06 20:54:01.351277+08	0	0	\N	2019-11-06 13:49:13.107486+08	\N	\N	2	2018-07-06
547	-26	生活日用	0	迷你烧烤	2018-07-06 20:53:31.017029+08	0	0	\N	2019-11-06 13:49:13.108865+08	\N	\N	2	2018-07-06
546	-35	生活日用	0	茶几脚	2018-07-06 20:53:07.049125+08	0	0	\N	2019-11-06 13:49:13.11024+08	\N	\N	2	2018-07-06
544	-25	生活日用	0	充电电池套装	2018-07-06 20:52:16.965338+08	0	0	\N	2019-11-06 13:49:13.11298+08	\N	\N	2	2018-07-06
543	-40	生活日用	0	数据线X2	2018-07-05 20:26:57.825444+08	0	0	\N	2019-11-06 13:49:13.116548+08	\N	\N	1	2018-07-05
542	-11	饮食	0	荔枝	2018-07-05 20:11:54.276154+08	0	0	\N	2019-11-06 13:49:13.117884+08	\N	\N	1	2018-07-05
541	-43	饮食	0	零食	2018-07-05 20:11:36.528204+08	0	0	\N	2019-11-06 13:49:13.119184+08	\N	\N	1	2018-07-05
540	-8484	装修	0	沙发+电视柜+客房床	2018-07-05 20:11:11.482136+08	0	0	\N	2019-11-06 13:49:13.120474+08	\N	\N	1	2018-07-05
539	-21	文教娱乐	0	鱼缸气泵	2018-07-05 20:10:23+08	0	0	\N	2019-11-06 13:49:13.121798+08	\N	\N	1	2018-07-05
538	-7380	装修	0	防盗窗	2018-07-05 20:09:39.243447+08	0	0	\N	2019-11-06 13:49:13.123118+08	\N	\N	1	2018-07-05
536	-1000	装修	0	300材料+700人工费	2018-06-23 10:52:02.226167+08	0	0	\N	2019-11-06 13:49:13.125817+08	\N	\N	1	2018-06-23
535	-26	饮食	0	水果	2018-06-20 19:39:27.524845+08	0	0	\N	2019-11-06 13:49:13.1272+08	\N	\N	1	2018-06-20
533	-45	生活日用	0	洗衣机管子	2018-06-18 22:53:39.37853+08	0	0	\N	2019-11-06 13:49:13.134069+08	\N	\N	2	2018-06-18
532	-28	装修	0	四把锁	2018-06-18 22:53:09.520126+08	0	0	\N	2019-11-06 13:49:13.135437+08	\N	\N	1	2018-06-18
531	-4	饮食	0	馕	2018-06-18 22:52:30.249187+08	0	0	\N	2019-11-06 13:49:13.136809+08	\N	\N	2	2018-06-18
529	-101	生活日用	0	炒锅	2018-06-18 22:50:54.794685+08	0	0	\N	2019-11-06 13:49:13.139741+08	\N	\N	1	2018-06-18
528	-703	装修	0	电压力锅，烤箱，电热水壶	2018-06-18 22:50:35.490175+08	0	0	\N	2019-11-06 13:49:13.141228+08	\N	\N	1	2018-06-18
527	-179	装修	0	电饭煲	2018-06-18 22:50:07.839546+08	0	0	\N	2019-11-06 13:49:13.142563+08	\N	\N	1	2018-06-18
526	-230	装修	0	空调和油烟机安装材料费	2018-06-18 12:15:32.639799+08	0	0	\N	2019-11-06 13:49:13.143968+08	\N	\N	1	2018-06-18
525	-3459	健康保险	0	太保3889返430	2018-06-18 10:34:23+08	0	0	\N	2019-11-06 13:49:13.145309+08	\N	\N	1	2018-06-18
524	-3649	装修	0	西门子洗衣机	2018-06-18 08:56:53.763332+08	0	0	\N	2019-11-06 13:49:13.14683+08	\N	\N	1	2018-06-18
523	-6199	装修	0	索尼65寸电视	2018-06-18 08:56:38.121068+08	0	0	\N	2019-11-06 13:49:13.148176+08	\N	\N	1	2018-06-18
521	-5499	装修	0	西门子冰箱	2018-06-18 08:55:53.71055+08	0	0	\N	2019-11-06 13:49:13.150839+08	\N	\N	1	2018-06-18
520	-2199	装修	0	美的空调	2018-06-18 08:55:33.969267+08	0	0	\N	2019-11-06 13:49:13.152165+08	\N	\N	1	2018-06-18
519	-200	交通出行	0	一个月高速费	2018-06-17 14:10:53+08	0	0	\N	2019-11-06 13:49:13.153525+08	\N	\N	2	2018-06-17
518	-20	交通出行	0	停车费	2018-06-17 14:10:29+08	0	0	\N	2019-11-06 13:49:13.154902+08	\N	\N	2	2018-06-17
516	-292	饮食	0	午餐	2018-06-17 14:09:38.870307+08	0	0	\N	2019-11-06 13:49:13.157678+08	\N	\N	2	2018-06-17
515	-137	饮食	0	晚餐	2018-06-17 14:09:22.395555+08	0	0	\N	2019-11-06 13:49:13.161518+08	\N	\N	2	2018-06-17
514	-2249	装修	0	格力空调	2018-06-17 14:08:33.350023+08	0	0	\N	2019-11-06 13:49:13.162942+08	\N	\N	1	2018-06-17
487	-108	小孩生活用品	0	尿不湿	2018-06-10 16:35:55+08	0	0	\N	2020-07-20 13:32:29.200388+08	\N	\N	1	2018-06-10
512	-779	装修	0	马桶	2018-06-15 21:02:44.925568+08	0	0	\N	2019-11-06 13:49:13.165649+08	\N	\N	1	2018-06-15
511	-338	装修	0	晾衣架	2018-06-15 21:02:26.634583+08	0	0	\N	2019-11-06 13:49:13.166951+08	\N	\N	1	2018-06-15
509	-23	小孩服饰	0	泳裤	2018-06-15 21:00:54+08	0	0	\N	2019-11-06 13:49:13.17315+08	\N	\N	2	2018-06-15
508	-25	小孩服饰	0	睡衣	2018-06-15 20:59:41+08	0	0	\N	2019-11-06 13:49:13.178221+08	\N	\N	2	2018-06-15
507	-153	小孩生活用品	0	奶瓶2个	2018-06-15 20:59:11+08	0	0	\N	2019-11-06 13:49:13.181128+08	\N	\N	2	2018-06-15
506	-28	生活日用	0	窗帘配件	2018-06-11 21:16:09.166077+08	0	0	\N	2019-11-06 13:49:13.182564+08	\N	\N	2	2018-06-11
505	-121	小孩零食	0	小孩零食	2018-06-11 21:14:18+08	0	0	\N	2019-11-06 13:49:13.183906+08	\N	\N	2	2018-06-11
504	-1000	生活日用	0	生活费	2018-06-11 21:13:28.370153+08	0	0	\N	2019-11-06 13:49:13.185248+08	\N	\N	2	2018-06-11
503	-3000	装修	0	墙纸	2018-06-11 21:13:10.911937+08	0	0	\N	2019-11-06 13:49:13.186585+08	\N	\N	1	2018-06-11
502	-4000	装修	0	窗帘	2018-06-10 16:46:12.800218+08	0	0	\N	2019-11-06 13:49:13.190533+08	\N	\N	1	2018-06-10
498	-80	装修	0	浴巾架	2018-06-10 16:43:23.160521+08	0	0	\N	2019-11-06 13:49:13.196071+08	\N	\N	1	2018-06-10
497	-588	装修	0	毛巾架	2018-06-10 16:43:02.533797+08	0	0	\N	2019-11-06 13:49:13.197361+08	\N	\N	1	2018-06-10
496	-77	小孩零食	0	零食	2018-06-10 16:40:23+08	0	0	\N	2019-11-06 13:49:13.198702+08	\N	\N	2	2018-06-10
495	-152	生活日用	0	椅子	2018-06-10 16:39:57.396621+08	0	0	\N	2019-11-06 13:49:13.200012+08	\N	\N	2	2018-06-10
493	-300	服饰美容	0	包包	2018-06-10 16:38:59+08	0	0	\N	2019-11-06 13:49:13.202832+08	\N	\N	2	2018-06-10
492	-300	饮食	0	生日蛋糕	2018-06-10 16:38:35.292313+08	0	0	\N	2019-11-06 13:49:13.204102+08	\N	\N	2	2018-06-10
491	-700	饮食	0	儿子生日聚餐	2018-06-10 16:38:14.895493+08	0	0	\N	2019-11-06 13:49:13.205397+08	\N	\N	2	2018-06-10
490	-39	生活日用	0	靠垫	2018-06-10 16:37:01.184432+08	0	0	\N	2019-11-06 13:49:13.206703+08	\N	\N	1	2018-06-10
489	-5	饮食	0	可乐	2018-06-10 16:36:31.122883+08	0	0	\N	2019-11-06 13:49:13.208016+08	\N	\N	1	2018-06-10
488	-26	饮食	0	串烧	2018-06-10 16:36:12.012742+08	0	0	\N	2019-11-06 13:49:13.209807+08	\N	\N	1	2018-06-10
477	-161	小孩生活用品	0	尿不湿	2018-06-05 20:48:32+08	0	0	\N	2020-07-20 13:32:29.211845+08	\N	\N	2	2018-06-05
486	-10	饮食	0	一点点奶茶	2018-06-10 16:35:35.756307+08	0	0	\N	2019-11-06 13:49:13.215151+08	\N	\N	1	2018-06-10
485	-2	生活日用	0	吸管	2018-06-10 16:35:19.791576+08	0	0	\N	2019-11-06 13:49:13.216463+08	\N	\N	1	2018-06-10
483	-5200	装修	0	移门	2018-06-07 20:56:35.577261+08	0	0	\N	2019-11-06 13:49:13.219146+08	\N	\N	1	2018-06-07
482	-12	生活日用	0	水桶	2018-06-05 20:53:23.543928+08	0	0	\N	2019-11-06 13:49:13.220477+08	\N	\N	2	2018-06-05
480	-200	交通出行	0	加油	2018-06-05 20:52:16+08	0	0	\N	2019-11-06 13:49:13.223266+08	\N	\N	2	2018-06-05
479	-230	交通出行	0	加油	2018-06-05 20:51:54+08	0	0	\N	2019-11-06 13:49:13.224735+08	\N	\N	2	2018-06-05
478	-346	其他消费	0	其他	2018-06-05 20:50:08.914915+08	0	0	\N	2019-11-06 13:49:13.226155+08	\N	\N	2	2018-06-05
476	-208	生活日用	0	大米四袋	2018-06-05 20:48:16.109593+08	0	0	\N	2019-11-06 13:49:13.228807+08	\N	\N	2	2018-06-05
475	-59	饮食	0	茶香香	2018-06-05 20:45:29.729047+08	0	0	\N	2019-11-06 13:49:13.230223+08	\N	\N	2	2018-06-05
474	-103	住房缴费	0	电费	2018-06-05 20:44:41+08	0	0	\N	2019-11-06 13:49:13.231503+08	\N	\N	2	2018-06-05
473	-50	饮食	0	重庆小面	2018-06-05 20:44:07.658109+08	0	0	\N	2019-11-06 13:49:13.232824+08	\N	\N	2	2018-06-05
472	-57	饮食	0	超市	2018-06-05 20:43:43+08	0	0	\N	2019-11-06 13:49:13.236176+08	\N	\N	2	2018-06-05
464	-290	小孩健康	0	看医生	2018-06-03 20:57:34+08	0	0	\N	2019-11-06 13:49:13.247261+08	\N	\N	1	2018-06-03
452	-9	文教娱乐	0	电影票	2018-05-22 21:10:06+08	0	0	\N	2019-11-06 13:49:13.267318+08	\N	\N	2	2018-05-22
513	13111	收入	1	工资	2018-06-15 21:03:18.918734+08	0	0	\N	2019-12-09 16:59:22.879971+08	\N	\N	1	2018-06-15
628	-65	饮食	0	美购	2018-08-12 19:52:48.89025+08	0	0	\N	2019-11-06 13:49:12.978086+08	\N	\N	2	2018-08-12
626	-1214	装修	0	小沙发	2018-08-12 19:42:11.869848+08	0	0	\N	2019-11-06 13:49:12.980839+08	\N	\N	1	2018-08-12
624	-30	饮食	0	O2	2018-08-12 19:41:31.799085+08	0	0	\N	2019-11-06 13:49:12.983762+08	\N	\N	1	2018-08-12
623	-97	服饰美容	0	优衣库衣服	2018-08-12 19:41:15.119227+08	0	0	\N	2019-11-06 13:49:12.985207+08	\N	\N	1	2018-08-12
621	-30	饮食	0	蛋糕	2018-08-12 19:40:06.31983+08	0	0	\N	2019-11-06 13:49:12.987887+08	\N	\N	1	2018-08-12
620	-55	饮食	0	零食	2018-08-12 19:39:39.110393+08	0	0	\N	2019-11-06 13:49:12.989235+08	\N	\N	1	2018-08-12
619	-45	小孩健康	0	钙片	2018-08-12 19:39:11+08	0	0	\N	2019-11-06 13:49:12.990697+08	\N	\N	1	2018-08-12
618	-15	饮食	0	蛋糕	2018-08-12 19:38:54.599387+08	0	0	\N	2019-11-06 13:49:12.991965+08	\N	\N	1	2018-08-12
617	-18	小孩文具	0	早教书	2018-08-12 19:38:08+08	0	0	\N	2019-11-06 13:49:12.993275+08	\N	\N	1	2018-08-12
616	-436	饮食	0	四份自助餐	2018-07-30 23:16:25.0607+08	0	0	\N	2019-11-06 13:49:12.994623+08	\N	\N	2	2018-07-30
615	-198	生活日用	0	洗牙	2018-07-30 23:16:05.025255+08	0	0	\N	2019-11-06 13:49:12.998809+08	\N	\N	2	2018-07-30
614	-16	饮食	0	早餐	2018-07-30 23:15:52.240438+08	0	0	\N	2019-11-06 13:49:13.000441+08	\N	\N	2	2018-07-30
613	-36	生活日用	0	滴滴	2018-07-30 23:15:37.12656+08	0	0	\N	2019-11-06 13:49:13.001802+08	\N	\N	2	2018-07-30
612	-100	饮食	0	老婆大人	2018-07-30 23:15:08.479093+08	0	0	\N	2019-11-06 13:49:13.003158+08	\N	\N	2	2018-07-30
611	-20	饮食	0	美购	2018-07-30 23:14:52+08	0	0	\N	2019-11-06 13:49:13.004454+08	\N	\N	2	2018-07-30
610	-110	饮食	0	棒冰	2018-07-30 23:14:26.04232+08	0	0	\N	2019-11-06 13:49:13.012034+08	\N	\N	2	2018-07-30
609	-23	饮食	0	美购	2018-07-30 23:13:45+08	0	0	\N	2019-11-06 13:49:13.013604+08	\N	\N	2	2018-07-30
608	-52	小孩生活用品	0	防幢条	2018-07-30 23:13:29+08	0	0	\N	2019-11-06 13:49:13.014998+08	\N	\N	2	2018-07-30
607	-135	生活日用	0	卫浴置物栏	2018-07-30 23:12:14+08	0	0	\N	2019-11-06 13:49:13.016432+08	\N	\N	1	2018-07-30
606	-818	生活日用	0	椰棕榈床垫1.5＊2	2018-07-30 23:11:44+08	0	0	\N	2019-11-06 13:49:13.019484+08	\N	\N	1	2018-07-30
605	-49	装修	0	牙刷杯	2018-07-30 23:11:11.818146+08	0	0	\N	2019-11-06 13:49:13.02094+08	\N	\N	1	2018-07-30
604	-129	装修	0	榻榻米靠垫	2018-07-30 23:10:55.171839+08	0	0	\N	2019-11-06 13:49:13.022308+08	\N	\N	1	2018-07-30
603	-2850	装修	0	餐桌带四把椅子	2018-07-30 23:10:20.659926+08	0	0	\N	2019-11-06 13:49:13.023643+08	\N	\N	1	2018-07-30
602	-100	生活日用	0	理发冲卡	2018-07-22 18:33:17.103775+08	0	0	\N	2019-11-06 13:49:13.025014+08	\N	\N	1	2018-07-22
601	-10	饮食	0	西瓜	2018-07-22 18:32:51.941376+08	0	0	\N	2019-11-06 13:49:13.026422+08	\N	\N	1	2018-07-22
600	-1000	装修	0	棕榈床垫	2018-07-22 18:32:05.470991+08	0	0	\N	2019-11-06 13:49:13.027768+08	\N	\N	1	2018-07-22
598	-440	小孩奶粉	0	奶粉	2018-07-20 22:07:26+08	0	0	\N	2019-11-06 13:49:13.030567+08	\N	\N	2	2018-07-20
562	-193	小孩生活用品	0	尿不湿	2018-07-06 21:01:13+08	0	0	\N	2020-07-20 13:32:29.193345+08	\N	\N	2	2018-07-06
596	-157	小孩生活用品	0	游泳池	2018-07-20 22:06:54+08	0	0	\N	2019-11-06 13:49:13.033375+08	\N	\N	2	2018-07-20
595	-119	小孩生活用品	0	门栏	2018-07-20 22:05:46+08	0	0	\N	2019-11-06 13:49:13.034772+08	\N	\N	2	2018-07-20
594	-177	小孩零食	0	零食	2018-07-20 22:05:34+08	0	0	\N	2019-11-06 13:49:13.036287+08	\N	\N	2	2018-07-20
593	-204	饮食	0	芒果3箱	2018-07-20 22:04:01.886168+08	0	0	\N	2019-11-06 13:49:13.037705+08	\N	\N	2	2018-07-20
592	-11	生活日用	0	美购	2018-07-20 22:03:19.716363+08	0	0	\N	2019-11-06 13:49:13.039078+08	\N	\N	2	2018-07-20
591	-40	小孩服饰	0	袜子	2018-07-20 22:03:01+08	0	0	\N	2019-11-06 13:49:13.04051+08	\N	\N	2	2018-07-20
590	-179	服饰美容	0	睡衣	2018-07-20 22:02:38.329936+08	0	0	\N	2019-11-06 13:49:13.041895+08	\N	\N	2	2018-07-20
589	-61	饮食	0	五天午饭	2018-07-20 22:02:25.820082+08	0	0	\N	2019-11-06 13:49:13.043171+08	\N	\N	2	2018-07-20
588	-61	饮食	0	五天午饭	2018-07-20 22:01:35.995216+08	0	0	\N	2019-11-06 13:49:13.044491+08	\N	\N	2	2018-07-20
587	-170	饮食	0	夜宵	2018-07-20 22:00:50.941324+08	0	0	\N	2019-11-06 13:49:13.045878+08	\N	\N	2	2018-07-20
586	-3	饮食	0	大饼	2018-07-20 22:00:16.679831+08	0	0	\N	2019-11-06 13:49:13.047161+08	\N	\N	2	2018-07-20
585	-316	小孩服饰	0	鞋子	2018-07-20 21:59:30+08	0	0	\N	2019-11-06 13:49:13.048471+08	\N	\N	2	2018-07-20
584	-632	装修	0	鞋柜	2018-07-20 21:58:37.062662+08	0	0	\N	2019-11-06 13:49:13.049826+08	\N	\N	1	2018-07-20
583	-1197	装修	0	茶几	2018-07-20 21:57:47.700261+08	0	0	\N	2019-11-06 13:49:13.051203+08	\N	\N	1	2018-07-20
582	-198	人情往来	0	乐高玩具礼物	2018-07-20 21:30:11+08	0	0	\N	2019-11-06 13:49:13.052728+08	\N	\N	1	2018-07-20
581	-118	小孩玩具	0	洗澡玩具	2018-07-20 21:29:35+08	0	0	\N	2019-11-06 13:49:13.054113+08	\N	\N	1	2018-07-20
580	-10	生活日用	0	停车费	2018-07-20 21:29:13.951582+08	0	0	\N	2019-11-06 13:49:13.055528+08	\N	\N	1	2018-07-20
579	-24	饮食	0	零食	2018-07-20 21:28:52.503376+08	0	0	\N	2019-11-06 13:49:13.056894+08	\N	\N	1	2018-07-20
577	-125	饮食	0	夜宵	2018-07-15 14:19:50.509415+08	0	0	\N	2019-11-06 13:49:13.05971+08	\N	\N	1	2018-07-15
576	-16	饮食	0	零食	2018-07-15 14:19:32.776258+08	0	0	\N	2019-11-06 13:49:13.061108+08	\N	\N	1	2018-07-15
575	-58	文教娱乐	0	电影票X2	2018-07-15 14:19:07+08	0	0	\N	2019-11-06 13:49:13.062533+08	\N	\N	1	2018-07-15
574	-73	小孩零食	0	酱油+肉松	2018-07-15 14:18:37+08	0	0	\N	2019-11-06 13:49:13.063849+08	\N	\N	1	2018-07-15
571	-6000	装修	0	装修尾款	2018-07-15 14:16:29.339395+08	0	0	\N	2019-11-06 13:49:13.067937+08	\N	\N	1	2018-07-15
569	-81	生活日用	0	美购	2018-07-13 07:45:27.716189+08	0	0	\N	2019-11-06 13:49:13.070681+08	\N	\N	2	2018-07-13
566	-1299	生活日用	0	诺基亚手机	2018-07-06 21:24:28.546523+08	0	0	\N	2019-11-06 13:49:13.075676+08	\N	\N	1	2018-07-06
597	-174	小孩生活用品	0	尿不湿	2018-07-20 22:07:07+08	0	0	\N	2020-07-20 13:32:29.186869+08	\N	\N	2	2018-07-20
564	-101	生活日用	0	苏泊尔锅	2018-07-06 21:04:15.433001+08	0	0	\N	2019-11-06 13:49:13.079235+08	\N	\N	2	2018-07-06
563	-441	小孩奶粉	0	奶粉喜宝	2018-07-06 21:02:11+08	0	0	\N	2019-11-06 13:49:13.080607+08	\N	\N	2	2018-07-06
561	-51	小孩生活用品	0	儿童酱油	2018-07-06 21:00:53+08	0	0	\N	2019-11-06 13:49:13.083353+08	\N	\N	2	2018-07-06
560	-200	交通出行	0	加油	2018-07-06 21:00:19+08	0	0	\N	2019-11-06 13:49:13.084716+08	\N	\N	2	2018-07-06
559	-80	交通出行	0	汽车保养	2018-07-06 21:00:05+08	0	0	\N	2019-11-06 13:49:13.086059+08	\N	\N	2	2018-07-06
558	-10	饮食	0	零食	2018-07-06 20:59:43+08	0	0	\N	2019-11-06 13:49:13.087453+08	\N	\N	2	2018-07-06
557	-119	住房缴费	0	电费	2018-07-06 20:59:05+08	0	0	\N	2019-11-06 13:49:13.088839+08	\N	\N	2	2018-07-06
556	-22	饮食	0	午餐	2018-07-06 20:58:50.06225+08	0	0	\N	2019-11-06 13:49:13.090379+08	\N	\N	2	2018-07-06
555	-57	小孩服饰	0	衣服	2018-07-06 20:58:13+08	0	0	\N	2019-11-06 13:49:13.091791+08	\N	\N	2	2018-07-06
554	-134	饮食	0	午餐	2018-07-06 20:57:31.351514+08	0	0	\N	2019-11-06 13:49:13.09311+08	\N	\N	2	2018-07-06
553	-19	服饰美容	0	袜子	2018-07-06 20:55:58.469988+08	0	0	\N	2019-11-06 13:49:13.094491+08	\N	\N	2	2018-07-06
534	-126	文教娱乐	0	鱼+水草	2018-06-20 19:39:17+08	0	0	\N	2019-11-06 13:49:13.128602+08	\N	\N	1	2018-06-20
530	-108	小孩零食	0	小孩零食	2018-06-18 22:51:38+08	0	0	\N	2019-11-06 13:49:13.138377+08	\N	\N	2	2018-06-18
522	-1899	装修	0	松下43寸电视机	2018-06-18 08:56:13+08	0	0	\N	2019-11-06 13:49:13.149506+08	\N	\N	1	2018-06-18
517	-100	通讯物流	0	邮费	2018-06-17 14:10:02+08	0	0	\N	2019-11-06 13:49:13.156278+08	\N	\N	2	2018-06-17
510	-20	小孩生活用品	0	浴巾	2018-06-15 21:01:05+08	0	0	\N	2019-11-06 13:49:13.168667+08	\N	\N	2	2018-06-15
212	-679	装修	0	9付50导轨2个挂衣杆	2018-01-26 21:55:42.57114+08	0	0	\N	2019-11-06 13:49:13.678165+08	\N	\N	1	2018-01-26
565	5362	收入	1	工资	2018-07-06 21:04:45.161443+08	0	0	\N	2019-12-09 16:59:22.875259+08	\N	\N	2	2018-07-06
717	-369	小孩生活用品	0	婴儿床	2018-09-29 22:43:16+08	0	0	\N	2019-11-06 13:49:12.843407+08	\N	\N	2	2018-09-29
713	-16	服饰美容	0	拖鞋	2018-09-29 22:41:36+08	0	0	\N	2019-11-06 13:49:12.849313+08	\N	\N	2	2018-09-29
707	-3	饮食	0	麦饺	2018-09-29 22:39:24.732275+08	0	0	\N	2019-11-06 13:49:12.858568+08	\N	\N	2	2018-09-29
705	-58	饮食	0	过桥米线	2018-09-29 22:38:52.194292+08	0	0	\N	2019-11-06 13:49:12.861691+08	\N	\N	2	2018-09-29
703	-35	饮食	0	肯德基	2018-09-29 22:37:24+08	0	0	\N	2019-11-06 13:49:12.864919+08	\N	\N	2	2018-09-29
702	-94	服饰美容	0	支付宝	2018-09-29 22:37:02+08	0	0	\N	2019-11-06 13:49:12.866976+08	\N	\N	2	2018-09-29
701	-22	饮食	0	美团外卖	2018-09-29 22:35:18.673503+08	0	0	\N	2019-11-06 13:49:12.868387+08	\N	\N	2	2018-09-29
700	-18	饮食	0	水果	2018-09-29 22:35:04.557162+08	0	0	\N	2019-11-06 13:49:12.869807+08	\N	\N	2	2018-09-29
699	-18	饮食	0	绿资	2018-09-29 22:34:53.787178+08	0	0	\N	2019-11-06 13:49:12.872376+08	\N	\N	2	2018-09-29
698	-5	饮食	0	麦饺	2018-09-29 22:34:37.829348+08	0	0	\N	2019-11-06 13:49:12.873923+08	\N	\N	2	2018-09-29
697	-34	饮食	0	美团	2018-09-29 22:34:20.140353+08	0	0	\N	2019-11-06 13:49:12.87527+08	\N	\N	2	2018-09-29
696	-25	饮食	0	夜宵	2018-09-29 22:31:03.53761+08	0	0	\N	2019-11-06 13:49:12.876621+08	\N	\N	2	2018-09-29
662	-29	小孩生活用品	0	尿不湿	2018-09-10 21:24:03+08	0	0	\N	2020-07-20 13:32:29.169092+08	\N	\N	2	2018-09-10
694	-2728	生活日用	0	S8	2018-09-12 08:12:24.490773+08	0	0	\N	2019-11-06 13:49:12.879692+08	\N	\N	1	2018-09-12
693	-3043	装修	0	酒柜+小东西	2018-09-12 08:12:02.561299+08	0	0	\N	2019-11-06 13:49:12.881078+08	\N	\N	1	2018-09-12
692	-12	装修	0	小挂架	2018-09-12 08:11:19.975291+08	0	0	\N	2019-11-06 13:49:12.882453+08	\N	\N	1	2018-09-12
691	-279	装修	0	电视柜架子	2018-09-12 08:10:46.252111+08	0	0	\N	2019-11-06 13:49:12.883798+08	\N	\N	1	2018-09-12
690	-6	饮食	0	饮料	2018-09-12 08:10:25.712609+08	0	0	\N	2019-11-06 13:49:12.885139+08	\N	\N	1	2018-09-12
689	-15	饮食	0	绿姿	2018-09-12 08:10:02.282651+08	0	0	\N	2019-11-06 13:49:12.886438+08	\N	\N	1	2018-09-12
687	-88	人情往来	0	助行器	2018-09-12 08:08:58+08	0	0	\N	2019-11-06 13:49:12.8892+08	\N	\N	1	2018-09-12
686	-100	通讯物流	0	手机充值	2018-09-12 08:08:19+08	0	0	\N	2019-11-06 13:49:12.890516+08	\N	\N	1	2018-09-12
685	-95	交通出行	0	车保养	2018-09-12 08:07:41+08	0	0	\N	2019-11-06 13:49:12.891814+08	\N	\N	1	2018-09-12
684	-65	饮食	0	乐购	2018-09-12 08:07:18.995503+08	0	0	\N	2019-11-06 13:49:12.893129+08	\N	\N	1	2018-09-12
683	-26	饮食	0	石锅饭	2018-09-12 08:06:57.036432+08	0	0	\N	2019-11-06 13:49:12.894464+08	\N	\N	1	2018-09-12
682	-5	交通出行	0	停车费	2018-09-12 08:06:20+08	0	0	\N	2019-11-06 13:49:12.895836+08	\N	\N	1	2018-09-12
681	-373	装修	0	沙发靠脚	2018-09-12 08:05:48.940575+08	0	0	\N	2019-11-06 13:49:12.897191+08	\N	\N	1	2018-09-12
680	-40	饮食	0	阿香米线	2018-09-12 08:05:09.411137+08	0	0	\N	2019-11-06 13:49:12.898522+08	\N	\N	1	2018-09-12
679	-119	饮食	0	美购超市	2018-09-12 08:04:41.07638+08	0	0	\N	2019-11-06 13:49:12.899925+08	\N	\N	1	2018-09-12
678	-100	通讯物流	0	话费	2018-09-12 08:04:12+08	0	0	\N	2019-11-06 13:49:12.901315+08	\N	\N	1	2018-09-12
676	-27	生活日用	0	百合花	2018-09-12 08:02:07+08	0	0	\N	2019-11-06 13:49:12.904227+08	\N	\N	1	2018-09-12
675	-10	饮食	0	小吃	2018-09-12 08:01:47.516703+08	0	0	\N	2019-11-06 13:49:12.905591+08	\N	\N	1	2018-09-12
674	-49	装修	0	植物6盆	2018-09-10 21:32:51.639312+08	0	0	\N	2019-11-06 13:49:12.906947+08	\N	\N	1	2018-09-10
673	-724	装修	0	塌塌米垫	2018-09-10 21:31:48.156967+08	0	0	\N	2019-11-06 13:49:12.908358+08	\N	\N	1	2018-09-10
672	-1000	交通出行	0	油卡	2018-09-10 21:29:50+08	0	0	\N	2019-11-06 13:49:12.91002+08	\N	\N	2	2018-09-10
671	-100	饮食	0	美蛙	2018-09-10 21:29:37.37144+08	0	0	\N	2019-11-06 13:49:12.911407+08	\N	\N	2	2018-09-10
670	-364	生活日用	0	硬盘	2018-09-10 21:26:48.149934+08	0	0	\N	2019-11-06 13:49:12.91271+08	\N	\N	2	2018-09-10
669	-92	生活日用	0	生活用品	2018-09-10 21:26:31.200121+08	0	0	\N	2019-11-06 13:49:12.914013+08	\N	\N	2	2018-09-10
667	-176	小孩健康	0	钙	2018-09-10 21:25:35+08	0	0	\N	2019-11-06 13:49:12.916664+08	\N	\N	2	2018-09-10
665	-41	饮食	0	零食	2018-09-10 21:24:52+08	0	0	\N	2019-11-06 13:49:12.919362+08	\N	\N	2	2018-09-10
664	-83	小孩零食	0	零食	2018-09-10 21:24:33+08	0	0	\N	2019-11-06 13:49:12.920752+08	\N	\N	2	2018-09-10
663	-440	小孩奶粉	0	奶粉	2018-09-10 21:24:21+08	0	0	\N	2019-11-06 13:49:12.922071+08	\N	\N	2	2018-09-10
660	-256	小孩生活用品	0	尿不湿	2018-09-10 21:23:36+08	0	0	\N	2020-07-20 13:32:29.175144+08	\N	\N	2	2018-09-10
661	-109	生活日用	0	大米	2018-09-10 21:23:49.767052+08	0	0	\N	2019-11-06 13:49:12.925601+08	\N	\N	2	2018-09-10
657	-42	小孩生活用品	0	尿不湿	2018-09-10 21:22:01+08	0	0	\N	2020-07-20 13:32:29.180239+08	\N	\N	2	2018-09-10
659	-61	生活日用	0	垃圾袋	2018-09-10 21:22:30.870155+08	0	0	\N	2019-11-06 13:49:12.928207+08	\N	\N	2	2018-09-10
658	-126	小孩零食	0	零食	2018-09-10 21:22:18+08	0	0	\N	2019-11-06 13:49:12.929562+08	\N	\N	2	2018-09-10
656	-104	服饰美容	0	午餐	2018-09-10 21:20:19.099265+08	0	0	\N	2019-11-06 13:49:12.93219+08	\N	\N	2	2018-09-10
655	-173	生活日用	0	老家凳子	2018-09-10 21:19:53.549757+08	0	0	\N	2019-11-06 13:49:12.933523+08	\N	\N	2	2018-09-10
654	-6	饮食	0	饼	2018-09-10 21:19:20+08	0	0	\N	2019-11-06 13:49:12.934856+08	\N	\N	2	2018-09-10
653	-142	住房缴费	0	水费	2018-09-10 21:18:57+08	0	0	\N	2019-11-06 13:49:12.936247+08	\N	\N	2	2018-09-10
652	-230	饮食	0	超市	2018-09-10 21:18:43+08	0	0	\N	2019-11-06 13:49:12.937581+08	\N	\N	2	2018-09-10
651	-40	饮食	0	水果	2018-09-10 21:18:15+08	0	0	\N	2019-11-06 13:49:12.938952+08	\N	\N	2	2018-09-10
650	-214	生活日用	0	面膜	2018-09-10 21:17:46.762276+08	0	0	\N	2019-11-06 13:49:12.940372+08	\N	\N	2	2018-09-10
649	-17	住房缴费	0	水费	2018-09-10 21:17:18+08	0	0	\N	2019-11-06 13:49:12.941742+08	\N	\N	2	2018-09-10
646	-128	饮食	0	蛋糕	2018-09-10 21:16:23.32728+08	0	0	\N	2019-11-06 13:49:12.947082+08	\N	\N	2	2018-09-10
644	-38	生活日用	0	凳子	2018-09-10 21:15:39.900756+08	0	0	\N	2019-11-06 13:49:12.949866+08	\N	\N	2	2018-09-10
642	-15	饮食	0	购物和停车费	2018-09-10 21:11:28+08	0	0	\N	2019-11-06 13:49:12.956173+08	\N	\N	2	2018-09-10
641	-26	文教娱乐	0	优酷	2018-09-10 21:11:02+08	0	0	\N	2019-11-06 13:49:12.958212+08	\N	\N	2	2018-09-10
640	-55	服饰美容	0	衣服	2018-09-10 21:10:39.011139+08	0	0	\N	2019-11-06 13:49:12.960123+08	\N	\N	2	2018-09-10
639	-288	服饰美容	0	衣服	2018-09-10 21:09:51.606558+08	0	0	\N	2019-11-06 13:49:12.961555+08	\N	\N	2	2018-09-10
638	-18	饮食	0	重庆小面	2018-09-10 21:07:17+08	0	0	\N	2019-11-06 13:49:12.963074+08	\N	\N	2	2018-09-10
637	-19	生活日用	0	玻璃水	2018-09-10 21:05:53.823099+08	0	0	\N	2019-11-06 13:49:12.964474+08	\N	\N	2	2018-09-10
636	-750	生活日用	0	爽肤水BB霜	2018-08-12 19:57:10.709879+08	0	0	\N	2019-11-06 13:49:12.965943+08	\N	\N	2	2018-08-12
635	-120	服饰美容	0	鞋子	2018-08-12 19:56:07.303468+08	0	0	\N	2019-11-06 13:49:12.967293+08	\N	\N	2	2018-08-12
634	-229	生活日用	0	卸妆水	2018-08-12 19:55:24.305151+08	0	0	\N	2019-11-06 13:49:12.968631+08	\N	\N	2	2018-08-12
633	-43	生活日用	0	抹布	2018-08-12 19:54:46.130235+08	0	0	\N	2019-11-06 13:49:12.970044+08	\N	\N	2	2018-08-12
632	-100	饮食	0	棒冰	2018-08-12 19:54:24.399845+08	0	0	\N	2019-11-06 13:49:12.971442+08	\N	\N	2	2018-08-12
631	-172	生活日用	0	洗面奶	2018-08-12 19:54:07.849906+08	0	0	\N	2019-11-06 13:49:12.972794+08	\N	\N	2	2018-08-12
630	-77	服饰美容	0	衣服卫衣	2018-08-12 19:53:32.125073+08	0	0	\N	2019-11-06 13:49:12.974228+08	\N	\N	2	2018-08-12
629	-251	住房缴费	0	电费	2018-08-12 19:53:09+08	0	0	\N	2019-11-06 13:49:12.976297+08	\N	\N	2	2018-08-12
627	-100	通讯物流	0	话费	2018-08-12 19:42:29+08	0	0	\N	2019-11-06 13:49:12.979433+08	\N	\N	1	2018-08-12
215	-21000	装修	0	装修30%	2018-01-28 14:59:38.120757+08	0	0	\N	2019-11-06 13:49:13.673911+08	\N	\N	1	2018-01-28
695	12662	收入	1	工资	2018-09-12 08:15:28.706776+08	0	0	\N	2019-12-09 16:59:22.862694+08	\N	\N	1	2018-09-12
1028	-15	文教娱乐	0	爱奇艺会员	2018-12-22 10:47:46.619548+08	0	0	\N	2019-11-06 13:49:12.474952+08	\N	\N	2	2018-12-22
1025	-69	服饰美容	0	隔离	2018-12-22 10:46:51.570178+08	0	0	\N	2019-11-06 13:49:12.478947+08	\N	\N	2	2018-12-22
1022	-38	服饰美容	0	包	2018-12-22 10:45:50.429539+08	0	0	\N	2019-11-06 13:49:12.483041+08	\N	\N	2	2018-12-22
1019	-38	服饰美容	0	袜子	2018-12-22 10:45:01.164501+08	0	0	\N	2019-11-06 13:49:12.487177+08	\N	\N	2	2018-12-22
1016	-20	小孩文具	0	专注力训练	2018-12-22 10:43:47.288497+08	0	0	\N	2019-11-06 13:49:12.491517+08	\N	\N	2	2018-12-22
1007	-28	饮食	0	吐司	2018-12-17 09:26:54.771478+08	0	0	\N	2019-11-06 13:49:12.494148+08	\N	\N	1	2018-12-17
1004	-11	饮食	0	早餐	2018-12-17 09:25:19.315476+08	0	0	\N	2019-11-06 13:49:12.49833+08	\N	\N	1	2018-12-17
1001	-9	饮食	0	绿姿	2018-12-17 09:24:28.860758+08	0	0	\N	2019-11-06 13:49:12.502456+08	\N	\N	1	2018-12-17
998	-114	服饰美容	0	护发精油	2018-12-07 23:21:09.278115+08	0	0	\N	2019-11-06 13:49:12.506413+08	\N	\N	2	2018-12-07
994	-108	人情往来	0	给弯弯礼物	2018-12-07 23:20:16.532687+08	0	0	\N	2019-11-06 13:49:12.512443+08	\N	\N	2	2018-12-07
990	-27	小孩服饰	0	纱布毛巾	2018-12-07 23:18:35.593624+08	0	0	\N	2019-11-06 13:49:12.518034+08	\N	\N	2	2018-12-07
986	-60	服饰美容	0	裤子	2018-12-07 23:17:21.588957+08	0	0	\N	2019-11-06 13:49:12.523751+08	\N	\N	2	2018-12-07
978	-4043	住房缴费	0	房产税1.5	2018-12-07 22:00:26.157284+08	0	0	\N	2019-11-06 13:49:12.533376+08	\N	\N	1	2018-12-07
974	-50	人情往来	0	泡脚药	2018-12-07 21:56:19.668206+08	0	0	\N	2019-11-06 13:49:12.537559+08	\N	\N	1	2018-12-07
970	-232	服饰美容	0	优衣库	2018-12-07 21:52:41.770159+08	0	0	\N	2019-11-06 13:49:12.54296+08	\N	\N	1	2018-12-07
966	-100	通讯物流	0	话费	2018-12-07 21:51:11.656303+08	0	0	\N	2019-11-06 13:49:12.548296+08	\N	\N	1	2018-12-07
959	-56	交通出行	0	装轮胎	2018-11-28 22:13:41.332632+08	0	0	\N	2019-11-06 13:49:12.559034+08	\N	\N	2	2018-11-28
955	-33	生活日用	0	网线分线器	2018-11-28 22:12:30.037158+08	0	0	\N	2019-11-06 13:49:12.566081+08	\N	\N	2	2018-11-28
951	-148	生活日用	0	2个保温瓶	2018-11-28 22:10:45.971543+08	0	0	\N	2019-11-06 13:49:12.571992+08	\N	\N	2	2018-11-28
947	-43	生活日用	0	美购超市	2018-11-28 22:06:36.29686+08	0	0	\N	2019-11-06 13:49:12.578056+08	\N	\N	2	2018-11-28
943	-200	服饰美容	0	理发	2018-11-28 22:04:41.353525+08	0	0	\N	2019-11-06 13:49:12.584143+08	\N	\N	2	2018-11-28
939	-51	饮食	0	绿资	2018-11-28 22:03:24.399149+08	0	0	\N	2019-11-06 13:49:12.590026+08	\N	\N	2	2018-11-28
935	-35	生活日用	0	脸盆2个	2018-11-28 22:02:03.021126+08	0	0	\N	2019-11-06 13:49:12.595876+08	\N	\N	2	2018-11-28
931	-216	饮食	0	烘培用品	2018-11-28 22:00:42.879105+08	0	0	\N	2019-11-06 13:49:12.601461+08	\N	\N	2	2018-11-28
840	-442	小孩奶粉	0	奶粉四合	2018-11-11 15:38:44+08	0	0	\N	2019-11-06 13:49:12.668161+08	\N	\N	1	2018-11-11
815	-15	文教娱乐	0	优酷	2018-10-28 19:22:53+08	0	0	\N	2019-11-06 13:49:12.704214+08	\N	\N	2	2018-10-28
814	-32	小孩健康	0	A D剂	2018-10-28 19:22:37+08	0	0	\N	2019-11-06 13:49:12.705567+08	\N	\N	2	2018-10-28
784	-138	生活日用	0	实木凳子6把	2018-10-28 19:05:01.59176+08	0	0	\N	2019-11-06 13:49:12.747086+08	\N	\N	2	2018-10-28
775	-19	生活日用	0	土豆切丝	2018-10-28 19:01:20.522945+08	0	0	\N	2019-11-06 13:49:12.761361+08	\N	\N	2	2018-10-28
725	-200	生活日用	0	零花钱	2018-09-29 22:48:11.364281+08	0	0	\N	2019-11-06 13:49:12.832198+08	\N	\N	2	2018-09-29
724	-250	交通出行	0	过路费	2018-09-29 22:48:00+08	0	0	\N	2019-11-06 13:49:12.833578+08	\N	\N	2	2018-09-29
720	-284	生活日用	0	油米	2018-09-29 22:45:45.193774+08	0	0	\N	2019-11-06 13:49:12.839254+08	\N	\N	2	2018-09-29
719	-40	小孩服饰	0	袜子	2018-09-29 22:43:52+08	0	0	\N	2019-11-06 13:49:12.840599+08	\N	\N	2	2018-09-29
716	-15	文教娱乐	0	腾讯VIP	2018-09-29 22:43:03+08	0	0	\N	2019-11-06 13:49:12.844732+08	\N	\N	2	2018-09-29
714	-32	生活日用	0	抽屉垫	2018-09-29 22:42:24.432134+08	0	0	\N	2019-11-06 13:49:12.84794+08	\N	\N	2	2018-09-29
712	-2888	人情往来	0	表弟结婚红包	2018-09-29 22:41:21+08	0	0	\N	2019-11-06 13:49:12.850619+08	\N	\N	2	2018-09-29
711	-8	饮食	0	水果	2018-09-29 22:40:55.743375+08	0	0	\N	2019-11-06 13:49:12.85195+08	\N	\N	2	2018-09-29
710	-23	生活日用	0	水管	2018-09-29 22:40:21.71091+08	0	0	\N	2019-11-06 13:49:12.853754+08	\N	\N	2	2018-09-29
709	-13	饮食	0	水果	2018-09-29 22:39:54.87663+08	0	0	\N	2019-11-06 13:49:12.855232+08	\N	\N	2	2018-09-29
708	-439	小孩玩具	0	三轮车	2018-09-29 22:39:42+08	0	0	\N	2019-11-06 13:49:12.856761+08	\N	\N	2	2018-09-29
704	-29	饮食	0	三江购物	2018-09-29 22:37:48+08	0	0	\N	2019-11-06 13:49:12.863278+08	\N	\N	2	2018-09-29
688	-70	文教娱乐	0	宠物鱼虾	2018-09-12 08:09:28+08	0	0	\N	2019-11-06 13:49:12.887834+08	\N	\N	1	2018-09-12
668	-106	生活日用	0	餐巾纸	2018-09-10 21:26:16.470029+08	0	0	\N	2019-11-06 13:49:12.915326+08	\N	\N	2	2018-09-10
666	-95	小孩生活用品	0	洗衣液	2018-09-10 21:25:15+08	0	0	\N	2019-11-06 13:49:12.918018+08	\N	\N	2	2018-09-10
648	-318	住房缴费	0	电费	2018-09-10 21:17:02+08	0	0	\N	2019-11-06 13:49:12.943089+08	\N	\N	2	2018-09-10
647	-7	饮食	0	超市	2018-09-10 21:16:42+08	0	0	\N	2019-11-06 13:49:12.944636+08	\N	\N	2	2018-09-10
622	-28	健康保险	0	验血型	2018-08-12 19:40:52+08	0	0	\N	2019-11-06 13:49:12.986532+08	\N	\N	1	2018-08-12
54	11825	收入	1	工资	2017-11-18 08:42:00.108541+08	0	0	\N	2019-12-09 16:59:22.924266+08	\N	\N	1	2017-11-18
573	-130	服饰美容	0	hm衣服	2018-07-15 14:18:07.8894+08	0	0	\N	2019-11-06 13:49:13.06514+08	\N	\N	1	2018-07-15
545	-35	生活日用	0	老家浴室置物架	2018-07-06 20:52:50.792397+08	0	0	\N	2019-11-06 13:49:13.111652+08	\N	\N	2	2018-07-06
501	-1000	装修	0	背景墙	2018-06-10 16:46:01.279849+08	0	0	\N	2019-11-06 13:49:13.191859+08	\N	\N	1	2018-06-10
500	-40	装修	0	空调开关X2	2018-06-10 16:44:13.223936+08	0	0	\N	2019-11-06 13:49:13.193187+08	\N	\N	1	2018-06-10
445	-22	生活日用	0	插座	2018-05-22 21:07:24.424818+08	0	0	\N	2019-11-06 13:49:13.277258+08	\N	\N	2	2018-05-22
428	-578	装修	0	台盆	2018-05-07 21:51:16.266137+08	0	0	\N	2019-11-06 13:49:13.303751+08	\N	\N	1	2018-05-07
421	-10	住房缴费	0	水费	2018-05-06 20:24:11+08	0	0	\N	2019-11-06 13:49:13.329102+08	\N	\N	2	2018-05-06
374	-17200	装修	0	橱柜，卫生间，阳台，榻榻米门	2018-04-14 17:22:06.8383+08	0	0	\N	2019-11-06 13:49:13.401938+08	\N	\N	1	2018-04-14
360	-82	小孩生活用品	0	退热贴+两双袜子+小馒头	2018-04-10 21:49:26+08	0	0	\N	2019-11-06 13:49:13.427225+08	\N	\N	2	2018-04-10
357	-5	饮食	0	大饼油条	2018-04-04 21:46:26.954467+08	0	0	\N	2019-11-06 13:49:13.43892+08	\N	\N	1	2018-04-04
356	-478	小孩生活用品	0	儿童围栏	2018-04-04 21:41:20+08	0	0	\N	2019-11-06 13:49:13.441264+08	\N	\N	2	2018-04-04
342	-80	小孩零食	0	米粉＋零食	2018-03-25 21:25:42+08	0	0	\N	2019-11-06 13:49:13.461988+08	\N	\N	2	2018-03-25
297	-185	生活日用	0	华润万家	2018-03-04 17:12:55.169482+08	0	0	\N	2019-11-06 13:49:13.522598+08	\N	\N	2	2018-03-04
286	-30	生活日用	0	iPad外套	2018-03-01 18:32:03.418446+08	0	0	\N	2019-11-06 13:49:13.537016+08	\N	\N	1	2018-03-01
285	-252	文教娱乐	0	树莓派3b E14中国版	2018-02-27 21:44:03+08	0	0	\N	2019-11-06 13:49:13.538326+08	\N	\N	1	2018-02-27
284	-139	文教娱乐	0	64G micro SD卡	2018-02-27 21:41:19+08	0	0	\N	2019-11-06 13:49:13.539627+08	\N	\N	1	2018-02-27
247	-463	服饰美容	0	一件棉服＋毛线裙	2018-02-11 07:37:51.749042+08	0	0	\N	2019-11-06 13:49:13.628402+08	\N	\N	2	2018-02-11
214	-55	饮食	0	麦当劳	2018-01-28 11:11:57.318761+08	0	0	\N	2019-11-06 13:49:13.675396+08	\N	\N	1	2018-01-28
73	-29	小孩服饰	0	婴儿鞋	2017-11-26 21:19:16+08	0	0	\N	2019-11-06 13:49:14.003452+08	\N	\N	2	2017-11-26
578	16800	收入	1	工资+换公司补贴	2018-07-20 21:27:56.917456+08	0	0	\N	2019-12-09 16:59:22.870745+08	\N	\N	1	2018-07-20
75	-213	生活日用	0	大米12袋	2017-11-26 21:23:44.03519+08	0	0	\N	2019-11-06 13:49:13.998738+08	\N	\N	2	2017-11-26
1	-179	文教娱乐	0	BroadLink RM pro	2017-10-25 14:10:01+08	0	0	\N	2019-11-06 13:49:14.218766+08	\N	\N	1	2017-10-25
1062	-65	小孩服饰	0	裤子	2018-12-29 23:32:56.441465+08	0	0	\N	2019-11-06 13:49:12.427656+08	\N	\N	2	2018-12-29
1059	-199	生活日用	0	被套	2018-12-29 23:31:47.133022+08	0	0	\N	2019-11-06 13:49:12.43198+08	\N	\N	2	2018-12-29
1055	-75	小孩服饰	0	二套秋衣	2018-12-26 18:54:47.300848+08	0	0	\N	2019-11-06 13:49:12.437858+08	\N	\N	2	2018-12-26
1052	-7668	小孩健康	0	平安保险	2018-12-26 18:50:45.419034+08	0	0	\N	2019-11-06 13:49:12.441815+08	\N	\N	2	2018-12-26
1049	-19	饮食	0	绿姿	2018-12-26 18:35:41.803527+08	0	0	\N	2019-11-06 13:49:12.445774+08	\N	\N	1	2018-12-26
1046	-173	小孩玩具	0	乐高积木桌	2018-12-26 18:32:23.519572+08	0	0	\N	2019-11-06 13:49:12.450179+08	\N	\N	1	2018-12-26
1043	-130	交通出行	0	加油	2018-12-26 18:25:24.401409+08	0	0	\N	2019-11-06 13:49:12.45436+08	\N	\N	1	2018-12-26
1040	-99	生活日用	0	剃毛球器	2018-12-23 19:22:45.412624+08	0	0	\N	2019-11-06 13:49:12.458541+08	\N	\N	2	2018-12-23
1037	-80	生活日用	0	午餐费用	2018-12-22 10:51:02.108284+08	0	0	\N	2019-11-06 13:49:12.46274+08	\N	\N	2	2018-12-22
1034	-184	服饰美容	0	裤子和妈妈鞋	2018-12-22 10:49:43.455184+08	0	0	\N	2019-11-06 13:49:12.466842+08	\N	\N	2	2018-12-22
963	-5	交通出行	0	停车费	2018-12-07 21:50:07.277676+08	0	0	\N	2019-11-06 13:49:12.553488+08	\N	\N	1	2018-12-07
952	-628	生活日用	0	键盘架鼠标	2018-11-28 22:11:15.06189+08	0	0	\N	2019-11-06 13:49:12.570658+08	\N	\N	2	2018-11-28
948	-94	服饰美容	0	打底袜	2018-11-28 22:07:02.204165+08	0	0	\N	2019-11-06 13:49:12.57667+08	\N	\N	2	2018-11-28
944	-499	服饰美容	0	小ck包	2018-11-28 22:05:04.263127+08	0	0	\N	2019-11-06 13:49:12.582694+08	\N	\N	2	2018-11-28
940	-140	服饰美容	0	毛衣加裙子	2018-11-28 22:03:43.108731+08	0	0	\N	2019-11-06 13:49:12.588378+08	\N	\N	2	2018-11-28
936	-195	服饰美容	0	棉衣	2018-11-28 22:02:24.924074+08	0	0	\N	2019-11-06 13:49:12.594603+08	\N	\N	2	2018-11-28
932	-20	小孩服饰	0	袜子5双	2018-11-28 22:01:08.057899+08	0	0	\N	2019-11-06 13:49:12.600116+08	\N	\N	2	2018-11-28
928	-46	服饰美容	0	留夫鸭	2018-11-28 21:57:26.184976+08	0	0	\N	2019-11-06 13:49:12.60567+08	\N	\N	2	2018-11-28
916	-147	小孩玩具	0	滑梯	2018-11-23 17:28:52.647142+08	0	0	\N	2019-11-06 13:49:12.608349+08	\N	\N	1	2018-11-23
774	-16	生活日用	0	小夜灯	2018-10-28 19:01:01.097362+08	0	0	\N	2019-11-06 13:49:12.762961+08	\N	\N	2	2018-10-28
773	-31	服饰美容	0	妈咪包	2018-10-28 19:00:37+08	0	0	\N	2019-11-06 13:49:12.764389+08	\N	\N	2	2018-10-28
772	-175	住房缴费	0	电费	2018-10-28 19:00:19+08	0	0	\N	2019-11-06 13:49:12.766054+08	\N	\N	2	2018-10-28
771	-14	生活日用	0	晾衣杆	2018-10-28 19:00:04.024749+08	0	0	\N	2019-11-06 13:49:12.767472+08	\N	\N	2	2018-10-28
770	-5	交通出行	0	停车费	2018-10-28 18:59:36+08	0	0	\N	2019-11-06 13:49:12.768951+08	\N	\N	2	2018-10-28
769	-35	饮食	0	欧文西点	2018-10-28 18:59:20.970789+08	0	0	\N	2019-11-06 13:49:12.770423+08	\N	\N	2	2018-10-28
768	-199	服饰美容	0	优衣库	2018-10-28 18:59:03.071687+08	0	0	\N	2019-11-06 13:49:12.771792+08	\N	\N	2	2018-10-28
767	-462	服饰美容	0	衣服	2018-10-28 18:58:50.707349+08	0	0	\N	2019-11-06 13:49:12.773151+08	\N	\N	2	2018-10-28
766	-233	服饰美容	0	in time365	2018-10-28 18:58:27.789815+08	0	0	\N	2019-11-06 13:49:12.774468+08	\N	\N	2	2018-10-28
765	-91	饮食	0	美团3次	2018-10-28 18:51:47.158209+08	0	0	\N	2019-11-06 13:49:12.775859+08	\N	\N	1	2018-10-28
763	-260	饮食	0	外婆家	2018-10-28 18:49:34.189064+08	0	0	\N	2019-11-06 13:49:12.778594+08	\N	\N	1	2018-10-28
762	-2114	生活日用	0	电信3年	2018-10-28 18:48:55+08	0	0	\N	2019-11-06 13:49:12.77993+08	\N	\N	1	2018-10-28
761	-18	饮食	0	饮料	2018-10-28 18:48:24.485127+08	0	0	\N	2019-11-06 13:49:12.781291+08	\N	\N	1	2018-10-28
760	-420	小孩奶粉	0	尿不湿x2，奶粉	2018-10-28 18:47:34+08	0	0	\N	2019-11-06 13:49:12.782628+08	\N	\N	1	2018-10-28
759	-109	服饰美容	0	hm	2018-10-28 18:46:40.478777+08	0	0	\N	2019-11-06 13:49:12.784004+08	\N	\N	1	2018-10-28
758	-40	饮食	0	老婆大人	2018-10-28 18:46:09.285264+08	0	0	\N	2019-11-06 13:49:12.785299+08	\N	\N	1	2018-10-28
757	-9	饮食	0	水果	2018-10-28 18:45:59.293902+08	0	0	\N	2019-11-06 13:49:12.786812+08	\N	\N	1	2018-10-28
756	-10	饮食	0	早餐	2018-10-28 18:45:42.795424+08	0	0	\N	2019-11-06 13:49:12.788255+08	\N	\N	1	2018-10-28
755	-702	生活日用	0	碗，桌垫等	2018-10-28 18:45:02.551568+08	0	0	\N	2019-11-06 13:49:12.78964+08	\N	\N	1	2018-10-28
754	-16	饮食	0	煎饼	2018-10-28 18:44:01.979742+08	0	0	\N	2019-11-06 13:49:12.790923+08	\N	\N	1	2018-10-28
753	-385	生活日用	0	沃尔玛	2018-10-06 19:46:27.614162+08	0	0	\N	2019-11-06 13:49:12.792328+08	\N	\N	2	2018-10-06
752	-13	饮食	0	coco	2018-10-06 19:46:09.432062+08	0	0	\N	2019-11-06 13:49:12.793678+08	\N	\N	2	2018-10-06
751	-26	饮食	0	KFC	2018-10-06 19:45:55.47814+08	0	0	\N	2019-11-06 13:49:12.795024+08	\N	\N	2	2018-10-06
750	-26	饮食	0	KFC	2018-10-06 19:45:36.409805+08	0	0	\N	2019-11-06 13:49:12.796439+08	\N	\N	2	2018-10-06
727	5362	收入	1	工资	2018-06-23 22:49:58+08	0	0	\N	2019-12-09 16:59:22.87783+08	\N	\N	2	2018-06-23
748	-942	生活日用	0	宜家	2018-10-06 19:39:24.791611+08	0	0	\N	2019-11-06 13:49:12.799211+08	\N	\N	1	2018-10-06
747	-647	饮食	0	麦德龙	2018-10-06 19:39:07+08	0	0	\N	2019-11-06 13:49:12.800552+08	\N	\N	1	2018-10-06
746	-15	交通出行	0	停车费	2018-10-06 19:38:51+08	0	0	\N	2019-11-06 13:49:12.802527+08	\N	\N	1	2018-10-06
745	-172	饮食	0	捞王	2018-10-06 19:38:34.114938+08	0	0	\N	2019-11-06 13:49:12.803862+08	\N	\N	1	2018-10-06
743	-340	小孩服饰	0	hm衣服	2018-10-06 19:37:17+08	0	0	\N	2019-11-06 13:49:12.80662+08	\N	\N	1	2018-10-06
742	-336	小孩服饰	0	maxwin衣服	2018-10-06 19:36:57+08	0	0	\N	2019-11-06 13:49:12.808125+08	\N	\N	1	2018-10-06
741	-3	饮食	0	豆奶	2018-10-06 19:36:21.964655+08	0	0	\N	2019-11-06 13:49:12.809903+08	\N	\N	1	2018-10-06
740	-44	饮食	0	三江超市	2018-10-06 19:35:54.133962+08	0	0	\N	2019-11-06 13:49:12.811296+08	\N	\N	1	2018-10-06
739	-139	饮食	0	西贝莜面	2018-10-06 19:35:32.341604+08	0	0	\N	2019-11-06 13:49:12.812698+08	\N	\N	1	2018-10-06
738	-536	小孩生活用品	0	麦德龙	2018-10-06 19:34:58+08	0	0	\N	2019-11-06 13:49:12.814086+08	\N	\N	1	2018-10-06
737	-26	饮食	0	水果	2018-10-06 19:34:02.920585+08	0	0	\N	2019-11-06 13:49:12.815432+08	\N	\N	1	2018-10-06
736	-59	人情往来	0	外婆毛巾袜	2018-10-06 19:33:48+08	0	0	\N	2019-11-06 13:49:12.816786+08	\N	\N	1	2018-10-06
735	-80	生活日用	0	NITOR生活用品	2018-10-06 19:33:16.938521+08	0	0	\N	2019-11-06 13:49:12.818373+08	\N	\N	1	2018-10-06
734	-17	饮食	0	葡萄	2018-10-06 19:32:20.247606+08	0	0	\N	2019-11-06 13:49:12.819833+08	\N	\N	1	2018-10-06
733	-15	饮食	0	葡萄	2018-10-06 19:31:53.320472+08	0	0	\N	2019-11-06 13:49:12.821149+08	\N	\N	1	2018-10-06
732	-50	生活日用	0	盆栽	2018-09-29 23:04:48.380637+08	0	0	\N	2019-11-06 13:49:12.822685+08	\N	\N	2	2018-09-29
731	-173	生活日用	0	板凳	2018-09-29 23:04:20.741833+08	0	0	\N	2019-11-06 13:49:12.824039+08	\N	\N	2	2018-09-29
749	12662	收入	1	八月工资	2018-08-20 19:40:46+08	0	0	\N	2019-12-09 16:59:22.86884+08	\N	\N	1	2018-08-20
729	-45	饮食	0	无印良品咖喱	2018-09-29 22:53:53.233403+08	0	0	\N	2019-11-06 13:49:12.826758+08	\N	\N	2	2018-09-29
728	-388	小孩奶粉	0	奶粉	2018-09-29 22:53:30+08	0	0	\N	2019-11-06 13:49:12.828101+08	\N	\N	2	2018-09-29
730	5366	收入	1	工资	2018-08-23 22:57:11+08	0	0	\N	2019-12-09 16:59:22.866813+08	\N	\N	2	2018-08-23
723	-150	生活日用	0	电视支架	2018-09-29 22:47:46.319133+08	0	0	\N	2019-11-06 13:49:12.835018+08	\N	\N	2	2018-09-29
722	-300	小孩生活用品	0	铁锅和奶锅	2018-09-29 22:47:31+08	0	0	\N	2019-11-06 13:49:12.836342+08	\N	\N	2	2018-09-29
718	-112	生活日用	0	保洁	2018-09-29 22:43:36.820251+08	0	0	\N	2019-11-06 13:49:12.842045+08	\N	\N	2	2018-09-29
715	-214	生活日用	0	碗	2018-09-29 22:42:39.840786+08	0	0	\N	2019-11-06 13:49:12.846183+08	\N	\N	2	2018-09-29
484	-106	文教娱乐	0	鱼类用品	2018-06-07 20:58:20+08	0	0	\N	2019-11-06 13:49:13.217834+08	\N	\N	1	2018-06-07
726	5366	收入	1	工资	2018-09-29 22:49:34.97276+08	0	0	\N	2019-12-09 16:59:22.860333+08	\N	\N	2	2018-09-29
991	-94	服饰美容	0	三件秋衣	2018-12-07 23:19:12.587673+08	0	0	\N	2019-11-06 13:49:12.5165+08	\N	\N	2	2018-12-07
987	-18	生活日用	0	美购	2018-12-07 23:17:41.195305+08	0	0	\N	2019-11-06 13:49:12.522362+08	\N	\N	2	2018-12-07
983	-87	住房缴费	0	电费爸家	2018-12-07 23:16:31.513253+08	0	0	\N	2019-11-06 13:49:12.527984+08	\N	\N	2	2018-12-07
979	-30	服饰美容	0	围巾	2018-12-07 23:13:34.102808+08	0	0	\N	2019-11-06 13:49:12.532064+08	\N	\N	2	2018-12-07
975	-80	住房缴费	0	房产证	2018-12-07 21:56:40.199565+08	0	0	\N	2019-11-06 13:49:12.536131+08	\N	\N	1	2018-12-07
971	-58	生活日用	0	日用	2018-12-07 21:54:05.77163+08	0	0	\N	2019-11-06 13:49:12.541635+08	\N	\N	1	2018-12-07
967	-102	生活日用	0	美购	2018-12-07 21:51:26.544618+08	0	0	\N	2019-11-06 13:49:12.546943+08	\N	\N	1	2018-12-07
960	-12	生活日用	0	毛巾架	2018-11-28 22:13:59.624645+08	0	0	\N	2019-11-06 13:49:12.557657+08	\N	\N	2	2018-11-28
956	-598	生活日用	0	剃须刀	2018-11-28 22:12:44.201706+08	0	0	\N	2019-11-06 13:49:12.564659+08	\N	\N	2	2018-11-28
833	800	收入	1	江六嬷嬷红包新房	2018-10-28 19:33:33.219261+08	0	0	\N	2019-12-09 16:59:22.845466+08	\N	\N	2	2018-10-28
843	-2199	生活日用	0	小米石头扫地机器人	2018-11-11 15:42:40.508004+08	0	0	\N	2019-11-06 13:49:12.665227+08	\N	\N	1	2018-11-11
841	-265	饮食	0	外婆家	2018-11-11 15:39:05.090315+08	0	0	\N	2019-11-06 13:49:12.666737+08	\N	\N	1	2018-11-11
839	-369	文教娱乐	0	uno单片机	2018-11-11 15:35:50+08	0	0	\N	2019-11-06 13:49:12.66958+08	\N	\N	1	2018-11-11
838	-599	服饰美容	0	hm外套	2018-11-11 15:34:59.609878+08	0	0	\N	2019-11-06 13:49:12.671524+08	\N	\N	1	2018-11-11
837	-15	饮食	0	水果	2018-11-11 15:34:18.484848+08	0	0	\N	2019-11-06 13:49:12.672915+08	\N	\N	1	2018-11-11
836	-17	饮食	0	三江超市	2018-11-11 15:34:01.027864+08	0	0	\N	2019-11-06 13:49:12.674363+08	\N	\N	1	2018-11-11
835	-8	饮食	0	饮料	2018-11-11 15:33:41.942247+08	0	0	\N	2019-11-06 13:49:12.676087+08	\N	\N	1	2018-11-11
834	-10	饮食	0	饼	2018-11-11 15:33:19.605083+08	0	0	\N	2019-11-06 13:49:12.677552+08	\N	\N	1	2018-11-11
832	2000	收入	1	妈妈红包新房	2018-10-28 19:32:43.243589+08	0	0	\N	2019-12-09 16:59:22.8492+08	\N	\N	2	2018-10-28
831	1600	收入	1	奶奶红包新房	2018-10-28 19:32:19.27426+08	0	0	\N	2019-12-09 16:59:22.851706+08	\N	\N	2	2018-10-28
830	5439	收入	1	工资	2018-10-28 19:31:25.391557+08	0	0	\N	2019-12-09 16:59:22.854105+08	\N	\N	2	2018-10-28
825	-344	小孩生活用品	0	尿不湿零食	2018-10-28 19:28:49+08	0	0	\N	2020-07-20 13:32:29.162901+08	\N	\N	2	2018-10-28
829	-1500	交通出行	0	油卡	2018-10-28 19:30:50+08	0	0	\N	2019-11-06 13:49:12.684717+08	\N	\N	2	2018-10-28
828	-200	饮食	0	请客	2018-10-28 19:30:30.506795+08	0	0	\N	2019-11-06 13:49:12.686038+08	\N	\N	2	2018-10-28
827	-31	饮食	0	美团外卖	2018-10-28 19:30:15.574066+08	0	0	\N	2019-11-06 13:49:12.687374+08	\N	\N	2	2018-10-28
826	-36	饮食	0	KFC	2018-10-28 19:30:03.436245+08	0	0	\N	2019-11-06 13:49:12.688751+08	\N	\N	2	2018-10-28
824	-50	小孩生活用品	0	婴儿保湿润肤乳	2018-10-28 19:28:27+08	0	0	\N	2019-11-06 13:49:12.691441+08	\N	\N	2	2018-10-28
823	-35	生活日用	0	牙刷杯架	2018-10-28 19:27:39.087376+08	0	0	\N	2019-11-06 13:49:12.692747+08	\N	\N	2	2018-10-28
822	-31	生活日用	0	防烫夹和不8冰箱架	2018-10-28 19:26:56.681713+08	0	0	\N	2019-11-06 13:49:12.694062+08	\N	\N	2	2018-10-28
821	-116	生活日用	0	平底锅	2018-10-28 19:25:55.455612+08	0	0	\N	2019-11-06 13:49:12.695428+08	\N	\N	2	2018-10-28
820	-9	生活日用	0	泡面碗	2018-10-28 19:25:43.183836+08	0	0	\N	2019-11-06 13:49:12.696754+08	\N	\N	2	2018-10-28
819	-75	生活日用	0	钟	2018-10-28 19:25:29.198973+08	0	0	\N	2019-11-06 13:49:12.698089+08	\N	\N	2	2018-10-28
818	-42	生活日用	0	美购	2018-10-28 19:24:02.560859+08	0	0	\N	2019-11-06 13:49:12.699478+08	\N	\N	2	2018-10-28
817	-260	生活日用	0	眼镜	2018-10-28 19:23:49.866154+08	0	0	\N	2019-11-06 13:49:12.700855+08	\N	\N	2	2018-10-28
813	-158	服饰美容	0	睡衣	2018-10-28 19:22:00.651007+08	0	0	\N	2019-11-06 13:49:12.706853+08	\N	\N	2	2018-10-28
812	-52	生活日用	0	鞋架	2018-10-28 19:21:48.697742+08	0	0	\N	2019-11-06 13:49:12.708322+08	\N	\N	2	2018-10-28
811	-79	服饰美容	0	睡衣	2018-10-28 19:21:30.298908+08	0	0	\N	2019-11-06 13:49:12.709828+08	\N	\N	2	2018-10-28
810	-25	生活日用	0	硅藻泥垫	2018-10-28 19:21:17.74903+08	0	0	\N	2019-11-06 13:49:12.711115+08	\N	\N	2	2018-10-28
809	-341	小孩服饰	0	鞋子	2018-10-28 19:20:54+08	0	0	\N	2019-11-06 13:49:12.71246+08	\N	\N	2	2018-10-28
808	-10	生活日用	0	三江	2018-10-28 19:20:40.828358+08	0	0	\N	2019-11-06 13:49:12.713868+08	\N	\N	2	2018-10-28
807	-79	生活日用	0	马桶疏通器	2018-10-28 19:20:23.916193+08	0	0	\N	2019-11-06 13:49:12.71525+08	\N	\N	2	2018-10-28
806	-30	生活日用	0	美购	2018-10-28 19:19:00.396588+08	0	0	\N	2019-11-06 13:49:12.716627+08	\N	\N	2	2018-10-28
805	-66	生活日用	0	米桶杂物	2018-10-28 19:18:46.506599+08	0	0	\N	2019-11-06 13:49:12.718053+08	\N	\N	2	2018-10-28
804	-26	小孩服饰	0	背带	2018-10-28 19:18:32+08	0	0	\N	2019-11-06 13:49:12.719428+08	\N	\N	2	2018-10-28
803	-20	饮食	0	餐饮	2018-10-28 19:12:14+08	0	0	\N	2019-11-06 13:49:12.720758+08	\N	\N	2	2018-10-28
802	-179	服饰美容	0	戈美其	2018-10-28 19:11:58.300446+08	0	0	\N	2019-11-06 13:49:12.722117+08	\N	\N	2	2018-10-28
801	-70	饮食	0	美购	2018-10-28 19:11:34.720873+08	0	0	\N	2019-11-06 13:49:12.723798+08	\N	\N	2	2018-10-28
800	-400	小孩健康	0	社保	2018-10-28 19:11:17+08	0	0	\N	2019-11-06 13:49:12.725108+08	\N	\N	2	2018-10-28
799	-198	生活日用	0	睡袋2件	2018-10-28 19:11:02.369244+08	0	0	\N	2019-11-06 13:49:12.726448+08	\N	\N	2	2018-10-28
798	-20	生活日用	0	钻头	2018-10-28 19:10:41.860811+08	0	0	\N	2019-11-06 13:49:12.727799+08	\N	\N	2	2018-10-28
797	-16	饮食	0	卤人甲	2018-10-28 19:10:25.665516+08	0	0	\N	2019-11-06 13:49:12.729158+08	\N	\N	2	2018-10-28
796	-26	生活日用	0	垃圾袋	2018-10-28 19:10:02.082561+08	0	0	\N	2019-11-06 13:49:12.730526+08	\N	\N	2	2018-10-28
795	-100	生活日用	0	4个油瓶	2018-10-28 19:09:51.286799+08	0	0	\N	2019-11-06 13:49:12.731957+08	\N	\N	2	2018-10-28
794	-66	服饰美容	0	拖鞋	2018-10-28 19:09:34+08	0	0	\N	2019-11-06 13:49:12.733406+08	\N	\N	2	2018-10-28
793	-249	小孩生活用品	0	相框	2018-10-28 19:08:52+08	0	0	\N	2019-11-06 13:49:12.734806+08	\N	\N	2	2018-10-28
792	-66	生活日用	0	餐巾纸盒	2018-10-28 19:08:35.756433+08	0	0	\N	2019-11-06 13:49:12.736148+08	\N	\N	2	2018-10-28
791	-87	生活日用	0	黑色调味架	2018-10-28 19:08:13.371043+08	0	0	\N	2019-11-06 13:49:12.737571+08	\N	\N	2	2018-10-28
790	-103	生活日用	0	刀架	2018-10-28 19:07:50.6745+08	0	0	\N	2019-11-06 13:49:12.738983+08	\N	\N	2	2018-10-28
788	-24	饮食	0	水果	2018-10-28 19:06:46.692497+08	0	0	\N	2019-11-06 13:49:12.741677+08	\N	\N	2	2018-10-28
787	-140	生活日用	0	垃圾桶麦桶桶	2018-10-28 19:05:59.473886+08	0	0	\N	2019-11-06 13:49:12.743133+08	\N	\N	2	2018-10-28
786	-43	生活日用	0	垃圾桶	2018-10-28 19:05:26.277667+08	0	0	\N	2019-11-06 13:49:12.744418+08	\N	\N	2	2018-10-28
785	-30	生活日用	0	洗脸盆	2018-10-28 19:05:15.176875+08	0	0	\N	2019-11-06 13:49:12.74576+08	\N	\N	2	2018-10-28
783	-25	服饰美容	0	鞋套	2018-10-28 19:04:35+08	0	0	\N	2019-11-06 13:49:12.748427+08	\N	\N	2	2018-10-28
782	-39	生活日用	0	密封胶	2018-10-28 19:04:21.324808+08	0	0	\N	2019-11-06 13:49:12.750566+08	\N	\N	2	2018-10-28
781	-100	饮食	0	02	2018-10-28 19:03:42.230293+08	0	0	\N	2019-11-06 13:49:12.752007+08	\N	\N	2	2018-10-28
780	-27	生活日用	0	硅藻泥垫	2018-10-28 19:03:26.622482+08	0	0	\N	2019-11-06 13:49:12.753443+08	\N	\N	2	2018-10-28
779	-63	生活日用	0	电表箱装饰	2018-10-28 19:02:40.374177+08	0	0	\N	2019-11-06 13:49:12.755242+08	\N	\N	2	2018-10-28
778	-38	生活日用	0	水果盘	2018-10-28 19:02:20.155016+08	0	0	\N	2019-11-06 13:49:12.75673+08	\N	\N	2	2018-10-28
777	-248	生活日用	0	猪猪	2018-10-28 19:01:57.096648+08	0	0	\N	2019-11-06 13:49:12.758057+08	\N	\N	2	2018-10-28
776	-703	服饰美容	0	耐克鞋	2018-10-28 19:01:41.874321+08	0	0	\N	2019-11-06 13:49:12.75986+08	\N	\N	2	2018-10-28
846	28640	收入	1	提成	2018-11-11 16:19:36.944542+08	0	0	\N	2019-12-09 16:59:22.84368+08	\N	\N	2	2018-11-11
1082	-336	小孩服饰	0	羽绒服	2019-01-06 16:03:29.066705+08	0	0	\N	2019-11-06 13:49:12.400187+08	\N	\N	2	2019-01-06
1080	-438	饮食	0	午餐	2019-01-06 15:37:03.217492+08	0	0	\N	2019-11-06 13:49:12.402901+08	\N	\N	1	2019-01-06
1076	-22	饮食	0	寿司	2019-01-04 19:50:37.572854+08	0	0	\N	2019-11-06 13:49:12.408418+08	\N	\N	2	2019-01-04
1074	-548	服饰美容	0	羽绒服和裤子	2019-01-04 19:49:49.281463+08	0	0	\N	2019-11-06 13:49:12.41277+08	\N	\N	2	2019-01-04
1072	-53	住房缴费	0	电费自己	2019-01-04 19:48:55.273933+08	0	0	\N	2019-11-06 13:49:12.415426+08	\N	\N	2	2019-01-04
1070	-60	服饰美容	0	给妈妈的裤子	2019-01-04 19:48:11.697988+08	0	0	\N	2019-11-06 13:49:12.418162+08	\N	\N	2	2019-01-04
1068	-350	生活日用	0	锅套餐	2019-01-04 19:46:35.002655+08	0	0	\N	2019-11-06 13:49:12.42093+08	\N	\N	2	2019-01-04
1063	-134	饮食	0	晚饭	2018-12-29 23:34:06.489854+08	0	0	\N	2019-11-06 13:49:12.426299+08	\N	\N	2	2018-12-29
1060	-200	交通出行	0	建设银行etc	2018-12-29 23:32:12.327877+08	0	0	\N	2019-11-06 13:49:12.4303+08	\N	\N	2	2018-12-29
1056	-200	交通出行	0	油费	2018-12-26 18:55:09.240784+08	0	0	\N	2019-11-06 13:49:12.436505+08	\N	\N	2	2018-12-26
1053	-400	小孩健康	0	医保	2018-12-26 18:50:56.958099+08	0	0	\N	2019-11-06 13:49:12.44045+08	\N	\N	2	2018-12-26
1050	-876	小孩奶粉	0	奶粉8盒	2018-12-26 18:46:52.831955+08	0	0	\N	2019-11-06 13:49:12.444423+08	\N	\N	1	2018-12-26
1047	-40	生活日用	0	静音耳塞	2018-12-26 18:33:51.752662+08	0	0	\N	2019-11-06 13:49:12.44873+08	\N	\N	1	2018-12-26
1044	-199	文教娱乐	0	英语听力教程	2018-12-26 18:28:58.819497+08	0	0	\N	2019-11-06 13:49:12.452939+08	\N	\N	1	2018-12-26
1041	-24	生活日用	0	三江购物	2018-12-23 19:23:01.88036+08	0	0	\N	2019-11-06 13:49:12.457121+08	\N	\N	2	2018-12-23
1038	-68	饮食	0	橙子	2018-12-22 10:51:47.769616+08	0	0	\N	2019-11-06 13:49:12.461358+08	\N	\N	2	2018-12-22
869	-227	小孩生活用品	0	尿不湿	2018-11-11 16:30:50+08	0	0	\N	2020-07-20 13:32:29.146152+08	\N	\N	2	2018-11-11
1032	-9	生活日用	0	苹果膜	2018-12-22 10:49:01.700091+08	0	0	\N	2019-11-06 13:49:12.469479+08	\N	\N	2	2018-12-22
1029	-229	服饰美容	0	外套	2018-12-22 10:48:04.057954+08	0	0	\N	2019-11-06 13:49:12.473626+08	\N	\N	2	2018-12-22
1026	-13	小孩生活用品	0	手套	2018-12-22 10:47:12.454556+08	0	0	\N	2019-11-06 13:49:12.477648+08	\N	\N	2	2018-12-22
1023	-159	服饰美容	0	鞋子	2018-12-22 10:46:15.926979+08	0	0	\N	2019-11-06 13:49:12.481649+08	\N	\N	2	2018-12-22
1020	-20	小孩文具	0	睡前故事	2018-12-22 10:45:14.234713+08	0	0	\N	2019-11-06 13:49:12.485896+08	\N	\N	2	2018-12-22
1017	-160	服饰美容	0	过膝靴	2018-12-22 10:44:10.152591+08	0	0	\N	2019-11-06 13:49:12.490063+08	\N	\N	2	2018-12-22
1005	-12	交通出行	0	地铁	2018-12-17 09:25:37.138668+08	0	0	\N	2019-11-06 13:49:12.496835+08	\N	\N	1	2018-12-17
1002	-12	饮食	0	超市	2018-12-17 09:24:41.815345+08	0	0	\N	2019-11-06 13:49:12.501128+08	\N	\N	1	2018-12-17
999	-24	饮食	0	中午午饭	2018-12-07 23:22:27.964039+08	0	0	\N	2019-11-06 13:49:12.505086+08	\N	\N	2	2018-12-07
996	-59	生活日用	0	美购	2018-12-07 23:20:41.338364+08	0	0	\N	2019-11-06 13:49:12.509013+08	\N	\N	2	2018-12-07
992	-100	住房缴费	0	预存100	2018-12-07 23:19:36.516225+08	0	0	\N	2019-11-06 13:49:12.515113+08	\N	\N	2	2018-12-07
988	-20	小孩服饰	0	袜子	2018-12-07 23:18:04.003558+08	0	0	\N	2019-11-06 13:49:12.520935+08	\N	\N	2	2018-12-07
984	-37	住房缴费	0	电费自己	2018-12-07 23:16:51.413196+08	0	0	\N	2019-11-06 13:49:12.526648+08	\N	\N	2	2018-12-07
972	-10	生活日用	0	转头	2018-12-07 21:55:18.803146+08	0	0	\N	2019-11-06 13:49:12.540261+08	\N	\N	1	2018-12-07
968	-25	生活日用	0	超市	2018-12-07 21:51:48.354516+08	0	0	\N	2019-11-06 13:49:12.545572+08	\N	\N	1	2018-12-07
964	-25	饮食	0	牛肉炒面	2018-12-07 21:50:19.233802+08	0	0	\N	2019-11-06 13:49:12.552107+08	\N	\N	1	2018-12-07
961	-65	生活日用	0	美团外卖	2018-11-28 22:15:23.845048+08	0	0	\N	2019-11-06 13:49:12.556279+08	\N	\N	2	2018-11-28
957	-11	生活日用	0	鞋架	2018-11-28 22:12:52.977922+08	0	0	\N	2019-11-06 13:49:12.563285+08	\N	\N	2	2018-11-28
953	-718	生活日用	0	显示屏	2018-11-28 22:11:31.956987+08	0	0	\N	2019-11-06 13:49:12.569219+08	\N	\N	2	2018-11-28
949	-50	生活日用	0	美购超市	2018-11-28 22:07:20.539738+08	0	0	\N	2019-11-06 13:49:12.57516+08	\N	\N	2	2018-11-28
945	-75	小孩服饰	0	内衣套装	2018-11-28 22:05:20.013375+08	0	0	\N	2019-11-06 13:49:12.580912+08	\N	\N	2	2018-11-28
941	-125	服饰美容	0	外套	2018-11-28 22:03:59.425474+08	0	0	\N	2019-11-06 13:49:12.58686+08	\N	\N	2	2018-11-28
937	-6	生活日用	0	晾衣绳	2018-11-28 22:02:39.205845+08	0	0	\N	2019-11-06 13:49:12.593243+08	\N	\N	2	2018-11-28
933	-42	小孩玩具	0	玩具发条	2018-11-28 22:01:26.959542+08	0	0	\N	2019-11-06 13:49:12.598781+08	\N	\N	2	2018-11-28
929	-63	小孩其他	0	床护栏	2018-11-28 21:57:56.179419+08	0	0	\N	2019-11-06 13:49:12.604267+08	\N	\N	2	2018-11-28
1035	-186	小孩生活用品	0	一包尿不湿一包拉拉裤	2018-12-22 10:50:23.756186+08	0	0	\N	2020-07-20 13:32:29.133173+08	\N	\N	2	2018-12-22
913	-90	饮食	0	超市	2018-11-23 17:25:01.873028+08	0	0	\N	2019-11-06 13:49:12.612508+08	\N	\N	1	2018-11-23
873	-152	生活日用	0	抽餐巾纸	2018-11-11 16:32:41.527072+08	0	0	\N	2019-11-06 13:49:12.622643+08	\N	\N	2	2018-11-11
872	-187	小孩玩具	0	滑梯	2018-11-11 16:31:52+08	0	0	\N	2019-11-06 13:49:12.623973+08	\N	\N	2	2018-11-11
871	-150	小孩生活用品	0	奶嘴奶瓶	2018-11-11 16:31:40+08	0	0	\N	2019-11-06 13:49:12.625297+08	\N	\N	2	2018-11-11
870	-209	生活日用	0	10袋大米10斤装	2018-11-11 16:31:24+08	0	0	\N	2019-11-06 13:49:12.626639+08	\N	\N	2	2018-11-11
867	-77	生活日用	0	两袋20斤米	2018-11-11 16:30:16+08	0	0	\N	2019-11-06 13:49:12.629336+08	\N	\N	2	2018-11-11
866	-87	小孩零食	0	嘟嘟零食	2018-11-11 16:29:50+08	0	0	\N	2019-11-06 13:49:12.630763+08	\N	\N	2	2018-11-11
865	-109	生活日用	0	四袋10斤大米	2018-11-11 16:29:36+08	0	0	\N	2019-11-06 13:49:12.632083+08	\N	\N	2	2018-11-11
864	-113	小孩生活用品	0	奶瓶加奶嘴	2018-11-11 16:28:03+08	0	0	\N	2019-11-06 13:49:12.634491+08	\N	\N	2	2018-11-11
863	-99	小孩生活用品	0	湿巾	2018-11-11 16:26:50+08	0	0	\N	2019-11-06 13:49:12.636405+08	\N	\N	2	2018-11-11
862	-30	饮食	0	零食	2018-11-11 16:26:25.849624+08	0	0	\N	2019-11-06 13:49:12.638079+08	\N	\N	2	2018-11-11
861	-99	服饰美容	0	鞋子	2018-11-11 16:25:59.693306+08	0	0	\N	2019-11-06 13:49:12.639498+08	\N	\N	2	2018-11-11
860	-930	服饰美容	0	大衣	2018-11-11 16:25:45.047199+08	0	0	\N	2019-11-06 13:49:12.640842+08	\N	\N	2	2018-11-11
859	-750	服饰美容	0	牛仔裤lee	2018-11-11 16:25:32.191249+08	0	0	\N	2019-11-06 13:49:12.642145+08	\N	\N	2	2018-11-11
858	-231	小孩服饰	0	嘟嘟鞋	2018-11-11 16:25:13+08	0	0	\N	2019-11-06 13:49:12.643496+08	\N	\N	2	2018-11-11
857	-215	服饰美容	0	毛衣	2018-11-11 16:24:54.954612+08	0	0	\N	2019-11-06 13:49:12.644862+08	\N	\N	2	2018-11-11
855	-10	饮食	0	甘蔗	2018-11-11 16:24:01.537867+08	0	0	\N	2019-11-06 13:49:12.647964+08	\N	\N	2	2018-11-11
854	-100	饮食	0	老婆大人	2018-11-11 16:23:47+08	0	0	\N	2019-11-06 13:49:12.649297+08	\N	\N	2	2018-11-11
853	-26	生活日用	0	沥水篮	2018-11-11 16:23:31.12472+08	0	0	\N	2019-11-06 13:49:12.650648+08	\N	\N	2	2018-11-11
852	-38	小孩玩具	0	熊公仔	2018-11-11 16:22:56+08	0	0	\N	2019-11-06 13:49:12.652084+08	\N	\N	2	2018-11-11
851	-106	生活日用	0	家13.6爸91.98	2018-11-11 16:22:35.865774+08	0	0	\N	2019-11-06 13:49:12.653465+08	\N	\N	2	2018-11-11
850	-40	生活日用	0	苹果数据线	2018-11-11 16:21:36.474236+08	0	0	\N	2019-11-06 13:49:12.654815+08	\N	\N	2	2018-11-11
849	-60	服饰美容	0	高腰裙	2018-11-11 16:21:19.526106+08	0	0	\N	2019-11-06 13:49:12.656537+08	\N	\N	2	2018-11-11
848	-6	饮食	0	零食	2018-11-11 16:21:00.215915+08	0	0	\N	2019-11-06 13:49:12.658096+08	\N	\N	2	2018-11-11
847	-112	生活日用	0	美购超市	2018-11-11 16:20:35.204362+08	0	0	\N	2019-11-06 13:49:12.65956+08	\N	\N	2	2018-11-11
844	-880	小孩奶粉	0	奶粉八合	2018-11-11 15:43:41+08	0	0	\N	2019-11-06 13:49:12.66387+08	\N	\N	1	2018-11-11
917	13640	收入	1	工资	2018-11-23 17:32:42.532132+08	0	0	\N	2019-12-09 16:59:22.841178+08	\N	\N	1	2018-11-23
1106	-100	通讯物流	0	话费	2019-01-16 19:50:36.422279+08	0	0	\N	2019-11-06 13:49:12.365986+08	\N	\N	1	2019-01-16
1105	-45	饮食	0	零食	2019-01-16 19:50:24.533724+08	0	0	\N	2019-11-06 13:49:12.367515+08	\N	\N	1	2019-01-16
1104	-100	饮食	0	零食	2019-01-15 19:45:51.897067+08	0	0	\N	2019-11-06 13:49:12.368967+08	\N	\N	2	2019-01-15
1103	-385	服饰美容	0	德玛纳羽绒服	2019-01-15 19:44:19.387947+08	0	0	\N	2019-11-06 13:49:12.370578+08	\N	\N	2	2019-01-15
1102	-30	饮食	0	砂糖桔	2019-01-15 19:43:30.318816+08	0	0	\N	2019-11-06 13:49:12.372066+08	\N	\N	2	2019-01-15
1101	-826	服饰美容	0	maxwin	2019-01-15 19:42:54.333715+08	0	0	\N	2019-11-06 13:49:12.373497+08	\N	\N	2	2019-01-15
1100	-126	服饰美容	0	衣服	2019-01-15 19:42:28.246633+08	0	0	\N	2019-11-06 13:49:12.374851+08	\N	\N	2	2019-01-15
1099	-18	生活日用	0	剃须刀充电器	2019-01-15 16:13:49.719782+08	0	0	\N	2019-11-06 13:49:12.376304+08	\N	\N	1	2019-01-15
1098	-27	饮食	0	一鸣早餐	2019-01-15 16:13:19.143599+08	0	0	\N	2019-11-06 13:49:12.377707+08	\N	\N	1	2019-01-15
1009	13640	收入	1	工资	2018-12-17 10:32:15.539481+08	0	0	\N	2019-12-09 16:59:22.838079+08	\N	\N	1	2018-12-17
1096	-1500	交通出行	0	加油卡	2019-01-12 12:01:34.582958+08	0	0	\N	2019-11-06 13:49:12.381988+08	\N	\N	2	2019-01-12
1095	-52	饮食	0	爆米花可乐	2019-01-12 12:01:09.21409+08	0	0	\N	2019-11-06 13:49:12.383441+08	\N	\N	2	2019-01-12
1094	-63	饮食	0	披萨	2019-01-12 12:00:55.561395+08	0	0	\N	2019-11-06 13:49:12.384802+08	\N	\N	2	2019-01-12
1093	-1045	服饰美容	0	衣服	2019-01-12 12:00:26.915755+08	0	0	\N	2019-11-06 13:49:12.386233+08	\N	\N	2	2019-01-12
1092	-91	饮食	0	美购	2019-01-12 11:59:40.611702+08	0	0	\N	2019-11-06 13:49:12.387606+08	\N	\N	2	2019-01-12
1090	-102	住房缴费	0	水费	2019-01-12 11:59:04.536554+08	0	0	\N	2019-11-06 13:49:12.390406+08	\N	\N	2	2019-01-12
1089	-68	小孩健康	0	通鼻精油	2019-01-12 11:58:52.630972+08	0	0	\N	2019-11-06 13:49:12.391836+08	\N	\N	2	2019-01-12
1087	-23	通讯物流	0	出租车	2019-01-12 11:58:20.315624+08	0	0	\N	2019-11-06 13:49:12.39316+08	\N	\N	2	2019-01-12
1086	-169	生活日用	0	烘干机	2019-01-06 16:05:21.340785+08	0	0	\N	2019-11-06 13:49:12.394461+08	\N	\N	2	2019-01-06
1085	-90	生活日用	0	电影大黄蜂	2019-01-06 16:04:20.013972+08	0	0	\N	2019-11-06 13:49:12.39585+08	\N	\N	2	2019-01-06
1083	-50	饮食	0	蛋糕	2019-01-06 16:03:44.051609+08	0	0	\N	2019-11-06 13:49:12.398757+08	\N	\N	2	2019-01-06
1081	-10	其他消费	0	宁波银行卡注销	2019-01-06 15:38:18.473631+08	0	0	\N	2019-11-06 13:49:12.40156+08	\N	\N	1	2019-01-06
1079	-19	饮食	0	一鸣早餐	2019-01-06 15:36:45.952306+08	0	0	\N	2019-11-06 13:49:12.404251+08	\N	\N	1	2019-01-06
1077	-17	住房缴费	0	水费自己	2019-01-04 19:50:53.902175+08	0	0	\N	2019-11-06 13:49:12.407094+08	\N	\N	2	2019-01-04
1075	-109	小孩服饰	0	帽子和卫衣	2019-01-04 19:50:17.193679+08	0	0	\N	2019-11-06 13:49:12.409768+08	\N	\N	2	2019-01-04
1073	-70	饮食	0	菠萝蜜	2019-01-04 19:49:07.949244+08	0	0	\N	2019-11-06 13:49:12.414126+08	\N	\N	2	2019-01-04
1071	-154	住房缴费	0	电费父母	2019-01-04 19:48:39.080065+08	0	0	\N	2019-11-06 13:49:12.416799+08	\N	\N	2	2019-01-04
1069	-17	小孩服饰	0	手套	2019-01-04 19:47:49.946221+08	0	0	\N	2019-11-06 13:49:12.419643+08	\N	\N	2	2019-01-04
1067	-28	饮食	0	KFC	2019-01-03 11:20:58.735202+08	0	0	\N	2019-11-06 13:49:12.422215+08	\N	\N	1	2019-01-03
1064	-2000	其他消费	0	酒钱	2018-12-31 22:42:05.727787+08	0	0	\N	2019-11-06 13:49:12.424819+08	\N	\N	2	2018-12-31
1061	-25	饮食	0	绿姿	2018-12-29 23:32:38.048764+08	0	0	\N	2019-11-06 13:49:12.428944+08	\N	\N	2	2018-12-29
1057	-90	生活日用	0	洗衣液	2018-12-26 18:55:20.632592+08	0	0	\N	2019-11-06 13:49:12.435189+08	\N	\N	2	2018-12-26
1054	-28	饮食	0	绿资	2018-12-26 18:51:19.210056+08	0	0	\N	2019-11-06 13:49:12.439175+08	\N	\N	2	2018-12-26
1051	-79	其他消费	0	亚马逊会员	2018-12-26 18:48:35.869463+08	0	0	\N	2019-11-06 13:49:12.443128+08	\N	\N	1	2018-12-26
1048	-100	通讯物流	0	话费	2018-12-26 18:34:13.475672+08	0	0	\N	2019-11-06 13:49:12.447101+08	\N	\N	1	2018-12-26
1045	-55	其他消费	0	圣诞礼物	2018-12-26 18:29:20.309162+08	0	0	\N	2019-11-06 13:49:12.451628+08	\N	\N	1	2018-12-26
1042	-15	饮食	0	绿姿	2018-12-23 19:24:00.129677+08	0	0	\N	2019-11-06 13:49:12.455726+08	\N	\N	2	2018-12-23
1039	-540	小孩健康	0	3瓶VD	2018-12-23 19:22:23.418597+08	0	0	\N	2019-11-06 13:49:12.459962+08	\N	\N	2	2018-12-23
1036	-165	文教娱乐	0	腾讯视频VIP	2018-12-22 10:50:46.25077+08	0	0	\N	2019-11-06 13:49:12.464124+08	\N	\N	2	2018-12-22
1033	-79	小孩玩具	0	摇摇马	2018-12-22 10:49:23.232326+08	0	0	\N	2019-11-06 13:49:12.468133+08	\N	\N	2	2018-12-22
1030	-30	服饰美容	0	内裤	2018-12-22 10:48:22.954751+08	0	0	\N	2019-11-06 13:49:12.472206+08	\N	\N	2	2018-12-22
1027	-7	生活日用	0	地漏过滤网	2018-12-22 10:47:33.737842+08	0	0	\N	2019-11-06 13:49:12.476253+08	\N	\N	2	2018-12-22
1024	-24	小孩生活用品	0	奶粉盒	2018-12-22 10:46:39.12343+08	0	0	\N	2019-11-06 13:49:12.480281+08	\N	\N	2	2018-12-22
1021	-55	服饰美容	0	裤子	2018-12-22 10:45:32.37373+08	0	0	\N	2019-11-06 13:49:12.484447+08	\N	\N	2	2018-12-22
1006	-259	饮食	0	零食	2018-12-17 09:26:39.129141+08	0	0	\N	2019-11-06 13:49:12.495526+08	\N	\N	1	2018-12-17
1003	-185	生活日用	0	华润万家	2018-12-17 09:25:07.271332+08	0	0	\N	2019-11-06 13:49:12.499789+08	\N	\N	1	2018-12-17
1000	-200	交通出行	0	加油	2018-12-07 23:23:32.108984+08	0	0	\N	2019-11-06 13:49:12.503772+08	\N	\N	1	2018-12-07
997	-99	小孩生活用品	0	睡袋	2018-12-07 23:20:53.194804+08	0	0	\N	2019-11-06 13:49:12.507718+08	\N	\N	2	2018-12-07
993	-12	生活日用	0	永生花	2018-12-07 23:19:55.826011+08	0	0	\N	2019-11-06 13:49:12.513821+08	\N	\N	2	2018-12-07
989	-34	小孩服饰	0	口水巾	2018-12-07 23:18:16.258788+08	0	0	\N	2019-11-06 13:49:12.519465+08	\N	\N	2	2018-12-07
985	-45	小孩服饰	0	裤子	2018-12-07 23:17:06.188823+08	0	0	\N	2019-11-06 13:49:12.525172+08	\N	\N	2	2018-12-07
981	-59	小孩生活用品	0	床套	2018-12-07 23:14:54.580121+08	0	0	\N	2019-11-06 13:49:12.529352+08	\N	\N	2	2018-12-07
977	-38	饮食	0	KFC	2018-12-07 21:59:56.524895+08	0	0	\N	2019-11-06 13:49:12.534788+08	\N	\N	1	2018-12-07
973	-150	交通出行	0	四轮平衡	2018-12-07 21:55:56.665185+08	0	0	\N	2019-11-06 13:49:12.538888+08	\N	\N	1	2018-12-07
969	-10	其他消费	0	按摩	2018-12-07 21:52:16.892951+08	0	0	\N	2019-11-06 13:49:12.544231+08	\N	\N	1	2018-12-07
965	-11	饮食	0	三江	2018-12-07 21:50:33.755799+08	0	0	\N	2019-11-06 13:49:12.55064+08	\N	\N	1	2018-12-07
962	-245	生活日用	0	床垫	2018-11-28 22:15:38.809934+08	0	0	\N	2019-11-06 13:49:12.554985+08	\N	\N	2	2018-11-28
958	-782	交通出行	0	轮胎	2018-11-28 22:13:11.935212+08	0	0	\N	2019-11-06 13:49:12.560499+08	\N	\N	2	2018-11-28
954	-143	小孩生活用品	0	肥皂果汁瓶等	2018-11-28 22:12:03.593388+08	0	0	\N	2019-11-06 13:49:12.567624+08	\N	\N	2	2018-11-28
950	-15	饮食	0	甘蔗	2018-11-28 22:07:52.291988+08	0	0	\N	2019-11-06 13:49:12.573719+08	\N	\N	2	2018-11-28
946	-10	饮食	0	臭豆腐	2018-11-28 22:06:23.236022+08	0	0	\N	2019-11-06 13:49:12.579544+08	\N	\N	2	2018-11-28
942	-233	饮食	0	粥聚餐	2018-11-28 22:04:30.884068+08	0	0	\N	2019-11-06 13:49:12.585494+08	\N	\N	2	2018-11-28
938	-26	生活日用	0	美购超市	2018-11-28 22:03:11.656869+08	0	0	\N	2019-11-06 13:49:12.591647+08	\N	\N	2	2018-11-28
934	-27	饮食	0	板栗	2018-11-28 22:01:44.857374+08	0	0	\N	2019-11-06 13:49:12.597276+08	\N	\N	2	2018-11-28
930	-220	服饰美容	0	衣服墨景	2018-11-28 21:59:20.080156+08	0	0	\N	2019-11-06 13:49:12.602955+08	\N	\N	2	2018-11-28
914	-30	饮食	0	水果	2018-11-23 17:25:19.752135+08	0	0	\N	2019-11-06 13:49:12.611129+08	\N	\N	1	2018-11-23
878	-25	饮食	0	外卖	2018-11-11 16:34:38.933363+08	0	0	\N	2019-11-06 13:49:12.615533+08	\N	\N	2	2018-11-11
877	-50	文教娱乐	0	东钱湖玩	2018-11-11 16:34:25+08	0	0	\N	2019-11-06 13:49:12.616917+08	\N	\N	2	2018-11-11
876	-500	住房缴费	0	物业费	2018-11-11 16:33:35+08	0	0	\N	2019-11-06 13:49:12.618337+08	\N	\N	2	2018-11-11
875	-2018	人情往来	0	红包小强婚礼	2018-11-11 16:33:23+08	0	0	\N	2019-11-06 13:49:12.619769+08	\N	\N	2	2018-11-11
874	-2108	生活日用	0	榨汁机	2018-11-11 16:32:57.38183+08	0	0	\N	2019-11-06 13:49:12.621145+08	\N	\N	2	2018-11-11
1097	14142	收入	1	工资	2019-01-15 16:10:50.458465+08	0	0	\N	2019-12-09 16:59:22.835913+08	\N	\N	1	2019-01-15
1184	-320	文教娱乐	0	黄贤森林公园	2019-02-28 22:20:46.347493+08	0	0	\N	2019-11-06 13:49:12.246783+08	\N	\N	2	2019-02-28
1183	-20	服饰美容	0	袜子	2019-02-28 22:19:59.239864+08	0	0	\N	2019-11-06 13:49:12.248256+08	\N	\N	2	2019-02-28
1182	-9	饮食	0	水果	2019-02-28 22:19:47.927135+08	0	0	\N	2019-11-06 13:49:12.249646+08	\N	\N	2	2019-02-28
1181	-53	生活日用	0	钟	2019-02-28 22:19:29.221043+08	0	0	\N	2019-11-06 13:49:12.252708+08	\N	\N	2	2019-02-28
1180	-35	生活日用	0	抹布	2019-02-28 22:19:15.150639+08	0	0	\N	2019-11-06 13:49:12.254103+08	\N	\N	2	2019-02-28
1179	-12	饮食	0	饮料	2019-02-28 17:15:25.774956+08	0	0	\N	2019-11-06 13:49:12.255739+08	\N	\N	1	2019-02-28
1178	-32	饮食	0	茶香香	2019-02-28 17:14:54.694478+08	0	0	\N	2019-11-06 13:49:12.257143+08	\N	\N	1	2019-02-28
1176	-500	人情往来	0	聪聪	2019-02-22 20:23:49.939558+08	0	0	\N	2019-11-06 13:49:12.261549+08	\N	\N	2	2019-02-22
1175	-500	人情往来	0	建辉儿子	2019-02-22 20:23:24.907658+08	0	0	\N	2019-11-06 13:49:12.263145+08	\N	\N	2	2019-02-22
1174	-156	小孩玩具	0	厨房玩具	2019-02-22 20:22:41.110327+08	0	0	\N	2019-11-06 13:49:12.265432+08	\N	\N	2	2019-02-22
1173	-26	饮食	0	美购	2019-02-22 20:21:31.957294+08	0	0	\N	2019-11-06 13:49:12.266874+08	\N	\N	2	2019-02-22
1172	-17	饮食	0	三江	2019-02-22 20:21:11.149555+08	0	0	\N	2019-11-06 13:49:12.268301+08	\N	\N	2	2019-02-22
1171	-54	饮食	0	美购	2019-02-22 20:20:54.613904+08	0	0	\N	2019-11-06 13:49:12.269741+08	\N	\N	2	2019-02-22
1170	-65	饮食	0	绿姿	2019-02-22 20:20:42.538782+08	0	0	\N	2019-11-06 13:49:12.271261+08	\N	\N	2	2019-02-22
1168	-22	生活日用	0	胶水	2019-02-22 20:19:52.289172+08	0	0	\N	2019-11-06 13:49:12.272707+08	\N	\N	2	2019-02-22
1167	-38	生活日用	0	海绵洗碗	2019-02-22 20:19:38.40857+08	0	0	\N	2019-11-06 13:49:12.274138+08	\N	\N	2	2019-02-22
1166	-20	饮食	0	栗子	2019-02-15 15:31:24.448261+08	0	0	\N	2019-11-06 13:49:12.275567+08	\N	\N	1	2019-02-15
1133	34547	收入	1	奖金	2019-01-31 10:43:29.778598+08	0	0	\N	2019-12-09 16:59:22.829804+08	\N	\N	1	2019-01-31
1164	-600	人情往来	0	宁波嬷嬷	2019-02-12 09:22:22.990414+08	0	0	\N	2019-11-06 13:49:12.278559+08	\N	\N	2	2019-02-12
1163	-1000	人情往来	0	外婆	2019-02-12 09:22:08.963676+08	0	0	\N	2019-11-06 13:49:12.280017+08	\N	\N	2	2019-02-12
1162	-318	文教娱乐	0	电影票	2019-02-12 09:21:55.42718+08	0	0	\N	2019-11-06 13:49:12.28141+08	\N	\N	2	2019-02-12
1123	-108	小孩生活用品	0	尿布	2019-01-27 08:37:58.694199+08	0	0	\N	2020-07-20 13:32:29.105988+08	\N	\N	2	2019-01-27
1160	-175	生活日用	0	乐购	2019-02-12 09:18:56.554084+08	0	0	\N	2019-11-06 13:49:12.28428+08	\N	\N	2	2019-02-12
1159	-163	人情往来	0	酱油	2019-02-12 09:18:30.624258+08	0	0	\N	2019-11-06 13:49:12.285706+08	\N	\N	2	2019-02-12
1158	-52	饮食	0	美购	2019-02-12 09:18:01.715779+08	0	0	\N	2019-11-06 13:49:12.28712+08	\N	\N	2	2019-02-12
1157	-290	人情往来	0	水果	2019-02-12 09:17:35.050985+08	0	0	\N	2019-11-06 13:49:12.28855+08	\N	\N	2	2019-02-12
1156	-290	人情往来	0	水果	2019-02-12 09:17:34.758617+08	0	0	\N	2019-11-06 13:49:12.289881+08	\N	\N	2	2019-02-12
1155	-7	生活日用	0	超市	2019-02-12 09:16:40.358773+08	0	0	\N	2019-11-06 13:49:12.291241+08	\N	\N	2	2019-02-12
1154	-37	饮食	0	汉堡王	2019-02-12 09:13:02.705194+08	0	0	\N	2019-11-06 13:49:12.292632+08	\N	\N	1	2019-02-12
1153	-77	小孩玩具	0	玩具	2019-02-12 09:12:44.33567+08	0	0	\N	2019-11-06 13:49:12.294075+08	\N	\N	1	2019-02-12
1152	-209	生活日用	0	花呗	2019-02-12 09:12:08.485877+08	0	0	\N	2019-11-06 13:49:12.295489+08	\N	\N	1	2019-02-12
1150	-15	饮食	0	O2	2019-02-12 09:10:13.901305+08	0	0	\N	2019-11-06 13:49:12.298338+08	\N	\N	1	2019-02-12
1149	-18	饮食	0	KFC	2019-02-12 09:09:56.463947+08	0	0	\N	2019-11-06 13:49:12.300396+08	\N	\N	1	2019-02-12
1148	-117	饮食	0	烧烤	2019-02-12 09:09:41.069795+08	0	0	\N	2019-11-06 13:49:12.301743+08	\N	\N	1	2019-02-12
1147	-144	文教娱乐	0	泡澡按摩	2019-02-12 09:09:23.03433+08	0	0	\N	2019-11-06 13:49:12.303045+08	\N	\N	1	2019-02-12
1146	-10	饮食	0	coco	2019-02-12 09:08:45.467417+08	0	0	\N	2019-11-06 13:49:12.304768+08	\N	\N	1	2019-02-12
1145	-361	小孩服饰	0	衣服裤子	2019-01-31 22:24:55.249003+08	0	0	\N	2019-11-06 13:49:12.306977+08	\N	\N	2	2019-01-31
1144	-998	服饰美容	0	三双nike鞋	2019-01-31 12:19:58.767117+08	0	0	\N	2019-11-06 13:49:12.308494+08	\N	\N	2	2019-01-31
1143	-80	住房缴费	0	工本费	2019-01-31 12:18:59.534994+08	0	0	\N	2019-11-06 13:49:12.310014+08	\N	\N	2	2019-01-31
1142	-130	服饰美容	0	皮带钱包	2019-01-31 12:18:31.371465+08	0	0	\N	2019-11-06 13:49:12.31151+08	\N	\N	2	2019-01-31
1141	-22	文教娱乐	0	电影票	2019-01-31 12:17:40.611358+08	0	0	\N	2019-11-06 13:49:12.312892+08	\N	\N	2	2019-01-31
1140	-40	饮食	0	三江	2019-01-31 12:17:02.466508+08	0	0	\N	2019-11-06 13:49:12.314325+08	\N	\N	2	2019-01-31
1139	-13	饮食	0	coco	2019-01-31 12:16:51.974644+08	0	0	\N	2019-11-06 13:49:12.315703+08	\N	\N	2	2019-01-31
1138	-8	交通出行	0	停车费	2019-01-31 12:16:41.649199+08	0	0	\N	2019-11-06 13:49:12.317155+08	\N	\N	2	2019-01-31
1137	-18	生活日用	0	天然气	2019-01-31 12:16:28.509117+08	0	0	\N	2019-11-06 13:49:12.318534+08	\N	\N	2	2019-01-31
1136	-153	饮食	0	湘味人家	2019-01-31 12:15:51.920722+08	0	0	\N	2019-11-06 13:49:12.319891+08	\N	\N	2	2019-01-31
1135	-119	小孩生活用品	0	围栏	2019-01-31 12:15:23.307095+08	0	0	\N	2019-11-06 13:49:12.32121+08	\N	\N	2	2019-01-31
1134	-56	饮食	0	午餐	2019-01-31 12:14:42.009591+08	0	0	\N	2019-11-06 13:49:12.322679+08	\N	\N	2	2019-01-31
1126	6108	收入	1	工资	2019-01-27 08:39:20.05784+08	0	0	\N	2019-12-09 16:59:22.831666+08	\N	\N	2	2019-01-27
1132	-22	文教娱乐	0	电影票	2019-01-31 10:42:10.571435+08	0	0	\N	2019-11-06 13:49:12.325569+08	\N	\N	1	2019-01-31
1131	-10	饮食	0	一鸣早餐	2019-01-31 10:38:54.173359+08	0	0	\N	2019-11-06 13:49:12.327408+08	\N	\N	1	2019-01-31
1130	-27	饮食	0	老婆大人	2019-01-31 10:38:34.680994+08	0	0	\N	2019-11-06 13:49:12.328987+08	\N	\N	1	2019-01-31
1129	-11	饮食	0	O2	2019-01-31 10:38:22.244353+08	0	0	\N	2019-11-06 13:49:12.330971+08	\N	\N	1	2019-01-31
1128	-38	交通出行	0	滴滴	2019-01-31 10:38:05.755573+08	0	0	\N	2019-11-06 13:49:12.332259+08	\N	\N	1	2019-01-31
1127	-106	饮食	0	丁丁麻辣烫	2019-01-31 10:37:46.264705+08	0	0	\N	2019-11-06 13:49:12.333888+08	\N	\N	1	2019-01-31
1125	1500	收入	1	工龄奖	2019-01-27 08:38:49.576143+08	0	0	\N	2019-12-09 16:59:22.833921+08	\N	\N	2	2019-01-27
1161	-265	小孩生活用品	0	尿不湿3包	2019-02-12 09:21:16.082704+08	0	0	\N	2020-07-20 13:32:29.096908+08	\N	\N	2	2019-02-12
1122	-77	服饰美容	0	马威	2019-01-27 08:37:01.884462+08	0	0	\N	2019-11-06 13:49:12.340687+08	\N	\N	2	2019-01-27
1121	-22	饮食	0	吐司	2019-01-27 08:36:45.060309+08	0	0	\N	2019-11-06 13:49:12.342168+08	\N	\N	2	2019-01-27
1120	-54	生活日用	0	美购	2019-01-27 08:36:27.270523+08	0	0	\N	2019-11-06 13:49:12.343517+08	\N	\N	2	2019-01-27
1119	-30	小孩生活用品	0	雨伞	2019-01-27 08:36:13.646985+08	0	0	\N	2019-11-06 13:49:12.344899+08	\N	\N	2	2019-01-27
1118	-43	小孩其他	0	理发	2019-01-27 08:35:57.580795+08	0	0	\N	2019-11-06 13:49:12.346371+08	\N	\N	2	2019-01-27
1117	-38	生活日用	0	数据线	2019-01-27 08:34:49.285049+08	0	0	\N	2019-11-06 13:49:12.34771+08	\N	\N	2	2019-01-27
1116	-81	服饰美容	0	羽绒服妈妈	2019-01-27 08:34:35.330914+08	0	0	\N	2019-11-06 13:49:12.349105+08	\N	\N	2	2019-01-27
1115	-16	饮食	0	一鸣早餐	2019-01-22 09:11:13.954558+08	0	0	\N	2019-11-06 13:49:12.350735+08	\N	\N	1	2019-01-22
1114	-54	饮食	0	零食	2019-01-22 09:10:53.90553+08	0	0	\N	2019-11-06 13:49:12.352314+08	\N	\N	1	2019-01-22
1113	-199	饮食	0	香辣居	2019-01-22 09:10:45.545977+08	0	0	\N	2019-11-06 13:49:12.355721+08	\N	\N	1	2019-01-22
1112	-18	饮食	0	一鸣早餐	2019-01-22 09:10:20.931107+08	0	0	\N	2019-11-06 13:49:12.357045+08	\N	\N	1	2019-01-22
1111	-30	饮食	0	美团	2019-01-19 18:25:57.100542+08	0	0	\N	2019-11-06 13:49:12.35849+08	\N	\N	2	2019-01-19
1110	-25	饮食	0	美团	2019-01-19 18:25:47.091092+08	0	0	\N	2019-11-06 13:49:12.359938+08	\N	\N	2	2019-01-19
1109	-10	饮食	0	桂圆	2019-01-19 08:54:15.068207+08	0	0	\N	2019-11-06 13:49:12.361488+08	\N	\N	1	2019-01-19
1108	-10	饮食	0	一鸣早餐	2019-01-18 14:38:03.819781+08	0	0	\N	2019-11-06 13:49:12.362979+08	\N	\N	1	2019-01-18
1165	14142	收入	1	工资	2019-02-15 15:30:49.213216+08	0	0	\N	2019-12-09 16:59:22.827784+08	\N	\N	1	2019-02-15
1262	-16	饮食	0	早餐	2019-03-31 19:10:19.517941+08	0	0	\N	2019-11-06 13:49:12.132429+08	\N	\N	1	2019-03-31
1261	-11	饮食	0	早餐	2019-03-31 19:09:56.800302+08	0	0	\N	2019-11-06 13:49:12.134269+08	\N	\N	1	2019-03-31
1260	-16	饮食	0	一鸣早餐	2019-03-31 19:09:41.202702+08	0	0	\N	2019-11-06 13:49:12.135655+08	\N	\N	1	2019-03-31
1259	-11	饮食	0	早餐	2019-03-31 19:09:26.522833+08	0	0	\N	2019-11-06 13:49:12.137233+08	\N	\N	1	2019-03-31
1258	-10	饮食	0	便利店	2019-03-31 19:09:10.871801+08	0	0	\N	2019-11-06 13:49:12.138843+08	\N	\N	1	2019-03-31
1257	-179	生活日用	0	路由器	2019-03-31 19:08:36.271254+08	0	0	\N	2019-11-06 13:49:12.140373+08	\N	\N	1	2019-03-31
1256	-282	小孩生活用品	0	虎牌水杯	2019-03-31 19:07:35.3661+08	0	0	\N	2019-11-06 13:49:12.141784+08	\N	\N	2	2019-03-31
1255	-3244	交通出行	0	台湾机票x2	2019-03-31 19:06:35.083318+08	0	0	\N	2019-11-06 13:49:12.143205+08	\N	\N	2	2019-03-31
1254	-800	交通出行	0	动物园年卡x2	2019-03-31 19:06:09.039901+08	0	0	\N	2019-11-06 13:49:12.144705+08	\N	\N	2	2019-03-31
1253	-296	交通出行	0	入台证	2019-03-31 19:05:09.338296+08	0	0	\N	2019-11-06 13:49:12.146251+08	\N	\N	2	2019-03-31
1251	-2688	生活日用	0	床垫	2019-03-20 10:36:47.336808+08	0	0	\N	2019-11-06 13:49:12.149312+08	\N	\N	2	2019-03-20
1250	-1908	生活日用	0	宜家床	2019-03-20 10:36:21.205328+08	0	0	\N	2019-11-06 13:49:12.15073+08	\N	\N	2	2019-03-20
1249	-440	饮食	0	铁板烧	2019-03-20 10:35:53.038405+08	0	0	\N	2019-11-06 13:49:12.152401+08	\N	\N	2	2019-03-20
1248	-11	饮食	0	一鸣早餐	2019-03-20 10:35:32.827171+08	0	0	\N	2019-11-06 13:49:12.153857+08	\N	\N	1	2019-03-20
1247	-23	其他消费	0	止泻药	2019-03-20 10:35:20.374468+08	0	0	\N	2019-11-06 13:49:12.155339+08	\N	\N	1	2019-03-20
1246	-12	饮食	0	儿童面	2019-03-20 10:34:54.903646+08	0	0	\N	2019-11-06 13:49:12.156757+08	\N	\N	1	2019-03-20
1245	-15	饮食	0	一鸣早餐	2019-03-20 10:34:39.347277+08	0	0	\N	2019-11-06 13:49:12.158351+08	\N	\N	1	2019-03-20
1243	-60	交通出行	0	台湾2寸照x2	2019-03-20 10:34:06.897434+08	0	0	\N	2019-11-06 13:49:12.159794+08	\N	\N	1	2019-03-20
1242	-13	生活日用	0	TCL遥控器	2019-03-20 10:33:32.205741+08	0	0	\N	2019-11-06 13:49:12.161131+08	\N	\N	1	2019-03-20
1241	-23	饮食	0	一鸣早餐	2019-03-20 10:32:39.024707+08	0	0	\N	2019-11-06 13:49:12.162502+08	\N	\N	1	2019-03-20
1240	-2	饮食	0	矿泉水	2019-03-20 10:32:13.497559+08	0	0	\N	2019-11-06 13:49:12.163843+08	\N	\N	1	2019-03-20
1239	-9	饮食	0	早餐	2019-03-20 10:31:33.475277+08	0	0	\N	2019-11-06 13:49:12.165198+08	\N	\N	1	2019-03-20
1238	-27	饮食	0	美团	2019-03-17 08:01:57.240865+08	0	0	\N	2019-11-06 13:49:12.166579+08	\N	\N	2	2019-03-17
1237	-34	饮食	0	肯德基	2019-03-17 08:01:41.295347+08	0	0	\N	2019-11-06 13:49:12.167958+08	\N	\N	2	2019-03-17
1236	-233	小孩生活用品	0	水杯	2019-03-17 08:00:37.079777+08	0	0	\N	2019-11-06 13:49:12.169553+08	\N	\N	2	2019-03-17
1235	-92	小孩生活用品	0	利其儿	2019-03-17 08:00:12.876533+08	0	0	\N	2019-11-06 13:49:12.171005+08	\N	\N	2	2019-03-17
1234	-23	生活日用	0	垃圾袋	2019-03-17 07:59:49.614605+08	0	0	\N	2019-11-06 13:49:12.17248+08	\N	\N	2	2019-03-17
1233	-85	生活日用	0	两袋大米	2019-03-17 07:59:35.684846+08	0	0	\N	2019-11-06 13:49:12.17388+08	\N	\N	2	2019-03-17
1232	-13	饮食	0	菠萝	2019-03-17 07:59:10.974271+08	0	0	\N	2019-11-06 13:49:12.175376+08	\N	\N	2	2019-03-17
1231	-31	小孩生活用品	0	退热贴	2019-03-17 07:58:56.00156+08	0	0	\N	2019-11-06 13:49:12.176901+08	\N	\N	2	2019-03-17
1230	-99	生活日用	0	烧水壶	2019-03-17 07:58:39.223635+08	0	0	\N	2019-11-06 13:49:12.17833+08	\N	\N	2	2019-03-17
1229	-2000	交通出行	0	油卡	2019-03-17 07:57:46.698414+08	0	0	\N	2019-11-06 13:49:12.179702+08	\N	\N	2	2019-03-17
1228	-22	饮食	0	水果	2019-03-17 07:57:20.323731+08	0	0	\N	2019-11-06 13:49:12.181104+08	\N	\N	2	2019-03-17
1227	-9	生活日用	0	本子	2019-03-17 07:57:10.817308+08	0	0	\N	2019-11-06 13:49:12.182516+08	\N	\N	2	2019-03-17
1226	-89	小孩生活用品	0	bbox水杯	2019-03-17 07:57:01.106023+08	0	0	\N	2019-11-06 13:49:12.183853+08	\N	\N	2	2019-03-17
1225	-56	生活日用	0	垃圾袋	2019-03-17 07:56:37.912822+08	0	0	\N	2019-11-06 13:49:12.185232+08	\N	\N	2	2019-03-17
1224	-380	通讯物流	0	手机话费	2019-03-17 07:53:57.556711+08	0	0	\N	2019-11-06 13:49:12.186666+08	\N	\N	2	2019-03-17
1223	-24	饮食	0	美购物	2019-03-17 07:53:14.268107+08	0	0	\N	2019-11-06 13:49:12.187949+08	\N	\N	2	2019-03-17
1222	-31	饮食	0	早餐	2019-03-17 07:52:53.750484+08	0	0	\N	2019-11-06 13:49:12.18938+08	\N	\N	2	2019-03-17
1221	-280	生活日用	0	耳温枪	2019-03-17 07:52:35.501916+08	0	0	\N	2019-11-06 13:49:12.190802+08	\N	\N	2	2019-03-17
1220	-63	生活日用	0	数据线	2019-03-17 07:51:51.946646+08	0	0	\N	2019-11-06 13:49:12.192238+08	\N	\N	2	2019-03-17
1209	-5	小孩生活用品	0	游泳裤	2019-03-09 13:32:09.41704+08	0	0	\N	2020-07-20 13:32:29.089361+08	\N	\N	1	2019-03-09
1216	-5	饮食	0	早餐	2019-03-15 12:55:17.885313+08	0	0	\N	2019-11-06 13:49:12.196168+08	\N	\N	1	2019-03-15
1215	-6	饮食	0	早餐	2019-03-15 12:55:03.876785+08	0	0	\N	2019-11-06 13:49:12.197481+08	\N	\N	1	2019-03-15
1214	-6	饮食	0	早餐	2019-03-15 12:54:54.780636+08	0	0	\N	2019-11-06 13:49:12.200938+08	\N	\N	1	2019-03-15
1213	-20	饮食	0	小吃	2019-03-15 12:54:40.83488+08	0	0	\N	2019-11-06 13:49:12.202366+08	\N	\N	1	2019-03-15
1212	-100	生活日用	0	超市	2019-03-09 13:34:03.090991+08	0	0	\N	2019-11-06 13:49:12.204048+08	\N	\N	1	2019-03-09
1211	-26	饮食	0	草莓	2019-03-09 13:32:47.960109+08	0	0	\N	2019-11-06 13:49:12.205429+08	\N	\N	1	2019-03-09
1210	-48	小孩其他	0	理发	2019-03-09 13:32:32.22292+08	0	0	\N	2019-11-06 13:49:12.206851+08	\N	\N	1	2019-03-09
1208	-95	饮食	0	无邪	2019-03-09 13:31:32.464471+08	0	0	\N	2019-11-06 13:49:12.209779+08	\N	\N	1	2019-03-09
1207	-25	饮食	0	水果	2019-03-09 13:31:04.458873+08	0	0	\N	2019-11-06 13:49:12.211129+08	\N	\N	1	2019-03-09
1206	-15	饮食	0	老婆大人	2019-03-09 13:30:43.998072+08	0	0	\N	2019-11-06 13:49:12.212517+08	\N	\N	1	2019-03-09
1205	-20	饮食	0	一鸣	2019-03-09 13:30:29.234572+08	0	0	\N	2019-11-06 13:49:12.213846+08	\N	\N	1	2019-03-09
1204	-158	饮食	0	零食	2019-03-09 13:29:58.674789+08	0	0	\N	2019-11-06 13:49:12.215217+08	\N	\N	1	2019-03-09
1203	-159	文教娱乐	0	京东plus	2019-03-08 20:55:45.832805+08	0	0	\N	2019-11-06 13:49:12.216551+08	\N	\N	2	2019-03-08
1202	-89	生活日用	0	烧水壶	2019-03-08 20:55:12.910734+08	0	0	\N	2019-11-06 13:49:12.218118+08	\N	\N	2	2019-03-08
1201	-259	生活日用	0	磁力铁贴	2019-03-08 20:54:58.743196+08	0	0	\N	2019-11-06 13:49:12.219513+08	\N	\N	2	2019-03-08
1200	-38	饮食	0	大饼	2019-03-08 20:54:08.106621+08	0	0	\N	2019-11-06 13:49:12.220831+08	\N	\N	2	2019-03-08
1199	-32	饮食	0	肯德基	2019-03-08 20:53:50.435167+08	0	0	\N	2019-11-06 13:49:12.222264+08	\N	\N	2	2019-03-08
1198	-50	生活日用	0	电影绿皮书	2019-03-08 20:53:31.472268+08	0	0	\N	2019-11-06 13:49:12.223652+08	\N	\N	2	2019-03-08
1197	-524	交通出行	0	机油	2019-03-08 20:52:35.049243+08	0	0	\N	2019-11-06 13:49:12.22515+08	\N	\N	2	2019-03-08
1196	-89	住房缴费	0	水费爸	2019-03-08 20:48:56.541908+08	0	0	\N	2019-11-06 13:49:12.226483+08	\N	\N	2	2019-03-08
1195	-29	饮食	0	水果	2019-03-08 20:48:41.915092+08	0	0	\N	2019-11-06 13:49:12.228058+08	\N	\N	2	2019-03-08
1194	-7	生活日用	0	收纳盒	2019-03-08 20:48:31.012076+08	0	0	\N	2019-11-06 13:49:12.230177+08	\N	\N	2	2019-03-08
1193	-89	生活日用	0	保暖壶	2019-03-08 20:48:16.588021+08	0	0	\N	2019-11-06 13:49:12.232216+08	\N	\N	2	2019-03-08
1192	-5	生活日用	0	雨刮器	2019-03-08 20:47:54.968574+08	0	0	\N	2019-11-06 13:49:12.233535+08	\N	\N	2	2019-03-08
1191	-35	小孩生活用品	0	门栏	2019-03-08 20:47:42.457831+08	0	0	\N	2019-11-06 13:49:12.235401+08	\N	\N	2	2019-03-08
1190	-150	饮食	0	老宁波	2019-03-08 20:47:27.538031+08	0	0	\N	2019-11-06 13:49:12.236851+08	\N	\N	2	2019-03-08
1189	-206	住房缴费	0	电费爸	2019-03-08 20:46:35.461905+08	0	0	\N	2019-11-06 13:49:12.238364+08	\N	\N	2	2019-03-08
1187	-854	饮食	0	海底捞	2019-03-08 20:45:52.925379+08	0	0	\N	2019-11-06 13:49:12.242774+08	\N	\N	2	2019-03-08
1186	-10	住房缴费	0	水费新家	2019-03-08 20:45:42.423534+08	0	0	\N	2019-11-06 13:49:12.244092+08	\N	\N	2	2019-03-08
1219	14142	收入	1	工资	2019-03-15 16:15:35.245119+08	0	0	\N	2019-12-09 16:59:22.819337+08	\N	\N	1	2019-03-15
1340	-480	生活日用	0	面条机	2019-04-21 18:03:28.784766+08	0	0	\N	2019-11-06 13:49:12.019421+08	\N	\N	2	2019-04-21
1339	-11	生活日用	0	餐巾纸	2019-04-21 18:03:00.382599+08	0	0	\N	2019-11-06 13:49:12.020757+08	\N	\N	2	2019-04-21
1338	-223	饮食	0	午饭	2019-04-21 18:01:14.13926+08	0	0	\N	2019-11-06 13:49:12.022344+08	\N	\N	2	2019-04-21
1337	-6	饮食	0	凉皮	2019-04-21 18:00:59.763961+08	0	0	\N	2019-11-06 13:49:12.023647+08	\N	\N	2	2019-04-21
1336	-9	饮食	0	锅盔	2019-04-21 17:59:44.138236+08	0	0	\N	2019-11-06 13:49:12.025002+08	\N	\N	2	2019-04-21
1335	-30	健康保险	0	止疼药	2019-04-21 17:59:34.885628+08	0	0	\N	2019-11-06 13:49:12.026425+08	\N	\N	2	2019-04-21
1334	-49	生活日用	0	洗漱包	2019-04-21 17:59:13.745049+08	0	0	\N	2019-11-06 13:49:12.028152+08	\N	\N	2	2019-04-21
1333	-46	饮食	0	美购	2019-04-21 17:58:54.679217+08	0	0	\N	2019-11-06 13:49:12.029835+08	\N	\N	2	2019-04-21
1332	-20	生活日用	0	美购	2019-04-21 17:58:42.233559+08	0	0	\N	2019-11-06 13:49:12.031197+08	\N	\N	2	2019-04-21
1330	-207	生活日用	0	四件套	2019-04-21 17:58:08.937857+08	0	0	\N	2019-11-06 13:49:12.034123+08	\N	\N	2	2019-04-21
1329	-25	文教娱乐	0	菜谱	2019-04-21 17:57:56.400708+08	0	0	\N	2019-11-06 13:49:12.035671+08	\N	\N	2	2019-04-21
1328	-3	饮食	0	大饼	2019-04-21 17:57:40.776429+08	0	0	\N	2019-11-06 13:49:12.036935+08	\N	\N	2	2019-04-21
1327	-12	生活日用	0	裁纸机	2019-04-21 17:57:27.631462+08	0	0	\N	2019-11-06 13:49:12.038315+08	\N	\N	2	2019-04-21
1326	-6	饮食	0	乐购	2019-04-21 17:57:00.069949+08	0	0	\N	2019-11-06 13:49:12.039649+08	\N	\N	2	2019-04-21
1325	-3	饮食	0	大饼	2019-04-21 17:56:26.412454+08	0	0	\N	2019-11-06 13:49:12.041034+08	\N	\N	2	2019-04-21
1324	-42	生活日用	0	美购	2019-04-21 17:56:17.118989+08	0	0	\N	2019-11-06 13:49:12.042367+08	\N	\N	2	2019-04-21
1323	-9	饮食	0	早餐	2019-04-21 17:56:06.14131+08	0	0	\N	2019-11-06 13:49:12.04374+08	\N	\N	2	2019-04-21
1322	-204	小孩服饰	0	衣服	2019-04-21 17:55:55.582743+08	0	0	\N	2019-11-06 13:49:12.045341+08	\N	\N	2	2019-04-21
1321	-314	服饰美容	0	衣服	2019-04-21 17:55:39.821953+08	0	0	\N	2019-11-06 13:49:12.046878+08	\N	\N	2	2019-04-21
1320	-19	饮食	0	绿姿	2019-04-21 17:55:17.380702+08	0	0	\N	2019-11-06 13:49:12.048321+08	\N	\N	2	2019-04-21
1319	-5	饮食	0	零食	2019-04-15 14:50:52.557154+08	0	0	\N	2019-11-06 13:49:12.049922+08	\N	\N	1	2019-04-15
1318	-54	饮食	0	超市	2019-04-15 14:50:36.837514+08	0	0	\N	2019-11-06 13:49:12.052126+08	\N	\N	1	2019-04-15
1317	-200	生活日用	0	iPhone屏幕	2019-04-15 14:50:24.478914+08	0	0	\N	2019-11-06 13:49:12.053722+08	\N	\N	1	2019-04-15
1316	-20	交通出行	0	停车费	2019-04-15 14:50:08.504877+08	0	0	\N	2019-11-06 13:49:12.055046+08	\N	\N	1	2019-04-15
1315	-99	服饰美容	0	maxwin	2019-04-15 14:49:49.94284+08	0	0	\N	2019-11-06 13:49:12.056451+08	\N	\N	1	2019-04-15
1314	-5	饮食	0	早餐	2019-04-15 14:48:56.809092+08	0	0	\N	2019-11-06 13:49:12.058956+08	\N	\N	1	2019-04-15
1300	1500	收入	1	工龄奖	2019-04-10 19:31:59.615555+08	0	0	\N	2019-12-09 16:59:22.815067+08	\N	\N	2	2019-04-10
1312	-599	生活日用	0	厨师机	2019-04-10 19:36:49.326912+08	0	0	\N	2019-11-06 13:49:12.062386+08	\N	\N	2	2019-04-10
1311	-289	生活日用	0	奶煤气灶	2019-04-10 19:36:26.930231+08	0	0	\N	2019-11-06 13:49:12.06383+08	\N	\N	2	2019-04-10
1310	-579	生活日用	0	煤气灶	2019-04-10 19:36:11.094374+08	0	0	\N	2019-11-06 13:49:12.065159+08	\N	\N	2	2019-04-10
1309	-5	服饰美容	0	袜子	2019-04-10 19:35:29.63207+08	0	0	\N	2019-11-06 13:49:12.066561+08	\N	\N	2	2019-04-10
1308	-75	生活日用	0	咸菜桶	2019-04-10 19:35:10.784282+08	0	0	\N	2019-11-06 13:49:12.068047+08	\N	\N	2	2019-04-10
1307	-32	饮食	0	水果	2019-04-10 19:34:43.658287+08	0	0	\N	2019-11-06 13:49:12.069443+08	\N	\N	2	2019-04-10
1306	-98	住房缴费	0	爸电费	2019-04-10 19:34:29.831056+08	0	0	\N	2019-11-06 13:49:12.070958+08	\N	\N	2	2019-04-10
1305	-138	住房缴费	0	家电费	2019-04-10 19:34:16.701986+08	0	0	\N	2019-11-06 13:49:12.072601+08	\N	\N	2	2019-04-10
1303	-20	饮食	0	水果	2019-04-10 19:33:45.0745+08	0	0	\N	2019-11-06 13:49:12.075347+08	\N	\N	2	2019-04-10
1302	-101	生活日用	0	京东	2019-04-10 19:32:45.011693+08	0	0	\N	2019-11-06 13:49:12.07665+08	\N	\N	2	2019-04-10
1301	-35	饮食	0	美团	2019-04-10 19:32:20.893617+08	0	0	\N	2019-11-06 13:49:12.077917+08	\N	\N	2	2019-04-10
1286	8549	收入	1	工资	2019-03-31 19:20:12.5419+08	0	0	\N	2019-12-09 16:59:22.817422+08	\N	\N	2	2019-03-31
1299	-24	饮食	0	美团	2019-04-10 19:31:43.643245+08	0	0	\N	2019-11-06 13:49:12.0805+08	\N	\N	2	2019-04-10
1298	-1288	交通出行	0	垦丁住宿x3	2019-04-10 19:31:08.138548+08	0	0	\N	2019-11-06 13:49:12.081959+08	\N	\N	2	2019-04-10
1297	-529	交通出行	0	花莲住宿x2	2019-04-10 19:30:32.726192+08	0	0	\N	2019-11-06 13:49:12.083254+08	\N	\N	2	2019-04-10
1296	-634	交通出行	0	台北住宿x2	2019-04-10 19:30:04.336225+08	0	0	\N	2019-11-06 13:49:12.084553+08	\N	\N	2	2019-04-10
1295	-39	饮食	0	零食	2019-04-10 19:25:29.391743+08	0	0	\N	2019-11-06 13:49:12.085863+08	\N	\N	1	2019-04-10
1294	-10	饮食	0	一鸣早餐	2019-04-10 19:25:12.278238+08	0	0	\N	2019-11-06 13:49:12.087159+08	\N	\N	1	2019-04-10
1293	-6	饮食	0	早餐	2019-04-10 19:25:01.980165+08	0	0	\N	2019-11-06 13:49:12.088523+08	\N	\N	1	2019-04-10
1292	-10	饮食	0	零食	2019-04-10 19:24:37.508702+08	0	0	\N	2019-11-06 13:49:12.089903+08	\N	\N	1	2019-04-10
1291	-270	生活日用	0	榨汁机滤网+齿轮+架子	2019-04-10 19:24:16.246634+08	0	0	\N	2019-11-06 13:49:12.091164+08	\N	\N	1	2019-04-10
1290	-10	饮食	0	一鸣早餐	2019-04-10 19:23:36.212086+08	0	0	\N	2019-11-06 13:49:12.092467+08	\N	\N	1	2019-04-10
1289	-5	饮食	0	早餐	2019-04-10 19:23:14.343819+08	0	0	\N	2019-11-06 13:49:12.093788+08	\N	\N	1	2019-04-10
1288	-5	饮食	0	早餐	2019-04-10 19:22:58.747952+08	0	0	\N	2019-11-06 13:49:12.095062+08	\N	\N	1	2019-04-10
1287	-6	饮食	0	早餐	2019-04-10 19:22:41.987321+08	0	0	\N	2019-11-06 13:49:12.096471+08	\N	\N	1	2019-04-10
1285	-5	交通出行	0	停车费	2019-03-31 19:19:19.696537+08	0	0	\N	2019-11-06 13:49:12.099357+08	\N	\N	2	2019-03-31
1284	-40	交通出行	0	植物园门票x2	2019-03-31 19:19:07.902552+08	0	0	\N	2019-11-06 13:49:12.100674+08	\N	\N	2	2019-03-31
1283	-15	交通出行	0	车载垃圾桶	2019-03-31 19:18:29.878197+08	0	0	\N	2019-11-06 13:49:12.102054+08	\N	\N	2	2019-03-31
1282	-121	饮食	0	水果	2019-03-31 19:18:14.262994+08	0	0	\N	2019-11-06 13:49:12.103563+08	\N	\N	2	2019-03-31
1281	-9	生活日用	0	笔	2019-03-31 19:17:58.622744+08	0	0	\N	2019-11-06 13:49:12.105087+08	\N	\N	2	2019-03-31
1280	-18	小孩生活用品	0	口水巾	2019-03-31 19:17:48.643678+08	0	0	\N	2019-11-06 13:49:12.106426+08	\N	\N	2	2019-03-31
1279	-41	饮食	0	美购	2019-03-31 19:17:25.647142+08	0	0	\N	2019-11-06 13:49:12.107762+08	\N	\N	2	2019-03-31
1278	-100	饮食	0	老婆大人	2019-03-31 19:17:15.123442+08	0	0	\N	2019-11-06 13:49:12.109088+08	\N	\N	2	2019-03-31
1276	-148	生活日用	0	双肩包	2019-03-31 19:16:43.664597+08	0	0	\N	2019-11-06 13:49:12.111972+08	\N	\N	2	2019-03-31
1275	-21	小孩生活用品	0	隔汗巾	2019-03-31 19:16:31.475917+08	0	0	\N	2019-11-06 13:49:12.113425+08	\N	\N	2	2019-03-31
1274	-65	生活日用	0	美购	2019-03-31 19:16:15.816868+08	0	0	\N	2019-11-06 13:49:12.114856+08	\N	\N	2	2019-03-31
1273	-3	饮食	0	烧饼	2019-03-31 19:16:07.654801+08	0	0	\N	2019-11-06 13:49:12.116228+08	\N	\N	2	2019-03-31
1272	-11	饮食	0	水果	2019-03-31 19:15:55.524232+08	0	0	\N	2019-11-06 13:49:12.117609+08	\N	\N	2	2019-03-31
1271	-23	生活日用	0	美购	2019-03-31 19:15:43.796213+08	0	0	\N	2019-11-06 13:49:12.119056+08	\N	\N	2	2019-03-31
1270	-41	住房缴费	0	天然气	2019-03-31 19:15:33.543634+08	0	0	\N	2019-11-06 13:49:12.120622+08	\N	\N	2	2019-03-31
1269	-33	饮食	0	美购	2019-03-31 19:15:15.548283+08	0	0	\N	2019-11-06 13:49:12.122151+08	\N	\N	2	2019-03-31
1268	-100	饮食	0	O2	2019-03-31 19:15:06.947522+08	0	0	\N	2019-11-06 13:49:12.123519+08	\N	\N	2	2019-03-31
1267	-4	饮食	0	零食	2019-03-31 19:14:54.5196+08	0	0	\N	2019-11-06 13:49:12.125114+08	\N	\N	2	2019-03-31
1266	-24	饮食	0	绿姿	2019-03-31 19:14:32.118884+08	0	0	\N	2019-11-06 13:49:12.126675+08	\N	\N	2	2019-03-31
1265	-10	交通出行	0	停车费	2019-03-31 19:12:36.248937+08	0	0	\N	2019-11-06 13:49:12.128082+08	\N	\N	1	2019-03-31
1313	14142	收入	1	工资	2019-04-15 14:48:25.931551+08	0	0	\N	2019-12-09 16:59:22.813269+08	\N	\N	1	2019-04-15
1417	-102	住房缴费	0	东兴水费	2019-05-24 23:33:44.533774+08	0	0	\N	2019-11-06 13:49:11.9019+08	\N	\N	2	2019-05-24
1416	-50	生活日用	0	车载灭火器2个	2019-05-24 23:33:14.889685+08	0	0	\N	2019-11-06 13:49:11.903376+08	\N	\N	2	2019-05-24
1415	-23	住房缴费	0	水费	2019-05-24 23:32:40.34503+08	0	0	\N	2019-11-06 13:49:11.904697+08	\N	\N	2	2019-05-24
1414	-69	住房缴费	0	爸妈家电费	2019-05-24 23:32:10.913001+08	0	0	\N	2019-11-06 13:49:11.906044+08	\N	\N	2	2019-05-24
1413	-76	住房缴费	0	家电费	2019-05-24 23:31:47.535299+08	0	0	\N	2019-11-06 13:49:11.907757+08	\N	\N	2	2019-05-24
1376	8866	收入	1	工资	2019-04-29 23:06:31.331389+08	0	0	\N	2019-12-09 16:59:22.811328+08	\N	\N	2	2019-04-29
1411	-10	通讯物流	0	停车费	2019-05-16 14:47:39.967158+08	0	0	\N	2019-11-06 13:49:11.910446+08	\N	\N	1	2019-05-16
1409	-11	饮食	0	早餐	2019-05-16 14:46:09.835499+08	0	0	\N	2019-11-06 13:49:11.913279+08	\N	\N	1	2019-05-16
1408	-6	饮食	0	早餐	2019-05-16 14:46:01.018756+08	0	0	\N	2019-11-06 13:49:11.914645+08	\N	\N	1	2019-05-16
1407	-27	饮食	0	超市	2019-05-16 14:45:44.691986+08	0	0	\N	2019-11-06 13:49:11.916172+08	\N	\N	1	2019-05-16
1406	-170	生活日用	0	手机摄像头维修	2019-05-16 14:45:24.617111+08	0	0	\N	2019-11-06 13:49:11.917512+08	\N	\N	1	2019-05-16
1405	-370	饮食	0	台湾行微xxx凤梨酥	2019-05-08 16:18:39.034946+08	0	0	\N	2019-11-06 13:49:11.918855+08	\N	\N	2	2019-05-08
1404	-362	饮食	0	台湾行雪茄x10	2019-05-08 16:17:34.228178+08	0	0	\N	2019-11-06 13:49:11.920317+08	\N	\N	2	2019-05-08
1403	-1712	饮食	0	台湾行中华烟x4，金门高粱酒x4	2019-05-08 16:17:14.289643+08	0	0	\N	2019-11-06 13:49:11.921677+08	\N	\N	2	2019-05-08
1402	-328	饮食	0	台湾行凤梨酥	2019-05-08 16:16:20.583076+08	0	0	\N	2019-11-06 13:49:11.923+08	\N	\N	2	2019-05-08
1400	-254	饮食	0	台湾行海鲜	2019-05-08 16:15:01.293315+08	0	0	\N	2019-11-06 13:49:11.924394+08	\N	\N	2	2019-05-08
1399	-50	饮食	0	台湾行吃住	2019-05-08 16:14:24.255055+08	0	0	\N	2019-11-06 13:49:11.925797+08	\N	\N	2	2019-05-08
1398	-1464	服饰美容	0	台湾行护肤品	2019-05-08 16:13:29.585799+08	0	0	\N	2019-11-06 13:49:11.927074+08	\N	\N	2	2019-05-08
1397	-143	饮食	0	台湾行吃喝	2019-05-08 16:12:47.64401+08	0	0	\N	2019-11-06 13:49:11.928766+08	\N	\N	2	2019-05-08
1396	-1099	生活日用	0	台湾行吃喝住行	2019-05-08 16:11:28.175158+08	0	0	\N	2019-11-06 13:49:11.930292+08	\N	\N	2	2019-05-08
1395	-441	生活日用	0	台湾行吃喝住行	2019-05-08 16:10:23.874217+08	0	0	\N	2019-11-06 13:49:11.931707+08	\N	\N	2	2019-05-08
1394	-2400	小孩奶粉	0	台湾行羊奶粉x12	2019-05-08 16:09:06.163739+08	0	0	\N	2019-11-06 13:49:11.933257+08	\N	\N	2	2019-05-08
1393	-246	生活日用	0	台湾行神经痛药	2019-05-08 16:08:41.503163+08	0	0	\N	2019-11-06 13:49:11.934867+08	\N	\N	2	2019-05-08
1391	-2197	交通出行	0	台湾行吃喝玩乐	2019-05-04 23:32:48.065148+08	0	0	\N	2019-11-06 13:49:11.936406+08	\N	\N	2	2019-05-04
1390	-911	服饰美容	0	台湾行康是美	2019-05-04 23:31:42.431365+08	0	0	\N	2019-11-06 13:49:11.937802+08	\N	\N	2	2019-05-04
1389	-274	交通出行	0	台湾行洗脚x2	2019-05-04 23:30:32.375483+08	0	0	\N	2019-11-06 13:49:11.939121+08	\N	\N	2	2019-05-04
1388	-482	小孩服饰	0	台湾行衣服	2019-05-04 23:30:07.901079+08	0	0	\N	2019-11-06 13:49:11.940461+08	\N	\N	2	2019-05-04
1386	-633	服饰美容	0	台湾行耐克鞋	2019-05-04 23:28:41.236411+08	0	0	\N	2019-11-06 13:49:11.941845+08	\N	\N	2	2019-05-04
1385	-415	小孩服饰	0	台湾行两双鞋	2019-05-04 23:28:27.658155+08	0	0	\N	2019-11-06 13:49:11.943182+08	\N	\N	2	2019-05-04
1384	-412	服饰美容	0	台湾行hm	2019-05-04 23:27:54.091615+08	0	0	\N	2019-11-06 13:49:11.945+08	\N	\N	2	2019-05-04
1383	-540	服饰美容	0	台湾行日药本铺	2019-05-04 23:27:30.524853+08	0	0	\N	2019-11-06 13:49:11.946628+08	\N	\N	2	2019-05-04
1382	-16	生活日用	0	ghelper一个月会员	2019-04-30 11:40:14.313231+08	0	0	\N	2019-11-06 13:49:11.948204+08	\N	\N	1	2019-04-30
1381	-11	饮食	0	一鸣早餐	2019-04-30 11:37:26.946489+08	0	0	\N	2019-11-06 13:49:11.94968+08	\N	\N	1	2019-04-30
1380	-148	交通出行	0	台北故宫门票x2	2019-04-30 11:37:08.824641+08	0	0	\N	2019-11-06 13:49:11.951033+08	\N	\N	2	2019-04-30
1379	-218	交通出行	0	台北101门票x2	2019-04-30 11:36:03.433146+08	0	0	\N	2019-11-06 13:49:11.952721+08	\N	\N	2	2019-04-30
1377	-589	交通出行	0	高雄到台北高铁x2	2019-04-29 23:18:02.627126+08	0	0	\N	2019-11-06 13:49:11.957929+08	\N	\N	2	2019-04-29
1375	-450	小孩生活用品	0	尿布	2019-04-29 23:03:54.239125+08	0	0	\N	2020-07-20 13:32:29.062071+08	\N	\N	2	2019-04-29
1368	-54	小孩生活用品	0	尿布	2019-04-29 23:01:15.119033+08	0	0	\N	2020-07-20 13:32:29.074867+08	\N	\N	2	2019-04-29
1374	-240	服饰美容	0	防晒霜	2019-04-29 23:03:22.709436+08	0	0	\N	2019-11-06 13:49:11.968182+08	\N	\N	2	2019-04-29
1373	-45	生活日用	0	防晒霜	2019-04-29 23:03:00.986169+08	0	0	\N	2019-11-06 13:49:11.969948+08	\N	\N	2	2019-04-29
1372	-269	生活日用	0	行李箱	2019-04-29 23:02:49.360033+08	0	0	\N	2019-11-06 13:49:11.971626+08	\N	\N	2	2019-04-29
1371	-300	文教娱乐	0	公司聚餐	2019-04-29 23:02:04.689551+08	0	0	\N	2019-11-06 13:49:11.973073+08	\N	\N	2	2019-04-29
1370	-40	饮食	0	桑椹	2019-04-29 23:01:40.561646+08	0	0	\N	2019-11-06 13:49:11.974418+08	\N	\N	2	2019-04-29
1369	-3	饮食	0	大饼	2019-04-29 23:01:25.758237+08	0	0	\N	2019-11-06 13:49:11.975831+08	\N	\N	2	2019-04-29
1367	-66	小孩生活用品	0	澡桶	2019-04-29 23:01:04.84741+08	0	0	\N	2019-11-06 13:49:11.978583+08	\N	\N	2	2019-04-29
1366	-15	饮食	0	桑椹	2019-04-29 23:00:44.062143+08	0	0	\N	2019-11-06 13:49:11.979957+08	\N	\N	2	2019-04-29
1365	-270	服饰美容	0	服饰	2019-04-29 23:00:27.216079+08	0	0	\N	2019-11-06 13:49:11.981318+08	\N	\N	2	2019-04-29
1364	-75	饮食	0	周黑鸭	2019-04-29 23:00:15.159534+08	0	0	\N	2019-11-06 13:49:11.984554+08	\N	\N	2	2019-04-29
1363	-19	饮食	0	不二烫捞	2019-04-29 23:00:03.565063+08	0	0	\N	2019-11-06 13:49:11.986122+08	\N	\N	2	2019-04-29
1362	-40	小孩服饰	0	睡袋	2019-04-29 22:59:43.499136+08	0	0	\N	2019-11-06 13:49:11.987773+08	\N	\N	2	2019-04-29
1361	-5	饮食	0	饼	2019-04-29 22:59:32.87961+08	0	0	\N	2019-11-06 13:49:11.99074+08	\N	\N	2	2019-04-29
1360	-150	生活日用	0	美购	2019-04-29 22:59:20.538904+08	0	0	\N	2019-11-06 13:49:11.992175+08	\N	\N	2	2019-04-29
1359	-3650	健康保险	0	车险	2019-04-29 22:58:48.105502+08	0	0	\N	2019-11-06 13:49:11.99354+08	\N	\N	2	2019-04-29
1358	-25	小孩服饰	0	拖鞋	2019-04-29 22:58:18.860137+08	0	0	\N	2019-11-06 13:49:11.994895+08	\N	\N	2	2019-04-29
1357	-30	生活日用	0	好易购	2019-04-29 22:58:05.830167+08	0	0	\N	2019-11-06 13:49:11.996222+08	\N	\N	2	2019-04-29
1356	-15	生活日用	0	分装瓶	2019-04-29 22:56:46.377325+08	0	0	\N	2019-11-06 13:49:11.997564+08	\N	\N	2	2019-04-29
1355	-80	生活日用	0	电风扇	2019-04-29 22:56:13.970054+08	0	0	\N	2019-11-06 13:49:11.999001+08	\N	\N	2	2019-04-29
1354	-69	小孩服饰	0	背心	2019-04-29 22:55:58.14066+08	0	0	\N	2019-11-06 13:49:12.000337+08	\N	\N	2	2019-04-29
1353	-376	交通出行	0	花莲垦丁纵谷线一日游x2	2019-04-29 12:44:58.656029+08	0	0	\N	2019-11-06 13:49:12.002139+08	\N	\N	2	2019-04-29
1352	-128	交通出行	0	垦丁到高雄左营高铁站x2	2019-04-29 12:43:54.941175+08	0	0	\N	2019-11-06 13:49:12.003732+08	\N	\N	2	2019-04-29
1351	-250	交通出行	0	花莲太鲁阁一日游x2	2019-04-29 12:42:50.040796+08	0	0	\N	2019-11-06 13:49:12.00509+08	\N	\N	2	2019-04-29
1349	-15	饮食	0	零食	2019-04-29 12:40:35.833162+08	0	0	\N	2019-11-06 13:49:12.00651+08	\N	\N	1	2019-04-29
1348	-11	饮食	0	两天早餐	2019-04-29 12:38:57.017564+08	0	0	\N	2019-11-06 13:49:12.008046+08	\N	\N	1	2019-04-29
1347	-22	饮食	0	三天早餐	2019-04-29 12:38:35.215635+08	0	0	\N	2019-11-06 13:49:12.009378+08	\N	\N	1	2019-04-29
1346	-6	饮食	0	早餐	2019-04-29 12:38:07.418004+08	0	0	\N	2019-11-06 13:49:12.010706+08	\N	\N	1	2019-04-29
1345	-140	饮食	0	乐购	2019-04-29 12:37:18.641796+08	0	0	\N	2019-11-06 13:49:12.012129+08	\N	\N	1	2019-04-29
1344	-10	饮食	0	绿姿	2019-04-29 12:36:57.900327+08	0	0	\N	2019-11-06 13:49:12.013473+08	\N	\N	1	2019-04-29
1343	-20	饮食	0	卤人甲	2019-04-29 12:36:44.151687+08	0	0	\N	2019-11-06 13:49:12.01482+08	\N	\N	1	2019-04-29
1412	14918	收入	1	工资	2019-05-16 14:55:20.378183+08	0	0	\N	2019-12-09 16:59:22.809155+08	\N	\N	1	2019-05-16
1495	-10	小孩生活用品	0	浴巾	2019-06-13 12:07:33.170687+08	0	0	\N	2019-11-06 13:49:11.780432+08	\N	\N	2	2019-06-13
1494	-60	服饰美容	0	手镯	2019-06-13 12:07:09.356525+08	0	0	\N	2019-11-06 13:49:11.782165+08	\N	\N	2	2019-06-13
1493	-19	小孩健康	0	日常检查	2019-06-13 12:06:52.500623+08	0	0	\N	2019-11-06 13:49:11.783645+08	\N	\N	2	2019-06-13
1492	-20	交通出行	0	停车费	2019-06-09 22:40:53.240179+08	0	0	\N	2019-11-06 13:49:11.784981+08	\N	\N	2	2019-06-09
1490	-871	饮食	0	老北京菜	2019-06-09 22:39:37.002704+08	0	0	\N	2019-11-06 13:49:11.786301+08	\N	\N	2	2019-06-09
1489	-24	生活日用	0	门帘	2019-06-09 22:39:08.891039+08	0	0	\N	2019-11-06 13:49:11.787669+08	\N	\N	2	2019-06-09
1488	-20	服饰美容	0	袜子	2019-06-09 22:38:59.480133+08	0	0	\N	2019-11-06 13:49:11.789109+08	\N	\N	2	2019-06-09
1487	-126	服饰美容	0	连衣裙	2019-06-09 22:38:34.844775+08	0	0	\N	2019-11-06 13:49:11.790484+08	\N	\N	2	2019-06-09
1486	-32	饮食	0	鸭蛋	2019-06-09 22:37:42.957086+08	0	0	\N	2019-11-06 13:49:11.791897+08	\N	\N	2	2019-06-09
1485	-158	饮食	0	鲍鱼先生	2019-06-09 22:36:36.168395+08	0	0	\N	2019-11-06 13:49:11.793267+08	\N	\N	2	2019-06-09
1484	-28	生活日用	0	手机膜	2019-06-09 22:36:09.769876+08	0	0	\N	2019-11-06 13:49:11.794584+08	\N	\N	2	2019-06-09
1482	6108	收入	1	18年12月工资	2019-06-05 21:14:18.989785+08	0	0	\N	2019-12-09 16:59:22.800264+08	\N	\N	2	2019-06-05
1481	5438	收入	1	18年11月工资	2019-06-05 21:13:37.997801+08	0	0	\N	2019-12-09 16:59:22.803465+08	\N	\N	2	2019-06-05
1480	8866	收入	1	五月工资	2019-06-05 21:03:54.090056+08	0	0	\N	2019-12-09 16:59:22.805445+08	\N	\N	2	2019-06-05
1479	50000	收入	1	18年提成	2019-06-05 21:00:23.628356+08	0	0	\N	2019-12-09 16:59:22.807401+08	\N	\N	2	2019-06-05
1431	-236	小孩生活用品	0	尿布3包	2019-05-24 23:42:39.086035+08	0	0	\N	2020-07-20 13:32:29.049988+08	\N	\N	2	2019-05-24
1477	-58	生活日用	0	车载风扇	2019-06-05 16:24:09.250749+08	0	0	\N	2019-11-06 13:49:11.812236+08	\N	\N	2	2019-06-05
1476	-1000	交通出行	0	油卡	2019-06-04 23:27:20.377003+08	0	0	\N	2019-11-06 13:49:11.813663+08	\N	\N	2	2019-06-04
1475	-170	生活日用	0	1水宝宝防晒喷雾 洗面奶 眉笔	2019-06-04 23:26:07.513699+08	0	0	\N	2019-11-06 13:49:11.81604+08	\N	\N	2	2019-06-04
1474	-68	小孩服饰	0	雨衣	2019-06-04 23:25:02.907736+08	0	0	\N	2019-11-06 13:49:11.818282+08	\N	\N	2	2019-06-04
1473	-59	小孩服饰	0	防晒衣	2019-06-04 23:24:36.383951+08	0	0	\N	2019-11-06 13:49:11.819916+08	\N	\N	2	2019-06-04
1472	-40	生活日用	0	美缝剂	2019-06-04 23:24:11.489596+08	0	0	\N	2019-11-06 13:49:11.821313+08	\N	\N	2	2019-06-04
1471	-60	饮食	0	美购	2019-06-04 23:23:41.802018+08	0	0	\N	2019-11-06 13:49:11.82291+08	\N	\N	2	2019-06-04
1470	-16	小孩服饰	0	袜子	2019-06-04 23:23:21.48411+08	0	0	\N	2019-11-06 13:49:11.824578+08	\N	\N	2	2019-06-04
1469	-66	人情往来	0	水费父母家	2019-06-04 23:23:04.156541+08	0	0	\N	2019-11-06 13:49:11.826274+08	\N	\N	2	2019-06-04
1468	-46	住房缴费	0	水费家	2019-06-04 23:22:38.022164+08	0	0	\N	2019-11-06 13:49:11.828007+08	\N	\N	2	2019-06-04
1467	-26	饮食	0	荔枝	2019-06-04 23:22:10.179069+08	0	0	\N	2019-11-06 13:49:11.829763+08	\N	\N	2	2019-06-04
1466	-30	小孩服饰	0	美妆蛋3个	2019-06-04 23:21:49.525435+08	0	0	\N	2019-11-06 13:49:11.83162+08	\N	\N	2	2019-06-04
1465	-1000	人情往来	0	海口小南	2019-06-04 23:20:24.637213+08	0	0	\N	2019-11-06 13:49:11.833475+08	\N	\N	2	2019-06-04
1464	-10	生活日用	0	餐巾纸	2019-06-01 14:17:30.461258+08	0	0	\N	2019-11-06 13:49:11.83557+08	\N	\N	2	2019-06-01
1463	-121	小孩生活用品	0	小宝熊水壶	2019-06-01 14:17:14.792865+08	0	0	\N	2019-11-06 13:49:11.83777+08	\N	\N	2	2019-06-01
1462	-90	饮食	0	荔枝	2019-06-01 14:16:46.856579+08	0	0	\N	2019-11-06 13:49:11.839979+08	\N	\N	2	2019-06-01
1461	-37	生活日用	0	华润万家	2019-05-31 21:01:38.282397+08	0	0	\N	2019-11-06 13:49:11.842045+08	\N	\N	2	2019-05-31
1460	-25	生活日用	0	手机壳	2019-05-30 16:38:15.381488+08	0	0	\N	2019-11-06 13:49:11.843821+08	\N	\N	2	2019-05-30
1459	-203	小孩生活用品	0	奶瓶洗衣液	2019-05-30 16:37:48.007972+08	0	0	\N	2019-11-06 13:49:11.84526+08	\N	\N	2	2019-05-30
1458	-58	饮食	0	蛋糕	2019-05-28 23:21:29.340864+08	0	0	\N	2019-11-06 13:49:11.846934+08	\N	\N	2	2019-05-28
1457	-2828	健康保险	0	人保车险3268-440	2019-05-28 14:21:24.979565+08	0	0	\N	2019-11-06 13:49:11.848368+08	\N	\N	1	2019-05-28
1455	-669	文教娱乐	0	三星buds无线耳机	2019-05-28 10:18:57.747671+08	0	0	\N	2019-11-06 13:49:11.850036+08	\N	\N	1	2019-05-28
1454	-5	饮食	0	早餐	2019-05-28 10:18:18.75867+08	0	0	\N	2019-11-06 13:49:11.851671+08	\N	\N	1	2019-05-28
1452	-160	生活日用	0	VPN	2019-05-28 10:17:02.597144+08	0	0	\N	2019-11-06 13:49:11.853234+08	\N	\N	1	2019-05-28
1450	-65	饮食	0	老婆大人	2019-05-28 10:16:23.049717+08	0	0	\N	2019-11-06 13:49:11.856509+08	\N	\N	1	2019-05-28
1449	-32	饮食	0	山竹	2019-05-28 10:16:01.060185+08	0	0	\N	2019-11-06 13:49:11.858735+08	\N	\N	1	2019-05-28
1448	-38	饮食	0	欧文	2019-05-28 10:15:41.529211+08	0	0	\N	2019-11-06 13:49:11.860431+08	\N	\N	1	2019-05-28
1447	-100	通讯物流	0	话费	2019-05-28 10:15:17.568073+08	0	0	\N	2019-11-06 13:49:11.862318+08	\N	\N	1	2019-05-28
1446	-50	生活日用	0	说明书打印	2019-05-28 10:14:47.300546+08	0	0	\N	2019-11-06 13:49:11.863912+08	\N	\N	1	2019-05-28
1445	-15	生活日用	0	生活用品	2019-05-28 10:14:08.93446+08	0	0	\N	2019-11-06 13:49:11.865252+08	\N	\N	1	2019-05-28
1444	-80	文教娱乐	0	DOTA2特权码	2019-05-28 10:13:17.779619+08	0	0	\N	2019-11-06 13:49:11.866556+08	\N	\N	1	2019-05-28
1443	-11	饮食	0	一鸣早餐	2019-05-28 10:12:54.262534+08	0	0	\N	2019-11-06 13:49:11.867935+08	\N	\N	1	2019-05-28
1442	-100	饮食	0	水果零食	2019-05-28 10:12:38.985613+08	0	0	\N	2019-11-06 13:49:11.869284+08	\N	\N	1	2019-05-28
1441	-200	服饰美容	0	理发充值	2019-05-28 10:12:14.499585+08	0	0	\N	2019-11-06 13:49:11.870587+08	\N	\N	1	2019-05-28
1440	-89	小孩玩具	0	画板	2019-05-28 10:11:44.020867+08	0	0	\N	2019-11-06 13:49:11.871932+08	\N	\N	1	2019-05-28
1439	-22	生活日用	0	工具	2019-05-28 10:11:21.742579+08	0	0	\N	2019-11-06 13:49:11.873282+08	\N	\N	1	2019-05-28
1438	-33	生活日用	0	手机壳	2019-05-26 11:33:36.772155+08	0	0	\N	2019-11-06 13:49:11.874745+08	\N	\N	2	2019-05-26
1437	-5133	生活日用	0	三星手机	2019-05-26 11:33:26.696326+08	0	0	\N	2019-11-06 13:49:11.876052+08	\N	\N	2	2019-05-26
1436	-30	服饰美容	0	小背包	2019-05-26 11:33:04.934693+08	0	0	\N	2019-11-06 13:49:11.877341+08	\N	\N	2	2019-05-26
1435	-170	生活日用	0	冰藤席	2019-05-26 11:32:54.111088+08	0	0	\N	2019-11-06 13:49:11.878663+08	\N	\N	2	2019-05-26
1434	-60	服饰美容	0	运动套装	2019-05-26 11:32:28.158983+08	0	0	\N	2019-11-06 13:49:11.879915+08	\N	\N	2	2019-05-26
1433	-130	服饰美容	0	鞋子	2019-05-26 11:32:07.415661+08	0	0	\N	2019-11-06 13:49:11.881261+08	\N	\N	2	2019-05-26
1432	-48	小孩玩具	0	电池	2019-05-26 11:31:36.438039+08	0	0	\N	2019-11-06 13:49:11.882559+08	\N	\N	2	2019-05-26
1430	-33	生活日用	0	手机壳	2019-05-24 23:39:44.894008+08	0	0	\N	2019-11-06 13:49:11.885571+08	\N	\N	2	2019-05-24
1429	-33	生活日用	0	手机壳	2019-05-24 23:39:43.43634+08	0	0	\N	2019-11-06 13:49:11.886901+08	\N	\N	2	2019-05-24
1428	-40	小孩生活用品	0	睡衣	2019-05-24 23:39:11.909539+08	0	0	\N	2019-11-06 13:49:11.88815+08	\N	\N	2	2019-05-24
1427	-256	小孩服饰	0	鞋子阿迪达斯	2019-05-24 23:38:53.804269+08	0	0	\N	2019-11-06 13:49:11.889435+08	\N	\N	2	2019-05-24
1426	-37	生活日用	0	美购	2019-05-24 23:38:26.263426+08	0	0	\N	2019-11-06 13:49:11.890847+08	\N	\N	2	2019-05-24
1424	-67	小孩生活用品	0	洗衣液	2019-05-24 23:37:14.789532+08	0	0	\N	2019-11-06 13:49:11.892148+08	\N	\N	2	2019-05-24
1423	-128	小孩服饰	0	背包	2019-05-24 23:36:36.818068+08	0	0	\N	2019-11-06 13:49:11.89358+08	\N	\N	2	2019-05-24
1422	-49	生活日用	0	冰丝袖	2019-05-24 23:36:12.406985+08	0	0	\N	2019-11-06 13:49:11.894898+08	\N	\N	2	2019-05-24
1421	-35	生活日用	0	美购	2019-05-24 23:35:50.119401+08	0	0	\N	2019-11-06 13:49:11.896204+08	\N	\N	2	2019-05-24
1420	-120	饮食	0	私家小厨	2019-05-24 23:35:12.726696+08	0	0	\N	2019-11-06 13:49:11.897511+08	\N	\N	2	2019-05-24
1419	-37	饮食	0	肯德基	2019-05-24 23:34:26.203205+08	0	0	\N	2019-11-06 13:49:11.898873+08	\N	\N	2	2019-05-24
1572	-40	饮食	0	水果	2019-07-10 23:13:42.098847+08	0	0	\N	2019-11-06 13:49:11.672018+08	\N	\N	1	2019-07-10
1571	-49	住房缴费	0	电费景湖	2019-07-10 23:13:41.753459+08	0	0	\N	2019-11-06 13:49:11.673333+08	\N	\N	2	2019-07-10
1570	-62	住房缴费	0	电费东兴	2019-07-10 23:13:06.308205+08	0	0	\N	2019-11-06 13:49:11.67464+08	\N	\N	2	2019-07-10
1569	-260	饮食	0	超市	2019-07-10 23:13:02.735111+08	0	0	\N	2019-11-06 13:49:11.675895+08	\N	\N	1	2019-07-10
1568	-66	文教娱乐	0	AWS	2019-07-10 23:12:47.036877+08	0	0	\N	2019-11-06 13:49:11.678554+08	\N	\N	1	2019-07-10
1567	-160	饮食	0	凉鞋	2019-07-10 23:12:36.202374+08	0	0	\N	2019-11-06 13:49:11.679857+08	\N	\N	2	2019-07-10
1565	-260	小孩奶粉	0	卡洛塔尼奶粉	2019-07-10 23:10:06.404997+08	0	0	\N	2019-11-06 13:49:11.682452+08	\N	\N	1	2019-07-10
1564	-5	文教娱乐	0	域名	2019-07-10 23:09:15.314019+08	0	0	\N	2019-11-06 13:49:11.683799+08	\N	\N	1	2019-07-10
1563	-120	文教娱乐	0	VPS	2019-07-10 23:09:01.652478+08	0	0	\N	2019-11-06 13:49:11.685157+08	\N	\N	1	2019-07-10
1562	-10	饮食	0	水果	2019-07-10 23:08:37.56324+08	0	0	\N	2019-11-06 13:49:11.686436+08	\N	\N	1	2019-07-10
1561	-24	生活日用	0	手机壳	2019-07-10 23:08:17.313788+08	0	0	\N	2019-11-06 13:49:11.687701+08	\N	\N	1	2019-07-10
1560	-14	饮食	0	一鸣早餐	2019-07-10 23:07:56.648394+08	0	0	\N	2019-11-06 13:49:11.689013+08	\N	\N	1	2019-07-10
1559	-11	饮食	0	水果	2019-07-10 23:07:17.038942+08	0	0	\N	2019-11-06 13:49:11.690343+08	\N	\N	1	2019-07-10
1558	-16	饮食	0	一鸣早餐	2019-07-10 23:06:49.200178+08	0	0	\N	2019-11-06 13:49:11.691872+08	\N	\N	1	2019-07-10
1557	-100	住房缴费	0	天然气预存	2019-07-02 14:28:56.124319+08	0	0	\N	2019-11-06 13:49:11.693162+08	\N	\N	2	2019-07-02
1556	-27	住房缴费	0	天然气	2019-07-02 14:27:48.811356+08	0	0	\N	2019-11-06 13:49:11.694489+08	\N	\N	2	2019-07-02
1555	-24	住房缴费	0	自家水费	2019-07-02 13:59:38.294163+08	0	0	\N	2019-11-06 13:49:11.695771+08	\N	\N	2	2019-07-02
1554	-27	生活日用	0	美购	2019-07-02 13:58:55.459243+08	0	0	\N	2019-11-06 13:49:11.697037+08	\N	\N	2	2019-07-02
1553	-42	小孩玩具	0	汪汪玩具	2019-07-02 13:42:50.492929+08	0	0	\N	2019-11-06 13:49:11.698356+08	\N	\N	2	2019-07-02
1552	-8	饮食	0	粽子	2019-07-02 13:42:23.775448+08	0	0	\N	2019-11-06 13:49:11.699642+08	\N	\N	2	2019-07-02
1551	-35	小孩其他	0	小杯子	2019-06-30 18:17:22.620689+08	0	0	\N	2019-11-06 13:49:11.700897+08	\N	\N	1	2019-06-30
1550	-239	饮食	0	宁海吃饭	2019-06-30 18:16:57.150404+08	0	0	\N	2019-11-06 13:49:11.702275+08	\N	\N	1	2019-06-30
1549	-5	饮食	0	早餐	2019-06-28 22:39:56.87101+08	0	0	\N	2019-11-06 13:49:11.703957+08	\N	\N	2	2019-06-28
1548	-1000	交通出行	0	油卡	2019-06-28 22:39:45.002407+08	0	0	\N	2019-11-06 13:49:11.705299+08	\N	\N	2	2019-06-28
1547	-219	小孩其他	0	钙片	2019-06-28 22:24:47.121802+08	0	0	\N	2019-11-06 13:49:11.706688+08	\N	\N	1	2019-06-28
1546	-11	饮食	0	早餐	2019-06-28 21:40:18.359817+08	0	0	\N	2019-11-06 13:49:11.70799+08	\N	\N	1	2019-06-28
1545	-60	饮食	0	美购超市	2019-06-28 21:40:00.602568+08	0	0	\N	2019-11-06 13:49:11.709474+08	\N	\N	1	2019-06-28
1544	-9	饮食	0	早餐	2019-06-28 21:39:40.024485+08	0	0	\N	2019-11-06 13:49:11.710822+08	\N	\N	1	2019-06-28
1543	-9	饮食	0	早餐	2019-06-28 21:39:22.662057+08	0	0	\N	2019-11-06 13:49:11.712157+08	\N	\N	1	2019-06-28
1542	-15	饮食	0	水果	2019-06-28 21:39:08.960367+08	0	0	\N	2019-11-06 13:49:11.713544+08	\N	\N	1	2019-06-28
1541	-6	饮食	0	早餐	2019-06-28 21:38:58.657171+08	0	0	\N	2019-11-06 13:49:11.714915+08	\N	\N	1	2019-06-28
1540	-10	饮食	0	早餐	2019-06-28 21:38:44.595436+08	0	0	\N	2019-11-06 13:49:11.716356+08	\N	\N	1	2019-06-28
1539	-5	饮食	0	早餐	2019-06-28 21:38:36.983756+08	0	0	\N	2019-11-06 13:49:11.717694+08	\N	\N	1	2019-06-28
1537	-84	饮食	0	美购超市	2019-06-28 21:38:07.963803+08	0	0	\N	2019-11-06 13:49:11.720301+08	\N	\N	1	2019-06-28
1536	-35	小孩玩具	0	汪汪队纸贴	2019-06-28 21:37:52.905414+08	0	0	\N	2019-11-06 13:49:11.72186+08	\N	\N	1	2019-06-28
1535	-64	生活日用	0	剃须刀充电器x2	2019-06-28 21:37:28.157047+08	0	0	\N	2019-11-06 13:49:11.723237+08	\N	\N	1	2019-06-28
1534	-11	饮食	0	早餐	2019-06-28 21:36:55.137768+08	0	0	\N	2019-11-06 13:49:11.724481+08	\N	\N	1	2019-06-28
1533	-110	饮食	0	超市	2019-06-28 21:36:32.013748+08	0	0	\N	2019-11-06 13:49:11.725912+08	\N	\N	1	2019-06-28
1532	-11	饮食	0	早餐	2019-06-28 21:36:10.492692+08	0	0	\N	2019-11-06 13:49:11.727321+08	\N	\N	1	2019-06-28
1531	-15	饮食	0	早餐	2019-06-28 21:35:57.288648+08	0	0	\N	2019-11-06 13:49:11.728682+08	\N	\N	1	2019-06-28
1530	-25	饮食	0	饮食	2019-06-28 21:35:39.995694+08	0	0	\N	2019-11-06 13:49:11.730041+08	\N	\N	1	2019-06-28
1529	-292	饮食	0	临安府	2019-06-28 21:35:20.617693+08	0	0	\N	2019-11-06 13:49:11.733089+08	\N	\N	1	2019-06-28
1528	-16	饮食	0	零食	2019-06-28 21:34:50.875306+08	0	0	\N	2019-11-06 13:49:11.73447+08	\N	\N	1	2019-06-28
1527	-67	饮食	0	欧文	2019-06-28 21:34:34.074208+08	0	0	\N	2019-11-06 13:49:11.736066+08	\N	\N	1	2019-06-28
1526	-60	饮食	0	美购超市	2019-06-28 21:34:20.717035+08	0	0	\N	2019-11-06 13:49:11.737384+08	\N	\N	1	2019-06-28
1524	45677	收入	1	19年1-3月提成	2019-06-26 07:25:18.404718+08	0	0	\N	2019-12-09 16:59:22.789622+08	\N	\N	2	2019-06-26
1523	8868	收入	1	6月工资	2019-06-26 07:23:12.699632+08	0	0	\N	2019-12-09 16:59:22.791706+08	\N	\N	2	2019-06-26
1522	-20	生活日用	0	瓶子	2019-06-26 07:19:23.314949+08	0	0	\N	2019-11-06 13:49:11.742804+08	\N	\N	2	2019-06-26
1521	-33	饮食	0	水果	2019-06-26 07:17:41.213723+08	0	0	\N	2019-11-06 13:49:11.744045+08	\N	\N	2	2019-06-26
1520	-60	饮食	0	零食	2019-06-21 23:31:34.361449+08	0	0	\N	2019-11-06 13:49:11.745442+08	\N	\N	2	2019-06-21
1519	-35	饮食	0	外卖	2019-06-21 23:29:58.930612+08	0	0	\N	2019-11-06 13:49:11.746812+08	\N	\N	2	2019-06-21
1518	-68	生活日用	0	食用油	2019-06-21 23:28:02.968875+08	0	0	\N	2019-11-06 13:49:11.748124+08	\N	\N	2	2019-06-21
1517	-147	生活日用	0	油	2019-06-21 23:27:47.095664+08	0	0	\N	2019-11-06 13:49:11.749425+08	\N	\N	2	2019-06-21
1516	-170	生活日用	0	餐巾纸	2019-06-21 23:26:59.260994+08	0	0	\N	2019-11-06 13:49:11.75097+08	\N	\N	2	2019-06-21
1514	-183	生活日用	0	大米和油	2019-06-21 23:25:44.522213+08	0	0	\N	2019-11-06 13:49:11.753831+08	\N	\N	2	2019-06-21
1513	-485	小孩文具	0	Hape玩具	2019-06-21 23:24:48.625048+08	0	0	\N	2019-11-06 13:49:11.755324+08	\N	\N	2	2019-06-21
1512	-485	人情往来	0	猫咪Hape	2019-06-21 23:24:28.361385+08	0	0	\N	2019-11-06 13:49:11.756572+08	\N	\N	2	2019-06-21
1511	-28	饮食	0	美购	2019-06-21 23:23:45.118825+08	0	0	\N	2019-11-06 13:49:11.758022+08	\N	\N	2	2019-06-21
1510	-27	小孩服饰	0	防蚊裤	2019-06-21 23:23:25.102114+08	0	0	\N	2019-11-06 13:49:11.759313+08	\N	\N	2	2019-06-21
1509	-68	服饰美容	0	冰丝裤2双	2019-06-21 23:23:01.430656+08	0	0	\N	2019-11-06 13:49:11.7606+08	\N	\N	2	2019-06-21
1508	-22	服饰美容	0	丝网6双	2019-06-21 23:22:23.014527+08	0	0	\N	2019-11-06 13:49:11.762108+08	\N	\N	2	2019-06-21
1507	-99	服饰美容	0	睡衣2件	2019-06-21 23:22:03.834094+08	0	0	\N	2019-11-06 13:49:11.763564+08	\N	\N	2	2019-06-21
1506	-6	饮食	0	大饼2个	2019-06-21 23:21:41.113572+08	0	0	\N	2019-11-06 13:49:11.765091+08	\N	\N	2	2019-06-21
1505	-25	饮食	0	零食	2019-06-21 23:21:14.836909+08	0	0	\N	2019-11-06 13:49:11.76686+08	\N	\N	2	2019-06-21
1504	-15	生活日用	0	美购	2019-06-21 23:20:56.259407+08	0	0	\N	2019-11-06 13:49:11.768317+08	\N	\N	2	2019-06-21
1503	-36	饮食	0	野米	2019-06-21 23:20:30.519385+08	0	0	\N	2019-11-06 13:49:11.769637+08	\N	\N	2	2019-06-21
1502	-12	饮食	0	早餐	2019-06-21 23:20:09.816463+08	0	0	\N	2019-11-06 13:49:11.771+08	\N	\N	2	2019-06-21
1501	-84	人情往来	0	澳贝玩具弯弯	2019-06-21 23:19:28.435052+08	0	0	\N	2019-11-06 13:49:11.772495+08	\N	\N	2	2019-06-21
1500	-52	小孩服饰	0	防蚊裤2条	2019-06-21 23:18:50.770669+08	0	0	\N	2019-11-06 13:49:11.773799+08	\N	\N	2	2019-06-21
1499	-140	饮食	0	2袋10kg大米，2袋5kg大米	2019-06-13 12:09:19.29221+08	0	0	\N	2019-11-06 13:49:11.775058+08	\N	\N	2	2019-06-13
1498	-110	饮食	0	三只松鼠零食	2019-06-13 12:08:35.48117+08	0	0	\N	2019-11-06 13:49:11.776312+08	\N	\N	2	2019-06-13
1497	-14	服饰美容	0	拖鞋	2019-06-13 12:08:02.187161+08	0	0	\N	2019-11-06 13:49:11.777604+08	\N	\N	2	2019-06-13
1525	25448	收入	1	18年提成	2019-06-26 21:44:24.923027+08	0	0	\N	2019-12-09 16:59:22.787721+08	\N	\N	2	2019-06-26
1652	-60	服饰美容	0	空调被	2019-08-08 19:25:02.110605+08	0	0	\N	2019-11-06 13:49:11.554644+08	\N	\N	2	2019-08-08
1651	-45	小孩服饰	0	睡衣	2019-08-08 19:24:28.206852+08	0	0	\N	2019-11-06 13:49:11.55625+08	\N	\N	2	2019-08-08
1649	-25	饮食	0	牛肉面	2019-08-08 19:23:42.72342+08	0	0	\N	2019-11-06 13:49:11.558074+08	\N	\N	2	2019-08-08
1648	-15	生活日用	0	擦布	2019-08-08 19:23:28.311022+08	0	0	\N	2019-11-06 13:49:11.559764+08	\N	\N	2	2019-08-08
1647	-139	住房缴费	0	东兴电费	2019-08-08 19:23:08.202235+08	0	0	\N	2019-11-06 13:49:11.561562+08	\N	\N	2	2019-08-08
1646	-5	交通出行	0	停车费	2019-08-08 19:22:42.368618+08	0	0	\N	2019-11-06 13:49:11.562997+08	\N	\N	2	2019-08-08
1645	-100	住房缴费	0	景湖电费	2019-08-08 19:22:28.141991+08	0	0	\N	2019-11-06 13:49:11.564457+08	\N	\N	2	2019-08-08
1644	-40	饮食	0	超市	2019-08-08 19:22:11.137748+08	0	0	\N	2019-11-06 13:49:11.56585+08	\N	\N	2	2019-08-08
1643	-100	饮食	0	老婆大人	2019-08-08 19:21:22.530205+08	0	0	\N	2019-11-06 13:49:11.567148+08	\N	\N	2	2019-08-08
1642	-26	饮食	0	美购	2019-08-08 19:21:06.476522+08	0	0	\N	2019-11-06 13:49:11.568441+08	\N	\N	2	2019-08-08
1641	-25	小孩服饰	0	睡衣	2019-08-08 19:20:50.791145+08	0	0	\N	2019-11-06 13:49:11.569769+08	\N	\N	2	2019-08-08
1640	-10	饮食	0	饮料	2019-08-08 19:20:32.440378+08	0	0	\N	2019-11-06 13:49:11.571315+08	\N	\N	2	2019-08-08
1639	-29	饮食	0	绿姿	2019-08-08 19:20:14.525062+08	0	0	\N	2019-11-06 13:49:11.572666+08	\N	\N	2	2019-08-08
1638	-30	生活日用	0	数据线	2019-08-08 19:19:55.05405+08	0	0	\N	2019-11-06 13:49:11.574072+08	\N	\N	2	2019-08-08
1637	-55	饮食	0	美购	2019-08-08 19:19:37.586328+08	0	0	\N	2019-11-06 13:49:11.575483+08	\N	\N	2	2019-08-08
1636	-283	生活日用	0	消毒柜	2019-08-08 19:19:23.411571+08	0	0	\N	2019-11-06 13:49:11.576823+08	\N	\N	2	2019-08-08
1634	-2822	小孩奶粉	0	卡洛塔尼三段*12+合利他命	2019-08-05 10:52:46.764446+08	0	0	\N	2019-11-06 13:49:11.579602+08	\N	\N	1	2019-08-05
1633	-20	服饰美容	0	雨衣	2019-08-05 10:50:22.612038+08	0	0	\N	2019-11-06 13:49:11.580974+08	\N	\N	1	2019-08-05
1632	-118	服饰美容	0	maxwin	2019-08-05 10:49:52.483383+08	0	0	\N	2019-11-06 13:49:11.582312+08	\N	\N	1	2019-08-05
1631	-17	饮食	0	零食	2019-08-05 10:49:25.01083+08	0	0	\N	2019-11-06 13:49:11.583907+08	\N	\N	1	2019-08-05
1630	-11	饮食	0	早餐	2019-08-05 10:49:16.255363+08	0	0	\N	2019-11-06 13:49:11.585221+08	\N	\N	1	2019-08-05
1616	10125	收入	1	工资	2019-07-27 20:59:54.0616+08	0	0	\N	2019-12-09 16:59:22.786052+08	\N	\N	2	2019-07-27
1628	-157	饮食	0	两箱葡萄	2019-07-31 17:46:26.460228+08	0	0	\N	2019-11-06 13:49:11.587847+08	\N	\N	1	2019-07-31
1626	-40	饮食	0	美购	2019-07-31 17:45:52.397562+08	0	0	\N	2019-11-06 13:49:11.589243+08	\N	\N	1	2019-07-31
1625	-159	小孩玩具	0	小孩玩具	2019-07-31 17:45:14.48011+08	0	0	\N	2019-11-06 13:49:11.591044+08	\N	\N	1	2019-07-31
1624	-10	饮食	0	迪斯尼水	2019-07-31 17:44:57.642997+08	0	0	\N	2019-11-06 13:49:11.592463+08	\N	\N	1	2019-07-31
1623	-46	饮食	0	美购	2019-07-31 17:44:37.08693+08	0	0	\N	2019-11-06 13:49:11.59383+08	\N	\N	1	2019-07-31
1622	-39	饮食	0	重庆小面	2019-07-31 17:44:21.889053+08	0	0	\N	2019-11-06 13:49:11.595142+08	\N	\N	1	2019-07-31
1621	-22	饮食	0	夜宵	2019-07-31 17:44:03.559655+08	0	0	\N	2019-11-06 13:49:11.596495+08	\N	\N	1	2019-07-31
1620	-438	文教娱乐	0	树莓派4	2019-07-31 17:43:46.902398+08	0	0	\N	2019-11-06 13:49:11.597846+08	\N	\N	1	2019-07-31
1619	-15	饮食	0	一鸣早餐	2019-07-31 17:43:21.715714+08	0	0	\N	2019-11-06 13:49:11.599166+08	\N	\N	1	2019-07-31
1618	-125	生活日用	0	电动牙刷头三个	2019-07-27 21:00:29.139218+08	0	0	\N	2019-11-06 13:49:11.60048+08	\N	\N	2	2019-07-27
1617	-20	交通出行	0	高速	2019-07-27 21:00:08.940375+08	0	0	\N	2019-11-06 13:49:11.601902+08	\N	\N	2	2019-07-27
1615	-2000	交通出行	0	油卡	2019-07-27 20:58:20.540464+08	0	0	\N	2019-11-06 13:49:11.60457+08	\N	\N	2	2019-07-27
1614	-5	饮食	0	停车费	2019-07-27 20:57:47.258906+08	0	0	\N	2019-11-06 13:49:11.606161+08	\N	\N	2	2019-07-27
1613	-42	饮食	0	肯德基	2019-07-27 20:57:36.392758+08	0	0	\N	2019-11-06 13:49:11.607524+08	\N	\N	2	2019-07-27
1612	-12	饮食	0	薯条	2019-07-27 20:56:56.667164+08	0	0	\N	2019-11-06 13:49:11.608822+08	\N	\N	2	2019-07-27
1611	-30	饮食	0	欧文	2019-07-27 20:56:35.931576+08	0	0	\N	2019-11-06 13:49:11.610307+08	\N	\N	2	2019-07-27
1610	-23	饮食	0	西瓜	2019-07-27 20:55:52.892228+08	0	0	\N	2019-11-06 13:49:11.612017+08	\N	\N	2	2019-07-27
1609	-125	服饰美容	0	连体衣	2019-07-27 20:55:24.251127+08	0	0	\N	2019-11-06 13:49:11.6137+08	\N	\N	2	2019-07-27
1608	-61	饮食	0	美购	2019-07-27 20:55:06.026082+08	0	0	\N	2019-11-06 13:49:11.615176+08	\N	\N	2	2019-07-27
1606	-322	服饰美容	0	眼镜	2019-07-22 19:37:40.064293+08	0	0	\N	2019-11-06 13:49:11.618223+08	\N	\N	2	2019-07-22
1605	-85	饮食	0	午餐	2019-07-22 19:37:28.887043+08	0	0	\N	2019-11-06 13:49:11.619622+08	\N	\N	2	2019-07-22
1604	-506	文教娱乐	0	按摩脚三人	2019-07-22 19:37:14.359041+08	0	0	\N	2019-11-06 13:49:11.62098+08	\N	\N	2	2019-07-22
1603	-180	交通出行	0	高速上海到宁波	2019-07-22 19:36:33.260357+08	0	0	\N	2019-11-06 13:49:11.622346+08	\N	\N	2	2019-07-22
1602	-180	交通出行	0	高速费宁波到上海	2019-07-20 17:16:07.935033+08	0	0	\N	2019-11-06 13:49:11.623657+08	\N	\N	2	2019-07-20
1601	-75	饮食	0	午餐	2019-07-20 17:15:17.851018+08	0	0	\N	2019-11-06 13:49:11.625071+08	\N	\N	2	2019-07-20
1600	-28	饮食	0	包子	2019-07-20 17:14:40.104658+08	0	0	\N	2019-11-06 13:49:11.626404+08	\N	\N	2	2019-07-20
1599	-4	饮食	0	甜不辣	2019-07-20 17:14:23.930361+08	0	0	\N	2019-11-06 13:49:11.627728+08	\N	\N	2	2019-07-20
1598	-238	生活日用	0	不粘锅和奶锅	2019-07-20 17:14:07.111496+08	0	0	\N	2019-11-06 13:49:11.629025+08	\N	\N	2	2019-07-20
1597	-17	服饰美容	0	帽子	2019-07-20 17:13:43.49591+08	0	0	\N	2019-11-06 13:49:11.630328+08	\N	\N	2	2019-07-20
1596	-11	生活日用	0	勺子	2019-07-20 17:13:23.691667+08	0	0	\N	2019-11-06 13:49:11.631914+08	\N	\N	2	2019-07-20
1594	-74	饮食	0	棒冰	2019-07-20 17:12:44.436427+08	0	0	\N	2019-11-06 13:49:11.633253+08	\N	\N	2	2019-07-20
1593	-24	饮食	0	服饰	2019-07-20 17:12:29.844594+08	0	0	\N	2019-11-06 13:49:11.634834+08	\N	\N	2	2019-07-20
1592	-6	饮食	0	臭豆腐	2019-07-20 17:11:31.18464+08	0	0	\N	2019-11-06 13:49:11.636123+08	\N	\N	2	2019-07-20
1591	-7	饮食	0	大饼	2019-07-20 17:11:19.403781+08	0	0	\N	2019-11-06 13:49:11.63816+08	\N	\N	2	2019-07-20
1590	-6	饮食	0	麦饼	2019-07-20 17:10:45.522674+08	0	0	\N	2019-11-06 13:49:11.641487+08	\N	\N	2	2019-07-20
1589	-180	交通出行	0	汽车保养	2019-07-20 17:10:18.613283+08	0	0	\N	2019-11-06 13:49:11.644748+08	\N	\N	2	2019-07-20
1588	-35	生活日用	0	煤气灶贴	2019-07-20 17:10:01.626858+08	0	0	\N	2019-11-06 13:49:11.648326+08	\N	\N	2	2019-07-20
1587	-24	饮食	0	茶香香	2019-07-20 17:09:33.034017+08	0	0	\N	2019-11-06 13:49:11.651635+08	\N	\N	2	2019-07-20
1586	-33	生活日用	0	厨房贴纸	2019-07-20 17:08:56.064838+08	0	0	\N	2019-11-06 13:49:11.653418+08	\N	\N	2	2019-07-20
1585	-1129	饮食	0	请贝联聚餐	2019-07-13 10:50:55.266883+08	0	0	\N	2019-11-06 13:49:11.654781+08	\N	\N	2	2019-07-13
1584	-112	住房缴费	0	水费东兴	2019-07-13 10:50:36.641957+08	0	0	\N	2019-11-06 13:49:11.656248+08	\N	\N	2	2019-07-13
1583	-537	交通出行	0	机油2瓶	2019-07-10 23:18:43.512409+08	0	0	\N	2019-11-06 13:49:11.657628+08	\N	\N	2	2019-07-10
1582	-18	生活日用	0	垃圾桶	2019-07-10 23:18:08.553734+08	0	0	\N	2019-11-06 13:49:11.65931+08	\N	\N	2	2019-07-10
1581	-20	饮食	0	外卖	2019-07-10 23:17:22.751533+08	0	0	\N	2019-11-06 13:49:11.660749+08	\N	\N	2	2019-07-10
1580	-30	饮食	0	粽子	2019-07-10 23:16:52.347382+08	0	0	\N	2019-11-06 13:49:11.662193+08	\N	\N	2	2019-07-10
1578	-35	生活日用	0	卷筒清洁	2019-07-10 23:16:15.303663+08	0	0	\N	2019-11-06 13:49:11.664932+08	\N	\N	2	2019-07-10
1577	-27	生活日用	0	蟑螂贴	2019-07-10 23:15:46.562424+08	0	0	\N	2019-11-06 13:49:11.666267+08	\N	\N	2	2019-07-10
1576	-20	服饰美容	0	T 恤	2019-07-10 23:15:26.433065+08	0	0	\N	2019-11-06 13:49:11.66768+08	\N	\N	2	2019-07-10
1574	-100	饮食	0	一鸣	2019-07-10 23:14:46.694518+08	0	0	\N	2019-11-06 13:49:11.669145+08	\N	\N	2	2019-07-10
1629	14422	收入	1	工资	2019-07-31 17:50:13.323706+08	0	0	\N	2019-12-09 16:59:22.783792+08	\N	\N	1	2019-07-31
1730	-34	住房缴费	0	景湖水岸水费	2019-09-05 21:11:18.47383+08	0	0	\N	2019-11-06 13:49:11.435492+08	\N	\N	2	2019-09-05
1729	-34	住房缴费	0	景湖水岸水费	2019-09-05 21:10:32.129147+08	0	0	\N	2019-11-06 13:49:11.436795+08	\N	\N	2	2019-09-05
1728	-123	住房缴费	0	景湖水岸电费	2019-09-05 21:09:57.534853+08	0	0	\N	2019-11-06 13:49:11.438185+08	\N	\N	2	2019-09-05
1727	-103	饮食	0	水晶米10kg两袋	2019-09-02 11:56:09.116035+08	0	0	\N	2019-11-06 13:49:11.439804+08	\N	\N	2	2019-09-02
1726	-1550	生活日用	0	车套	2019-09-01 05:39:12.664409+08	0	0	\N	2019-11-06 13:49:11.441214+08	\N	\N	2	2019-09-01
1725	-100	饮食	0	购物	2019-09-01 05:37:48.439784+08	0	0	\N	2019-11-06 13:49:11.443652+08	\N	\N	2	2019-09-01
1724	-79	饮食	0	牛肉干	2019-09-01 05:37:28.1911+08	0	0	\N	2019-11-06 13:49:11.445078+08	\N	\N	2	2019-09-01
1723	-12	生活日用	0	君子兰	2019-09-01 05:36:19.531447+08	0	0	\N	2019-11-06 13:49:11.44653+08	\N	\N	2	2019-09-01
1722	-8	服饰美容	0	头绳	2019-09-01 05:35:59.377287+08	0	0	\N	2019-11-06 13:49:11.447917+08	\N	\N	2	2019-09-01
1721	-12	生活日用	0	洗碗布	2019-09-01 05:35:41.273759+08	0	0	\N	2019-11-06 13:49:11.449307+08	\N	\N	2	2019-09-01
1720	-8	生活日用	0	发财树	2019-09-01 05:35:11.172281+08	0	0	\N	2019-11-06 13:49:11.451635+08	\N	\N	2	2019-09-01
1719	-14	生活日用	0	一次性洗碗巾	2019-09-01 05:34:54.210405+08	0	0	\N	2019-11-06 13:49:11.453012+08	\N	\N	2	2019-09-01
1718	-3	饮食	0	葱油饼	2019-09-01 05:33:21.663918+08	0	0	\N	2019-11-06 13:49:11.454454+08	\N	\N	2	2019-09-01
1717	-50	生活日用	0	美购	2019-09-01 05:33:03.182575+08	0	0	\N	2019-11-06 13:49:11.455845+08	\N	\N	2	2019-09-01
1716	-44	服饰美容	0	套装	2019-09-01 05:32:29.95261+08	0	0	\N	2019-11-06 13:49:11.457319+08	\N	\N	2	2019-09-01
1714	-17	饮食	0	牛肉面	2019-09-01 05:31:29.442172+08	0	0	\N	2019-11-06 13:49:11.459965+08	\N	\N	2	2019-09-01
1713	-20	小孩生活用品	0	马桶	2019-09-01 05:31:14.188212+08	0	0	\N	2019-11-06 13:49:11.461561+08	\N	\N	2	2019-09-01
1712	-5	生活日用	0	晾衣绳	2019-09-01 05:30:50.269529+08	0	0	\N	2019-11-06 13:49:11.462919+08	\N	\N	2	2019-09-01
1711	-22	饮食	0	苹果	2019-09-01 05:30:12.047096+08	0	0	\N	2019-11-06 13:49:11.464255+08	\N	\N	2	2019-09-01
1710	-23	饮食	0	美团	2019-09-01 05:29:56.223117+08	0	0	\N	2019-11-06 13:49:11.465785+08	\N	\N	2	2019-09-01
1709	-21	生活日用	0	吸水地毯	2019-09-01 05:29:34.633726+08	0	0	\N	2019-11-06 13:49:11.467091+08	\N	\N	2	2019-09-01
1708	-210	生活日用	0	布贴*4+喷雾*1	2019-08-28 14:44:06.697938+08	0	0	\N	2019-11-06 13:49:11.468396+08	\N	\N	1	2019-08-28
1707	-11	饮食	0	绿姿蛋糕	2019-08-28 14:41:35.526706+08	0	0	\N	2019-11-06 13:49:11.469965+08	\N	\N	1	2019-08-28
1706	-358	饮食	0	生日蛋糕	2019-08-28 14:41:11.232188+08	0	0	\N	2019-11-06 13:49:11.471398+08	\N	\N	1	2019-08-28
1705	-260	饮食	0	妈妈菜	2019-08-28 14:40:39.386011+08	0	0	\N	2019-11-06 13:49:11.472885+08	\N	\N	1	2019-08-28
1704	-8	饮食	0	肠粉	2019-08-28 14:39:56.823904+08	0	0	\N	2019-11-06 13:49:11.474261+08	\N	\N	1	2019-08-28
1703	-8	饮食	0	饮料	2019-08-28 14:39:41.826238+08	0	0	\N	2019-11-06 13:49:11.475628+08	\N	\N	1	2019-08-28
1702	-50	生活日用	0	信用卡还款	2019-08-28 14:39:00.351525+08	0	0	\N	2019-11-06 13:49:11.476967+08	\N	\N	1	2019-08-28
1701	-108	交通出行	0	打车	2019-08-26 06:53:01.399268+08	0	0	\N	2019-11-06 13:49:11.479333+08	\N	\N	1	2019-08-26
1700	-8	饮食	0	饮料	2019-08-26 06:52:45.774803+08	0	0	\N	2019-11-06 13:49:11.482168+08	\N	\N	1	2019-08-26
1698	-60	交通出行	0	打车	2019-08-25 21:34:10.827115+08	0	0	\N	2019-11-06 13:49:11.488085+08	\N	\N	1	2019-08-25
1697	-60	饮食	0	超市	2019-08-25 21:33:20.562752+08	0	0	\N	2019-11-06 13:49:11.491482+08	\N	\N	1	2019-08-25
1696	-239	生活日用	0	背包	2019-08-25 21:32:40.921308+08	0	0	\N	2019-11-06 13:49:11.493315+08	\N	\N	1	2019-08-25
1695	-69	生活日用	0	望远镜	2019-08-25 21:32:24.949124+08	0	0	\N	2019-11-06 13:49:11.494735+08	\N	\N	1	2019-08-25
1694	-58	服饰美容	0	lgd衣服	2019-08-25 21:32:11.263243+08	0	0	\N	2019-11-06 13:49:11.496093+08	\N	\N	1	2019-08-25
1693	-20	交通出行	0	高速	2019-08-25 21:31:44.343589+08	0	0	\N	2019-11-06 13:49:11.497673+08	\N	\N	1	2019-08-25
1692	-120	生活日用	0	生活日用	2019-08-25 21:31:21.131043+08	0	0	\N	2019-11-06 13:49:11.499432+08	\N	\N	1	2019-08-25
1690	-10	饮食	0	零食	2019-08-25 21:30:26.134701+08	0	0	\N	2019-11-06 13:49:11.500846+08	\N	\N	1	2019-08-25
1689	-6	饮食	0	早餐	2019-08-25 21:30:07.83638+08	0	0	\N	2019-11-06 13:49:11.502187+08	\N	\N	1	2019-08-25
1688	-11	饮食	0	一鸣早餐	2019-08-25 21:29:51.02019+08	0	0	\N	2019-11-06 13:49:11.503662+08	\N	\N	1	2019-08-25
1687	-39	生活日用	0	鞋子	2019-08-25 21:29:29.450498+08	0	0	\N	2019-11-06 13:49:11.505252+08	\N	\N	1	2019-08-25
1686	-39	饮食	0	美购	2019-08-25 21:29:18.61609+08	0	0	\N	2019-11-06 13:49:11.506626+08	\N	\N	1	2019-08-25
1685	-288	交通出行	0	高铁x2	2019-08-25 21:28:47.8841+08	0	0	\N	2019-11-06 13:49:11.50815+08	\N	\N	1	2019-08-25
1683	-26	饮食	0	面	2019-08-25 21:27:33.955258+08	0	0	\N	2019-11-06 13:49:11.511187+08	\N	\N	1	2019-08-25
1682	-5	饮食	0	饮料	2019-08-25 21:27:24.187919+08	0	0	\N	2019-11-06 13:49:11.512472+08	\N	\N	1	2019-08-25
1681	-15	饮食	0	肯德基	2019-08-25 21:26:42.084396+08	0	0	\N	2019-11-06 13:49:11.513907+08	\N	\N	1	2019-08-25
1680	-144	交通出行	0	高铁	2019-08-25 21:25:58.542674+08	0	0	\N	2019-11-06 13:49:11.51523+08	\N	\N	1	2019-08-25
1679	-144	交通出行	0	高铁	2019-08-25 21:25:41.668871+08	0	0	\N	2019-11-06 13:49:11.51666+08	\N	\N	1	2019-08-25
1678	-6	饮食	0	早餐	2019-08-25 21:24:56.191691+08	0	0	\N	2019-11-06 13:49:11.518027+08	\N	\N	1	2019-08-25
1677	-6	饮食	0	早餐	2019-08-25 21:24:35.261063+08	0	0	\N	2019-11-06 13:49:11.519471+08	\N	\N	1	2019-08-25
1676	-79	服饰美容	0	连衣裙	2019-08-18 22:19:19.423091+08	0	0	\N	2019-11-06 13:49:11.520789+08	\N	\N	2	2019-08-18
1675	-50	小孩生活用品	0	儿童坐便器	2019-08-18 22:18:53.979325+08	0	0	\N	2019-11-06 13:49:11.52215+08	\N	\N	2	2019-08-18
1674	-17	生活日用	0	纸巾架	2019-08-18 22:18:33.816722+08	0	0	\N	2019-11-06 13:49:11.523559+08	\N	\N	2	2019-08-18
1673	-20	生活日用	0	干发帽	2019-08-18 22:18:17.029693+08	0	0	\N	2019-11-06 13:49:11.524877+08	\N	\N	2	2019-08-18
1672	-52	饮食	0	三江	2019-08-18 22:18:00.8652+08	0	0	\N	2019-11-06 13:49:11.526304+08	\N	\N	2	2019-08-18
1671	-1735	饮食	0	梅龙镇	2019-08-18 22:17:38.171745+08	0	0	\N	2019-11-06 13:49:11.527638+08	\N	\N	2	2019-08-18
1670	-61	小孩玩具	0	兔兔	2019-08-18 22:17:09.143617+08	0	0	\N	2019-11-06 13:49:11.528923+08	\N	\N	2	2019-08-18
1669	-13	饮食	0	6+7	2019-08-18 22:16:54.373236+08	0	0	\N	2019-11-06 13:49:11.530231+08	\N	\N	2	2019-08-18
1668	-475	服饰美容	0	优衣库	2019-08-18 22:16:36.117257+08	0	0	\N	2019-11-06 13:49:11.531592+08	\N	\N	2	2019-08-18
1667	-140	饮食	0	大衣	2019-08-18 22:16:17.948955+08	0	0	\N	2019-11-06 13:49:11.532909+08	\N	\N	2	2019-08-18
1666	-10	饮食	0	桃子	2019-08-18 22:15:21.667333+08	0	0	\N	2019-11-06 13:49:11.534273+08	\N	\N	2	2019-08-18
1665	-105	服饰美容	0	裤子加裙子	2019-08-18 22:14:04.747173+08	0	0	\N	2019-11-06 13:49:11.535553+08	\N	\N	2	2019-08-18
1664	-50	生活日用	0	拖把	2019-08-18 22:11:07.327547+08	0	0	\N	2019-11-06 13:49:11.537186+08	\N	\N	2	2019-08-18
1663	-60	生活日用	0	厨房用纸	2019-08-11 17:15:38.526232+08	0	0	\N	2019-11-06 13:49:11.538634+08	\N	\N	2	2019-08-11
1662	-212	服饰美容	0	白色衬衫加裤子	2019-08-10 22:48:39.834135+08	0	0	\N	2019-11-06 13:49:11.54008+08	\N	\N	2	2019-08-10
1660	-168	生活日用	0	洗衣液	2019-08-10 16:56:20.484034+08	0	0	\N	2019-11-06 13:49:11.54184+08	\N	\N	2	2019-08-10
1659	-54	饮食	0	麦当劳	2019-08-10 14:56:45.633306+08	0	0	\N	2019-11-06 13:49:11.543481+08	\N	\N	2	2019-08-10
1658	-119	服饰美容	0	连衣裙	2019-08-10 14:55:11.222848+08	0	0	\N	2019-11-06 13:49:11.545258+08	\N	\N	2	2019-08-10
1657	-64	饮食	0	牛肉面	2019-08-09 19:01:57.856486+08	0	0	\N	2019-11-06 13:49:11.546887+08	\N	\N	2	2019-08-09
1655	-72	饮食	0	美团披萨	2019-08-08 19:27:03.027139+08	0	0	\N	2019-11-06 13:49:11.549677+08	\N	\N	2	2019-08-08
1654	-68	饮食	0	芒果	2019-08-08 19:26:39.296846+08	0	0	\N	2019-11-06 13:49:11.551335+08	\N	\N	2	2019-08-08
1699	1600	收入	1	ti门票收入10400-4200-4600	2019-08-25 21:35:41.790336+08	0	0	\N	2019-12-09 16:59:22.78141+08	\N	\N	1	2019-08-25
1807	-50	生活日用	0	足浴粉	2019-10-09 13:30:29.275082+08	0	0	\N	2019-11-06 13:49:11.31305+08	\N	\N	1	2019-10-09
1806	-176	交通出行	0	上海吃喝	2019-10-09 13:29:43.771387+08	0	0	\N	2019-11-06 13:49:11.316525+08	\N	\N	1	2019-10-09
1805	-527	交通出行	0	汉庭2晚	2019-10-09 13:28:51.236735+08	0	0	\N	2019-11-06 13:49:11.320342+08	\N	\N	1	2019-10-09
1804	-103	饮食	0	服务区吃饭	2019-10-09 13:27:51.319664+08	0	0	\N	2019-11-06 13:49:11.324408+08	\N	\N	1	2019-10-09
1803	-175	交通出行	0	加油费	2019-10-01 23:39:19.128796+08	0	0	\N	2019-11-06 13:49:11.329004+08	\N	\N	1	2019-10-01
1802	-49	饮食	0	其他	2019-09-30 14:07:24.856967+08	0	0	\N	2019-11-06 13:49:11.333384+08	\N	\N	1	2019-09-30
1801	-94	小孩服饰	0	嘟嘟鞋子	2019-09-30 14:06:50.982347+08	0	0	\N	2019-11-06 13:49:11.334838+08	\N	\N	1	2019-09-30
1800	-27	饮食	0	美购	2019-09-30 14:06:25.163339+08	0	0	\N	2019-11-06 13:49:11.336325+08	\N	\N	1	2019-09-30
1799	-412	饮食	0	麦德龙	2019-09-30 14:05:24.000653+08	0	0	\N	2019-11-06 13:49:11.338065+08	\N	\N	1	2019-09-30
1798	-14	饮食	0	美购	2019-09-30 14:04:47.28246+08	0	0	\N	2019-11-06 13:49:11.339641+08	\N	\N	1	2019-09-30
1797	-8	饮食	0	早餐	2019-09-30 14:04:34.549396+08	0	0	\N	2019-11-06 13:49:11.341022+08	\N	\N	1	2019-09-30
1796	-72	饮食	0	美购	2019-09-30 14:04:20.811287+08	0	0	\N	2019-11-06 13:49:11.342444+08	\N	\N	1	2019-09-30
1795	-23	生活日用	0	裤子	2019-09-29 22:11:44.42087+08	0	0	\N	2019-11-06 13:49:11.343852+08	\N	\N	2	2019-09-29
1794	-23	饮食	0	超市	2019-09-29 22:09:55.749932+08	0	0	\N	2019-11-06 13:49:11.345275+08	\N	\N	2	2019-09-29
1793	-100	饮食	0	老婆大人	2019-09-29 22:08:49.930557+08	0	0	\N	2019-11-06 13:49:11.346598+08	\N	\N	2	2019-09-29
1792	-155	生活日用	0	置物架	2019-09-29 22:08:12.589381+08	0	0	\N	2019-11-06 13:49:11.347988+08	\N	\N	2	2019-09-29
1791	-20	饮食	0	一点点	2019-09-29 22:08:01.484278+08	0	0	\N	2019-11-06 13:49:11.3495+08	\N	\N	2	2019-09-29
1790	-9	饮食	0	大饼加肉串	2019-09-29 22:07:48.055331+08	0	0	\N	2019-11-06 13:49:11.350889+08	\N	\N	2	2019-09-29
1789	-10	生活日用	0	牙刷	2019-09-29 19:50:34.889139+08	0	0	\N	2019-11-06 13:49:11.352387+08	\N	\N	2	2019-09-29
1788	-15	生活日用	0	雨衣	2019-09-29 19:50:23.494116+08	0	0	\N	2019-11-06 13:49:11.353823+08	\N	\N	2	2019-09-29
1786	-75	生活日用	0	美购超市	2019-09-29 19:49:39.750127+08	0	0	\N	2019-11-06 13:49:11.356703+08	\N	\N	2	2019-09-29
1785	-15	生活日用	0	超市	2019-09-29 19:49:17.110788+08	0	0	\N	2019-11-06 13:49:11.358092+08	\N	\N	2	2019-09-29
1784	-40	小孩生活用品	0	马桶架	2019-09-29 19:47:36.888525+08	0	0	\N	2019-11-06 13:49:11.359564+08	\N	\N	2	2019-09-29
1783	-40	小孩生活用品	0	马桶架	2019-09-29 19:47:11.000133+08	0	0	\N	2019-11-06 13:49:11.360914+08	\N	\N	2	2019-09-29
1782	-40	小孩生活用品	0	马桶架	2019-09-29 19:47:10.992604+08	0	0	\N	2019-11-06 13:49:11.362684+08	\N	\N	2	2019-09-29
1781	-23	生活日用	0	超市	2019-09-24 12:14:52.607228+08	0	0	\N	2019-11-06 13:49:11.364216+08	\N	\N	2	2019-09-24
1780	-23	生活日用	0	超市	2019-09-24 12:14:52.598427+08	0	0	\N	2019-11-06 13:49:11.365662+08	\N	\N	2	2019-09-24
1779	-33	饮食	0	米线	2019-09-22 17:25:30.950386+08	0	0	\N	2019-11-06 13:49:11.366955+08	\N	\N	2	2019-09-22
1778	-9	饮食	0	番薯	2019-09-22 17:25:08.7249+08	0	0	\N	2019-11-06 13:49:11.368503+08	\N	\N	2	2019-09-22
1777	-9	饮食	0	番薯	2019-09-22 17:25:06.53255+08	0	0	\N	2019-11-06 13:49:11.369913+08	\N	\N	2	2019-09-22
1776	-299	饮食	0	妈妈菜	2019-09-22 17:24:53.724861+08	0	0	\N	2019-11-06 13:49:11.371249+08	\N	\N	2	2019-09-22
1775	-62	小孩生活用品	0	儿童餐具	2019-09-22 17:24:39.07552+08	0	0	\N	2019-11-06 13:49:11.372775+08	\N	\N	2	2019-09-22
1774	-9	饮食	0	早餐	2019-09-22 17:24:00.648578+08	0	0	\N	2019-11-06 13:49:11.374187+08	\N	\N	2	2019-09-22
1772	14365	收入	1	8月工资	2019-09-19 17:05:55.240721+08	0	0	\N	2019-12-09 16:59:22.77371+08	\N	\N	1	2019-09-19
1771	14422	收入	1	6月工资	2019-09-19 17:04:52.382271+08	0	0	\N	2019-12-09 16:59:22.776613+08	\N	\N	1	2019-09-19
1769	10124	收入	1	7月份工资	2019-09-16 11:28:42.42062+08	0	0	\N	2019-12-09 16:59:22.779045+08	\N	\N	2	2019-09-16
1770	-59	小孩生活用品	0	杯子	2019-09-16 11:29:29.070681+08	0	0	\N	2019-11-06 13:49:11.380032+08	\N	\N	2	2019-09-16
1767	-38	饮食	0	葡萄	2019-09-16 11:27:30.722175+08	0	0	\N	2019-11-06 13:49:11.382784+08	\N	\N	2	2019-09-16
1766	-100	生活日用	0	家居展	2019-09-16 11:27:13.396463+08	0	0	\N	2019-11-06 13:49:11.384059+08	\N	\N	2	2019-09-16
1765	-259	生活日用	0	空气炸锅	2019-09-16 11:26:30.364423+08	0	0	\N	2019-11-06 13:49:11.385437+08	\N	\N	2	2019-09-16
1764	-46	服饰美容	0	百褶裙	2019-09-16 11:26:11.084746+08	0	0	\N	2019-11-06 13:49:11.38672+08	\N	\N	2	2019-09-16
1763	-7	生活日用	0	玩具	2019-09-16 11:25:50.650825+08	0	0	\N	2019-11-06 13:49:11.387992+08	\N	\N	2	2019-09-16
1762	-24	生活日用	0	新江厦	2019-09-16 11:25:36.771308+08	0	0	\N	2019-11-06 13:49:11.389308+08	\N	\N	2	2019-09-16
1761	-28	生活日用	0	除油剂	2019-09-16 11:25:09.601413+08	0	0	\N	2019-11-06 13:49:11.390599+08	\N	\N	2	2019-09-16
1760	-29	小孩服饰	0	内裤	2019-09-16 11:24:52.506249+08	0	0	\N	2019-11-06 13:49:11.391883+08	\N	\N	2	2019-09-16
1759	-44	饮食	0	KFC	2019-09-16 09:18:00.364566+08	0	0	\N	2019-11-06 13:49:11.393214+08	\N	\N	1	2019-09-16
1758	-100	文教娱乐	0	sd卡	2019-09-16 09:17:33.312409+08	0	0	\N	2019-11-06 13:49:11.394578+08	\N	\N	1	2019-09-16
1757	-5	饮食	0	早餐	2019-09-16 09:16:00.715742+08	0	0	\N	2019-11-06 13:49:11.395921+08	\N	\N	1	2019-09-16
1755	-14	饮食	0	零食	2019-09-16 09:15:25.044129+08	0	0	\N	2019-11-06 13:49:11.398564+08	\N	\N	1	2019-09-16
1754	-14	饮食	0	零食	2019-09-16 09:15:10.595337+08	0	0	\N	2019-11-06 13:49:11.399856+08	\N	\N	1	2019-09-16
1753	-11	饮食	0	早餐	2019-09-16 09:14:58.553849+08	0	0	\N	2019-11-06 13:49:11.401167+08	\N	\N	1	2019-09-16
1752	-5	饮食	0	早餐	2019-09-16 09:14:44.56059+08	0	0	\N	2019-11-06 13:49:11.402528+08	\N	\N	1	2019-09-16
1751	-79	饮食	0	零食	2019-09-16 09:14:25.290579+08	0	0	\N	2019-11-06 13:49:11.403907+08	\N	\N	1	2019-09-16
1750	-6	饮食	0	早餐	2019-09-16 09:14:07.921658+08	0	0	\N	2019-11-06 13:49:11.405207+08	\N	\N	1	2019-09-16
1749	-100	饮食	0	华润万家	2019-09-10 19:27:05.328969+08	0	0	\N	2019-11-06 13:49:11.406748+08	\N	\N	2	2019-09-10
1748	-102	住房缴费	0	东兴水费	2019-09-10 19:24:33.209786+08	0	0	\N	2019-11-06 13:49:11.40805+08	\N	\N	2	2019-09-10
1747	-8	饮食	0	杯套	2019-09-10 19:24:12.65633+08	0	0	\N	2019-11-06 13:49:11.409381+08	\N	\N	2	2019-09-10
1746	-27	服饰美容	0	绿姿	2019-09-10 19:23:43.116546+08	0	0	\N	2019-11-06 13:49:11.410708+08	\N	\N	2	2019-09-10
1745	-29	小孩服饰	0	内裤	2019-09-10 19:23:19.734297+08	0	0	\N	2019-11-06 13:49:11.412297+08	\N	\N	2	2019-09-10
1744	-65	服饰美容	0	T恤	2019-09-10 19:22:38.451486+08	0	0	\N	2019-11-06 13:49:11.413687+08	\N	\N	2	2019-09-10
1743	-137	小孩生活用品	0	保温杯	2019-09-10 19:22:20.233067+08	0	0	\N	2019-11-06 13:49:11.414993+08	\N	\N	2	2019-09-10
1742	-200	服饰美容	0	鞋子	2019-09-10 19:22:00.194359+08	0	0	\N	2019-11-06 13:49:11.417878+08	\N	\N	2	2019-09-10
1741	-15	饮食	0	鸡米花薯条	2019-09-07 22:21:41.813385+08	0	0	\N	2019-11-06 13:49:11.419291+08	\N	\N	2	2019-09-07
1740	-16	饮食	0	卤人甲	2019-09-07 22:21:30.046148+08	0	0	\N	2019-11-06 13:49:11.42173+08	\N	\N	2	2019-09-07
1739	-25	生活日用	0	手机壳	2019-09-07 22:21:06.48736+08	0	0	\N	2019-11-06 13:49:11.423021+08	\N	\N	2	2019-09-07
1738	-5	饮食	0	大饼	2019-09-07 22:20:50.999851+08	0	0	\N	2019-11-06 13:49:11.424304+08	\N	\N	2	2019-09-07
1737	-95	通讯物流	0	话费	2019-09-07 22:20:33.886727+08	0	0	\N	2019-11-06 13:49:11.425736+08	\N	\N	2	2019-09-07
1736	-37	小孩服饰	0	睡衣	2019-09-07 22:20:04.812092+08	0	0	\N	2019-11-06 13:49:11.427093+08	\N	\N	2	2019-09-07
1735	-13	生活日用	0	电源插头	2019-09-07 22:19:44.287962+08	0	0	\N	2019-11-06 13:49:11.428407+08	\N	\N	2	2019-09-07
1734	-6	饮食	0	早餐	2019-09-05 21:12:27.794172+08	0	0	\N	2019-11-06 13:49:11.429805+08	\N	\N	2	2019-09-05
1733	-25	服饰美容	0	裤子	2019-09-05 21:12:15.990127+08	0	0	\N	2019-11-06 13:49:11.431234+08	\N	\N	2	2019-09-05
1732	-223	住房缴费	0	东兴电费	2019-09-05 21:11:56.430822+08	0	0	\N	2019-11-06 13:49:11.432622+08	\N	\N	2	2019-09-05
1773	14422	收入	1	9月工资	2019-09-19 17:06:23.262664+08	0	0	\N	2019-12-09 16:59:22.771498+08	\N	\N	1	2019-09-19
1896	-7	饮食	0	酸奶	2019-10-29 20:20:53.326114+08	0	0	\N	2019-11-06 13:49:11.198723+08	\N	\N	1	2019-10-29
1895	-50	交通出行	0	两次高速费	2019-10-29 20:20:23.025673+08	0	0	\N	2019-11-06 13:49:11.19999+08	\N	\N	1	2019-10-29
1894	-10	通讯物流	0	移动	2019-10-29 20:19:56.650467+08	0	0	\N	2019-11-06 13:49:11.202528+08	\N	\N	1	2019-10-29
1893	-60	文教娱乐	0	kotlin书	2019-10-29 20:19:34.12018+08	0	0	\N	2019-11-06 13:49:11.203974+08	\N	\N	1	2019-10-29
1854	14478	收入	1	工资	2019-10-15 16:27:43.262042+08	0	0	\N	2019-12-09 16:59:22.767773+08	\N	\N	1	2019-10-15
1890	-66	文教娱乐	0	电影票	2019-10-23 20:05:03.574268+08	0	0	\N	2019-11-06 13:49:11.208374+08	\N	\N	2	2019-10-23
1889	-450	小孩健康	0	社保	2019-10-23 20:04:28.656632+08	0	0	\N	2019-11-06 13:49:11.209757+08	\N	\N	2	2019-10-23
1888	-30	饮食	0	串串	2019-10-23 20:04:04.768481+08	0	0	\N	2019-11-06 13:49:11.211068+08	\N	\N	2	2019-10-23
1887	-128	服饰美容	0	鞋子	2019-10-23 20:03:46.91536+08	0	0	\N	2019-11-06 13:49:11.212477+08	\N	\N	2	2019-10-23
1886	-80	服饰美容	0	毛衣	2019-10-23 20:03:26.936114+08	0	0	\N	2019-11-06 13:49:11.213821+08	\N	\N	2	2019-10-23
1885	-18	小孩玩具	0	沙滩玩具	2019-10-23 20:03:01.7694+08	0	0	\N	2019-11-06 13:49:11.215146+08	\N	\N	2	2019-10-23
1884	-87	服饰美容	0	牛仔裤	2019-10-23 20:02:44.198037+08	0	0	\N	2019-11-06 13:49:11.216416+08	\N	\N	2	2019-10-23
1882	-70	小孩服饰	0	背心外套	2019-10-23 20:00:19.183357+08	0	0	\N	2019-11-06 13:49:11.217879+08	\N	\N	2	2019-10-23
1881	-12	文教娱乐	0	钓鱼竿玩具	2019-10-23 19:59:41.682733+08	0	0	\N	2019-11-06 13:49:11.21921+08	\N	\N	2	2019-10-23
1880	-10	服饰美容	0	堆堆袜	2019-10-20 18:21:05.121791+08	0	0	\N	2019-11-06 13:49:11.220702+08	\N	\N	2	2019-10-20
1877	-11	生活日用	0	手机膜	2019-10-20 18:19:07.808639+08	0	0	\N	2019-11-06 13:49:11.222119+08	\N	\N	2	2019-10-20
1876	-50	通讯物流	0	新开充值移动	2019-10-20 18:18:49.712054+08	0	0	\N	2019-11-06 13:49:11.223605+08	\N	\N	2	2019-10-20
1875	-16	饮食	0	泡芙	2019-10-20 18:16:51.972919+08	0	0	\N	2019-11-06 13:49:11.224948+08	\N	\N	2	2019-10-20
1874	-15	饮食	0	章鱼丸	2019-10-20 18:16:40.288864+08	0	0	\N	2019-11-06 13:49:11.226408+08	\N	\N	2	2019-10-20
1873	-44	饮食	0	无印良品	2019-10-20 18:16:24.52385+08	0	0	\N	2019-11-06 13:49:11.227687+08	\N	\N	2	2019-10-20
1872	-298	服饰美容	0	优衣库	2019-10-20 18:16:07.10641+08	0	0	\N	2019-11-06 13:49:11.229021+08	\N	\N	2	2019-10-20
1871	-80	服饰美容	0	hm衣	2019-10-20 18:15:48.425671+08	0	0	\N	2019-11-06 13:49:11.230378+08	\N	\N	2	2019-10-20
1870	-18	交通出行	0	雨刮器	2019-10-20 18:15:30.117961+08	0	0	\N	2019-11-06 13:49:11.231747+08	\N	\N	2	2019-10-20
1869	-18	交通出行	0	雨刮器	2019-10-20 18:15:29.42746+08	0	0	\N	2019-11-06 13:49:11.233416+08	\N	\N	2	2019-10-20
1868	-6	生活日用	0	小抱枕	2019-10-17 22:38:33.640883+08	0	0	\N	2019-11-06 13:49:11.234791+08	\N	\N	2	2019-10-17
1867	-119	生活日用	0	床笠	2019-10-17 22:38:16.054065+08	0	0	\N	2019-11-06 13:49:11.236379+08	\N	\N	2	2019-10-17
1866	-57	饮食	0	美购	2019-10-17 20:51:52.678798+08	0	0	\N	2019-11-06 13:49:11.237845+08	\N	\N	2	2019-10-17
1865	-8	饮食	0	午餐	2019-10-17 20:50:01.976211+08	0	0	\N	2019-11-06 13:49:11.239406+08	\N	\N	2	2019-10-17
1864	-25	生活日用	0	门垫	2019-10-17 20:48:57.26424+08	0	0	\N	2019-11-06 13:49:11.241053+08	\N	\N	2	2019-10-17
1863	-103	饮食	0	火锅3份	2019-10-17 20:48:19.658265+08	0	0	\N	2019-11-06 13:49:11.242467+08	\N	\N	2	2019-10-17
1862	-103	饮食	0	火锅3份	2019-10-17 20:48:17.507774+08	0	0	\N	2019-11-06 13:49:11.243836+08	\N	\N	2	2019-10-17
1860	-13	生活日用	0	美工刀	2019-10-16 12:52:41.769673+08	0	0	\N	2019-11-06 13:49:11.247784+08	\N	\N	2	2019-10-16
1859	-9	生活日用	0	毛巾	2019-10-16 12:49:33.938383+08	0	0	\N	2019-11-06 13:49:11.249417+08	\N	\N	2	2019-10-16
1858	-6	饮食	0	手抓饼	2019-10-16 12:49:19.7016+08	0	0	\N	2019-11-06 13:49:11.250783+08	\N	\N	2	2019-10-16
1857	-17	小孩服饰	0	毛巾	2019-10-16 12:48:56.513409+08	0	0	\N	2019-11-06 13:49:11.25208+08	\N	\N	2	2019-10-16
1856	-33	小孩玩具	0	玩具	2019-10-16 12:47:40.994464+08	0	0	\N	2019-11-06 13:49:11.254605+08	\N	\N	2	2019-10-16
1830	10134	收入	1	8月工资	2019-10-09 23:54:52.837172+08	0	0	\N	2019-12-09 16:59:22.769612+08	\N	\N	2	2019-10-09
1853	-13	饮食	0	早餐	2019-10-15 16:26:50.37264+08	0	0	\N	2019-11-06 13:49:11.257308+08	\N	\N	1	2019-10-15
1852	-7	饮食	0	早餐	2019-10-15 16:26:42.382901+08	0	0	\N	2019-11-06 13:49:11.258629+08	\N	\N	1	2019-10-15
1851	-15	生活日用	0	玫瑰花	2019-10-15 16:26:31.400253+08	0	0	\N	2019-11-06 13:49:11.25996+08	\N	\N	1	2019-10-15
1850	-119	饮食	0	嘉兴邹大鲜	2019-10-15 16:26:07.210771+08	0	0	\N	2019-11-06 13:49:11.261313+08	\N	\N	1	2019-10-15
1849	-120	交通出行	0	嘉兴南湖门票x2	2019-10-15 16:25:45.087438+08	0	0	\N	2019-11-06 13:49:11.262892+08	\N	\N	1	2019-10-15
1848	-70	饮食	0	嘉兴零食	2019-10-15 16:25:17.817117+08	0	0	\N	2019-11-06 13:49:11.264283+08	\N	\N	1	2019-10-15
1847	-146	交通出行	0	嘉兴汉庭	2019-10-15 16:24:43.974185+08	0	0	\N	2019-11-06 13:49:11.267412+08	\N	\N	1	2019-10-15
1846	-43	饮食	0	老婆大人	2019-10-15 16:23:56.634891+08	0	0	\N	2019-11-06 13:49:11.269329+08	\N	\N	1	2019-10-15
1845	-7	饮食	0	早餐	2019-10-15 16:23:44.313976+08	0	0	\N	2019-11-06 13:49:11.27074+08	\N	\N	1	2019-10-15
1844	-7	饮食	0	早餐	2019-10-15 16:23:42.455847+08	0	0	\N	2019-11-06 13:49:11.272131+08	\N	\N	1	2019-10-15
1843	-64	饮食	0	酱鹅	2019-10-15 08:37:09.97252+08	0	0	\N	2019-11-06 13:49:11.273473+08	\N	\N	2	2019-10-15
1842	-60	文教娱乐	0	月河游船门票	2019-10-15 08:36:14.757071+08	0	0	\N	2019-11-06 13:49:11.274895+08	\N	\N	2	2019-10-15
1841	-20	交通出行	0	停车费	2019-10-15 08:35:51.338409+08	0	0	\N	2019-11-06 13:49:11.276281+08	\N	\N	2	2019-10-15
1834	-154	饮食	0	香肠虾饺	2019-10-10 00:04:01.624166+08	0	0	\N	2019-11-06 13:49:11.277726+08	\N	\N	2	2019-10-10
1833	-54	文教娱乐	0	书	2019-10-09 23:55:37.423804+08	0	0	\N	2019-11-06 13:49:11.279083+08	\N	\N	2	2019-10-09
1831	-116	饮食	0	薏米红豆茶	2019-10-09 23:55:08.873945+08	0	0	\N	2019-11-06 13:49:11.280454+08	\N	\N	2	2019-10-09
1827	-30	文教娱乐	0	电影	2019-10-09 23:53:33.007353+08	0	0	\N	2019-11-06 13:49:11.283226+08	\N	\N	2	2019-10-09
1826	-30	饮食	0	栗子	2019-10-09 23:53:08.783638+08	0	0	\N	2019-11-06 13:49:11.284607+08	\N	\N	2	2019-10-09
1824	-69	服饰美容	0	裤子	2019-10-09 23:52:28.996908+08	0	0	\N	2019-11-06 13:49:11.287481+08	\N	\N	2	2019-10-09
1823	-128	生活日用	0	洗脚	2019-10-09 23:52:18.89971+08	0	0	\N	2019-11-06 13:49:11.288883+08	\N	\N	2	2019-10-09
1822	-9	饮食	0	coco	2019-10-09 23:51:45.640095+08	0	0	\N	2019-11-06 13:49:11.290265+08	\N	\N	2	2019-10-09
1821	-17	小孩玩具	0	贴纸	2019-10-09 23:51:31.427008+08	0	0	\N	2019-11-06 13:49:11.291771+08	\N	\N	2	2019-10-09
1820	-93	生活日用	0	药箱	2019-10-09 23:51:14.480514+08	0	0	\N	2019-11-06 13:49:11.29314+08	\N	\N	2	2019-10-09
1819	-15	饮食	0	超市	2019-10-09 23:50:56.612204+08	0	0	\N	2019-11-06 13:49:11.294509+08	\N	\N	2	2019-10-09
1818	-15	小孩玩具	0	卡片玩具英语字母	2019-10-09 23:50:40.760156+08	0	0	\N	2019-11-06 13:49:11.295875+08	\N	\N	2	2019-10-09
1817	-7	饮食	0	凉皮	2019-10-09 23:50:18.28529+08	0	0	\N	2019-11-06 13:49:11.297255+08	\N	\N	2	2019-10-09
1816	-66	住房缴费	0	景湖水岸电费	2019-10-09 23:49:40.836406+08	0	0	\N	2019-11-06 13:49:11.298757+08	\N	\N	2	2019-10-09
1815	-88	住房缴费	0	东兴电费	2019-10-09 23:49:15.939234+08	0	0	\N	2019-11-06 13:49:11.300182+08	\N	\N	2	2019-10-09
1814	-13	生活日用	0	玫瑰花	2019-10-09 23:47:59.298336+08	0	0	\N	2019-11-06 13:49:11.30165+08	\N	\N	2	2019-10-09
1813	-79	生活日用	0	足浴	2019-10-09 13:34:20.559255+08	0	0	\N	2019-11-06 13:49:11.303004+08	\N	\N	1	2019-10-09
1812	-30	文教娱乐	0	电影票	2019-10-09 13:33:35.053022+08	0	0	\N	2019-11-06 13:49:11.304373+08	\N	\N	1	2019-10-09
1811	-58	生活日用	0	艾草足贴	2019-10-09 13:32:43.027165+08	0	0	\N	2019-11-06 13:49:11.30592+08	\N	\N	1	2019-10-09
1810	-20	饮食	0	鸭脖	2019-10-09 13:32:11.556095+08	0	0	\N	2019-11-06 13:49:11.307312+08	\N	\N	1	2019-10-09
1809	-8	饮食	0	欧文蛋糕	2019-10-09 13:32:02.747684+08	0	0	\N	2019-11-06 13:49:11.30922+08	\N	\N	1	2019-10-09
1891	10034	收入	1	工资	2019-10-23 20:06:18.52674+08	0	0	\N	2019-12-09 16:59:22.765524+08	\N	\N	2	2019-10-23
1948	-12	交通出行	0	洗车	2019-11-03 21:05:19.903609+08	0	0	\N	2019-11-06 13:49:11.113587+08	\N	\N	2	2019-11-03
1947	-20	小孩服饰	0	拖鞋	2019-11-03 21:05:06.854648+08	0	0	\N	2019-11-06 13:49:11.117717+08	\N	\N	2	2019-11-03
1946	-97	饮食	0	两袋大米共20kgs	2019-11-03 21:04:51.908334+08	0	0	\N	2019-11-06 13:49:11.119978+08	\N	\N	2	2019-11-03
1945	-56	住房缴费	0	东兴电费	2019-11-03 21:04:28.715953+08	0	0	\N	2019-11-06 13:49:11.121316+08	\N	\N	2	2019-11-03
1944	-46	住房缴费	0	景湖电费	2019-11-03 21:04:13.935426+08	0	0	\N	2019-11-06 13:49:11.122803+08	\N	\N	2	2019-11-03
1943	-38	住房缴费	0	景湖水费	2019-11-03 21:03:50.600031+08	0	0	\N	2019-11-06 13:49:11.124138+08	\N	\N	2	2019-11-03
1941	-229	文教娱乐	0	阿里云代理	2019-11-02 21:40:24.813243+08	0	0	\N	2019-11-06 13:49:11.125804+08	\N	\N	2	2019-11-02
1940	-365	生活日用	0	365卡	2019-11-02 21:39:46.442506+08	0	0	\N	2019-11-06 13:49:11.127114+08	\N	\N	2	2019-11-02
1939	-610	服饰美容	0	耐克鞋	2019-11-02 21:37:18.915337+08	0	0	\N	2019-11-06 13:49:11.128573+08	\N	\N	2	2019-11-02
1932	-251	小孩服饰	0	耐克鞋	2019-11-02 21:36:45.55362+08	0	0	\N	2019-11-06 13:49:11.131547+08	\N	\N	2	2019-11-02
1931	-6	饮食	0	甜筒	2019-11-02 21:36:25.015937+08	0	0	\N	2019-11-06 13:49:11.133652+08	\N	\N	2	2019-11-02
1929	-10	交通出行	0	停车费水上乐园	2019-11-02 12:42:20.26106+08	0	0	\N	2019-11-06 13:49:11.137246+08	\N	\N	2	2019-11-02
1928	-44	小孩服饰	0	睡衣皮卡丘	2019-11-02 08:13:39.947343+08	0	0	\N	2019-11-06 13:49:11.140896+08	\N	\N	2	2019-11-02
1927	-128	饮食	0	火锅潮牛	2019-11-02 08:13:21.98167+08	0	0	\N	2019-11-06 13:49:11.146156+08	\N	\N	2	2019-11-02
1925	-130	饮食	0	蛙来达	2019-10-31 18:59:24.299894+08	0	0	\N	2019-11-06 13:49:11.153691+08	\N	\N	2	2019-10-31
1924	-20	文教娱乐	0	水上乐园	2019-10-31 18:56:01.477437+08	0	0	\N	2019-11-06 13:49:11.156685+08	\N	\N	2	2019-10-31
1923	-35	饮食	0	外卖	2019-10-31 18:55:47.554074+08	0	0	\N	2019-11-06 13:49:11.158128+08	\N	\N	2	2019-10-31
1922	-28	饮食	0	美团外卖	2019-10-31 18:54:54.832592+08	0	0	\N	2019-11-06 13:49:11.159725+08	\N	\N	2	2019-10-31
1921	-35	饮食	0	肯德基	2019-10-31 18:54:41.79034+08	0	0	\N	2019-11-06 13:49:11.162821+08	\N	\N	2	2019-10-31
1920	-6	饮食	0	早餐	2019-10-31 18:54:29.92315+08	0	0	\N	2019-11-06 13:49:11.165222+08	\N	\N	2	2019-10-31
1919	-11	饮食	0	奶茶	2019-10-31 18:53:44.486888+08	0	0	\N	2019-11-06 13:49:11.167445+08	\N	\N	2	2019-10-31
1918	-20	通讯物流	0	网络充值	2019-10-31 18:52:38.505158+08	0	0	\N	2019-11-06 13:49:11.168934+08	\N	\N	2	2019-10-31
1917	-2500	交通出行	0	油卡充值	2019-10-31 18:52:17.155292+08	0	0	\N	2019-11-06 13:49:11.170336+08	\N	\N	2	2019-10-31
1916	-145	生活日用	0	四件套	2019-10-31 18:52:03.367482+08	0	0	\N	2019-11-06 13:49:11.171764+08	\N	\N	2	2019-10-31
1915	-99	小孩服饰	0	鞋子	2019-10-31 18:51:52.223918+08	0	0	\N	2019-11-06 13:49:11.173145+08	\N	\N	2	2019-10-31
1914	-177	小孩服饰	0	衣服	2019-10-31 18:51:41.432459+08	0	0	\N	2019-11-06 13:49:11.174538+08	\N	\N	2	2019-10-31
1913	-17	生活日用	0	艾草	2019-10-31 18:51:29.446514+08	0	0	\N	2019-11-06 13:49:11.175946+08	\N	\N	2	2019-10-31
1912	-59	小孩服饰	0	大衣	2019-10-31 18:50:12.026839+08	0	0	\N	2019-11-06 13:49:11.177288+08	\N	\N	2	2019-10-31
1911	-29	生活日用	0	大人衣架	2019-10-31 18:49:57.339891+08	0	0	\N	2019-11-06 13:49:11.178608+08	\N	\N	2	2019-10-31
1910	-23	生活日用	0	儿童衣架	2019-10-31 18:49:44.936265+08	0	0	\N	2019-11-06 13:49:11.179907+08	\N	\N	2	2019-10-31
1909	-32	生活日用	0	爬行垫	2019-10-31 18:49:12.22278+08	0	0	\N	2019-11-06 13:49:11.181231+08	\N	\N	2	2019-10-31
1908	-100	饮食	0	老婆大人	2019-10-31 18:48:52.097703+08	0	0	\N	2019-11-06 13:49:11.182551+08	\N	\N	2	2019-10-31
1907	-15	小孩生活用品	0	儿童尿壶	2019-10-31 18:48:30.864873+08	0	0	\N	2019-11-06 13:49:11.183842+08	\N	\N	2	2019-10-31
1906	-20	服饰美容	0	裤	2019-10-31 18:48:07.145779+08	0	0	\N	2019-11-06 13:49:11.185133+08	\N	\N	2	2019-10-31
1905	-16	饮食	0	酸奶	2019-10-31 18:47:46.485312+08	0	0	\N	2019-11-06 13:49:11.186439+08	\N	\N	2	2019-10-31
1904	-5	饮食	0	麦饼	2019-10-31 18:47:00.00689+08	0	0	\N	2019-11-06 13:49:11.187824+08	\N	\N	2	2019-10-31
1903	-5	饮食	0	麦饼	2019-10-31 18:46:56.247065+08	0	0	\N	2019-11-06 13:49:11.189172+08	\N	\N	2	2019-10-31
1902	-33	文教娱乐	0	电影票	2019-10-29 20:26:58.691431+08	0	0	\N	2019-11-06 13:49:11.190467+08	\N	\N	1	2019-10-29
1901	-33	文教娱乐	0	电影票	2019-10-29 20:25:26.6675+08	0	0	\N	2019-11-06 13:49:11.191779+08	\N	\N	1	2019-10-29
1900	-6	饮食	0	早餐	2019-10-29 20:24:13.87899+08	0	0	\N	2019-11-06 13:49:11.193176+08	\N	\N	1	2019-10-29
1899	-4	饮食	0	酸奶	2019-10-29 20:23:43.917113+08	0	0	\N	2019-11-06 13:49:11.19452+08	\N	\N	1	2019-10-29
1898	-12	饮食	0	一鸣早餐	2019-10-29 20:21:50.824463+08	0	0	\N	2019-11-06 13:49:11.195869+08	\N	\N	1	2019-10-29
1897	-30	小孩服饰	0	内裤	2019-10-29 20:21:23.831936+08	0	0	\N	2019-11-06 13:49:11.197159+08	\N	\N	1	2019-10-29
1892	-235	饮食	0	东钱湖吃饭	2019-10-29 20:18:59.682845+08	0	0	\N	2019-11-06 13:49:11.205298+08	\N	\N	1	2019-10-29
1861	-360	交通出行	0	嘉兴高速费	2019-10-16 21:24:17.440931+08	0	0	\N	2019-11-06 13:49:11.246057+08	\N	\N	2	2019-10-16
1825	-214	生活日用	0	厨房架子	2019-10-09 23:52:47.533063+08	0	0	\N	2019-11-06 13:49:11.286021+08	\N	\N	2	2019-10-09
1808	-26	饮食	0	美购	2019-10-09 13:31:40.36896+08	0	0	\N	2019-11-06 13:49:11.310579+08	\N	\N	1	2019-10-09
1787	-25	生活日用	0	电动牙刷座	2019-09-29 19:50:03.357269+08	0	0	\N	2019-11-06 13:49:11.355203+08	\N	\N	2	2019-09-29
1756	-100	交通出行	0	动物园游船	2019-09-16 09:15:45.680419+08	0	0	\N	2019-11-06 13:49:11.39717+08	\N	\N	1	2019-09-16
1731	-23	服饰美容	0	丝袜2双	2019-09-05 21:11:31.439947+08	0	0	\N	2019-11-06 13:49:11.434001+08	\N	\N	2	2019-09-05
1715	-17	生活日用	0	一次性洗脸巾	2019-09-01 05:31:58.614942+08	0	0	\N	2019-11-06 13:49:11.458646+08	\N	\N	2	2019-09-01
1684	-53	交通出行	0	滴滴	2019-08-25 21:28:13.782495+08	0	0	\N	2019-11-06 13:49:11.50954+08	\N	\N	1	2019-08-25
1656	-55	住房缴费	0	电话卡	2019-08-08 19:27:25.679105+08	0	0	\N	2019-11-06 13:49:11.54819+08	\N	\N	2	2019-08-08
1653	-278	小孩生活用品	0	行李箱	2019-08-08 19:25:19.547747+08	0	0	\N	2019-11-06 13:49:11.552763+08	\N	\N	2	2019-08-08
1635	-28	生活日用	0	袖套	2019-08-08 19:19:06.087682+08	0	0	\N	2019-11-06 13:49:11.578256+08	\N	\N	2	2019-08-08
1607	-53	小孩健康	0	止痒贴	2019-07-22 19:39:28.935349+08	0	0	\N	2019-11-06 13:49:11.616874+08	\N	\N	2	2019-07-22
1579	-200	交通出行	0	高速	2019-07-10 23:16:35.08296+08	0	0	\N	2019-11-06 13:49:11.663559+08	\N	\N	2	2019-07-10
1573	-100	饮食	0	老婆大人	2019-07-10 23:14:04.208484+08	0	0	\N	2019-11-06 13:49:11.670527+08	\N	\N	2	2019-07-10
1566	-80	饮食	0	水蜜桃24个	2019-07-10 23:11:08.64342+08	0	0	\N	2019-11-06 13:49:11.681165+08	\N	\N	1	2019-07-10
1538	-6	饮食	0	早餐	2019-06-28 21:38:20.586046+08	0	0	\N	2019-11-06 13:49:11.718969+08	\N	\N	1	2019-06-28
1496	-7	饮食	0	奶茶	2019-06-13 12:07:41.769122+08	0	0	\N	2019-11-06 13:49:11.778977+08	\N	\N	2	2019-06-13
1478	-28	小孩服饰	0	防蚊裤	2019-06-05 16:24:23.422449+08	0	0	\N	2019-11-06 13:49:11.810387+08	\N	\N	2	2019-06-05
1451	-30	生活日用	0	美购超市	2019-05-28 10:16:44.068771+08	0	0	\N	2019-11-06 13:49:11.854869+08	\N	\N	1	2019-05-28
1418	-36	小孩玩具	0	钓鱼玩具	2019-05-24 23:34:04.686589+08	0	0	\N	2019-11-06 13:49:11.900238+08	\N	\N	2	2019-05-24
1410	-30	生活日用	0	博朗剃须刀充电器	2019-05-16 14:46:28.356035+08	0	0	\N	2019-11-06 13:49:11.911971+08	\N	\N	1	2019-05-16
1378	-195	交通出行	0	台北到花莲火车x2	2019-04-29 23:18:34.895979+08	0	0	\N	2019-11-06 13:49:11.95423+08	\N	\N	2	2019-04-29
1342	-83	生活日用	0	餐巾纸	2019-04-21 18:05:51.183341+08	0	0	\N	2019-11-06 13:49:12.016209+08	\N	\N	2	2019-04-21
1341	-22	生活日用	0	保鲜袋	2019-04-21 18:05:18.01633+08	0	0	\N	2019-11-06 13:49:12.017822+08	\N	\N	2	2019-04-21
1331	-23	住房缴费	0	揉面垫	2019-04-21 17:58:31.268162+08	0	0	\N	2019-11-06 13:49:12.032573+08	\N	\N	2	2019-04-21
1304	-14	小孩服饰	0	袜子	2019-04-10 19:34:00.428089+08	0	0	\N	2019-11-06 13:49:12.074041+08	\N	\N	2	2019-04-10
1277	-12	小孩服饰	0	袜子	2019-03-31 19:17:04.609657+08	0	0	\N	2019-11-06 13:49:12.110631+08	\N	\N	2	2019-03-31
1264	-25	饮食	0	烧饼	2019-03-31 19:12:22.942382+08	0	0	\N	2019-11-06 13:49:12.129431+08	\N	\N	1	2019-03-31
1263	-138	饮食	0	美团	2019-03-31 19:11:57.730356+08	0	0	\N	2019-11-06 13:49:12.130891+08	\N	\N	1	2019-03-31
1252	-40	交通出行	0	金卡证明+快递费	2019-03-31 19:03:27.30745+08	0	0	\N	2019-11-06 13:49:12.147752+08	\N	\N	2	2019-03-31
1218	-79	生活日用	0	亚马逊会员	2019-03-15 12:57:00.878921+08	0	0	\N	2019-11-06 13:49:12.194871+08	\N	\N	1	2019-03-15
1188	-67	住房缴费	0	新家电费	2019-03-08 20:46:08.640219+08	0	0	\N	2019-11-06 13:49:12.23988+08	\N	\N	2	2019-03-08
1185	-2300	人情往来	0	新家请客	2019-02-28 22:26:12.830813+08	0	0	\N	2019-11-06 13:49:12.245389+08	\N	\N	2	2019-02-28
1177	-100	通讯物流	0	话费	2019-02-28 17:14:25.752092+08	0	0	\N	2019-11-06 13:49:12.260044+08	\N	\N	1	2019-02-28
1151	-45	生活日用	0	烟花	2019-02-12 09:11:36.71908+08	0	0	\N	2019-11-06 13:49:12.296862+08	\N	\N	1	2019-02-12
1124	-24	小孩生活用品	0	牙刷	2019-01-27 08:38:16.725154+08	0	0	\N	2019-11-06 13:49:12.337982+08	\N	\N	2	2019-01-27
1107	-12	饮食	0	粥	2019-01-18 14:36:49.387595+08	0	0	\N	2019-11-06 13:49:12.364421+08	\N	\N	1	2019-01-18
1091	-28	小孩服饰	0	防水罩衣	2019-01-12 11:59:26.939697+08	0	0	\N	2019-11-06 13:49:12.388944+08	\N	\N	2	2019-01-12
1084	-22	交通出行	0	打的	2019-01-06 16:03:57.277269+08	0	0	\N	2019-11-06 13:49:12.397376+08	\N	\N	2	2019-01-06
1078	-150	生活日用	0	手机屏幕更换	2019-01-04 19:51:28.356891+08	0	0	\N	2019-11-06 13:49:12.405758+08	\N	\N	2	2019-01-04
1065	-30	生活日用	0	理发	2019-01-03 11:19:17.182469+08	0	0	\N	2019-11-06 13:49:12.423481+08	\N	\N	1	2019-01-03
1031	-10	生活日用	0	美购	2018-12-22 10:48:39.351532+08	0	0	\N	2019-11-06 13:49:12.470857+08	\N	\N	2	2018-12-22
1018	-40	小孩生活用品	0	烘鞋器	2018-12-22 10:44:40.757822+08	0	0	\N	2019-11-06 13:49:12.488581+08	\N	\N	2	2018-12-22
995	-27	饮食	0	绿资	2018-12-07 23:20:28.769007+08	0	0	\N	2019-11-06 13:49:12.510279+08	\N	\N	2	2018-12-07
980	-241	饮食	0	韩宫宴炭火烧烤	2018-12-07 23:14:25.872478+08	0	0	\N	2019-11-06 13:49:12.530662+08	\N	\N	2	2018-12-07
915	-200	交通出行	0	加油	2018-11-23 17:26:15.047594+08	0	0	\N	2019-11-06 13:49:12.609758+08	\N	\N	1	2018-11-23
912	-140	其他消费	0	服务器一年	2018-11-23 17:24:44.717187+08	0	0	\N	2019-11-06 13:49:12.61392+08	\N	\N	1	2018-11-23
856	-112	生活日用	0	爸家	2018-11-11 16:24:28.558185+08	0	0	\N	2019-11-06 13:49:12.646239+08	\N	\N	2	2018-11-11
845	-158	生活日用	0	卷纸	2018-11-11 16:17:52.323287+08	0	0	\N	2019-11-06 13:49:12.662431+08	\N	\N	1	2018-11-11
816	-27	饮食	0	重庆面馆	2018-10-28 19:23:28.553105+08	0	0	\N	2019-11-06 13:49:12.702755+08	\N	\N	2	2018-10-28
789	-20	小孩零食	0	零售米饼	2018-10-28 19:07:37+08	0	0	\N	2019-11-06 13:49:12.740334+08	\N	\N	2	2018-10-28
744	-34	生活日用	0	茶杯	2018-10-06 19:37:46.673462+08	0	0	\N	2019-11-06 13:49:12.805202+08	\N	\N	1	2018-10-06
721	-110	小孩玩具	0	帐篷和滑梯	2018-09-29 22:46:12+08	0	0	\N	2019-11-06 13:49:12.837753+08	\N	\N	2	2018-09-29
706	-237	服饰美容	0	鞋子	2018-09-29 22:39:04.738784+08	0	0	\N	2019-11-06 13:49:12.860232+08	\N	\N	2	2018-09-29
677	-53	生活日用	0	蟑螂贴	2018-09-12 08:03:56.132158+08	0	0	\N	2019-11-06 13:49:12.902752+08	\N	\N	1	2018-09-12
645	-215	服饰美容	0	衣服	2018-09-10 21:16:03.82115+08	0	0	\N	2019-11-06 13:49:12.948504+08	\N	\N	2	2018-09-10
643	-108	交通出行	0	车票	2018-09-10 21:11:43+08	0	0	\N	2019-11-06 13:49:12.954406+08	\N	\N	2	2018-09-10
625	-5	交通出行	0	停车费	2018-08-12 19:41:54+08	0	0	\N	2019-11-06 13:49:12.98226+08	\N	\N	1	2018-08-12
599	-8000	装修	0	黑胡桃木床	2018-07-22 18:31:33.931966+08	0	0	\N	2019-11-06 13:49:13.029164+08	\N	\N	1	2018-07-22
572	-479	服饰美容	0	优衣库衣服	2018-07-15 14:17:47.622261+08	0	0	\N	2019-11-06 13:49:13.06652+08	\N	\N	1	2018-07-15
570	-183	小孩零食	0	钙零食	2018-07-13 07:45:58+08	0	0	\N	2019-11-06 13:49:13.069298+08	\N	\N	2	2018-07-13
568	-87	小孩生活用品	0	马桶和围兜	2018-07-13 07:44:40+08	0	0	\N	2019-11-06 13:49:13.072684+08	\N	\N	2	2018-07-13
537	-73	生活日用	0	手机配件	2018-07-05 20:08:44.352416+08	0	0	\N	2019-11-06 13:49:13.124443+08	\N	\N	1	2018-07-05
499	-110	装修	0	雷士阳台灯	2018-06-10 16:43:57.011544+08	0	0	\N	2019-11-06 13:49:13.194762+08	\N	\N	1	2018-06-10
469	-19	生活日用	0	灯头带线	2018-06-05 20:40:01.590713+08	0	0	\N	2019-11-06 13:49:13.240338+08	\N	\N	2	2018-06-05
434	-88	生活日用	0	防晒霜X4	2018-05-09 22:08:04.081661+08	0	0	\N	2019-11-06 13:49:13.295322+08	\N	\N	2	2018-05-09
417	-98	住房缴费	0	电费	2018-05-06 20:22:26+08	0	0	\N	2019-11-06 13:49:13.334561+08	\N	\N	2	2018-05-06
383	-108	生活日用	0	大米两袋	2018-04-20 21:48:27.362143+08	0	0	\N	2019-11-06 13:49:13.388031+08	\N	\N	2	2018-04-20
353	-112	住房缴费	0	电费东兴	2018-04-04 21:39:48+08	0	0	\N	2019-11-06 13:49:13.445366+08	\N	\N	2	2018-04-04
344	-103	生活日用	0	MacBook网口转换器	2018-03-26 10:51:47.66997+08	0	0	\N	2019-11-06 13:49:13.459055+08	\N	\N	1	2018-03-26
316	-54	饮食	0	肯德基24基本部15o215	2018-03-15 19:59:18.651479+08	0	0	\N	2019-11-06 13:49:13.497249+08	\N	\N	2	2018-03-15
294	-180	小孩奶粉	0	爱他美奶粉	2018-03-03 10:09:43+08	0	0	\N	2019-11-06 13:49:13.52657+08	\N	\N	2	2018-03-03
276	-47	饮食	0	欧文蛋糕	2018-02-26 19:01:40.45015+08	0	0	\N	2019-11-06 13:49:13.550056+08	\N	\N	2	2018-02-26
250	-200	服饰美容	0	新年毛衣	2018-02-13 12:21:42.941808+08	0	0	\N	2019-11-06 13:49:13.590885+08	\N	\N	1	2018-02-13
240	-100	小孩生活用品	0	电炖锅	2018-02-11 07:28:31+08	0	0	\N	2019-11-06 13:49:13.638759+08	\N	\N	2	2018-02-11
1515	-330	小孩生活用品	0	4包尿布	2019-06-21 23:26:32.073624+08	0	0	\N	2020-07-20 13:32:29.04021+08	\N	\N	2	2019-06-21
406	-312	小孩生活用品	0	尿不湿4包	2018-05-01 21:18:02+08	0	0	\N	2020-07-20 13:32:29.221315+08	\N	\N	2	2018-05-01
236	-99	生活日用	0	broadlink MP1插排	2018-02-09 14:22:06.732995+08	0	0	\N	2019-11-06 13:49:13.644225+08	\N	\N	1	2018-02-09
202	-39	饮食	0	药鸡蛋饼矿泉水	2018-01-20 09:56:01+08	0	0	\N	2019-11-06 13:49:13.692041+08	\N	\N	1	2018-01-20
200	-185	小孩奶粉	0	4罐米粉	2018-01-20 09:52:52+08	0	0	\N	2019-11-06 13:49:13.69475+08	\N	\N	2	2018-01-20
169	-24	饮食	0	山药片7包	2018-01-07 21:42:36.501108+08	0	0	\N	2019-11-06 13:49:13.744741+08	\N	\N	2	2018-01-07
141	-128	小孩服饰	0	保暖衣服一套，一件裤子	2017-12-27 21:45:53+08	0	0	\N	2019-11-06 13:49:13.811972+08	\N	\N	2	2017-12-27
134	-315	文教娱乐	0	小米智能家居套装	2017-12-27 20:07:42+08	0	0	\N	2019-11-06 13:49:13.824245+08	\N	\N	1	2017-12-27
100	-18	生活日用	0	生活用品	2017-12-06 22:34:56.134455+08	0	0	\N	2019-11-06 13:49:13.924681+08	\N	\N	2	2017-12-06
99	-27	饮食	0	五斤锅巴	2017-12-06 22:34:41.155732+08	0	0	\N	2019-11-06 13:49:13.928653+08	\N	\N	2	2017-12-06
98	-13	饮食	0	甘蔗	2017-12-06 22:34:23.461944+08	0	0	\N	2019-11-06 13:49:13.932008+08	\N	\N	2	2017-12-06
97	-1500	生活日用	0	生活费	2017-12-06 22:34:08.039676+08	0	0	\N	2019-11-06 13:49:13.938367+08	\N	\N	2	2017-12-06
84	-46	饮食	0	老婆大人零食	2017-11-30 20:21:06.089228+08	0	0	\N	2019-11-06 13:49:13.974251+08	\N	\N	2	2017-11-30
80	-22	饮食	0	夜宵米线	2017-11-29 22:42:16.008659+08	0	0	\N	2019-11-06 13:49:13.985798+08	\N	\N	2	2017-11-29
77	-72	服饰美容	0	秋衣	2017-11-28 20:51:08.013941+08	0	0	\N	2019-11-06 13:49:13.9951+08	\N	\N	2	2017-11-28
57	-249	小孩服饰	0	max win连体服	2017-11-18 14:38:29+08	0	0	\N	2019-11-06 13:49:14.036714+08	\N	\N	2	2017-11-18
31	-165	小孩生活用品	0	奶瓶，沙茶油，润肤油	2017-11-10 21:22:27+08	0	0	\N	2019-11-06 13:49:14.102702+08	\N	\N	2	2017-11-10
1953	-48	饮食	0	牛肉面x2	2019-11-06 14:13:46.149669+08	0	0	\N	2019-11-06 14:13:46.150049+08	\N	\N	1	2019-11-02
1954	-100	交通出行	0	洗车	2019-11-06 14:14:15.728712+08	0	0	\N	2019-11-06 14:14:15.729054+08	\N	\N	1	2019-11-03
1955	-11	饮食	0	零食	2019-11-06 14:14:36.409483+08	0	0	\N	2019-11-06 14:14:36.409813+08	\N	\N	1	2019-11-03
1957	-336	生活日用	0	麦德龙	2019-11-06 14:15:45.244868+08	0	0	\N	2019-11-06 14:15:45.245239+08	\N	\N	1	2019-11-03
1959	-181	小孩服饰	0	孩子王	2019-11-06 14:17:45.329547+08	0	0	\N	2019-11-06 14:17:45.329871+08	\N	\N	1	2019-11-02
1960	-21	服饰美容	0	打底袜	2019-11-09 16:52:41.803937+08	0	0	\N	2019-11-09 16:52:41.806229+08	\N	\N	2	2019-11-09
1961	-51	生活日用	0	美购	2019-11-09 16:53:02.164633+08	0	0	\N	2019-11-09 16:53:02.164936+08	\N	\N	2	2019-11-09
1962	-53	小孩生活用品	0	床尾	2019-11-09 16:53:57.108403+08	0	0	\N	2019-11-09 16:53:57.108728+08	\N	\N	2	2019-11-09
1963	-17	生活日用	0	车载支架	2019-11-09 16:54:42.061239+08	0	0	\N	2019-11-09 16:54:42.061551+08	\N	\N	2	2019-11-09
1964	-220	小孩玩具	0	平衡车	2019-11-09 16:55:11.404913+08	0	0	\N	2019-11-09 16:55:11.405266+08	\N	\N	2	2019-11-09
1965	-69	小孩玩具	0	滑板车	2019-11-09 16:55:28.185284+08	0	0	\N	2019-11-09 16:55:28.185597+08	\N	\N	2	2019-11-09
1966	-96	生活日用	0	华润超市	2019-11-09 16:55:50.200882+08	0	0	\N	2019-11-09 16:55:50.20123+08	\N	\N	2	2019-11-09
1967	-845	服饰美容	0	羽绒服毛衣	2019-11-09 16:56:13.780544+08	0	0	\N	2019-11-09 16:56:13.780852+08	\N	\N	2	2019-11-09
1968	-50	饮食	0	小杨生煎	2019-11-09 16:56:31.354319+08	0	0	\N	2019-11-09 16:56:31.354631+08	\N	\N	2	2019-11-09
1969	-40	交通出行	0	停车费	2019-11-09 16:56:59.309921+08	0	0	\N	2019-11-09 16:56:59.310213+08	\N	\N	2	2019-11-09
1970	-6	饮食	0	大饼	2019-11-09 16:57:44.51576+08	0	0	\N	2019-11-09 16:57:44.516104+08	\N	\N	2	2019-11-09
1971	-30	饮食	0	栗子	2019-11-09 16:58:02.555997+08	0	0	\N	2019-11-09 16:58:02.556295+08	\N	\N	2	2019-11-09
1972	-10	饮食	0	肉夹馍	2019-11-09 16:58:11.456661+08	0	0	\N	2019-11-09 16:58:11.457012+08	\N	\N	2	2019-11-09
1973	-489	小孩服饰	0	外套	2019-11-09 22:53:47.444581+08	0	0	\N	2019-11-09 22:53:47.444918+08	\N	\N	2	2019-11-09
1974	-37	饮食	0	鲜芋仙	2019-11-09 22:54:01.164548+08	0	0	\N	2019-11-09 22:54:01.164869+08	\N	\N	2	2019-11-09
1975	-350	服饰美容	0	乐卡克羽绒服	2019-11-14 20:03:54.965378+08	0	0	\N	2019-11-14 20:03:54.967739+08	\N	\N	2	2019-11-14
1976	-113	服饰美容	0	毛衣	2019-11-14 20:04:10.87956+08	0	0	\N	2019-11-14 20:04:10.879891+08	\N	\N	2	2019-11-14
1977	-34	小孩服饰	0	袜子	2019-11-14 20:04:24.364882+08	0	0	\N	2019-11-14 20:04:24.365242+08	\N	\N	2	2019-11-14
1978	-102	住房缴费	0	东兴水费	2019-11-14 20:04:43.564632+08	0	0	\N	2019-11-14 20:04:43.564938+08	\N	\N	2	2019-11-14
1979	-72	小孩服饰	0	连体睡衣	2019-11-14 20:05:50.015943+08	0	0	\N	2019-11-14 20:05:50.016287+08	\N	\N	2	2019-11-11
1980	-79	服饰美容	0	裙子	2019-11-14 20:06:07.365145+08	0	0	\N	2019-11-14 20:06:07.365473+08	\N	\N	2	2019-11-11
1981	-226	小孩生活用品	0	杯子4个	2019-11-14 20:06:51.123086+08	0	0	\N	2019-11-14 20:06:51.123527+08	\N	\N	2	2019-11-14
1982	-14	生活日用	0	雨刮水	2019-11-14 20:07:45.40528+08	0	0	\N	2019-11-14 20:07:45.405586+08	\N	\N	2	2019-11-14
1983	-19	生活日用	0	吸水垫	2019-11-14 20:08:44.810977+08	0	0	\N	2019-11-14 20:08:44.811303+08	\N	\N	2	2019-11-14
1984	-34	生活日用	0	挡风被电瓶车	2019-11-14 20:09:14.244771+08	0	0	\N	2019-11-14 20:09:14.245123+08	\N	\N	2	2019-11-14
1985	-30	文教娱乐	0	水上乐园门票	2019-11-14 20:10:55.790117+08	0	0	\N	2019-11-14 20:10:55.790445+08	\N	\N	2	2019-11-14
1986	-5	饮食	0	橘子	2019-11-14 20:11:37.675302+08	0	0	\N	2019-11-14 20:11:37.675608+08	\N	\N	2	2019-11-11
1987	-1800	人情往来	0	结婚红包	2019-11-14 20:12:03.035326+08	0	0	\N	2019-11-14 20:12:03.035665+08	\N	\N	2	2019-11-14
1988	-435	文教娱乐	0	树莓派4B	2019-11-15 13:28:42.84377+08	0	0	\N	2019-11-15 13:28:42.846103+08	\N	\N	1	2019-11-07
1989	-8	饮食	0	美购	2019-11-15 13:29:09.208427+08	0	0	\N	2019-11-15 13:29:09.208752+08	\N	\N	1	2019-11-08
1990	-486	服饰美容	0	优衣库	2019-11-15 13:29:31.964427+08	0	0	\N	2019-11-15 13:29:31.964765+08	\N	\N	1	2019-11-09
1991	-30	交通出行	0	水上乐园	2019-11-15 13:30:02.504758+08	0	0	\N	2019-11-15 13:30:02.505122+08	\N	\N	1	2019-11-10
1992	-19	文教娱乐	0	micro HDMI	2019-11-15 13:32:33.510396+08	0	0	\N	2019-11-15 13:32:33.510711+08	\N	\N	1	2019-11-12
1993	-11	饮食	0	早餐	2019-11-15 13:32:51.130642+08	0	0	\N	2019-11-15 13:32:51.130984+08	\N	\N	1	2019-11-13
1996	-28	服饰美容	0	裤子	2019-11-20 11:39:40.684144+08	0	0	\N	2019-11-20 11:39:40.684466+08	\N	\N	2	2019-11-14
1997	-20	服饰美容	0	打底衫	2019-11-20 11:39:57.801446+08	0	0	\N	2019-11-20 11:39:57.801773+08	\N	\N	2	2019-11-15
1999	-28	生活日用	0	面霜爸爸	2019-11-20 11:40:59.770032+08	0	0	\N	2019-11-20 11:40:59.770387+08	\N	\N	2	2019-11-17
2000	-15	饮食	0	绿资	2019-11-20 11:41:24.528069+08	0	0	\N	2019-11-20 11:41:24.528383+08	\N	\N	2	2019-11-18
2001	-111	小孩玩具	0	积木	2019-11-20 11:41:44.462381+08	0	0	\N	2019-11-20 11:41:44.462691+08	\N	\N	2	2019-11-19
2002	-20	饮食	0	泡面	2019-11-20 11:42:01.755678+08	0	0	\N	2019-11-20 11:42:01.75599+08	\N	\N	2	2019-11-19
2003	-10	交通出行	0	停车费	2019-11-24 15:33:01.230858+08	0	0	\N	2019-11-24 15:33:01.23332+08	\N	\N	2	2019-11-24
2004	-50	饮食	0	菠萝蜜	2019-11-24 15:34:06.859702+08	0	0	\N	2019-11-24 15:34:06.86002+08	\N	\N	2	2019-11-20
2005	-13	小孩服饰	0	拖鞋	2019-11-24 15:34:23.830545+08	0	0	\N	2019-11-24 15:34:23.830863+08	\N	\N	2	2019-11-24
2006	-8	生活日用	0	海绵	2019-11-24 15:34:44.589859+08	0	0	\N	2019-11-24 15:34:44.590192+08	\N	\N	2	2019-11-24
2007	-11	生活日用	0	厨具去锈	2019-11-24 15:35:25.734512+08	0	0	\N	2019-11-24 15:35:25.734819+08	\N	\N	2	2019-11-24
2008	-90	小孩服饰	0	裤子	2019-11-24 15:35:41.32521+08	0	0	\N	2019-11-24 15:35:41.32555+08	\N	\N	2	2019-11-24
2009	-350	服饰美容	0	Dior口红	2019-11-24 15:36:00.850349+08	0	0	\N	2019-11-24 15:36:00.850675+08	\N	\N	2	2019-11-24
2011	-9	饮食	0	coco	2019-11-28 13:43:31.304742+08	0	0	\N	2019-11-28 13:43:31.30513+08	\N	\N	1	2019-11-21
2012	-229	服饰美容	0	hm	2019-11-28 13:44:06.510577+08	0	0	\N	2019-11-28 13:44:06.510896+08	\N	\N	1	2019-11-24
1994	14165	收入	1	工资	2019-11-15 13:35:28.129697+08	0	0	\N	2019-12-09 16:59:22.763023+08	\N	\N	1	2019-11-15
1952	28	1	1	规划	2019-11-06 14:11:35.45389+08	0	0	\N	2019-12-09 16:59:22.821072+08	\N	\N	1	2019-03-03
1951	28	1	1	规划	2019-11-06 14:11:30.495072+08	0	0	\N	2019-12-09 16:59:22.823376+08	\N	\N	1	2019-03-03
1950	28	1	1	规划	2019-11-06 14:11:20.385981+08	0	0	\N	2019-12-09 16:59:22.825592+08	\N	\N	1	2019-03-03
2013	-149	服饰美容	0	优衣库	2019-11-28 13:44:25.907118+08	0	0	\N	2019-11-28 13:44:25.907486+08	\N	\N	1	2019-11-24
2015	-18	饮食	0	牛肉面	2019-11-28 13:45:18.070502+08	0	0	\N	2019-11-28 13:45:18.070843+08	\N	\N	1	2019-11-26
2016	-20	饮食	0	早餐X2	2019-11-28 13:45:50.224658+08	0	0	\N	2019-11-28 13:45:50.225026+08	\N	\N	1	2019-11-26
2018	-29	生活日用	0	micro HDMI转换线	2019-11-28 13:46:54.515145+08	0	0	\N	2019-11-28 13:46:54.515473+08	\N	\N	1	2019-11-26
2019	-37	饮食	0	KFC	2019-11-28 13:47:54.129719+08	0	0	\N	2019-11-28 13:47:54.130026+08	\N	\N	1	2019-11-21
2020	-10	生活日用	0	推车租用	2019-11-28 13:48:25.140203+08	0	0	\N	2019-11-28 13:48:25.140533+08	\N	\N	1	2019-11-24
2021	-328	文教娱乐	0	plex pass	2019-11-28 17:48:17.123872+08	0	0	\N	2019-11-28 17:48:17.124198+08	\N	\N	1	2019-11-28
2022	-2640	小孩奶粉	0	卡洛塔尼X12	2019-12-01 21:34:38.720503+08	0	0	\N	2019-12-01 21:34:38.723047+08	\N	\N	1	2019-12-01
2023	-21	服饰美容	0	丝袜	2019-12-03 20:06:19.437396+08	0	0	\N	2019-12-03 20:06:19.439751+08	\N	\N	2	2019-11-24
2024	-47	饮食	0	美购	2019-12-03 20:07:00.757381+08	0	0	\N	2019-12-03 20:07:00.757807+08	\N	\N	2	2019-11-27
2025	-8	饮食	0	饮料	2019-12-03 20:07:27.402004+08	0	0	\N	2019-12-03 20:07:27.402331+08	\N	\N	2	2019-11-28
2026	-5	饮食	0	土豆	2019-12-03 20:07:43.576754+08	0	0	\N	2019-12-03 20:07:43.577134+08	\N	\N	2	2019-11-28
2029	-206	服饰美容	0	衣服	2019-12-03 20:11:27.972201+08	0	0	\N	2019-12-03 20:11:27.972527+08	\N	\N	2	2019-11-30
2030	-98	饮食	0	打底裤	2019-12-03 20:11:56.462311+08	0	0	\N	2019-12-03 20:11:56.462658+08	\N	\N	2	2019-11-28
2031	-9	饮食	0	奶茶	2019-12-03 20:12:13.710441+08	0	0	\N	2019-12-03 20:12:13.710756+08	\N	\N	2	2019-11-29
2032	-73	住房缴费	0	电费东兴	2019-12-03 20:12:37.175739+08	0	0	\N	2019-12-03 20:12:37.176057+08	\N	\N	2	2019-12-03
2033	-45	住房缴费	0	电费景湖	2019-12-03 20:13:07.796941+08	0	0	\N	2019-12-03 20:13:07.797447+08	\N	\N	2	2019-12-03
2034	-16	生活日用	0	润唇膏	2019-12-03 20:13:31.981659+08	0	0	\N	2019-12-03 20:13:31.981985+08	\N	\N	2	2019-12-02
2035	-40	生活日用	0	干洗衣服	2019-12-03 20:13:54.224684+08	0	0	\N	2019-12-03 20:13:54.225056+08	\N	\N	2	2019-12-03
2036	-24	饮食	0	绿资蛋糕	2019-12-03 20:14:20.823904+08	0	0	\N	2019-12-03 20:14:20.824229+08	\N	\N	2	2019-12-03
2037	-500	生活日用	0	眼镜	2019-12-03 20:15:34.214836+08	0	0	\N	2019-12-03 20:15:34.21516+08	\N	\N	2	2019-11-25
2038	-37	饮食	0	外卖	2019-12-03 20:16:10.515033+08	0	0	\N	2019-12-03 20:16:10.515358+08	\N	\N	2	2019-12-01
2039	-6	生活日用	0	拼多多月费	2019-12-03 20:16:33.754023+08	0	0	\N	2019-12-03 20:16:33.754331+08	\N	\N	2	2019-12-02
2044	-20	饮食	0	老婆大人	2019-12-06 17:27:32.103479+08	0	0	\N	2019-12-06 17:27:32.103801+08	\N	\N	1	2019-12-03
2045	-31	饮食	0	美购	2019-12-06 17:27:58.134023+08	0	0	\N	2019-12-06 17:27:58.134388+08	\N	\N	1	2019-12-04
2041	9763	收入	1	10月工资	2019-12-03 20:18:38.263291+08	0	0	\N	2019-12-09 16:59:22.759721+08	\N	\N	2	2019-11-28
1483	8545	收入	1	二月工资	2019-06-05 21:16:54.918987+08	0	0	\N	2019-12-09 16:59:22.797642+08	\N	\N	2	2019-06-05
764	13356	收入	1	工资	2018-10-28 18:50:55.847241+08	0	0	\N	2019-12-09 16:59:22.858032+08	\N	\N	1	2018-10-28
238	14666	收入	1	奖金	2018-02-09 18:11:28.913842+08	0	0	\N	2019-12-09 16:59:22.904825+08	\N	\N	1	2018-02-09
2051	-8	交通出行	0	地铁	2019-12-12 19:42:35.151237+08	0	0	\N	2019-12-12 19:42:35.151557+08	\N	\N	2	2019-12-07
2054	-259	饮食	0	金胡椒泰国	2019-12-12 19:43:47.125765+08	0	0	\N	2019-12-12 19:43:47.12613+08	\N	\N	2	2019-12-07
2056	-350	服饰美容	0	马威羽绒服	2019-12-12 19:44:31.485473+08	0	0	\N	2019-12-12 19:44:31.485876+08	\N	\N	2	2019-12-07
2057	-99	小孩服饰	0	毛衣	2019-12-12 19:45:01.480786+08	0	0	\N	2019-12-12 19:45:01.481193+08	\N	\N	2	2019-12-08
2058	-47	生活日用	0	艾灸	2019-12-12 19:45:18.935012+08	0	0	\N	2019-12-12 19:45:18.935335+08	\N	\N	2	2019-12-08
2059	-25	饮食	0	草莓	2019-12-12 19:45:48.497218+08	0	0	\N	2019-12-12 19:45:48.497529+08	\N	\N	2	2019-12-10
2060	-17	饮食	0	草莓	2019-12-12 19:46:05.460027+08	0	0	\N	2019-12-12 19:46:05.460331+08	\N	\N	2	2019-12-12
2061	-73	饮食	0	火锅	2019-12-12 19:46:54.130644+08	0	0	\N	2019-12-12 19:46:54.130981+08	\N	\N	2	2019-12-06
2062	-40	生活日用	0	拼多多	2019-12-12 19:47:24.593565+08	0	0	\N	2019-12-12 19:47:24.593912+08	\N	\N	2	2019-12-12
2063	-770	生活日用	0	蚕丝被	2019-12-12 19:47:43.358625+08	0	0	\N	2019-12-12 19:47:43.35899+08	\N	\N	2	2019-12-11
2064	-10	饮食	0	桔子	2019-12-14 20:31:17.610518+08	0	0	\N	2019-12-14 20:31:17.612909+08	\N	\N	2	2019-12-13
2065	-99	小孩服饰	0	优衣库背心	2019-12-14 20:31:44.798123+08	0	0	\N	2019-12-14 20:31:44.798436+08	\N	\N	2	2019-12-13
2066	-230	饮食	0	午餐	2019-12-14 20:31:58.258931+08	0	0	\N	2019-12-14 20:31:58.259253+08	\N	\N	2	2019-12-14
2067	-20	饮食	0	冰激凌	2019-12-14 20:32:08.80177+08	0	0	\N	2019-12-14 20:32:08.802109+08	\N	\N	2	2019-12-14
2068	-20	饮食	0	荞麦片	2019-12-14 20:32:32.253944+08	0	0	\N	2019-12-14 20:32:32.254287+08	\N	\N	2	2019-12-14
2069	-10	交通出行	0	停车费	2019-12-14 20:32:43.660541+08	0	0	\N	2019-12-14 20:32:43.660914+08	\N	\N	2	2019-12-14
2071	-100	饮食	0	O2	2019-12-14 20:33:01.718068+08	0	0	\N	2019-12-14 20:33:01.718409+08	\N	\N	2	2019-12-14
2072	-60	文教娱乐	0	水上乐园票	2019-12-14 20:33:42.809058+08	0	0	\N	2019-12-14 20:33:42.809369+08	\N	\N	2	2019-12-13
2074	-8	交通出行	0	地铁	2019-12-18 10:03:40.642674+08	0	0	\N	2019-12-18 10:03:40.642988+08	\N	\N	1	2019-12-07
2077	-180	小孩服饰	0	maxwin	2019-12-18 10:04:59.527035+08	0	0	\N	2019-12-18 10:04:59.527361+08	\N	\N	1	2019-12-07
2078	-268	饮食	0	麦德龙	2019-12-18 10:05:17.240519+08	0	0	\N	2019-12-18 10:05:17.240934+08	\N	\N	1	2019-12-07
2079	-42	饮食	0	水果	2019-12-18 10:05:50.936847+08	0	0	\N	2019-12-18 10:05:50.937205+08	\N	\N	1	2019-12-08
2080	-39	饮食	0	水果	2019-12-18 10:06:25.361757+08	0	0	\N	2019-12-18 10:06:25.36207+08	\N	\N	1	2019-12-15
2081	-90	小孩服饰	0	外套	2019-12-18 10:06:59.577112+08	0	0	\N	2019-12-18 10:06:59.577511+08	\N	\N	1	2019-12-15
2082	14165	收入	1	12月工资	2019-12-19 13:12:51.145382+08	0	0	\N	2019-12-19 13:12:51.147735+08	\N	\N	1	2019-12-13
2097	-94	生活日用	0	卷纸	2019-12-21 18:44:24.14199+08	0	0	\N	2019-12-21 18:44:24.144582+08	\N	\N	2	2019-12-15
2098	-87	饮食	0	美购	2019-12-21 18:44:53.38369+08	0	0	\N	2019-12-21 18:44:53.384039+08	\N	\N	2	2019-12-17
2099	-10	饮食	0	山药片	2019-12-21 18:45:14.534675+08	0	0	\N	2019-12-21 18:45:14.535009+08	\N	\N	2	2019-12-18
2100	-80	饮食	0	橙子20斤	2019-12-21 18:45:29.491724+08	0	0	\N	2019-12-21 18:45:29.492069+08	\N	\N	2	2019-12-21
2101	-16	饮食	0	茶香香	2019-12-21 18:46:53.877058+08	0	0	\N	2019-12-21 18:46:53.877394+08	\N	\N	2	2019-12-15
2102	-150	生活日用	0	卷纸200gx27x3	2019-12-21 18:47:21.145366+08	0	0	\N	2019-12-21 18:47:21.145714+08	\N	\N	2	2019-12-20
2103	-13	生活日用	0	手机支架	2019-12-21 18:49:20.206535+08	0	0	\N	2019-12-21 18:49:20.206849+08	\N	\N	2	2019-12-21
2104	-40	生活日用	0	唇釉	2019-12-21 18:54:38.97798+08	0	0	\N	2019-12-21 18:54:38.97835+08	\N	\N	2	2019-12-21
2105	-49	生活日用	0	圣诞礼物	2019-12-26 19:25:24.102679+08	0	0	\N	2019-12-26 19:25:24.10526+08	\N	\N	1	2019-12-18
2106	-14	饮食	0	coco	2019-12-26 19:25:45.666142+08	0	0	\N	2019-12-26 19:25:45.666498+08	\N	\N	1	2019-12-25
2107	-28	饮食	0	KFC	2019-12-26 19:25:59.884276+08	0	0	\N	2019-12-26 19:25:59.884608+08	\N	\N	1	2019-12-25
2108	-15	饮食	0	KFC	2019-12-26 19:26:36.198935+08	0	0	\N	2019-12-26 19:26:36.199252+08	\N	\N	1	2019-12-26
2109	-14370	健康保险	0	长生人寿保险	2019-12-26 19:31:10.231335+08	0	0	\N	2019-12-26 19:31:10.23171+08	\N	\N	1	2019-12-09
2110	-28	小孩服饰	0	袜子	2019-12-30 20:45:09.998383+08	0	0	\N	2019-12-30 20:45:10.000834+08	\N	\N	2	2019-12-21
2111	-20	小孩服饰	0	内裤	2019-12-30 20:45:26.756859+08	0	0	\N	2019-12-30 20:45:26.757222+08	\N	\N	2	2019-12-21
2112	-10	饮食	0	荞麦片	2019-12-30 20:45:54.429618+08	0	0	\N	2019-12-30 20:45:54.429952+08	\N	\N	2	2019-12-22
2113	-26	生活日用	0	热水袋	2019-12-30 20:46:19.423932+08	0	0	\N	2019-12-30 20:46:19.424249+08	\N	\N	2	2019-12-23
2114	-100	饮食	0	老婆大人	2019-12-30 20:47:04.372587+08	0	0	\N	2019-12-30 20:47:04.372937+08	\N	\N	2	2019-12-24
2115	-35	生活日用	0	美购	2019-12-30 20:47:23.549799+08	0	0	\N	2019-12-30 20:47:23.550176+08	\N	\N	2	2019-12-24
2116	-30	小孩玩具	0	贴纸	2019-12-30 20:47:44.977133+08	0	0	\N	2019-12-30 20:47:44.977525+08	\N	\N	2	2019-12-25
2117	-15	小孩服饰	0	袖套	2019-12-30 20:48:04.824912+08	0	0	\N	2019-12-30 20:48:04.825303+08	\N	\N	2	2019-12-25
2118	-21	生活日用	0	不干胶	2019-12-30 20:48:25.321061+08	0	0	\N	2019-12-30 20:48:25.321432+08	\N	\N	2	2019-12-26
2119	-20	饮食	0	寿司	2019-12-30 20:48:48.277753+08	0	0	\N	2019-12-30 20:48:48.278069+08	\N	\N	2	2019-12-28
2120	-12	饮食	0	串串	2019-12-30 20:49:11.603003+08	0	0	\N	2019-12-30 20:49:11.603316+08	\N	\N	2	2019-12-28
2121	-26	饮食	0	小杨生煎	2019-12-30 20:49:29.485119+08	0	0	\N	2019-12-30 20:49:29.485491+08	\N	\N	2	2019-12-28
2122	-18	饮食	0	串串	2019-12-30 20:49:55.595831+08	0	0	\N	2019-12-30 20:49:55.596192+08	\N	\N	2	2019-12-29
2123	-100	通讯物流	0	话费	2019-12-30 20:50:16.11599+08	0	0	\N	2019-12-30 20:50:16.116337+08	\N	\N	2	2019-12-29
2124	-60	生活日用	0	美购	2019-12-30 20:50:32.486277+08	0	0	\N	2019-12-30 20:50:32.486628+08	\N	\N	2	2019-12-30
2125	-8	通讯物流	0	申通	2019-12-30 20:51:26.102645+08	0	0	\N	2019-12-30 20:51:26.102994+08	\N	\N	2	2019-12-27
2126	-50	饮食	0	新美心	2019-12-30 20:52:00.797123+08	0	0	\N	2019-12-30 20:52:00.797491+08	\N	\N	2	2019-12-24
2127	-31	饮食	0	老婆大人	2020-01-03 20:42:14.000616+08	0	0	\N	2020-01-03 20:42:14.003322+08	\N	\N	1	2019-12-28
2128	-12	饮食	0	一鸣	2020-01-03 20:42:33.314736+08	0	0	\N	2020-01-03 20:42:33.315123+08	\N	\N	1	2019-12-28
2129	-54	饮食	0	银泰城	2020-01-03 20:43:00.503269+08	0	0	\N	2020-01-03 20:43:00.503635+08	\N	\N	1	2019-12-28
2132	-187	饮食	0	银泰零食	2020-01-03 20:44:37.500061+08	0	0	\N	2020-01-03 20:44:37.500431+08	\N	\N	1	2019-12-29
2133	-100	通讯物流	0	话费	2020-01-03 20:44:50.763042+08	0	0	\N	2020-01-03 20:44:50.763374+08	\N	\N	1	2019-12-29
2134	-540	服饰美容	0	鳄鱼衣服	2020-01-03 20:45:20.411097+08	0	0	\N	2020-01-03 20:45:20.411411+08	\N	\N	1	2019-12-29
2135	-7	饮食	0	一鸣	2020-01-03 20:45:40.546552+08	0	0	\N	2020-01-03 20:45:40.546909+08	\N	\N	1	2019-12-31
2136	-10	饮食	0	零食	2020-01-03 20:45:52.7406+08	0	0	\N	2020-01-03 20:45:52.740918+08	\N	\N	1	2019-12-31
2137	-50	饮食	0	零食	2020-01-03 20:46:28.30701+08	0	0	\N	2020-01-03 20:46:28.30737+08	\N	\N	1	2020-01-03
2138	-21	饮食	0	不二烫捞	2020-01-04 20:46:27.883864+08	0	0	\N	2020-01-04 20:46:27.886399+08	\N	\N	2	2019-12-31
2139	-13	饮食	0	一点点	2020-01-04 20:46:51.2202+08	0	0	\N	2020-01-04 20:46:51.220535+08	\N	\N	2	2019-12-31
2140	-18	饮食	0	串串	2020-01-04 20:47:06.756028+08	0	0	\N	2020-01-04 20:47:06.756343+08	\N	\N	2	2020-01-01
2141	-218	饮食	0	涌上外婆桥	2020-01-04 20:47:28.995639+08	0	0	\N	2020-01-04 20:47:28.995987+08	\N	\N	2	2020-01-01
2142	-15	饮食	0	o2	2020-01-04 20:47:52.388778+08	0	0	\N	2020-01-04 20:47:52.389161+08	\N	\N	2	2020-01-01
2143	-37	饮食	0	美购	2020-01-04 20:48:12.607849+08	0	0	\N	2020-01-04 20:48:12.608172+08	\N	\N	2	2020-01-01
2144	-32	住房缴费	0	景湖电费	2020-01-04 20:48:38.183855+08	0	0	\N	2020-01-04 20:48:38.184185+08	\N	\N	2	2020-01-02
2145	-14	住房缴费	0	景湖水费	2020-01-04 20:49:11.689373+08	0	0	\N	2020-01-04 20:49:11.689708+08	\N	\N	2	2020-01-03
2146	-344	服饰美容	0	德玛纳	2020-01-04 20:49:36.485518+08	0	0	\N	2020-01-04 20:49:36.485839+08	\N	\N	2	2020-01-03
2147	-111	住房缴费	0	电费	2020-01-04 20:49:49.344101+08	0	0	\N	2020-01-04 20:49:49.3444+08	\N	\N	2	2020-01-03
2148	-157	小孩服饰	0	内衣	2020-01-04 20:50:08.578838+08	0	0	\N	2020-01-04 20:50:08.57913+08	\N	\N	2	2020-01-03
2149	-116	饮食	0	炸了只鸡	2020-01-04 20:50:23.254776+08	0	0	\N	2020-01-04 20:50:23.255102+08	\N	\N	2	2020-01-04
2150	-24	生活日用	0	修眉刀	2020-01-04 20:50:42.174459+08	0	0	\N	2020-01-04 20:50:42.174805+08	\N	\N	2	2020-01-04
2151	-11	饮食	0	橘子	2020-01-04 20:51:53.254564+08	0	0	\N	2020-01-04 20:51:53.254902+08	\N	\N	2	2019-12-31
2152	-150	饮食	0	大米	2020-01-04 20:52:05.856838+08	0	0	\N	2020-01-04 20:52:05.857196+08	\N	\N	2	2020-01-01
2153	-5	交通出行	0	停车费	2020-01-04 20:52:39.373839+08	0	0	\N	2020-01-04 20:52:39.374147+08	\N	\N	2	2020-01-01
2154	-43	饮食	0	一点点	2020-01-04 20:52:53.542667+08	0	0	\N	2020-01-04 20:52:53.543009+08	\N	\N	2	2020-01-03
2155	-17	生活日用	0	支架	2020-01-04 20:53:46.853975+08	0	0	\N	2020-01-04 20:53:46.854333+08	\N	\N	2	2020-01-03
2156	-57	生活日用	0	灯	2020-01-04 20:54:15.716924+08	0	0	\N	2020-01-04 20:54:15.717316+08	\N	\N	2	2020-01-01
2157	-59	生活日用	0	灯	2020-01-04 20:54:28.550167+08	0	0	\N	2020-01-04 20:54:28.550505+08	\N	\N	2	2020-01-04
2159	-119	生活日用	0	洗发水	2020-01-08 19:52:10.790885+08	0	0	\N	2020-01-08 19:52:10.791204+08	\N	\N	2	2020-01-08
2160	-135	服饰美容	0	内衣2套	2020-01-08 19:52:42.053031+08	0	0	\N	2020-01-08 19:52:42.053378+08	\N	\N	2	2020-01-06
2161	-83	饮食	0	菠萝蜜	2020-01-08 19:53:58.173767+08	0	0	\N	2020-01-08 19:53:58.174116+08	\N	\N	2	2020-01-05
2162	-6	饮食	0	零食	2020-01-20 09:21:14.741405+08	0	0	\N	2020-01-20 09:21:14.744445+08	\N	\N	1	2020-01-04
2163	-51	饮食	0	美食	2020-01-20 09:22:17.155906+08	0	0	\N	2020-01-20 09:22:17.156219+08	\N	\N	1	2020-01-05
2164	-100	通讯物流	0	手机充值	2020-01-20 09:22:45.595274+08	0	0	\N	2020-01-20 09:22:45.595587+08	\N	\N	1	2020-01-08
2165	-28	饮食	0	午餐	2020-01-20 09:23:04.535917+08	0	0	\N	2020-01-20 09:23:04.536246+08	\N	\N	1	2020-01-20
2166	-50	饮食	0	午餐	2020-01-20 09:23:38.682113+08	0	0	\N	2020-01-20 09:23:38.682456+08	\N	\N	1	2020-01-12
2167	-25	饮食	0	美购	2020-01-20 09:23:59.786923+08	0	0	\N	2020-01-20 09:23:59.787266+08	\N	\N	1	2020-01-14
2168	-11	饮食	0	一鸣早餐	2020-01-20 09:24:18.426213+08	0	0	\N	2020-01-20 09:24:18.426563+08	\N	\N	1	2020-01-16
2170	-25	饮食	0	水果	2020-01-20 09:25:20.351307+08	0	0	\N	2020-01-20 09:25:20.351629+08	\N	\N	1	2020-01-18
2171	-50	饮食	0	海苔	2020-01-20 09:25:58.557504+08	0	0	\N	2020-01-20 09:25:58.557931+08	\N	\N	1	2020-01-19
2172	-90	饮食	0	车厘子两斤	2020-01-20 09:26:17.282154+08	0	0	\N	2020-01-20 09:26:17.282481+08	\N	\N	1	2020-01-19
2173	-370	饮食	0	迪思芙餐厅	2020-01-20 09:27:22.190948+08	0	0	\N	2020-01-20 09:27:22.19129+08	\N	\N	1	2020-01-05
2174	-18	饮食	0	零食	2020-01-20 09:27:46.255963+08	0	0	\N	2020-01-20 09:27:46.256301+08	\N	\N	1	2020-01-14
2175	-60	饮食	0	红美人十斤	2020-01-20 09:28:13.529673+08	0	0	\N	2020-01-20 09:28:13.529982+08	\N	\N	1	2020-01-19
2176	14875	收入	1	工资	2020-01-20 09:29:25.860115+08	0	0	\N	2020-01-20 09:29:25.86045+08	\N	\N	1	2020-01-15
2177	29427	收入	1	奖金	2020-01-20 09:29:50.336254+08	0	0	\N	2020-01-20 09:29:50.336661+08	\N	\N	1	2020-01-17
2178	-179	服饰美容	0	鞋子	2020-01-20 22:22:56.51208+08	0	0	\N	2020-01-20 22:22:56.51245+08	\N	\N	2	2020-01-09
2179	-126	住房缴费	0	水费	2020-01-20 22:23:23.222945+08	0	0	\N	2020-01-20 22:23:23.223306+08	\N	\N	2	2020-01-11
2180	-37	生活日用	0	防滑垫	2020-01-20 22:24:25.645394+08	0	0	\N	2020-01-20 22:24:25.645751+08	\N	\N	2	2020-01-12
2181	-400	生活日用	0	汽车电瓶	2020-01-20 22:25:22.084653+08	0	0	\N	2020-01-20 22:25:22.085041+08	\N	\N	2	2020-01-17
2182	-62	生活日用	0	挡风空调板	2020-01-20 22:26:07.522247+08	0	0	\N	2020-01-20 22:26:07.522616+08	\N	\N	2	2020-01-19
2183	-271	小孩服饰	0	mqd毛衣和裤子	2020-01-20 22:26:38.769801+08	0	0	\N	2020-01-20 22:26:38.770152+08	\N	\N	2	2020-01-20
2184	-176	服饰美容	0	鞋子	2020-01-20 22:28:11.266623+08	0	0	\N	2020-01-20 22:28:11.266976+08	\N	\N	2	2020-01-05
2185	-41	服饰美容	0	裤子	2020-01-20 22:28:25.601275+08	0	0	\N	2020-01-20 22:28:25.601599+08	\N	\N	2	2020-01-20
2186	-49	饮食	0	披萨	2020-01-20 22:30:42.888006+08	0	0	\N	2020-01-20 22:30:42.888341+08	\N	\N	2	2020-01-18
2187	9755	收入	1	11月工资	2020-01-20 22:31:24.214934+08	0	0	\N	2020-01-20 22:31:24.215284+08	\N	\N	2	2020-01-20
2188	9755	收入	1	12月工资	2020-01-20 22:31:46.443347+08	0	0	\N	2020-01-20 22:31:46.443688+08	\N	\N	2	2020-01-20
2190	-269	小孩服饰	0	鞋子	2020-01-22 11:17:59.893127+08	0	0	\N	2020-01-22 11:17:59.89344+08	\N	\N	2	2020-01-21
2191	-168	小孩服饰	0	毛衣裤子	2020-01-22 11:18:18.047839+08	0	0	\N	2020-01-22 11:18:18.048174+08	\N	\N	2	2020-01-22
2192	-280	小孩服饰	0	迪士尼秋衣秋裤	2020-01-22 11:18:41.284886+08	0	0	\N	2020-01-22 11:18:41.285331+08	\N	\N	2	2020-01-21
2193	-40	饮食	0	西瓜子	2020-01-22 11:18:52.615174+08	0	0	\N	2020-01-22 11:18:52.61559+08	\N	\N	2	2020-01-22
2194	-236	饮食	0	水果	2020-02-06 11:33:23.099387+08	0	0	\N	2020-02-06 11:33:23.101949+08	\N	\N	2	2020-01-23
2195	-43	生活日用	0	美购	2020-02-06 11:34:27.199796+08	0	0	\N	2020-02-06 11:34:27.200172+08	\N	\N	2	2020-01-29
2196	-59	生活日用	0	药	2020-02-06 11:34:42.395563+08	0	0	\N	2020-02-06 11:34:42.395908+08	\N	\N	2	2020-01-29
2197	-23	生活日用	0	美购	2020-02-06 11:35:26.967193+08	0	0	\N	2020-02-06 11:35:26.967551+08	\N	\N	2	2020-01-29
2198	-10	生活日用	0	用品	2020-02-06 11:36:19.972409+08	0	0	\N	2020-02-06 11:36:19.972762+08	\N	\N	2	2020-01-30
2169	-15000	小孩教育	0	托班半年	2020-01-20 09:25:00.307658+08	0	0	\N	2020-07-20 13:36:03.704756+08	\N	\N	1	2020-01-17
2199	-110	住房缴费	0	景湖电费	2020-02-06 11:37:15.475851+08	0	0	\N	2020-02-06 11:37:15.476216+08	\N	\N	2	2020-02-02
2200	-133	住房缴费	0	东兴电费	2020-02-06 11:37:35.6359+08	0	0	\N	2020-02-06 11:37:35.636216+08	\N	\N	2	2020-02-02
2201	-286	交通出行	0	加油	2020-02-06 11:37:35.998767+08	0	0	\N	2020-02-06 11:37:35.999089+08	\N	\N	1	2020-01-20
2202	-110	文教娱乐	0	烟花	2020-02-06 11:38:08.704617+08	0	0	\N	2020-02-06 11:38:08.70499+08	\N	\N	1	2020-01-22
2203	-60	生活日用	0	医用酒精棉10瓶	2020-02-06 11:39:07.302181+08	0	0	\N	2020-02-06 11:39:07.302511+08	\N	\N	1	2020-01-29
2204	-5	生活日用	0	停车费	2020-02-06 11:39:39.494159+08	0	0	\N	2020-02-06 11:39:39.494502+08	\N	\N	2	2020-01-21
2205	-70	通讯物流	0	腾讯VIP	2020-02-06 11:39:59.125604+08	0	0	\N	2020-02-06 11:39:59.126061+08	\N	\N	2	2020-02-04
2206	-49	服饰美容	0	内衣	2020-02-06 11:40:21.322624+08	0	0	\N	2020-02-06 11:40:21.32294+08	\N	\N	2	2020-01-18
2207	-158	生活日用	0	保为康1860x60	2020-02-06 11:41:12.241896+08	0	0	\N	2020-02-06 11:41:12.242242+08	\N	\N	1	2020-01-29
2209	-198	生活日用	0	kf94儿童口罩x20	2020-02-06 11:42:56.784998+08	0	0	\N	2020-02-06 11:42:56.785338+08	\N	\N	1	2020-01-30
2210	-306	生活日用	0	kf94口罩x30	2020-02-06 11:43:33.517546+08	0	0	\N	2020-02-06 11:43:33.517867+08	\N	\N	1	2020-01-30
2211	-40	生活日用	0	口罩	2020-02-06 11:43:47.639415+08	0	0	\N	2020-02-06 11:43:47.639764+08	\N	\N	2	2020-01-28
2212	-87	饮食	0	美购	2020-02-06 11:43:58.067365+08	0	0	\N	2020-02-06 11:43:58.067736+08	\N	\N	1	2020-02-04
2217	-69	生活日用	0	京东	2020-02-06 11:47:05.638986+08	0	0	\N	2020-02-06 11:47:05.639296+08	\N	\N	2	2020-02-03
2218	560	收入	1	土地	2020-02-06 11:47:23.264879+08	0	0	\N	2020-02-06 11:47:23.265222+08	\N	\N	2	2020-02-06
2219	-378	生活日用	0	neomed口罩x2	2020-02-06 11:48:03.645917+08	0	0	\N	2020-02-06 11:48:03.646259+08	\N	\N	1	2020-01-30
2220	-169	饮食	0	天猫超市	2020-02-11 12:08:06.872447+08	0	0	\N	2020-02-11 12:08:06.87503+08	\N	\N	2	2020-02-09
2221	-59	生活日用	0	薄饼机	2020-02-11 12:08:23.182123+08	0	0	\N	2020-02-11 12:08:23.182746+08	\N	\N	2	2020-02-10
2223	-6	生活日用	0	手机膜	2020-02-20 22:00:45.618786+08	0	0	\N	2020-02-20 22:00:45.619108+08	\N	\N	2	2020-02-11
2224	-70	生活日用	0	多功能锅	2020-02-20 22:01:15.199831+08	0	0	\N	2020-02-20 22:01:15.200156+08	\N	\N	2	2020-02-11
2225	-34	饮食	0	水果	2020-02-20 22:01:47.658465+08	0	0	\N	2020-02-20 22:01:47.658836+08	\N	\N	2	2020-02-12
2226	-37	饮食	0	寿司	2020-02-20 22:02:19.615003+08	0	0	\N	2020-02-20 22:02:19.615435+08	\N	\N	2	2020-02-12
2227	-9	生活日用	0	垃圾桶	2020-02-20 22:02:50.508439+08	0	0	\N	2020-02-20 22:02:50.508775+08	\N	\N	2	2020-02-18
2228	-100	饮食	0	老婆大人	2020-02-20 22:03:08.724026+08	0	0	\N	2020-02-20 22:03:08.724363+08	\N	\N	2	2020-02-19
2229	-102	生活日用	0	书	2020-02-20 22:03:30.326239+08	0	0	\N	2020-02-20 22:03:30.326646+08	\N	\N	2	2020-02-20
2230	-28	生活日用	0	地球仪	2020-02-20 22:03:44.904633+08	0	0	\N	2020-02-20 22:03:44.905004+08	\N	\N	2	2020-02-20
2232	-200	饮食	0	绿资充值	2020-02-20 22:07:13.161649+08	0	0	\N	2020-02-20 22:07:13.162014+08	\N	\N	2	2020-02-12
2233	-79	生活日用	0	电饼	2020-02-20 22:09:38.014962+08	0	0	\N	2020-02-20 22:09:38.015296+08	\N	\N	2	2020-02-18
2234	-53	饮食	0	肯德基	2020-02-20 22:10:58.060356+08	0	0	\N	2020-02-20 22:10:58.060682+08	\N	\N	2	2020-02-13
2235	-9	饮食	0	橘子	2020-02-24 19:18:13.638531+08	0	0	\N	2020-02-24 19:18:13.640812+08	\N	\N	2	2020-02-22
2236	-63	饮食	0	水果	2020-02-24 19:18:27.07484+08	0	0	\N	2020-02-24 19:18:27.075175+08	\N	\N	2	2020-02-23
2237	-24	饮食	0	鸡蛋饼	2020-02-24 19:18:40.801816+08	0	0	\N	2020-02-24 19:18:40.802132+08	\N	\N	2	2020-02-23
2238	-199	生活日用	0	小米移动电源	2020-02-24 19:19:03.835733+08	0	0	\N	2020-02-24 19:19:03.836051+08	\N	\N	2	2020-02-23
2239	-100	生活日用	0	耳机	2020-02-24 23:41:19.365537+08	0	0	\N	2020-02-24 23:41:19.365873+08	\N	\N	2	2020-02-24
2240	-27	生活日用	0	电脑包	2020-02-27 23:20:02.953114+08	0	0	\N	2020-02-27 23:20:02.956044+08	\N	\N	2	2020-02-27
2241	-60	生活日用	0	一次性手套x100	2020-02-29 20:52:18.747189+08	0	0	\N	2020-02-29 20:52:18.749847+08	\N	\N	1	2020-02-07
2242	-95	饮食	0	美购	2020-02-29 20:52:39.673015+08	0	0	\N	2020-02-29 20:52:39.673369+08	\N	\N	1	2020-02-09
2243	-26	饮食	0	绿姿	2020-02-29 20:53:05.284777+08	0	0	\N	2020-02-29 20:53:05.285181+08	\N	\N	1	2020-02-09
2244	-20	饮食	0	药	2020-02-29 20:53:23.68838+08	0	0	\N	2020-02-29 20:53:23.688724+08	\N	\N	1	2020-02-09
2245	-43	饮食	0	美购	2020-02-29 20:53:52.079619+08	0	0	\N	2020-02-29 20:53:52.079938+08	\N	\N	1	2020-02-17
2246	-30	饮食	0	绿姿	2020-02-29 20:54:11.028387+08	0	0	\N	2020-02-29 20:54:11.028845+08	\N	\N	1	2020-02-17
2247	-52	饮食	0	老婆大人	2020-02-29 20:54:27.349296+08	0	0	\N	2020-02-29 20:54:27.349663+08	\N	\N	1	2020-02-17
2248	-40	生活日用	0	理发	2020-02-29 20:54:50.037948+08	0	0	\N	2020-02-29 20:54:50.038283+08	\N	\N	1	2020-02-20
2249	-35	饮食	0	美购	2020-02-29 20:55:15.233679+08	0	0	\N	2020-02-29 20:55:15.234029+08	\N	\N	1	2020-02-25
2250	-33	饮食	0	绿姿	2020-02-29 20:55:28.612664+08	0	0	\N	2020-02-29 20:55:28.613046+08	\N	\N	1	2020-02-25
2251	-10	饮食	0	水果	2020-02-29 20:55:49.344717+08	0	0	\N	2020-02-29 20:55:49.345071+08	\N	\N	1	2020-02-25
2252	-100	通讯物流	0	话费	2020-02-29 20:56:10.162758+08	0	0	\N	2020-02-29 20:56:10.16308+08	\N	\N	1	2020-02-27
2253	-69	小孩玩具	0	超级飞侠	2020-02-29 20:56:37.225114+08	0	0	\N	2020-02-29 20:56:37.225513+08	\N	\N	1	2020-02-28
2254	-55	饮食	0	水果	2020-02-29 20:56:53.350147+08	0	0	\N	2020-02-29 20:56:53.350474+08	\N	\N	1	2020-02-28
2255	-66	饮食	0	KFC	2020-02-29 20:58:51.576259+08	0	0	\N	2020-02-29 20:58:51.576647+08	\N	\N	1	2020-02-07
2256	-54	生活日用	0	一次性手套	2020-02-29 20:59:28.284531+08	0	0	\N	2020-02-29 20:59:28.284835+08	\N	\N	1	2020-02-08
2257	-9	生活日用	0	用品	2020-03-01 21:01:39.480757+08	0	0	\N	2020-03-01 21:01:39.483188+08	\N	\N	2	2020-03-01
2258	-100	生活日用	0	口罩	2020-03-01 21:01:49.116829+08	0	0	\N	2020-03-01 21:01:49.117184+08	\N	\N	2	2020-03-01
2259	-40	小孩其他	0	儿童凳子	2020-03-04 13:06:13.345174+08	0	0	\N	2020-03-04 13:06:13.347775+08	\N	\N	1	2020-03-02
2260	-59	小孩玩具	0	小猪佩奇书	2020-03-04 13:06:43.482513+08	0	0	\N	2020-03-04 13:06:43.482867+08	\N	\N	1	2020-03-02
2261	-69	小孩玩具	0	超级飞侠配角x4	2020-03-04 13:07:24.791286+08	0	0	\N	2020-03-04 13:07:24.791631+08	\N	\N	1	2020-03-03
2262	-7	住房缴费	0	景湖水费	2020-03-04 20:33:30.000878+08	0	0	\N	2020-03-04 20:33:30.001297+08	\N	\N	2	2020-03-03
2263	-27	住房缴费	0	景湖电费	2020-03-04 20:33:52.58647+08	0	0	\N	2020-03-04 20:33:52.586843+08	\N	\N	2	2020-03-04
2264	-133	住房缴费	0	东兴电费	2020-03-04 20:34:07.281542+08	0	0	\N	2020-03-04 20:34:07.281856+08	\N	\N	2	2020-03-04
2265	-21	生活日用	0	美购	2020-03-04 20:34:20.911234+08	0	0	\N	2020-03-04 20:34:20.911559+08	\N	\N	2	2020-03-04
2266	-100	饮食	0	老婆大人	2020-03-04 20:34:32.907046+08	0	0	\N	2020-03-04 20:34:32.907412+08	\N	\N	2	2020-03-04
2267	-50	饮食	0	一鸣	2020-03-04 20:35:16.282022+08	0	0	\N	2020-03-04 20:35:16.28236+08	\N	\N	2	2020-02-28
2268	-189	小孩健康	0	dha锌片	2020-03-04 20:36:19.166067+08	0	0	\N	2020-03-04 20:36:19.166382+08	\N	\N	2	2020-03-02
2269	-29	饮食	0	KFC	2020-03-12 11:05:20.185628+08	0	0	\N	2020-03-12 11:05:20.188231+08	\N	\N	1	2020-03-03
2270	-2640	小孩奶粉	0	卡洛塔尼x12	2020-03-12 11:05:56.065626+08	0	0	\N	2020-03-12 11:05:56.065955+08	\N	\N	1	2020-03-07
2271	-10	交通出行	0	停车费	2020-03-12 11:07:13.344132+08	0	0	\N	2020-03-12 11:07:13.344469+08	\N	\N	1	2020-03-07
2272	-155	饮食	0	超市	2020-03-12 11:07:45.305309+08	0	0	\N	2020-03-12 11:07:45.305661+08	\N	\N	1	2020-03-08
2275	14874	收入	1	工资	2020-03-13 16:04:58.22539+08	0	0	\N	2020-03-13 16:04:58.227647+08	\N	\N	1	2020-03-13
2276	-70	饮食	0	水果	2020-03-18 13:21:31.960473+08	0	0	\N	2020-03-18 13:21:31.962817+08	\N	\N	1	2020-03-14
2277	-5	饮食	0	酸奶	2020-03-18 13:22:24.315064+08	0	0	\N	2020-03-18 13:22:24.315417+08	\N	\N	1	2020-03-15
2278	-12	生活日用	0	去胶剂	2020-03-22 21:01:42.931967+08	0	0	\N	2020-03-22 21:01:42.934583+08	\N	\N	2	2020-03-06
2279	-27	生活日用	0	衣服	2020-03-22 21:02:05.90021+08	0	0	\N	2020-03-22 21:02:05.900566+08	\N	\N	2	2020-03-06
2280	-35	饮食	0	水果	2020-03-22 21:02:24.773284+08	0	0	\N	2020-03-22 21:02:24.773624+08	\N	\N	2	2020-03-07
2281	-200	生活日用	0	一鸣	2020-03-22 21:02:49.400687+08	0	0	\N	2020-03-22 21:02:49.401223+08	\N	\N	2	2020-03-10
2282	-16	饮食	0	水果	2020-03-22 21:03:07.055196+08	0	0	\N	2020-03-22 21:03:07.055585+08	\N	\N	2	2020-03-10
2364	-88	饮食	0	奶油	2020-04-26 15:42:19.478651+08	0	0	\N	2020-04-26 15:42:19.478992+08	\N	\N	2	2020-04-23
2283	-140	住房缴费	0	东兴水费	2020-03-22 21:03:33.681658+08	0	0	\N	2020-03-22 21:03:33.68197+08	\N	\N	2	2020-03-12
2284	-100	通讯物流	0	话费	2020-03-22 21:04:16.474865+08	0	0	\N	2020-03-22 21:04:16.475186+08	\N	\N	2	2020-03-14
2285	-50	饮食	0	水果	2020-03-22 21:04:41.043085+08	0	0	\N	2020-03-22 21:04:41.043491+08	\N	\N	2	2020-03-22
2286	-15	饮食	0	草莓	2020-03-22 21:05:08.196869+08	0	0	\N	2020-03-22 21:05:08.19724+08	\N	\N	2	2020-03-22
2287	-22	小孩玩具	0	玩具	2020-03-22 21:05:17.575987+08	0	0	\N	2020-03-22 21:05:17.576303+08	\N	\N	2	2020-03-22
2288	-40	饮食	0	水果	2020-03-22 21:05:49.764059+08	0	0	\N	2020-03-22 21:05:49.76444+08	\N	\N	2	2020-03-16
2289	-17	饮食	0	零食	2020-03-22 21:06:07.551718+08	0	0	\N	2020-03-22 21:06:07.552077+08	\N	\N	2	2020-03-21
2290	-110	服饰美容	0	衣服	2020-03-22 21:09:14.66409+08	0	0	\N	2020-03-22 21:09:14.664529+08	\N	\N	2	2020-03-17
2291	-54	饮食	0	奶油	2020-03-28 14:24:17.700681+08	0	0	\N	2020-03-28 14:24:17.703352+08	\N	\N	2	2020-03-26
2292	-143	服饰美容	0	卫衣	2020-03-28 14:24:34.782018+08	0	0	\N	2020-03-28 14:24:34.782361+08	\N	\N	2	2020-03-28
2293	-226	小孩服饰	0	衣服	2020-03-28 14:24:54.261524+08	0	0	\N	2020-03-28 14:24:54.26194+08	\N	\N	2	2020-03-28
2294	-256	小孩服饰	0	衣服	2020-03-28 14:25:04.942582+08	0	0	\N	2020-03-28 14:25:04.942901+08	\N	\N	2	2020-03-28
2295	-185	饮食	0	烧烤	2020-03-28 14:25:58.979977+08	0	0	\N	2020-03-28 14:25:58.980298+08	\N	\N	2	2020-03-27
2296	-35	饮食	0	拉那巴米	2020-03-28 14:27:00.725836+08	0	0	\N	2020-03-28 14:27:00.726151+08	\N	\N	2	2020-03-28
2297	-5	生活日用	0	停车费	2020-03-28 14:27:31.671574+08	0	0	\N	2020-03-28 14:27:31.671962+08	\N	\N	2	2020-03-28
2298	-14	饮食	0	零食	2020-03-28 16:34:11.975763+08	0	0	\N	2020-03-28 16:34:11.976071+08	\N	\N	2	2020-03-28
2299	-21	生活日用	0	超市	2020-03-28 16:34:30.001814+08	0	0	\N	2020-03-28 16:34:30.002144+08	\N	\N	2	2020-03-28
2300	-67	小孩玩具	0	80年代玩具	2020-04-03 13:24:29.085166+08	0	0	\N	2020-04-03 13:24:29.087559+08	\N	\N	1	2020-03-21
2301	-25	饮食	0	美购	2020-04-03 13:24:46.179271+08	0	0	\N	2020-04-03 13:24:46.179614+08	\N	\N	1	2020-03-21
2302	-30	通讯物流	0	话费	2020-04-03 13:25:32.850102+08	0	0	\N	2020-04-03 13:25:32.85057+08	\N	\N	1	2020-03-29
2305	-19	小孩玩具	0	托马斯水枪x2	2020-04-03 13:27:04.549371+08	0	0	\N	2020-04-03 13:27:04.549672+08	\N	\N	1	2020-03-29
2306	-50	小孩玩具	0	迪斯尼泡泡机	2020-04-03 13:27:23.937057+08	0	0	\N	2020-04-03 13:27:23.937389+08	\N	\N	1	2020-03-29
2307	-200	交通出行	0	加油费	2020-04-03 13:28:05.505695+08	0	0	\N	2020-04-03 13:28:05.506029+08	\N	\N	1	2020-03-18
2308	-294	生活日用	0	麦德龙	2020-04-03 13:28:53.554991+08	0	0	\N	2020-04-03 13:28:53.555301+08	\N	\N	1	2020-03-28
2309	-40	生活日用	0	驾照+照片+手续费	2020-04-03 13:29:57.274312+08	0	0	\N	2020-04-03 13:29:57.274634+08	\N	\N	1	2020-03-29
2310	-99	通讯物流	0	联通充值	2020-04-05 21:07:48.536434+08	0	0	\N	2020-04-05 21:07:48.539025+08	\N	\N	2	2020-03-28
2311	-18	饮食	0	美购	2020-04-05 21:08:07.678739+08	0	0	\N	2020-04-05 21:08:07.679163+08	\N	\N	2	2020-03-29
2312	-28	饮食	0	菠萝蜜	2020-04-05 21:08:37.319983+08	0	0	\N	2020-04-05 21:08:37.320302+08	\N	\N	2	2020-04-01
2313	-46	饮食	0	水果	2020-04-05 21:08:56.952602+08	0	0	\N	2020-04-05 21:08:56.952938+08	\N	\N	2	2020-04-02
2314	-100	饮食	0	老婆大人	2020-04-05 21:09:09.23824+08	0	0	\N	2020-04-05 21:09:09.238564+08	\N	\N	2	2020-04-02
2315	-42	健康保险	0	止痛药	2020-04-05 21:09:41.066498+08	0	0	\N	2020-04-05 21:09:41.066823+08	\N	\N	2	2020-04-02
2317	-32	住房缴费	0	景湖电费	2020-04-05 21:10:38.003578+08	0	0	\N	2020-04-05 21:10:38.003886+08	\N	\N	2	2020-04-03
2318	-100	住房缴费	0	东兴电费	2020-04-05 21:11:04.522522+08	0	0	\N	2020-04-05 21:11:04.522881+08	\N	\N	2	2020-04-03
2319	-27	生活日用	0	拼多多三个月会员	2020-04-05 21:11:44.051211+08	0	0	\N	2020-04-05 21:11:44.05154+08	\N	\N	2	2020-04-05
2320	-14	饮食	0	土豆	2020-04-05 21:11:58.261484+08	0	0	\N	2020-04-05 21:11:58.261828+08	\N	\N	2	2020-04-05
2321	-10	饮食	0	大饼和肉串	2020-04-05 21:12:47.127194+08	0	0	\N	2020-04-05 21:12:47.127533+08	\N	\N	2	2020-04-04
2322	-21	饮食	0	一鸣早餐	2020-04-10 15:11:42.010876+08	0	0	\N	2020-04-10 15:11:42.013256+08	\N	\N	1	2020-04-04
2323	-45	饮食	0	水果	2020-04-10 15:11:57.731252+08	0	0	\N	2020-04-10 15:11:57.731649+08	\N	\N	1	2020-04-04
2324	-12	饮食	0	水果	2020-04-10 15:12:24.025572+08	0	0	\N	2020-04-10 15:12:24.025934+08	\N	\N	1	2020-04-04
2325	-7	饮食	0	早餐	2020-04-10 15:12:48.179791+08	0	0	\N	2020-04-10 15:12:48.180112+08	\N	\N	1	2020-04-05
2326	-24	饮食	0	中翅	2020-04-10 15:13:15.737071+08	0	0	\N	2020-04-10 15:13:15.73741+08	\N	\N	1	2020-04-05
2327	-15	饮食	0	牛肉	2020-04-10 15:13:31.880435+08	0	0	\N	2020-04-10 15:13:31.880744+08	\N	\N	1	2020-04-05
2328	-13	饮食	0	五花肉	2020-04-10 15:13:54.250838+08	0	0	\N	2020-04-10 15:13:54.25115+08	\N	\N	1	2020-04-05
2329	-5	饮食	0	椒盐	2020-04-10 15:14:12.002302+08	0	0	\N	2020-04-10 15:14:12.002643+08	\N	\N	1	2020-04-05
2331	-35	饮食	0	超市	2020-04-10 15:15:05.645754+08	0	0	\N	2020-04-10 15:15:05.646132+08	\N	\N	1	2020-04-06
2332	-17	饮食	0	零食	2020-04-10 15:16:08.04644+08	0	0	\N	2020-04-10 15:16:08.046767+08	\N	\N	1	2020-04-05
2333	-27	生活日用	0	新江厦	2020-04-14 21:15:22.799011+08	0	0	\N	2020-04-14 21:15:22.801691+08	\N	\N	2	2020-04-06
2334	-607	服饰美容	0	衣服	2020-04-14 21:15:39.281373+08	0	0	\N	2020-04-14 21:15:39.281753+08	\N	\N	2	2020-04-07
2335	-29	生活日用	0	新江厦	2020-04-14 21:16:16.597591+08	0	0	\N	2020-04-14 21:16:16.597924+08	\N	\N	2	2020-04-08
2336	-50	生活日用	0	物美	2020-04-14 21:16:30.979712+08	0	0	\N	2020-04-14 21:16:30.980045+08	\N	\N	2	2020-04-08
2337	-19	饮食	0	物美	2020-04-14 21:21:11.380712+08	0	0	\N	2020-04-14 21:21:11.381085+08	\N	\N	2	2020-04-10
2338	-15	小孩生活用品	0	尿壶	2020-04-14 21:22:00.02902+08	0	0	\N	2020-04-14 21:22:00.029451+08	\N	\N	2	2020-04-11
2339	-140	生活日用	0	新江厦	2020-04-14 21:22:24.656587+08	0	0	\N	2020-04-14 21:22:24.657057+08	\N	\N	2	2020-04-12
2340	-26	饮食	0	李子	2020-04-14 21:22:42.234949+08	0	0	\N	2020-04-14 21:22:42.235304+08	\N	\N	2	2020-04-14
2341	-150	饮食	0	大米	2020-04-14 21:23:28.314339+08	0	0	\N	2020-04-14 21:23:28.314725+08	\N	\N	2	2020-04-14
2344	11460	收入	1	二月份工资	2020-04-14 21:26:17.115951+08	0	0	\N	2020-04-14 21:26:17.116325+08	\N	\N	2	2020-04-09
2345	2900	收入	1	一月工资	2020-04-14 21:28:04.825499+08	0	0	\N	2020-04-14 21:28:04.825865+08	\N	\N	2	2020-03-25
2346	-30	饮食	0	辣条	2020-04-18 07:23:55.234134+08	0	0	\N	2020-04-18 07:23:55.236405+08	\N	\N	2	2020-04-17
2347	-89	生活日用	0	卫生巾	2020-04-18 07:24:12.927273+08	0	0	\N	2020-04-18 07:24:12.927647+08	\N	\N	2	2020-04-18
2348	-49	小孩生活用品	0	学饮杯	2020-04-18 07:24:43.926674+08	0	0	\N	2020-04-18 07:24:43.926992+08	\N	\N	2	2020-04-18
2349	-96	饮食	0	水果	2020-04-18 07:26:02.005028+08	0	0	\N	2020-04-18 07:26:02.005363+08	\N	\N	2	2020-04-15
2350	-27	饮食	0	奶茶	2020-04-18 07:26:26.150017+08	0	0	\N	2020-04-18 07:26:26.150371+08	\N	\N	2	2020-04-15
2351	-83	生活日用	0	高压水枪	2020-04-18 07:27:26.27789+08	0	0	\N	2020-04-18 07:27:26.27821+08	\N	\N	2	2020-04-16
2352	-26	饮食	0	欧文	2020-04-18 07:27:58.770148+08	0	0	\N	2020-04-18 07:27:58.770504+08	\N	\N	2	2020-04-16
2353	-15	生活日用	0	鸡蛋盒	2020-04-18 07:28:50.471881+08	0	0	\N	2020-04-18 07:28:50.47222+08	\N	\N	2	2020-04-17
2354	-125	饮食	0	水果	2020-04-18 09:42:50.247513+08	0	0	\N	2020-04-18 09:42:50.24786+08	\N	\N	2	2020-04-18
2355	-30	饮食	0	水果	2020-04-22 13:07:50.251247+08	0	0	\N	2020-04-22 13:07:50.253671+08	\N	\N	2	2020-04-18
2356	-20	饮食	0	水果	2020-04-22 13:08:09.373386+08	0	0	\N	2020-04-22 13:08:09.373826+08	\N	\N	2	2020-04-19
2357	-25	生活日用	0	蛋糕模具	2020-04-22 13:08:45.227687+08	0	0	\N	2020-04-22 13:08:45.228026+08	\N	\N	2	2020-04-19
2358	-69	饮食	0	水果	2020-04-22 13:09:05.548001+08	0	0	\N	2020-04-22 13:09:05.548338+08	\N	\N	2	2020-04-20
2359	-27	生活日用	0	拖把	2020-04-22 13:09:23.431052+08	0	0	\N	2020-04-22 13:09:23.431375+08	\N	\N	2	2020-04-20
2360	-8	文教娱乐	0	芒果TV 	2020-04-22 13:10:35.253135+08	0	0	\N	2020-04-22 13:10:35.25346+08	\N	\N	2	2020-04-20
2361	-1000	交通出行	0	油卡	2020-04-22 13:11:35.895377+08	0	0	\N	2020-04-22 13:11:35.895765+08	\N	\N	2	2020-04-21
2362	-1000	交通出行	0	油卡2	2020-04-22 13:11:47.735205+08	0	0	\N	2020-04-22 13:11:47.735604+08	\N	\N	2	2020-04-21
2363	-3097	交通出行	0	人保车险	2020-04-26 15:41:54.051697+08	0	0	\N	2020-04-26 15:41:54.054386+08	\N	\N	2	2020-04-22
2365	-200	饮食	0	欧文充值	2020-04-26 15:42:41.536394+08	0	0	\N	2020-04-26 15:42:41.536729+08	\N	\N	2	2020-04-24
2366	-12	小孩文具	0	剪刀	2020-04-26 15:42:57.766283+08	0	0	\N	2020-04-26 15:42:57.766749+08	\N	\N	2	2020-04-25
2368	-69	小孩生活用品	0	水宝宝防晒霜	2020-04-26 15:43:20.974734+08	0	0	\N	2020-04-26 15:43:20.975051+08	\N	\N	2	2020-04-25
2369	-68	饮食	0	水果	2020-04-26 15:43:30.074658+08	0	0	\N	2020-04-26 15:43:30.07498+08	\N	\N	1	2020-04-14
2370	-29	生活日用	0	小米音响	2020-04-26 15:43:40.149525+08	0	0	\N	2020-04-26 15:43:40.149849+08	\N	\N	2	2020-04-26
2371	-7	饮食	0	绿资酸奶	2020-04-26 15:43:43.69584+08	0	0	\N	2020-04-26 15:43:43.696166+08	\N	\N	1	2020-04-13
2372	-54	饮食	0	美购	2020-04-26 15:44:05.695344+08	0	0	\N	2020-04-26 15:44:05.6957+08	\N	\N	1	2020-04-17
2373	-16	饮食	0	肯德基	2020-04-26 15:44:13.325381+08	0	0	\N	2020-04-26 15:44:13.325733+08	\N	\N	2	2020-04-24
2374	-10	交通出行	0	东钱湖停车费	2020-04-26 15:44:51.629133+08	0	0	\N	2020-04-26 15:44:51.629463+08	\N	\N	1	2020-04-19
2375	-10	饮食	0	麻糍	2020-04-26 15:45:08.510209+08	0	0	\N	2020-04-26 15:45:08.510573+08	\N	\N	1	2020-04-19
2376	-13	饮食	0	奶茶	2020-04-26 15:45:16.474851+08	0	0	\N	2020-04-26 15:45:16.475229+08	\N	\N	2	2020-04-26
2386	-85	饮食	0	水果	2020-04-26 15:59:38.166178+08	0	0	\N	2020-04-26 15:59:38.166636+08	\N	\N	1	2020-04-13
2387	-5	交通出行	0	明州医院停车费	2020-04-26 16:00:08.710203+08	0	0	\N	2020-04-26 16:00:08.710666+08	\N	\N	1	2020-04-18
2388	-232	交通出行	0	加油	2020-04-26 16:00:27.869815+08	0	0	\N	2020-04-26 16:00:27.870167+08	\N	\N	1	2020-04-18
2389	13479	收入	1	三月份工资	2020-04-30 17:34:21.903963+08	0	0	\N	2020-04-30 17:34:21.906628+08	\N	\N	2	2020-04-30
2390	-7	饮食	0	早餐	2020-04-30 17:35:38.555666+08	0	0	\N	2020-04-30 17:35:38.556021+08	\N	\N	2	2020-04-27
2391	-100	通讯物流	0	手机充值	2020-04-30 17:36:11.027248+08	0	0	\N	2020-04-30 17:36:11.027581+08	\N	\N	2	2020-04-27
2392	-100	交通出行	0	手机充值	2020-04-30 17:37:43.856334+08	0	0	\N	2020-04-30 17:37:43.85668+08	\N	\N	2	2020-04-27
2393	-12	饮食	0	番薯	2020-04-30 17:38:18.071305+08	0	0	\N	2020-04-30 17:38:18.071635+08	\N	\N	2	2020-04-28
2394	-18	饮食	0	土豆	2020-04-30 17:38:33.255217+08	0	0	\N	2020-04-30 17:38:33.255562+08	\N	\N	2	2020-04-29
2395	-15	饮食	0	水果	2020-04-30 20:27:09.549206+08	0	0	\N	2020-04-30 20:27:09.549598+08	\N	\N	2	2020-04-30
2396	-40	服饰美容	0	衣服	2020-05-07 19:32:17.298941+08	0	0	\N	2020-05-07 19:32:17.301504+08	\N	\N	2	2020-05-01
2397	-79	住房缴费	0	东兴电费	2020-05-07 19:32:44.396475+08	0	0	\N	2020-05-07 19:32:44.396827+08	\N	\N	2	2020-05-02
2398	-32	住房缴费	0	景湖电费	2020-05-07 19:33:02.545655+08	0	0	\N	2020-05-07 19:33:02.545981+08	\N	\N	2	2020-05-02
2399	-7	生活日用	0	热熔胶	2020-05-07 19:33:18.976154+08	0	0	\N	2020-05-07 19:33:18.976551+08	\N	\N	2	2020-05-02
2400	-40	小孩服饰	0	衣服裤子	2020-05-07 19:33:44.962176+08	0	0	\N	2020-05-07 19:33:44.96253+08	\N	\N	2	2020-05-03
2401	-59	生活日用	0	蓝月亮洗衣液	2020-05-07 19:34:04.04635+08	0	0	\N	2020-05-07 19:34:04.046691+08	\N	\N	2	2020-05-04
2402	-7	住房缴费	0	景湖水费	2020-05-07 19:34:27.36065+08	0	0	\N	2020-05-07 19:34:27.361069+08	\N	\N	2	2020-05-04
2403	-192	小孩服饰	0	衣服	2020-05-07 19:34:53.867142+08	0	0	\N	2020-05-07 19:34:53.867469+08	\N	\N	2	2020-05-04
2404	-377	服饰美容	0	鞋子	2020-05-07 19:35:05.317282+08	0	0	\N	2020-05-07 19:35:05.317629+08	\N	\N	2	2020-05-04
2405	-400	小孩服饰	0	鞋子衣服	2020-05-07 19:35:22.571824+08	0	0	\N	2020-05-07 19:35:22.572136+08	\N	\N	2	2020-05-04
2406	-40	服饰美容	0	衣服	2020-05-07 19:35:49.711689+08	0	0	\N	2020-05-07 19:35:49.712075+08	\N	\N	2	2020-05-05
2407	-25	饮食	0	荔枝	2020-05-07 19:36:05.076354+08	0	0	\N	2020-05-07 19:36:05.076703+08	\N	\N	2	2020-05-05
2408	-30	饮食	0	荔枝	2020-05-07 19:36:27.883205+08	0	0	\N	2020-05-07 19:36:27.883549+08	\N	\N	2	2020-05-03
2409	-10	服饰美容	0	袜子	2020-05-07 19:37:00.11159+08	0	0	\N	2020-05-07 19:37:00.111917+08	\N	\N	2	2020-05-05
2410	-70	服饰美容	0	鞋子	2020-05-07 19:37:13.981752+08	0	0	\N	2020-05-07 19:37:13.982064+08	\N	\N	2	2020-05-06
2411	-39	文教娱乐	0	书	2020-05-07 19:37:35.565664+08	0	0	\N	2020-05-07 19:37:35.565998+08	\N	\N	2	2020-05-06
2385	-12	宠物	0	苜蓿草种子一斤	2020-04-26 15:58:24.109383+08	0	0	\N	2020-05-11 11:12:01.233217+08	\N	\N	1	2020-04-26
2384	-13	宠物	0	提莫西草种子半斤	2020-04-26 15:58:00.765209+08	0	0	\N	2020-05-11 11:16:03.278764+08	\N	\N	1	2020-04-26
2383	-30	宠物	0	提莫西草500g	2020-04-26 15:57:20.630574+08	0	0	\N	2020-05-11 11:16:12.71789+08	\N	\N	1	2020-04-26
2382	-70	宠物	0	侏儒兔	2020-04-26 15:56:20.504854+08	0	0	\N	2020-05-11 11:16:20.715331+08	\N	\N	1	2020-04-25
2377	-131	宠物	0	布格斯幼兔饲料2kg	2020-04-26 15:47:11.251076+08	0	0	\N	2020-05-11 11:16:59.830791+08	\N	\N	1	2020-04-24
2379	-285	宠物	0	兔笼	2020-04-26 15:48:28.770069+08	0	0	\N	2020-05-11 11:17:05.211926+08	\N	\N	1	2020-04-24
2380	-10	宠物	0	兔笼木屑	2020-04-26 15:53:48.412536+08	0	0	\N	2020-05-11 11:17:10.919973+08	\N	\N	1	2020-04-24
2381	-29	宠物	0	紫花苜蓿草1kg	2020-04-26 15:55:16.516484+08	0	0	\N	2020-05-11 11:17:17.355427+08	\N	\N	1	2020-04-24
2413	-59	饮食	0	山竹5斤	2020-05-11 11:20:19.328115+08	0	0	\N	2020-05-11 11:20:19.328442+08	\N	\N	1	2020-04-27
2415	-20	通讯物流	0	移动充值	2020-05-11 11:21:21.632863+08	0	0	\N	2020-05-11 11:21:21.633255+08	\N	\N	1	2020-04-28
2416	-23	饮食	0	水果	2020-05-11 11:21:45.091948+08	0	0	\N	2020-05-11 11:21:45.092248+08	\N	\N	1	2020-04-29
2419	-50	通讯物流	0	话费	2020-05-11 11:23:52.943136+08	0	0	\N	2020-05-11 11:23:52.943484+08	\N	\N	1	2020-05-02
2420	-8	饮食	0	零食	2020-05-11 11:24:19.423131+08	0	0	\N	2020-05-11 11:24:19.423433+08	\N	\N	1	2020-05-02
2421	-375	服饰美容	0	优衣库	2020-05-11 11:24:42.95309+08	0	0	\N	2020-05-11 11:24:42.953405+08	\N	\N	1	2020-05-04
2422	-1490	服饰美容	0	思华洛斯奇项链	2020-05-11 11:25:37.650028+08	0	0	\N	2020-05-11 11:25:37.650337+08	\N	\N	1	2020-05-04
2423	-9	小孩玩具	0	玩具车	2020-05-11 11:25:54.272549+08	0	0	\N	2020-05-11 11:25:54.272889+08	\N	\N	1	2020-05-04
2424	-4	饮食	0	饮料	2020-05-11 11:26:14.937204+08	0	0	\N	2020-05-11 11:26:14.937534+08	\N	\N	1	2020-05-04
2425	-212	饮食	0	夜宵	2020-05-11 11:26:33.242973+08	0	0	\N	2020-05-11 11:26:33.243295+08	\N	\N	1	2020-05-04
2426	-53	生活日用	0	蟑螂贴	2020-05-11 11:26:56.812178+08	0	0	\N	2020-05-11 11:26:56.812524+08	\N	\N	1	2020-05-04
2429	-176	饮食	0	菠萝蜜	2020-05-11 11:28:34.352528+08	0	0	\N	2020-05-11 11:28:34.35285+08	\N	\N	1	2020-05-10
2430	-94	饮食	0	西瓜x4	2020-05-11 11:28:55.703462+08	0	0	\N	2020-05-11 11:28:55.703777+08	\N	\N	1	2020-05-10
2431	-91	饮食	0	牛肉面午餐	2020-05-11 11:29:15.552179+08	0	0	\N	2020-05-11 11:29:15.552518+08	\N	\N	1	2020-05-10
2428	-21	宠物	0	兔子尿垫	2020-05-11 11:27:58.062941+08	0	0	\N	2020-05-11 11:31:46.517636+08	\N	\N	1	2020-05-08
2427	-22	宠物	0	兔博士真菌消毒	2020-05-11 11:27:36.034372+08	0	0	\N	2020-05-11 11:31:56.836728+08	\N	\N	1	2020-05-07
2417	-134	宠物	0	宠物用品	2020-05-11 11:23:00.673401+08	0	0	\N	2020-05-11 11:32:19.387147+08	\N	\N	1	2020-04-29
2432	-10	生活日用	0	雨伞	2020-05-11 11:29:31.802057+08	0	0	\N	2020-05-11 11:29:31.802371+08	\N	\N	1	2020-05-10
2433	-7	宠物	0	宠物防舔项圈	2020-05-11 11:30:28.406237+08	0	0	\N	2020-05-11 11:31:35.692618+08	\N	\N	1	2020-05-10
2435	-129	服饰美容	0	鞋子	2020-05-12 09:09:27.827927+08	0	0	\N	2020-05-12 09:09:27.828272+08	\N	\N	2	2020-05-07
2436	-11	生活日用	0	小风扇	2020-05-12 09:09:41.647654+08	0	0	\N	2020-05-12 09:09:41.647974+08	\N	\N	2	2020-05-07
2437	-6	住房缴费	0	天然气	2020-05-12 09:10:06.201739+08	0	0	\N	2020-05-12 09:10:06.202053+08	\N	\N	2	2020-05-08
2438	-54	小孩生活用品	0	止痒贴	2020-05-12 09:10:30.243093+08	0	0	\N	2020-05-12 09:10:30.243478+08	\N	\N	2	2020-05-08
2439	-20	生活日用	0	地毯	2020-05-12 09:11:25.798341+08	0	0	\N	2020-05-12 09:11:25.798667+08	\N	\N	2	2020-05-08
2440	-126	住房缴费	0	水费	2020-05-12 09:11:46.67673+08	0	0	\N	2020-05-12 09:11:46.677138+08	\N	\N	2	2020-05-09
2441	-265	饮食	0	水果	2020-05-12 09:12:05.492699+08	0	0	\N	2020-05-12 09:12:05.493066+08	\N	\N	2	2020-05-10
2442	-30	饮食	0	串串	2020-05-12 09:12:26.29192+08	0	0	\N	2020-05-12 09:12:26.292227+08	\N	\N	2	2020-05-10
2444	-190	通讯物流	0	充值	2020-05-12 09:13:08.457603+08	0	0	\N	2020-05-12 09:13:08.45795+08	\N	\N	2	2020-05-11
2445	-65	服饰美容	0	鞋子	2020-05-12 09:14:40.138612+08	0	0	\N	2020-05-12 09:14:40.138951+08	\N	\N	2	2020-05-10
2446	-40	服饰美容	0	开衫	2020-05-12 09:14:55.27147+08	0	0	\N	2020-05-12 09:14:55.271813+08	\N	\N	2	2020-05-05
2447	14557	收入	1	四月工资	2020-05-20 12:58:12.620883+08	0	0	\N	2020-05-20 12:58:12.623464+08	\N	\N	1	2020-04-20
2448	14165	收入	1	五月工资	2020-05-20 12:58:54.917696+08	0	0	\N	2020-05-20 12:58:54.918041+08	\N	\N	1	2020-05-15
2449	-15	饮食	0	一鸣早餐	2020-05-20 13:00:15.043149+08	0	0	\N	2020-05-20 13:00:15.043481+08	\N	\N	1	2020-05-13
2450	-14	宠物	0	三把小锁	2020-05-20 13:00:43.771539+08	0	0	\N	2020-05-20 13:00:43.771858+08	\N	\N	1	2020-05-15
2451	-28	饮食	0	美购	2020-05-20 13:01:00.656534+08	0	0	\N	2020-05-20 13:01:00.65687+08	\N	\N	1	2020-05-18
2452	-13	饮食	0	土豆	2020-05-20 19:15:51.412866+08	0	0	\N	2020-05-20 19:15:51.413328+08	\N	\N	2	2020-05-12
2453	-45	饮食	0	桑葚	2020-05-20 19:16:08.596215+08	0	0	\N	2020-05-20 19:16:08.596545+08	\N	\N	2	2020-05-14
2454	-29	饮食	0	雪糕模具	2020-05-20 19:16:30.483384+08	0	0	\N	2020-05-20 19:16:30.483708+08	\N	\N	2	2020-05-17
2455	-248	生活日用	0	眼镜	2020-05-20 19:16:46.081352+08	0	0	\N	2020-05-20 19:16:46.081668+08	\N	\N	2	2020-05-18
2456	-20	小孩服饰	0	睡衣	2020-05-20 19:17:00.372415+08	0	0	\N	2020-05-20 19:17:00.37274+08	\N	\N	2	2020-05-18
2457	-62	生活日用	0	电蚊拍	2020-05-20 19:17:41.478922+08	0	0	\N	2020-05-20 19:17:41.479249+08	\N	\N	2	2020-05-16
2458	-9	生活日用	0	沙发粘垫	2020-05-20 19:17:57.849763+08	0	0	\N	2020-05-20 19:17:57.850082+08	\N	\N	2	2020-05-19
2460	-7083	健康保险	0	信泰保险	2020-05-20 19:20:47.31093+08	0	0	\N	2020-05-20 19:20:47.311293+08	\N	\N	2	2020-05-09
2461	-296	健康保险	0	保险	2020-05-20 19:21:12.270968+08	0	0	\N	2020-05-20 19:21:12.271292+08	\N	\N	2	2020-05-09
2462	-20	小孩服饰	0	睡衣	2020-05-27 18:42:56.772036+08	0	0	\N	2020-05-27 18:42:56.774468+08	\N	\N	2	2020-05-20
2463	-129	服饰美容	0	衣服	2020-05-27 18:43:23.350404+08	0	0	\N	2020-05-27 18:43:23.350725+08	\N	\N	2	2020-05-21
2464	-6	通讯物流	0	芒果TV	2020-05-27 18:43:56.167253+08	0	0	\N	2020-05-27 18:43:56.167662+08	\N	\N	2	2020-05-23
2465	-3	生活日用	0	插座	2020-05-27 18:44:13.922427+08	0	0	\N	2020-05-27 18:44:13.922752+08	\N	\N	2	2020-05-24
2466	-6	生活日用	0	雨刮器	2020-05-27 18:44:31.886271+08	0	0	\N	2020-05-27 18:44:31.886601+08	\N	\N	2	2020-05-26
2467	-80	通讯物流	0	芒果TV	2020-05-27 18:44:47.241985+08	0	0	\N	2020-05-27 18:44:47.242294+08	\N	\N	2	2020-05-26
2468	-31	生活日用	0	鞋子	2020-05-27 18:45:01.822036+08	0	0	\N	2020-05-27 18:45:01.822392+08	\N	\N	2	2020-05-27
2469	-6	生活日用	0	餐巾纸	2020-05-27 18:45:47.565839+08	0	0	\N	2020-05-27 18:45:47.566215+08	\N	\N	2	2020-05-22
2470	-16	生活日用	0	盆子	2020-05-27 18:46:13.996197+08	0	0	\N	2020-05-27 18:46:13.99662+08	\N	\N	2	2020-05-24
2471	-14	生活日用	0	钩子	2020-05-27 18:46:31.170853+08	0	0	\N	2020-05-27 18:46:31.171197+08	\N	\N	2	2020-05-26
2472	-99	服饰美容	0	鞋子	2020-05-27 18:47:54.056246+08	0	0	\N	2020-05-27 18:47:54.056595+08	\N	\N	2	2020-05-22
2473	-50	饮食	0	水果	2020-05-27 18:48:37.21587+08	0	0	\N	2020-05-27 18:48:37.216198+08	\N	\N	2	2020-05-27
2475	-43	宠物	0	苜蓿草两公斤	2020-06-02 10:44:57.619968+08	0	0	\N	2020-06-02 10:44:57.620358+08	\N	\N	1	2020-05-23
2476	-55	生活日用	0	小米WiFi放大器	2020-06-02 10:45:22.693918+08	0	0	\N	2020-06-02 10:45:22.694375+08	\N	\N	1	2020-05-23
2477	-22	饮食	0	美购	2020-06-02 10:45:37.959124+08	0	0	\N	2020-06-02 10:45:37.959455+08	\N	\N	1	2020-05-23
2478	-74	饮食	0	水果	2020-06-02 10:46:23.305448+08	0	0	\N	2020-06-02 10:46:23.305815+08	\N	\N	1	2020-05-24
2479	-160	生活日用	0	VPN	2020-06-02 10:46:45.947275+08	0	0	\N	2020-06-02 10:46:45.947671+08	\N	\N	1	2020-05-25
2480	-38	饮食	0	烧烤	2020-06-02 10:47:04.078604+08	0	0	\N	2020-06-02 10:47:04.078915+08	\N	\N	1	2020-05-29
2481	-100	通讯物流	0	手机充值	2020-06-02 10:47:29.609076+08	0	0	\N	2020-06-02 10:47:29.60943+08	\N	\N	1	2020-05-30
2482	-13	通讯物流	0	红米手机壳	2020-06-02 10:47:57.707829+08	0	0	\N	2020-06-02 10:47:57.708157+08	\N	\N	1	2020-05-30
2484	-358	生活日用	0	足疗机	2020-06-02 10:48:40.672821+08	0	0	\N	2020-06-02 10:48:40.673203+08	\N	\N	1	2020-06-01
2485	-178	服饰美容	0	衣服	2020-06-04 19:18:41.936201+08	0	0	\N	2020-06-04 19:18:41.938959+08	\N	\N	2	2020-05-27
2486	-179	服饰美容	0	衣服	2020-06-04 19:20:26.408642+08	0	0	\N	2020-06-04 19:20:26.408951+08	\N	\N	2	2020-05-27
2487	-76	饮食	0	水果	2020-06-04 19:20:50.856847+08	0	0	\N	2020-06-04 19:20:50.857456+08	\N	\N	2	2020-05-30
2488	-20	饮食	0	香瓜子豌豆	2020-06-04 19:21:09.70163+08	0	0	\N	2020-06-04 19:21:09.701954+08	\N	\N	2	2020-05-30
2489	-25	饮食	0	水果	2020-06-04 19:21:58.550887+08	0	0	\N	2020-06-04 19:21:58.55122+08	\N	\N	2	2020-06-01
2490	-37	住房缴费	0	景湖水岸电费	2020-06-04 19:30:13.632696+08	0	0	\N	2020-06-04 19:30:13.633044+08	\N	\N	2	2020-06-03
2491	-76	住房缴费	0	东兴电费	2020-06-04 19:30:29.724851+08	0	0	\N	2020-06-04 19:30:29.725209+08	\N	\N	2	2020-06-03
2492	-12	饮食	0	水果	2020-06-04 19:30:50.769777+08	0	0	\N	2020-06-04 19:30:50.770092+08	\N	\N	2	2020-06-03
2493	-1400	交通出行	0	修车	2020-06-04 19:31:02.812931+08	0	0	\N	2020-06-04 19:31:02.813303+08	\N	\N	2	2020-06-04
2494	2200	收入	1	保险	2020-06-04 19:31:19.828272+08	0	0	\N	2020-06-04 19:31:19.828599+08	\N	\N	2	2020-06-02
2495	-102	小孩生活用品	0	奶瓶2个	2020-06-04 19:31:56.327012+08	0	0	\N	2020-06-04 19:31:56.32732+08	\N	\N	2	2020-06-02
2496	-948	交通出行	0	三个轮胎	2020-06-04 19:32:36.216829+08	0	0	\N	2020-06-04 19:32:36.217198+08	\N	\N	2	2020-06-03
2497	-300	饮食	0	欧文	2020-06-08 11:28:23.139319+08	0	0	\N	2020-06-08 11:28:23.141702+08	\N	\N	2	2020-06-05
2498	-96	饮食	0	水果	2020-06-08 11:28:39.053114+08	0	0	\N	2020-06-08 11:28:39.053422+08	\N	\N	2	2020-06-06
2499	-13	饮食	0	水果	2020-06-08 11:28:50.580818+08	0	0	\N	2020-06-08 11:28:50.581181+08	\N	\N	2	2020-06-06
2500	-833	饮食	0	聚餐	2020-06-08 11:29:05.153378+08	0	0	\N	2020-06-08 11:29:05.153733+08	\N	\N	2	2020-06-06
2502	-95	生活日用	0	雨衣	2020-06-08 11:29:46.899281+08	0	0	\N	2020-06-08 11:29:46.899714+08	\N	\N	2	2020-06-06
2503	-20	生活日用	0	笔	2020-06-08 11:30:00.090173+08	0	0	\N	2020-06-08 11:30:00.090504+08	\N	\N	2	2020-06-07
2504	-189	饮食	0	乐购	2020-06-08 11:30:23.295989+08	0	0	\N	2020-06-08 11:30:23.296293+08	\N	\N	2	2020-06-07
2505	-118	服饰美容	0	洗面仪	2020-06-08 11:30:44.992647+08	0	0	\N	2020-06-08 11:30:44.993011+08	\N	\N	2	2020-06-08
2506	-209	小孩生活用品	0	京东	2020-06-08 11:31:40.813352+08	0	0	\N	2020-06-08 11:31:40.813688+08	\N	\N	2	2020-06-05
2507	-100	通讯物流	0	燃气费	2020-06-08 11:36:39.968166+08	0	0	\N	2020-06-08 11:36:39.9685+08	\N	\N	2	2020-06-08
2508	21600	收入	1	2019提成	2020-06-08 13:43:29.411272+08	0	0	\N	2020-06-08 13:43:29.414+08	\N	\N	2	2020-06-04
2509	-759	通讯物流	0	红米8	2020-06-09 11:35:44.344659+08	0	0	\N	2020-06-09 11:35:44.347062+08	\N	\N	1	2020-06-02
2510	-199	文教娱乐	0	域名十年	2020-06-09 11:36:12.512323+08	0	0	\N	2020-06-09 11:36:12.512733+08	\N	\N	1	2020-06-02
2511	-26	小孩玩具	0	晨光水彩笔	2020-06-09 11:37:09.136123+08	0	0	\N	2020-06-09 11:37:09.136467+08	\N	\N	1	2020-06-02
2512	-15	饮食	0	零食	2020-06-09 11:37:41.501215+08	0	0	\N	2020-06-09 11:37:41.50157+08	\N	\N	1	2020-06-03
2513	-15	饮食	0	绿姿	2020-06-09 11:38:05.863084+08	0	0	\N	2020-06-09 11:38:05.863412+08	\N	\N	1	2020-06-06
2514	-6	饮食	0	酸奶	2020-06-09 11:38:29.203185+08	0	0	\N	2020-06-09 11:38:29.203512+08	\N	\N	1	2020-06-07
2515	-196	饮食	0	烧烤	2020-06-09 11:38:46.211025+08	0	0	\N	2020-06-09 11:38:46.211332+08	\N	\N	1	2020-06-07
2516	-2518	健康保险	0	人保2918－400	2020-06-09 11:39:26.274039+08	0	0	\N	2020-06-09 11:39:26.274354+08	\N	\N	1	2020-06-08
2517	-316	交通出行	0	轮胎	2020-06-09 11:41:11.123275+08	0	0	\N	2020-06-09 11:41:11.123587+08	\N	\N	1	2020-06-03
2518	-30	生活日用	0	手机壳	2020-06-11 22:02:38.877384+08	0	0	\N	2020-06-11 22:02:38.879782+08	\N	\N	2	2020-06-08
2519	-13	小孩服饰	0	袜子	2020-06-11 22:03:04.015958+08	0	0	\N	2020-06-11 22:03:04.01629+08	\N	\N	2	2020-06-08
2520	-21	生活日用	0	桌子	2020-06-11 22:03:18.577992+08	0	0	\N	2020-06-11 22:03:18.578312+08	\N	\N	2	2020-06-08
2521	-15	生活日用	0	冰箱挂架	2020-06-11 22:03:51.967469+08	0	0	\N	2020-06-11 22:03:51.967837+08	\N	\N	2	2020-06-09
2522	-79	小孩服饰	0	裤子	2020-06-11 22:05:26.807857+08	0	0	\N	2020-06-11 22:05:26.808194+08	\N	\N	2	2020-06-10
2523	-13	饮食	0	奶茶	2020-06-11 22:05:41.580838+08	0	0	\N	2020-06-11 22:05:41.581205+08	\N	\N	2	2020-06-11
2524	-212	小孩健康	0	钙片dha	2020-06-11 22:09:45.900689+08	0	0	\N	2020-06-11 22:09:45.901071+08	\N	\N	2	2020-06-10
2525	-56	小孩生活用品	0	止痒贴	2020-06-15 16:46:33.509651+08	0	0	\N	2020-06-15 16:46:33.512122+08	\N	\N	2	2020-06-13
2526	-87	生活日用	0	京东到家	2020-06-15 16:49:43.395723+08	0	0	\N	2020-06-15 16:49:43.396063+08	\N	\N	2	2020-06-12
2527	-102	小孩零食	0	果汁泥	2020-06-15 16:50:00.805778+08	0	0	\N	2020-06-15 16:50:00.806112+08	\N	\N	2	2020-06-15
2528	-100	饮食	0	老婆大人	2020-06-22 17:28:06.516161+08	0	0	\N	2020-06-22 17:28:06.518638+08	\N	\N	2	2020-06-16
2529	-554	生活日用	0	床垫	2020-06-22 17:28:36.225399+08	0	0	\N	2020-06-22 17:28:36.225731+08	\N	\N	2	2020-06-16
2530	-66	生活日用	0	鞋架	2020-06-22 17:28:54.861122+08	0	0	\N	2020-06-22 17:28:54.861446+08	\N	\N	2	2020-06-16
2531	-17	生活日用	0	碗	2020-06-22 17:29:09.541923+08	0	0	\N	2020-06-22 17:29:09.542293+08	\N	\N	2	2020-06-16
2532	-120	小孩生活用品	0	奶瓶	2020-06-22 17:29:25.345625+08	0	0	\N	2020-06-22 17:29:25.345938+08	\N	\N	2	2020-06-16
2533	-91	小孩生活用品	0	席子	2020-06-22 17:29:43.910236+08	0	0	\N	2020-06-22 17:29:43.910591+08	\N	\N	2	2020-06-18
2534	-10	生活日用	0	杯子	2020-06-22 17:29:58.555946+08	0	0	\N	2020-06-22 17:29:58.556349+08	\N	\N	2	2020-06-19
2535	-17	饮食	0	水果	2020-06-22 17:30:25.920423+08	0	0	\N	2020-06-22 17:30:25.920771+08	\N	\N	2	2020-06-19
2536	-340	饮食	0	必胜客	2020-06-22 17:30:54.214125+08	0	0	\N	2020-06-22 17:30:54.214453+08	\N	\N	2	2020-06-20
2537	-35	饮食	0	牛肉	2020-06-22 17:31:16.142947+08	0	0	\N	2020-06-22 17:31:16.143264+08	\N	\N	2	2020-06-21
2538	-27	饮食	0	买菜	2020-06-22 17:31:30.741304+08	0	0	\N	2020-06-22 17:31:30.741653+08	\N	\N	2	2020-06-21
2539	-35	饮食	0	美购	2020-06-22 17:31:47.401147+08	0	0	\N	2020-06-22 17:31:47.401692+08	\N	\N	2	2020-06-21
2540	-258	饮食	0	自助餐	2020-06-22 17:32:28.710282+08	0	0	\N	2020-06-22 17:32:28.710631+08	\N	\N	2	2020-06-20
2541	-10	通讯物流	0	手机壳	2020-06-23 11:56:59.427889+08	0	0	\N	2020-06-23 11:56:59.4303+08	\N	\N	1	2020-06-08
2542	-10	饮食	0	零食	2020-06-23 11:57:32.891886+08	0	0	\N	2020-06-23 11:57:32.892299+08	\N	\N	1	2020-06-13
2543	-14	生活日用	0	空调遥控	2020-06-23 11:57:56.050826+08	0	0	\N	2020-06-23 11:57:56.051254+08	\N	\N	1	2020-06-15
2544	-98	宠物	0	兔子用品	2020-06-23 11:58:30.317637+08	0	0	\N	2020-06-23 11:58:30.317995+08	\N	\N	1	2020-06-16
2545	-110	宠物	0	兔子零食	2020-06-23 11:59:00.837433+08	0	0	\N	2020-06-23 11:59:00.83777+08	\N	\N	1	2020-06-19
2546	-60	小孩玩具	0	拼图	2020-06-23 11:59:34.957328+08	0	0	\N	2020-06-23 11:59:34.957673+08	\N	\N	1	2020-06-20
2547	-38	小孩玩具	0	环球城气球	2020-06-23 11:59:59.916195+08	0	0	\N	2020-06-23 11:59:59.916535+08	\N	\N	1	2020-06-20
2548	-35	交通出行	0	停车费	2020-06-23 12:00:19.615089+08	0	0	\N	2020-06-23 12:00:19.615429+08	\N	\N	1	2020-06-20
2549	-396	文教娱乐	0	环球城门票x4	2020-06-23 12:03:16.971514+08	0	0	\N	2020-06-23 12:03:16.971846+08	\N	\N	1	2020-06-15
2550	-70	饮食	0	同事聚餐	2020-06-23 12:03:41.921089+08	0	0	\N	2020-06-23 12:03:41.921503+08	\N	\N	1	2020-06-15
2551	-1000	交通出行	0	轮胎保养	2020-06-26 23:12:49.708415+08	0	0	\N	2020-06-26 23:12:49.711132+08	\N	\N	2	2020-06-22
2552	-30	饮食	0	串串	2020-06-26 23:13:08.230909+08	0	0	\N	2020-06-26 23:13:08.231228+08	\N	\N	2	2020-06-22
2553	-18	饮食	0	饮料	2020-06-26 23:13:22.007672+08	0	0	\N	2020-06-26 23:13:22.007994+08	\N	\N	2	2020-06-22
2554	-10	生活日用	0	彩票	2020-06-26 23:13:34.422717+08	0	0	\N	2020-06-26 23:13:34.423049+08	\N	\N	2	2020-06-22
2555	-9	饮食	0	芒果	2020-06-26 23:13:51.503439+08	0	0	\N	2020-06-26 23:13:51.503781+08	\N	\N	2	2020-06-22
2556	-99	服饰美容	0	短裤	2020-06-26 23:14:09.049569+08	0	0	\N	2020-06-26 23:14:09.04992+08	\N	\N	2	2020-06-22
2557	-164	饮食	0	水果	2020-06-26 23:14:37.780723+08	0	0	\N	2020-06-26 23:14:37.781124+08	\N	\N	2	2020-06-24
2558	-422	饮食	0	三江	2020-06-26 23:14:56.192372+08	0	0	\N	2020-06-26 23:14:56.192725+08	\N	\N	2	2020-06-24
2559	-15	生活日用	0	通下水管	2020-06-26 23:15:19.024606+08	0	0	\N	2020-06-26 23:15:19.024933+08	\N	\N	2	2020-06-24
2560	-26	饮食	0	西瓜	2020-06-26 23:15:37.112679+08	0	0	\N	2020-06-26 23:15:37.113036+08	\N	\N	2	2020-06-25
2561	-14	饮食	0	西瓜	2020-06-26 23:15:46.711357+08	0	0	\N	2020-06-26 23:15:46.711721+08	\N	\N	2	2020-06-25
2562	-6	饮食	0	肠粉	2020-06-26 23:15:58.588862+08	0	0	\N	2020-06-26 23:15:58.589337+08	\N	\N	2	2020-06-25
2563	-6	文教娱乐	0	优酷VIP	2020-06-26 23:16:25.150492+08	0	0	\N	2020-06-26 23:16:25.150838+08	\N	\N	2	2020-06-26
2564	-178	小孩生活用品	0	幼儿园被子	2020-06-26 23:16:48.979214+08	0	0	\N	2020-06-26 23:16:48.979599+08	\N	\N	2	2020-06-26
2565	-103	小孩服饰	0	mqd衣服	2020-06-26 23:17:15.454818+08	0	0	\N	2020-06-26 23:17:15.455169+08	\N	\N	2	2020-06-26
2566	-224	小孩文具	0	包包	2020-06-26 23:17:54.341648+08	0	0	\N	2020-06-26 23:17:54.341978+08	\N	\N	2	2020-06-26
2567	-134	小孩服饰	0	裤子	2020-06-26 23:18:08.43018+08	0	0	\N	2020-06-26 23:18:08.430516+08	\N	\N	2	2020-06-26
2568	-189	饮食	0	必胜客	2020-06-26 23:18:32.589396+08	0	0	\N	2020-06-26 23:18:32.589762+08	\N	\N	2	2020-06-26
2569	-55	饮食	0	必胜客披萨	2020-06-26 23:18:45.261288+08	0	0	\N	2020-06-26 23:18:45.26165+08	\N	\N	2	2020-06-26
2570	-320	小孩服饰	0	衣服	2020-06-26 23:18:57.42282+08	0	0	\N	2020-06-26 23:18:57.423138+08	\N	\N	2	2020-06-26
2571	-99	服饰美容	0	Zara裤子	2020-06-26 23:19:13.138522+08	0	0	\N	2020-06-26 23:19:13.138853+08	\N	\N	2	2020-06-26
2572	14152	收入	1	六月工资	2020-06-28 15:08:02.3416+08	0	0	\N	2020-06-28 15:08:02.344054+08	\N	\N	1	2020-06-15
2573	-198	服饰美容	0	优衣库	2020-06-30 15:08:33.048744+08	0	0	\N	2020-06-30 15:08:33.051531+08	\N	\N	1	2020-06-26
2574	-12	饮食	0	一鸣早餐	2020-06-30 15:08:59.049667+08	0	0	\N	2020-06-30 15:08:59.050024+08	\N	\N	1	2020-06-29
2575	-94	饮食	0	水果	2020-06-30 15:09:13.514303+08	0	0	\N	2020-06-30 15:09:13.514688+08	\N	\N	1	2020-06-29
2576	-15	生活日用	0	Galaxy buds耳机套	2020-06-30 15:09:36.633764+08	0	0	\N	2020-06-30 15:09:36.634141+08	\N	\N	1	2020-06-30
2577	-7668	健康保险	0	小孩平安保险	2020-06-30 15:10:23.608174+08	0	0	\N	2020-06-30 15:10:23.60849+08	\N	\N	1	2020-06-30
2578	-109	小孩服饰	0	鞋子	2020-07-03 18:25:34.209877+08	0	0	\N	2020-07-03 18:25:34.21237+08	\N	\N	2	2020-06-27
2579	-13	小孩健康	0	美康	2020-07-03 18:26:03.67026+08	0	0	\N	2020-07-03 18:26:03.670676+08	\N	\N	2	2020-06-27
2580	-15	生活日用	0	盆子	2020-07-03 18:26:30.196766+08	0	0	\N	2020-07-03 18:26:30.197152+08	\N	\N	2	2020-06-28
2581	-22	生活日用	0	雨伞	2020-07-03 18:26:47.853972+08	0	0	\N	2020-07-03 18:26:47.854299+08	\N	\N	2	2020-06-28
2582	-38	小孩服饰	0	袜子	2020-07-03 18:27:03.42488+08	0	0	\N	2020-07-03 18:27:03.425302+08	\N	\N	2	2020-06-29
2583	-17	饮食	0	猪蹄	2020-07-03 18:27:23.906615+08	0	0	\N	2020-07-03 18:27:23.906927+08	\N	\N	2	2020-06-30
2584	-4	住房缴费	0	景湖水费	2020-07-03 18:27:58.012766+08	0	0	\N	2020-07-03 18:27:58.013121+08	\N	\N	2	2020-07-02
2585	-19	小孩生活用品	0	A4 收藏本	2020-07-03 18:28:35.975016+08	0	0	\N	2020-07-03 18:28:35.97535+08	\N	\N	2	2020-07-03
2586	-45	生活日用	0	超市	2020-07-03 18:28:50.045466+08	0	0	\N	2020-07-03 18:28:50.04587+08	\N	\N	2	2020-07-03
2587	-35	住房缴费	0	景湖电费	2020-07-03 18:29:08.371942+08	0	0	\N	2020-07-03 18:29:08.372251+08	\N	\N	2	2020-07-03
2588	-107	住房缴费	0	东兴电费	2020-07-03 18:29:24.294314+08	0	0	\N	2020-07-03 18:29:24.294657+08	\N	\N	2	2020-07-03
2589	-10	饮食	0	coco	2020-07-15 09:45:51.090887+08	0	0	\N	2020-07-15 09:45:51.094944+08	\N	\N	1	2020-06-30
2590	-12	饮食	0	O2	2020-07-15 09:46:08.098265+08	0	0	\N	2020-07-15 09:46:08.098605+08	\N	\N	1	2020-06-30
2591	-135	宠物	0	兔粮	2020-07-15 09:46:32.146981+08	0	0	\N	2020-07-15 09:46:32.147304+08	\N	\N	1	2020-07-02
2592	-438	生活日用	0	除螨仪	2020-07-15 09:46:55.71098+08	0	0	\N	2020-07-15 09:46:55.711456+08	\N	\N	1	2020-07-02
2593	-90	生活日用	0	除螨包	2020-07-15 09:47:13.674716+08	0	0	\N	2020-07-15 09:47:13.675223+08	\N	\N	1	2020-07-02
2594	-229	小孩玩具	0	超级飞侠滑板车	2020-07-15 09:47:37.75805+08	0	0	\N	2020-07-15 09:47:37.758443+08	\N	\N	1	2020-07-02
2595	-7	饮食	0	一鸣早餐	2020-07-15 09:47:53.965354+08	0	0	\N	2020-07-15 09:47:53.965687+08	\N	\N	1	2020-07-02
2596	-53	宠物	0	兔子用品	2020-07-15 09:48:22.576877+08	0	0	\N	2020-07-15 09:48:22.577228+08	\N	\N	1	2020-07-04
2597	-97	饮食	0	大食堂	2020-07-15 09:48:37.055612+08	0	0	\N	2020-07-15 09:48:37.055969+08	\N	\N	1	2020-07-04
2598	-61	生活日用	0	宜家	2020-07-15 09:48:56.987365+08	0	0	\N	2020-07-15 09:48:56.987691+08	\N	\N	1	2020-07-05
2599	-90	饮食	0	蓝汀房	2020-07-15 09:49:44.927681+08	0	0	\N	2020-07-15 09:49:44.928049+08	\N	\N	1	2020-07-12
2600	-80	生活日用	0	泡脚药	2020-07-15 09:50:07.097852+08	0	0	\N	2020-07-15 09:50:07.098172+08	\N	\N	1	2020-07-13
2601	-100	通讯物流	0	话费	2020-07-15 09:50:22.108596+08	0	0	\N	2020-07-15 09:50:22.108929+08	\N	\N	1	2020-07-14
2602	-200	交通出行	0	油费	2020-07-15 09:50:34.576794+08	0	0	\N	2020-07-15 09:50:34.577176+08	\N	\N	1	2020-07-15
2603	-17	饮食	0	肯德基	2020-07-15 09:51:30.436238+08	0	0	\N	2020-07-15 09:51:30.436572+08	\N	\N	1	2020-06-30
2604	-2460	小孩奶粉	0	卡洛塔尼x12	2020-07-15 09:51:56.929538+08	0	0	\N	2020-07-15 09:51:56.929912+08	\N	\N	1	2020-07-10
2605	14139	收入	1	七月工资	2020-07-15 14:28:47.144347+08	0	0	\N	2020-07-15 14:28:47.144702+08	\N	\N	1	2020-07-15
2606	-780	小孩其他	0	幼儿园被子和校服	2020-07-20 10:28:04.337739+08	0	0	\N	2020-07-20 10:28:04.340262+08	\N	\N	2	2020-07-04
2607	-44	饮食	0	猪蹄	2020-07-20 10:28:20.736721+08	0	0	\N	2020-07-20 10:28:20.737077+08	\N	\N	2	2020-07-05
2608	-3	饮食	0	梨	2020-07-20 10:29:23.077555+08	0	0	\N	2020-07-20 10:29:23.077908+08	\N	\N	2	2020-07-05
2609	-219	生活日用	0	乐购	2020-07-20 10:29:41.387457+08	0	0	\N	2020-07-20 10:29:41.387817+08	\N	\N	2	2020-07-05
2610	-21	饮食	0	鸭脖	2020-07-20 10:30:08.121079+08	0	0	\N	2020-07-20 10:30:08.121506+08	\N	\N	2	2020-07-05
2611	-23	生活日用	0	地漏	2020-07-20 10:30:24.574885+08	0	0	\N	2020-07-20 10:30:24.575194+08	\N	\N	2	2020-07-05
2612	-106	小孩玩具	0	玩具飞机	2020-07-20 10:30:48.89181+08	0	0	\N	2020-07-20 10:30:48.892115+08	\N	\N	2	2020-07-07
2613	-142	服饰美容	0	包	2020-07-20 10:31:11.079054+08	0	0	\N	2020-07-20 10:31:11.07937+08	\N	\N	2	2020-07-07
2614	-14	饮食	0	水果	2020-07-20 10:31:25.85618+08	0	0	\N	2020-07-20 10:31:25.856506+08	\N	\N	2	2020-07-07
2615	-36	小孩生活用品	0	隔尿垫	2020-07-20 10:31:51.69987+08	0	0	\N	2020-07-20 10:31:51.700275+08	\N	\N	2	2020-07-08
2616	-148	住房缴费	0	水费东兴	2020-07-20 10:32:30.612189+08	0	0	\N	2020-07-20 10:32:30.612516+08	\N	\N	2	2020-07-10
2617	-28	小孩生活用品	0	杯子	2020-07-20 10:32:47.526049+08	0	0	\N	2020-07-20 10:32:47.526358+08	\N	\N	2	2020-07-10
2618	-15	小孩生活用品	0	吸管	2020-07-20 10:33:06.812389+08	0	0	\N	2020-07-20 10:33:06.812899+08	\N	\N	2	2020-07-11
2619	-54	饮食	0	奶茶	2020-07-20 10:33:20.083883+08	0	0	\N	2020-07-20 10:33:20.084202+08	\N	\N	2	2020-07-11
2620	-49	生活日用	0	紫草膏	2020-07-20 10:33:50.297616+08	0	0	\N	2020-07-20 10:33:50.297943+08	\N	\N	2	2020-07-12
2621	-50	小孩生活用品	0	餐具	2020-07-20 10:34:14.755277+08	0	0	\N	2020-07-20 10:34:14.755621+08	\N	\N	2	2020-07-12
2622	-11	饮食	0	饮料	2020-07-20 10:34:31.21483+08	0	0	\N	2020-07-20 10:34:31.215153+08	\N	\N	2	2020-07-12
2623	-13	小孩生活用品	0	硅胶围兜	2020-07-20 10:35:03.695236+08	0	0	\N	2020-07-20 10:35:03.695571+08	\N	\N	2	2020-07-13
2624	-100	饮食	0	老婆大人	2020-07-20 10:35:23.294889+08	0	0	\N	2020-07-20 10:35:23.295344+08	\N	\N	2	2020-07-13
2625	-15	饮食	0	牛蛙	2020-07-20 10:35:43.744846+08	0	0	\N	2020-07-20 10:35:43.745268+08	\N	\N	2	2020-07-17
2626	-27	生活日用	0	被子	2020-07-20 10:37:44.816576+08	0	0	\N	2020-07-20 10:37:44.816911+08	\N	\N	2	2020-07-11
2627	-30	服饰美容	0	背心	2020-07-20 10:37:58.828204+08	0	0	\N	2020-07-20 10:37:58.828546+08	\N	\N	2	2020-07-11
2628	-80	服饰美容	0	裤子	2020-07-20 10:38:20.296917+08	0	0	\N	2020-07-20 10:38:20.29728+08	\N	\N	2	2020-07-11
2629	-50	服饰美容	0	开衫	2020-07-20 10:38:34.06078+08	0	0	\N	2020-07-20 10:38:34.061167+08	\N	\N	2	2020-07-11
2630	-99	服饰美容	0	直发梳	2020-07-20 10:38:53.372532+08	0	0	\N	2020-07-20 10:38:53.37284+08	\N	\N	2	2020-07-12
2631	-20	服饰美容	0	睡衣	2020-07-20 10:39:11.625441+08	0	0	\N	2020-07-20 10:39:11.62577+08	\N	\N	2	2020-07-19
2342	-313	小孩生活用品	0	4包尿布	2020-04-14 21:24:16.307406+08	0	0	\N	2020-07-20 13:31:18.429843+08	\N	\N	2	2020-04-14
2158	-221	小孩生活用品	0	尿布	2020-01-08 19:51:37.833551+08	0	0	\N	2020-07-20 13:32:29.030309+08	\N	\N	2	2020-01-07
1058	-255	小孩生活用品	0	1包拉拉裤2包尿不湿	2018-12-26 18:56:23.189856+08	0	0	\N	2020-07-20 13:32:29.113841+08	\N	\N	2	2018-12-26
2633	-74	生活日用	0	64g U盘	2020-07-22 10:35:38.584701+08	0	0	\N	2020-07-22 10:36:28.257265+08	\N	\N	1	2020-06-16
2632	-266	交通出行	0	米其林轮胎	2020-07-22 10:34:42.447192+08	0	0	\N	2020-07-22 10:36:49.212689+08	\N	\N	1	2020-06-03
2634	-35	饮食	0	零食	2020-07-22 10:37:49.833401+08	0	0	\N	2020-07-22 10:37:49.833751+08	\N	\N	1	2020-07-18
2635	-80	饮食	0	水街零食	2020-07-22 10:40:00.690401+08	0	0	\N	2020-07-22 10:40:00.690758+08	\N	\N	1	2020-07-17
2636	-34	饮食	0	葡萄	2020-07-22 10:41:57.409244+08	0	0	\N	2020-07-22 10:41:57.409597+08	\N	\N	1	2020-07-18
2637	-84	生活日用	0	咳嗽药	2020-07-22 10:42:28.413089+08	0	0	\N	2020-07-22 10:42:28.413443+08	\N	\N	1	2020-07-19
2638	-8	饮食	0	西瓜	2020-07-22 10:42:48.650136+08	0	0	\N	2020-07-22 10:42:48.650461+08	\N	\N	1	2020-07-20
2639	-60	小孩玩具	0	拼图	2020-07-22 10:43:11.660814+08	0	0	\N	2020-07-22 10:43:11.661234+08	\N	\N	1	2020-07-21
2640	69840	收入	1	2019年提成	2020-07-24 16:37:50.79051+08	0	0	\N	2020-07-24 16:37:50.792943+08	\N	\N	2	2020-07-24
2641	2949	收入	1	6月份工资	2020-07-24 16:38:50.727588+08	0	0	\N	2020-07-24 16:38:50.727901+08	\N	\N	2	2020-07-24
2642	-1000	饮食	0	请同事吃饭	2020-07-24 21:53:17.50593+08	0	0	\N	2020-07-24 21:53:17.506257+08	\N	\N	2	2020-07-24
2643	-6	文教娱乐	0	优酷	2020-07-30 14:40:10.395518+08	0	0	\N	2020-07-30 14:40:10.410042+08	\N	\N	2	2020-07-26
2644	-36	其他消费	0	拍照	2020-07-30 14:40:35.754807+08	0	0	\N	2020-07-30 14:40:35.755113+08	\N	\N	2	2020-07-28
2645	-40	小孩生活用品	0	牙刷	2020-07-30 14:41:10.310099+08	0	0	\N	2020-07-30 14:41:10.310465+08	\N	\N	2	2020-07-29
2646	3600	收入	1	工龄奖	2020-07-30 14:41:29.244278+08	0	0	\N	2020-07-30 14:41:29.244616+08	\N	\N	2	2020-07-30
2647	-60	生活日用	0	棒冰批发	2020-07-30 14:43:48.597737+08	0	0	\N	2020-07-30 14:43:48.59807+08	\N	\N	2	2020-07-11
2648	-25	服饰美容	0	T恤	2020-07-30 14:45:04.306846+08	0	0	\N	2020-07-30 14:45:04.307174+08	\N	\N	2	2020-07-23
2649	-40	服饰美容	0	连衣裙	2020-07-30 14:45:31.143349+08	0	0	\N	2020-07-30 14:45:31.143681+08	\N	\N	2	2020-07-26
2650	-90	服饰美容	0	鞋子	2020-07-30 14:45:55.657119+08	0	0	\N	2020-07-30 14:45:55.657453+08	\N	\N	2	2020-07-26
2651	-15	服饰美容	0	裤子	2020-07-30 14:46:10.069771+08	0	0	\N	2020-07-30 14:46:10.070116+08	\N	\N	2	2020-07-29
2652	-5	饮食	0	可乐	2020-08-01 18:14:13.006083+08	0	0	\N	2020-08-01 18:14:13.008655+08	\N	\N	2	2020-07-30
2653	-64	小孩健康	0	幼儿园体检	2020-08-01 18:14:54.380581+08	0	0	\N	2020-08-01 18:14:54.380914+08	\N	\N	2	2020-07-31
2654	-80	饮食	0	美购	2020-08-01 18:15:23.701065+08	0	0	\N	2020-08-01 18:15:23.701397+08	\N	\N	2	2020-07-31
2655	-19	饮食	0	葡萄	2020-08-01 18:15:42.011864+08	0	0	\N	2020-08-01 18:15:42.012173+08	\N	\N	2	2020-07-31
2656	-80	生活日用	0	油	2020-08-01 18:15:57.44512+08	0	0	\N	2020-08-01 18:15:57.445453+08	\N	\N	2	2020-08-01
2657	-22	饮食	0	猪蹄	2020-08-01 18:16:49.325592+08	0	0	\N	2020-08-01 18:16:49.325905+08	\N	\N	2	2020-07-30
2658	-28	饮食	0	肯德基	2020-08-01 18:18:48.147089+08	0	0	\N	2020-08-01 18:18:48.147519+08	\N	\N	2	2020-07-30
2659	-20	饮食	0	美午饭	2020-08-01 18:19:09.509354+08	0	0	\N	2020-08-01 18:19:09.509736+08	\N	\N	2	2020-07-31
2660	-103	生活日用	0	油	2020-08-01 18:19:26.301879+08	0	0	\N	2020-08-01 18:19:26.302181+08	\N	\N	2	2020-08-01
2661	-8	交通出行	0	地铁	2020-08-02 13:22:57.496634+08	0	0	\N	2020-08-02 13:22:57.499198+08	\N	\N	2	2020-08-01
2662	-10	饮食	0	草莓干	2020-08-02 13:23:27.370714+08	0	0	\N	2020-08-02 13:23:27.371049+08	\N	\N	2	2020-08-01
2663	-20	小孩服饰	0	睡衣	2020-08-02 13:23:52.022762+08	0	0	\N	2020-08-02 13:23:52.023075+08	\N	\N	2	2020-08-01
2664	-108	饮食	0	海霸王	2020-08-02 13:25:45.900909+08	0	0	\N	2020-08-02 13:25:45.901269+08	\N	\N	2	2020-08-01
2665	-100	小孩文具	0	书	2020-08-02 13:26:00.686042+08	0	0	\N	2020-08-02 13:26:00.686367+08	\N	\N	2	2020-08-02
2666	-45	住房缴费	0	景湖电费	2020-08-04 16:33:57.877771+08	0	0	\N	2020-08-04 16:33:57.88024+08	\N	\N	2	2020-08-02
2667	-150	住房缴费	0	东兴电费	2020-08-04 16:34:18.777015+08	0	0	\N	2020-08-04 16:34:18.777341+08	\N	\N	2	2020-08-02
2668	-20	生活日用	0	白云胶	2020-08-04 16:34:42.838141+08	0	0	\N	2020-08-04 16:34:42.838463+08	\N	\N	2	2020-08-03
2669	-39	小孩服饰	0	裤	2020-08-04 16:35:01.365734+08	0	0	\N	2020-08-04 16:35:01.366082+08	\N	\N	2	2020-08-04
2671	-10	饮食	0	可乐	2020-08-04 16:35:34.833615+08	0	0	\N	2020-08-04 16:35:34.833962+08	\N	\N	2	2020-08-04
2672	-35	饮食	0	茶香香	2020-08-04 16:36:26.030978+08	0	0	\N	2020-08-04 16:36:26.031306+08	\N	\N	2	2020-08-02
2673	-6	交通出行	0	滴滴	2020-08-05 15:19:23.230388+08	0	0	\N	2020-08-05 15:19:23.233258+08	\N	\N	1	2020-07-24
2674	-7	饮食	0	西瓜半个	2020-08-05 15:19:57.646835+08	0	0	\N	2020-08-05 15:19:57.647151+08	\N	\N	1	2020-07-26
2675	-100	服饰美容	0	理发充值	2020-08-05 15:20:28.731008+08	0	0	\N	2020-08-05 15:20:28.731322+08	\N	\N	1	2020-07-27
2676	-30	宠物	0	提莫西草	2020-08-05 15:20:55.779671+08	0	0	\N	2020-08-05 15:20:55.779979+08	\N	\N	1	2020-07-31
2677	-28	宠物	0	兔绳	2020-08-05 15:21:15.750492+08	0	0	\N	2020-08-05 15:21:15.75084+08	\N	\N	1	2020-07-31
2678	-8	交通出行	0	地铁	2020-08-05 15:21:38.873195+08	0	0	\N	2020-08-05 15:21:38.873508+08	\N	\N	1	2020-08-01
2679	-42	饮食	0	零食	2020-08-05 15:22:06.336727+08	0	0	\N	2020-08-05 15:22:06.337118+08	\N	\N	1	2020-08-01
2680	-6	饮食	0	半个西瓜	2020-08-05 15:22:28.44307+08	0	0	\N	2020-08-05 15:22:28.44341+08	\N	\N	1	2020-08-02
2681	-78	小孩文具	0	图书	2020-08-05 15:22:46.462378+08	0	0	\N	2020-08-05 15:22:46.462705+08	\N	\N	1	2020-08-04
2682	-180	生活日用	0	锁芯	2020-08-05 15:23:53.371661+08	0	0	\N	2020-08-05 15:23:53.37197+08	\N	\N	1	2020-08-01
2683	-200	交通出行	0	加油	2020-08-06 08:45:29.966522+08	0	0	\N	2020-08-06 08:45:29.968912+08	\N	\N	1	2020-08-05
2684	-100	通讯物流	0	手机充值	2020-08-12 15:49:47.304922+08	0	0	\N	2020-08-12 15:49:47.307351+08	\N	\N	1	2020-08-12
2685	-18	饮食	0	零食	2020-08-12 15:50:23.111411+08	0	0	\N	2020-08-12 15:50:23.111908+08	\N	\N	1	2020-08-08
2686	-10	饮食	0	矿泉水	2020-08-13 09:07:11.788197+08	0	0	\N	2020-08-13 09:07:11.791185+08	\N	\N	2	2020-08-04
2687	-20	生活日用	0	餐纸	2020-08-13 09:07:50.37754+08	0	0	\N	2020-08-13 09:07:50.377868+08	\N	\N	2	2020-08-04
2689	-267	文教娱乐	0	书	2020-08-13 09:08:33.245945+08	0	0	\N	2020-08-13 09:08:33.24627+08	\N	\N	2	2020-08-05
2690	-45	饮食	0	鸡翅	2020-08-13 09:09:33.623127+08	0	0	\N	2020-08-13 09:09:33.623483+08	\N	\N	2	2020-08-05
2691	-18	饮食	0	绿姿	2020-08-13 09:10:02.645717+08	0	0	\N	2020-08-13 09:10:02.646043+08	\N	\N	2	2020-08-06
2692	-7	饮食	0	西瓜	2020-08-13 09:10:27.847591+08	0	0	\N	2020-08-13 09:10:27.847928+08	\N	\N	2	2020-08-08
2693	-50	小孩生活用品	0	杯子2个	2020-08-13 09:10:52.7642+08	0	0	\N	2020-08-13 09:10:52.764514+08	\N	\N	2	2020-08-10
2694	-25	小孩生活用品	0	杯子	2020-08-13 09:11:10.335462+08	0	0	\N	2020-08-13 09:11:10.335806+08	\N	\N	2	2020-08-12
2695	-6	饮食	0	早餐	2020-08-13 09:11:29.668297+08	0	0	\N	2020-08-13 09:11:29.668621+08	\N	\N	2	2020-08-13
2696	-134	饮食	0	海霸王香肠	2020-08-13 09:12:13.922139+08	0	0	\N	2020-08-13 09:12:13.922462+08	\N	\N	2	2020-08-07
2698	-20	饮食	0	李子	2020-08-13 09:13:20.4988+08	0	0	\N	2020-08-13 09:13:20.499113+08	\N	\N	2	2020-08-06
2699	-179	服饰美容	0	鞋子	2020-08-13 09:13:32.529514+08	0	0	\N	2020-08-13 09:13:32.529868+08	\N	\N	2	2020-08-07
2700	14139	收入	1	工资	2020-08-14 15:34:21.017839+08	0	0	\N	2020-08-14 15:34:21.020579+08	\N	\N	1	2020-08-14
2701	-3	饮食	0	大饼油条	2020-08-14 15:34:40.278215+08	0	0	\N	2020-08-14 15:34:40.27853+08	\N	\N	1	2020-08-13
2702	-3	饮食	0	大饼油条	2020-08-14 15:34:49.524347+08	0	0	\N	2020-08-14 15:34:49.52468+08	\N	\N	1	2020-08-14
2703	-78	饮食	0	美购超市	2020-08-17 14:37:35.330723+08	0	0	\N	2020-08-17 14:37:35.333122+08	\N	\N	2	2020-08-13
2704	-12	饮食	0	冰激凌	2020-08-17 14:37:49.071179+08	0	0	\N	2020-08-17 14:37:49.071538+08	\N	\N	2	2020-08-14
2705	-15	饮食	0	盐酥鸡	2020-08-17 14:38:14.581191+08	0	0	\N	2020-08-17 14:38:14.581501+08	\N	\N	2	2020-08-14
2706	-85	饮食	0	乡巴佬	2020-08-17 14:38:27.625125+08	0	0	\N	2020-08-17 14:38:27.625444+08	\N	\N	2	2020-08-15
2707	-181	饮食	0	盒马鲜生	2020-08-17 14:38:54.040722+08	0	0	\N	2020-08-17 14:38:54.041099+08	\N	\N	2	2020-08-15
2708	-25	饮食	0	吐司	2020-08-17 14:39:07.779147+08	0	0	\N	2020-08-17 14:39:07.779462+08	\N	\N	2	2020-08-15
2710	-16	生活日用	0	洗脸巾	2020-08-17 14:39:49.650535+08	0	0	\N	2020-08-17 14:39:49.650842+08	\N	\N	2	2020-08-16
2711	-7	生活日用	0	玻璃水	2020-08-17 14:40:00.099191+08	0	0	\N	2020-08-17 14:40:00.099535+08	\N	\N	2	2020-08-16
2712	-49	饮食	0	三只松鼠	2020-08-17 14:40:30.595947+08	0	0	\N	2020-08-17 14:40:30.596257+08	\N	\N	2	2020-08-15
2713	-89	服饰美容	0	衣服	2020-08-24 16:51:09.866448+08	0	0	\N	2020-08-24 16:51:09.868847+08	\N	\N	2	2020-08-16
2714	-4	交通出行	0	公交车	2020-08-24 16:51:51.330425+08	0	0	\N	2020-08-24 16:51:51.330741+08	\N	\N	2	2020-08-19
2715	-25	小孩玩具	0	水枪	2020-08-24 16:52:13.685144+08	0	0	\N	2020-08-24 16:52:13.685523+08	\N	\N	2	2020-08-20
2716	-27	小孩玩具	0	水枪	2020-08-24 16:52:27.605787+08	0	0	\N	2020-08-24 16:52:27.606253+08	\N	\N	2	2020-08-20
2717	-48	小孩生活用品	0	汗巾纱布	2020-08-24 16:53:03.900098+08	0	0	\N	2020-08-24 16:53:03.900461+08	\N	\N	2	2020-08-21
2718	-19	小孩生活用品	0	名字贴	2020-08-24 16:53:24.812019+08	0	0	\N	2020-08-24 16:53:24.812335+08	\N	\N	2	2020-08-21
2719	-34	小孩生活用品	0	名字贴	2020-08-24 16:53:39.566323+08	0	0	\N	2020-08-24 16:53:39.566656+08	\N	\N	2	2020-08-21
2720	-52	生活日用	0	炸锅	2020-08-24 16:54:02.040158+08	0	0	\N	2020-08-24 16:54:02.040479+08	\N	\N	2	2020-08-24
2721	-179	服饰美容	0	衣服	2020-08-24 16:54:19.663669+08	0	0	\N	2020-08-24 16:54:19.664008+08	\N	\N	2	2020-08-24
2722	-46	交通出行	0	空气滤芯	2020-08-24 16:54:52.25597+08	0	0	\N	2020-08-24 16:54:52.256288+08	\N	\N	2	2020-08-24
2723	-113	小孩玩具	0	蜡笔	2020-08-24 16:55:45.850142+08	0	0	\N	2020-08-24 16:55:45.85049+08	\N	\N	2	2020-08-18
2724	-69	小孩服饰	0	泳衣	2020-08-24 16:55:59.929875+08	0	0	\N	2020-08-24 16:55:59.930195+08	\N	\N	2	2020-08-20
2725	-61	小孩生活用品	0	牙刷	2020-08-24 16:56:41.631848+08	0	0	\N	2020-08-24 16:56:41.632144+08	\N	\N	2	2020-08-18
2726	-6	生活日用	0	申通快递	2020-08-24 16:57:19.195022+08	0	0	\N	2020-08-24 16:57:19.19536+08	\N	\N	2	2020-08-20
2727	2900	收入	1	工资	2020-08-24 16:57:42.631665+08	0	0	\N	2020-08-24 16:57:42.631977+08	\N	\N	2	2020-08-21
2728	-40	饮食	0	茶香香	2020-08-24 16:59:58.397339+08	0	0	\N	2020-08-24 16:59:58.397679+08	\N	\N	2	2020-08-21
2729	-47	饮食	0	几把串	2020-08-24 17:00:49.579555+08	0	0	\N	2020-08-24 17:00:49.579877+08	\N	\N	2	2020-08-19
2730	-22	饮食	0	早餐	2020-08-28 11:25:41.106712+08	0	0	\N	2020-08-28 11:25:41.109088+08	\N	\N	2	2020-08-28
2731	-19	服饰美容	0	睡裙	2020-08-28 11:25:58.625978+08	0	0	\N	2020-08-28 11:25:58.626341+08	\N	\N	2	2020-08-28
2732	-65	饮食	0	饮料	2020-08-28 11:27:20.332492+08	0	0	\N	2020-08-28 11:27:20.332833+08	\N	\N	2	2020-08-25
2733	-70	小孩生活用品	0	面霜	2020-08-28 11:27:44.563509+08	0	0	\N	2020-08-28 11:27:44.563847+08	\N	\N	2	2020-08-25
2734	-51	生活日用	0	洗衣液	2020-08-28 11:28:27.476702+08	0	0	\N	2020-08-28 11:28:27.477065+08	\N	\N	2	2020-08-28
2735	-29	文教娱乐	0	拍照	2020-08-28 11:29:07.320249+08	0	0	\N	2020-08-28 11:29:07.320574+08	\N	\N	2	2020-08-27
2736	-1320	生活日用	0	净水器套件	2020-08-31 09:41:40.555377+08	0	0	\N	2020-08-31 09:41:40.557791+08	\N	\N	1	2020-08-16
2737	-74	生活日用	0	数据线X5	2020-08-31 09:42:10.684118+08	0	0	\N	2020-08-31 09:42:10.684427+08	\N	\N	1	2020-08-17
2738	-149	小孩文具	0	汽车玩具	2020-08-31 09:42:34.615266+08	0	0	\N	2020-08-31 09:42:34.61559+08	\N	\N	1	2020-08-17
2739	-6	饮食	0	早餐	2020-08-31 09:42:55.244143+08	0	0	\N	2020-08-31 09:42:55.244464+08	\N	\N	1	2020-08-20
2740	-6	饮食	0	早餐	2020-08-31 09:43:08.684615+08	0	0	\N	2020-08-31 09:43:08.68494+08	\N	\N	1	2020-08-24
2741	-11	生活日用	0	3M反光贴	2020-08-31 09:43:32.482164+08	0	0	\N	2020-08-31 09:43:32.482501+08	\N	\N	1	2020-08-25
2742	-825	生活日用	0	UCC变形金刚折叠自行车	2020-08-31 09:44:08.417989+08	0	0	\N	2020-08-31 09:44:08.418329+08	\N	\N	1	2020-08-27
2743	-6	饮食	0	早餐	2020-08-31 09:44:22.415544+08	0	0	\N	2020-08-31 09:44:22.415881+08	\N	\N	1	2020-08-27
2744	-26	饮食	0	手抓饼	2020-08-31 09:44:39.044083+08	0	0	\N	2020-08-31 09:44:39.0444+08	\N	\N	1	2020-08-26
2745	-3	饮食	0	早餐	2020-08-31 09:44:51.575407+08	0	0	\N	2020-08-31 09:44:51.575814+08	\N	\N	1	2020-08-28
2746	-13	生活日用	0	自行车前灯架	2020-08-31 09:45:24.076182+08	0	0	\N	2020-08-31 09:45:24.076514+08	\N	\N	1	2020-08-28
2747	-18	饮食	0	西瓜	2020-08-31 09:46:04.163905+08	0	0	\N	2020-08-31 09:46:04.164239+08	\N	\N	1	2020-08-29
2748	-193	饮食	0	粥	2020-08-31 09:46:16.435982+08	0	0	\N	2020-08-31 09:46:16.436308+08	\N	\N	1	2020-08-29
2749	-4	生活日用	0	打印	2020-08-31 09:47:44.605337+08	0	0	\N	2020-08-31 09:47:44.605655+08	\N	\N	1	2020-08-30
2750	-26	饮食	0	零食	2020-08-31 09:48:47.850748+08	0	0	\N	2020-08-31 09:48:47.85106+08	\N	\N	1	2020-08-19
2751	-58	生活日用	0	自行车快递费	2020-08-31 09:49:33.134968+08	0	0	\N	2020-08-31 09:49:33.135281+08	\N	\N	1	2020-08-28
2752	-30	饮食	0	羊肉汤	2020-08-31 09:49:51.409476+08	0	0	\N	2020-08-31 09:49:51.409825+08	\N	\N	1	2020-08-28
2753	-1000	交通出行	0	油卡	2020-09-01 21:44:29.10818+08	0	0	\N	2020-09-01 21:44:29.110563+08	\N	\N	2	2020-08-28
2754	-28	饮食	0	茶香香	2020-09-01 21:44:48.587096+08	0	0	\N	2020-09-01 21:44:48.58746+08	\N	\N	2	2020-08-28
2755	-193	饮食	0	午餐	2020-09-01 21:45:21.483156+08	0	0	\N	2020-09-01 21:45:21.483493+08	\N	\N	2	2020-08-29
2756	-134	小孩服饰	0	衣服	2020-09-01 21:45:48.513287+08	0	0	\N	2020-09-01 21:45:48.513674+08	\N	\N	2	2020-08-30
2757	-50	交通出行	0	停车罚款	2020-09-01 21:46:10.646403+08	0	0	\N	2020-09-01 21:46:10.646736+08	\N	\N	2	2020-08-31
2758	-12	生活日用	0	无纺布	2020-09-01 21:46:33.765029+08	0	0	\N	2020-09-01 21:46:33.765367+08	\N	\N	2	2020-08-31
2759	-40	饮食	0	五芳斋	2020-09-01 21:46:48.641106+08	0	0	\N	2020-09-01 21:46:48.641417+08	\N	\N	2	2020-08-31
2760	-39	小孩生活用品	0	洗衣液	2020-09-01 21:47:09.073303+08	0	0	\N	2020-09-01 21:47:09.073694+08	\N	\N	2	2020-08-31
2761	-25	生活日用	0	桌布	2020-09-01 21:47:31.18923+08	0	0	\N	2020-09-01 21:47:31.189544+08	\N	\N	2	2020-09-01
2762	-13	交通出行	0	停车8＋5	2020-09-01 21:50:49.773622+08	0	0	\N	2020-09-01 21:50:49.77406+08	\N	\N	2	2020-08-29
2763	-104	饮食	0	定牛奶	2020-09-01 21:51:13.520716+08	0	0	\N	2020-09-01 21:51:13.521057+08	\N	\N	2	2020-08-31
2764	-345	交通出行	0	轮胎	2020-09-01 21:51:27.446333+08	0	0	\N	2020-09-01 21:51:27.446679+08	\N	\N	2	2020-09-01
2765	-25	生活日用	0	充电器	2020-09-01 21:51:50.922192+08	0	0	\N	2020-09-01 21:51:50.922532+08	\N	\N	2	2020-09-01
2766	-24	住房缴费	0	景湖水费	2020-09-05 02:36:07.830858+08	0	0	\N	2020-09-05 02:36:07.833304+08	\N	\N	2	2020-09-02
2767	-79	生活日用	0	折叠椅	2020-09-05 02:36:26.629413+08	0	0	\N	2020-09-05 02:36:26.629732+08	\N	\N	2	2020-09-02
2768	-234	住房缴费	0	东兴电费	2020-09-05 02:36:56.930334+08	0	0	\N	2020-09-05 02:36:56.930664+08	\N	\N	2	2020-09-03
2770	-46	饮食	0	盒马	2020-09-05 02:37:46.940213+08	0	0	\N	2020-09-05 02:37:46.940556+08	\N	\N	2	2020-09-03
2771	-109	饮食	0	凑凑	2020-09-05 02:38:05.890095+08	0	0	\N	2020-09-05 02:38:05.890539+08	\N	\N	2	2020-09-03
2772	-10	饮食	0	吐司	2020-09-05 02:38:57.43056+08	0	0	\N	2020-09-05 02:38:57.430878+08	\N	\N	2	2020-09-03
2773	-4	饮食	0	可口可乐	2020-09-05 02:39:21.834687+08	0	0	\N	2020-09-05 02:39:21.835005+08	\N	\N	2	2020-09-04
2774	-54	小孩生活用品	0	止痒贴	2020-09-09 10:35:58.975059+08	0	0	\N	2020-09-09 10:35:58.977695+08	\N	\N	2	2020-09-05
2775	-28	生活日用	0	物美	2020-09-09 10:36:15.776215+08	0	0	\N	2020-09-09 10:36:15.776593+08	\N	\N	2	2020-09-05
2776	-68	饮食	0	韩宫宴	2020-09-09 10:36:45.158888+08	0	0	\N	2020-09-09 10:36:45.159227+08	\N	\N	2	2020-09-06
2777	-49	小孩服饰	0	拖鞋	2020-09-09 10:36:58.052807+08	0	0	\N	2020-09-09 10:36:58.053157+08	\N	\N	2	2020-09-09
2778	-154	小孩服饰	0	内衣	2020-09-09 10:37:27.386791+08	0	0	\N	2020-09-09 10:37:27.387102+08	\N	\N	2	2020-09-06
2779	-8	饮食	0	锅盔	2020-09-09 10:37:45.804617+08	0	0	\N	2020-09-09 10:37:45.804926+08	\N	\N	2	2020-09-06
2780	-11	饮食	0	果汁	2020-09-09 10:38:00.337218+08	0	0	\N	2020-09-09 10:38:00.33761+08	\N	\N	2	2020-09-06
2781	-227	饮食	0	美团	2020-09-09 10:45:44.298872+08	0	0	\N	2020-09-09 10:45:44.299172+08	\N	\N	2	2020-09-06
2782	-87	饮食	0	美团	2020-09-09 10:46:45.64108+08	0	0	\N	2020-09-09 10:46:45.641397+08	\N	\N	2	2020-09-06
2783	-15	小孩其他	0	教师节红包	2020-09-09 10:57:39.382812+08	0	0	\N	2020-09-09 10:57:39.383124+08	\N	\N	2	2020-09-07
2784	-193	生活日用	0	大米4袋	2020-09-09 10:58:06.490492+08	0	0	\N	2020-09-09 10:58:06.490816+08	\N	\N	2	2020-09-07
2785	-140	生活日用	0	餐巾纸	2020-09-09 10:58:22.110235+08	0	0	\N	2020-09-09 10:58:22.110572+08	\N	\N	2	2020-09-09
2786	-399	生活日用	0	破壁机	2020-09-10 16:47:00.709005+08	0	0	\N	2020-09-10 16:47:00.711473+08	\N	\N	2	2020-09-09
2787	-25	生活日用	0	充电头	2020-09-10 16:47:12.854379+08	0	0	\N	2020-09-10 16:47:12.854728+08	\N	\N	2	2020-09-09
2788	-27	生活日用	0	餐巾纸	2020-09-10 16:47:39.097818+08	0	0	\N	2020-09-10 16:47:39.098121+08	\N	\N	2	2020-09-10
2789	-100	通讯物流	0	手机充值	2020-09-11 16:59:19.985774+08	0	0	\N	2020-09-11 16:59:19.988182+08	\N	\N	1	2020-09-04
2790	-84	饮食	0	银泰城	2020-09-11 16:59:47.244946+08	0	0	\N	2020-09-11 16:59:47.245308+08	\N	\N	1	2020-09-06
2791	-230	生活日用	0	urrider山地车儿童座椅	2020-09-11 17:00:22.8173+08	0	0	\N	2020-09-11 17:00:22.817611+08	\N	\N	1	2020-09-09
2793	-125	宠物	0	布格斯兔粮	2020-09-11 17:00:50.572502+08	0	0	\N	2020-09-11 17:00:50.572845+08	\N	\N	1	2020-09-10
2794	-64	饮食	0	美购	2020-09-11 17:01:34.395807+08	0	0	\N	2020-09-11 17:01:34.396178+08	\N	\N	1	2020-09-01
2795	-120	小孩健康	0	太平洋人寿	2020-09-11 17:02:54.574856+08	0	0	\N	2020-09-11 17:02:54.575236+08	\N	\N	1	2020-08-31
2796	-5248	小孩教育	0	幼儿园费用	2020-09-11 17:03:25.933619+08	0	0	\N	2020-09-11 17:03:25.93392+08	\N	\N	1	2020-09-04
2797	-96	饮食	0	宁波大学吃的	2020-09-11 17:04:08.235143+08	0	0	\N	2020-09-11 17:04:08.23549+08	\N	\N	1	2020-09-09
2798	-126	住房缴费	0	东兴水费	2020-09-11 21:19:30.21511+08	0	0	\N	2020-09-11 21:19:30.215423+08	\N	\N	2	2020-09-10
2799	-234	小孩生活用品	0	床	2020-09-11 21:19:47.251895+08	0	0	\N	2020-09-11 21:19:47.252193+08	\N	\N	2	2020-09-10
2800	-100	其他消费	0	班费	2020-09-11 21:20:33.684832+08	0	0	\N	2020-09-11 21:20:33.685259+08	\N	\N	2	2020-09-10
2801	-20	饮食	0	栗子	2020-09-11 21:20:50.287104+08	0	0	\N	2020-09-11 21:20:50.287437+08	\N	\N	2	2020-09-10
2802	-141	饮食	0	牛奶	2020-09-11 21:21:07.116035+08	0	0	\N	2020-09-11 21:21:07.116343+08	\N	\N	2	2020-09-10
2803	-28	饮食	0	牛奶	2020-09-11 21:21:20.631017+08	0	0	\N	2020-09-11 21:21:20.631322+08	\N	\N	2	2020-09-10
2804	-100	饮食	0	聚餐	2020-09-11 21:21:30.386859+08	0	0	\N	2020-09-11 21:21:30.38717+08	\N	\N	2	2020-09-11
2805	-182	生活日用	0	水壶加一袋米	2020-09-11 21:21:58.051162+08	0	0	\N	2020-09-11 21:21:58.051461+08	\N	\N	2	2020-09-10
2806	-22	饮食	0	五谷杂粮	2020-09-17 14:46:13.236274+08	0	0	\N	2020-09-17 14:46:13.238659+08	\N	\N	2	2020-09-11
2807	-5	交通出行	0	停车费	2020-09-17 14:46:31.553225+08	0	0	\N	2020-09-17 14:46:31.553544+08	\N	\N	2	2020-09-12
2808	-100	饮食	0	o2充值	2020-09-17 14:47:04.026538+08	0	0	\N	2020-09-17 14:47:04.026858+08	\N	\N	2	2020-09-17
2809	-50	饮食	0	西选	2020-09-17 14:47:34.368562+08	0	0	\N	2020-09-17 14:47:34.368882+08	\N	\N	2	2020-09-12
2810	-290	小孩服饰	0	鞋子	2020-09-17 14:47:54.407+08	0	0	\N	2020-09-17 14:47:54.407336+08	\N	\N	2	2020-09-12
2811	-100	饮食	0	老婆大人	2020-09-17 14:48:07.741401+08	0	0	\N	2020-09-17 14:48:07.741726+08	\N	\N	2	2020-09-12
2812	-30	饮食	0	星巴克	2020-09-17 14:48:20.436322+08	0	0	\N	2020-09-17 14:48:20.436633+08	\N	\N	2	2020-09-12
2813	-12	生活日用	0	排插固定器	2020-09-17 14:48:52.021006+08	0	0	\N	2020-09-17 14:48:52.021332+08	\N	\N	2	2020-09-13
2814	-36	饮食	0	饼干	2020-09-17 14:49:14.764086+08	0	0	\N	2020-09-17 14:49:14.764426+08	\N	\N	2	2020-09-13
2815	-65	生活日用	0	吊扇	2020-09-17 14:49:40.594683+08	0	0	\N	2020-09-17 14:49:40.595064+08	\N	\N	2	2020-09-14
2816	-20	生活日用	0	台面贴纸	2020-09-17 14:49:59.060709+08	0	0	\N	2020-09-17 14:49:59.061096+08	\N	\N	2	2020-09-17
2817	-27	饮食	0	美团	2020-09-17 14:50:42.340454+08	0	0	\N	2020-09-17 14:50:42.340858+08	\N	\N	2	2020-09-12
2818	-30	交通出行	0	停车费	2020-09-17 14:50:57.909201+08	0	0	\N	2020-09-17 14:50:57.90951+08	\N	\N	2	2020-09-12
2819	-6	饮食	0	凉皮	2020-09-17 14:51:17.938769+08	0	0	\N	2020-09-17 14:51:17.939074+08	\N	\N	2	2020-09-13
2820	-10	饮食	0	年糕	2020-09-17 14:51:29.299235+08	0	0	\N	2020-09-17 14:51:29.299594+08	\N	\N	2	2020-09-13
2821	-42	生活日用	0	小夜灯	2020-09-17 14:51:42.831358+08	0	0	\N	2020-09-17 14:51:42.831677+08	\N	\N	2	2020-09-17
2822	-6	生活日用	0	无痕挂钩	2020-09-17 14:52:06.588434+08	0	0	\N	2020-09-17 14:52:06.588781+08	\N	\N	2	2020-09-17
2823	-37	生活日用	0	拼多多	2020-09-17 17:15:36.520333+08	0	0	\N	2020-09-17 17:15:36.520664+08	\N	\N	2	2020-09-17
2824	-27	生活日用	0	拼多多	2020-09-17 17:16:21.91272+08	0	0	\N	2020-09-17 17:16:21.913065+08	\N	\N	2	2020-09-17
2825	-5	交通出行	0	停车费	2020-09-21 08:40:40.791846+08	0	0	\N	2020-09-21 08:40:40.794298+08	\N	\N	2	2020-09-19
2827	-88	饮食	0	餐饮	2020-09-21 08:46:14.517687+08	0	0	\N	2020-09-21 08:46:14.518014+08	\N	\N	2	2020-09-19
2828	-1000	文教娱乐	0	足浴充卡	2020-09-21 08:46:41.4655+08	0	0	\N	2020-09-21 08:46:41.465817+08	\N	\N	2	2020-09-19
2829	-95	小孩服饰	0	衣服	2020-09-21 08:47:01.712267+08	0	0	\N	2020-09-21 08:47:01.71259+08	\N	\N	2	2020-09-19
2830	-76	饮食	0	布朗尼烘焙	2020-09-21 08:47:22.288634+08	0	0	\N	2020-09-21 08:47:22.28903+08	\N	\N	2	2020-09-20
2831	-17	生活日用	0	一次性餐盒	2020-09-21 08:47:47.466201+08	0	0	\N	2020-09-21 08:47:47.466516+08	\N	\N	2	2020-09-20
2832	-14	饮食	0	超市	2020-09-21 08:48:00.492497+08	0	0	\N	2020-09-21 08:48:00.492814+08	\N	\N	2	2020-09-20
2833	-20	生活日用	0	口罩	2020-09-21 08:48:11.582925+08	0	0	\N	2020-09-21 08:48:11.583345+08	\N	\N	2	2020-09-21
2834	-4	饮食	0	早餐	2020-09-21 08:48:36.695462+08	0	0	\N	2020-09-21 08:48:36.695822+08	\N	\N	2	2020-09-21
2835	-42	生活日用	0	小夜灯	2020-09-21 08:51:30.356862+08	0	0	\N	2020-09-21 08:51:30.357223+08	\N	\N	2	2020-09-17
2836	-6	生活日用	0	无痕挂钩	2020-09-21 08:51:50.052066+08	0	0	\N	2020-09-21 08:51:50.052397+08	\N	\N	2	2020-09-19
2837	-34	饮食	0	羊肉汤	2020-09-22 13:44:00.72626+08	0	0	\N	2020-09-22 13:44:00.728587+08	\N	\N	1	2020-09-12
2838	-11	饮食	0	饮料	2020-09-22 13:44:40.460455+08	0	0	\N	2020-09-22 13:44:40.46081+08	\N	\N	1	2020-09-20
2839	-10	饮食	0	牛肉汤	2020-09-22 13:44:54.307881+08	0	0	\N	2020-09-22 13:44:54.308207+08	\N	\N	1	2020-09-20
2840	-61	饮食	0	羊肉汤	2020-09-22 13:45:04.316905+08	0	0	\N	2020-09-22 13:45:04.317275+08	\N	\N	1	2020-09-20
2841	-9	生活日用	0	自行车铃铛	2020-09-22 13:46:05.225811+08	0	0	\N	2020-09-22 13:46:05.226146+08	\N	\N	1	2020-09-17
2842	-2	饮食	0	冰淇淋	2020-09-22 13:46:22.351923+08	0	0	\N	2020-09-22 13:46:22.352253+08	\N	\N	1	2020-09-19
2843	-13	生活日用	0	自行车手电筒固定架	2020-09-22 13:46:53.946226+08	0	0	\N	2020-09-22 13:46:53.946581+08	\N	\N	1	2020-09-22
2844	-39	宠物	0	兔子食物	2020-09-22 13:47:17.34411+08	0	0	\N	2020-09-22 13:47:17.344433+08	\N	\N	1	2020-09-22
2845	-21	饮食	0	葡萄	2020-09-22 13:48:25.989766+08	0	0	\N	2020-09-22 13:48:25.990113+08	\N	\N	1	2020-09-13
2846	-23	生活日用	0	防油贴纸	2020-10-04 21:15:56.011334+08	0	0	\N	2020-10-04 21:15:56.013951+08	\N	\N	2	2020-09-22
2847	-25	生活日用	0	防水胶带	2020-10-04 21:16:16.280054+08	0	0	\N	2020-10-04 21:16:16.280376+08	\N	\N	2	2020-09-22
2848	-83	生活日用	0	美购超市	2020-10-04 21:16:47.699062+08	0	0	\N	2020-10-04 21:16:47.699386+08	\N	\N	2	2020-09-22
2849	-214	小孩服饰	0	衣服	2020-10-04 21:17:17.809463+08	0	0	\N	2020-10-04 21:17:17.809798+08	\N	\N	2	2020-09-22
2850	-10	饮食	0	十足	2020-10-04 21:17:38.618894+08	0	0	\N	2020-10-04 21:17:38.619196+08	\N	\N	2	2020-09-26
2851	-149	生活日用	0	鞋子	2020-10-04 21:17:55.104814+08	0	0	\N	2020-10-04 21:17:55.105153+08	\N	\N	2	2020-09-26
2852	-13	饮食	0	吃	2020-10-04 21:18:14.812929+08	0	0	\N	2020-10-04 21:18:14.813286+08	\N	\N	2	2020-09-26
2853	-10	饮食	0	十足	2020-10-04 21:18:28.444741+08	0	0	\N	2020-10-04 21:18:28.44509+08	\N	\N	2	2020-09-27
2854	-198	小孩健康	0	洗鼻子	2020-10-04 21:19:03.574811+08	0	0	\N	2020-10-04 21:19:03.575127+08	\N	\N	2	2020-09-27
2855	-8	饮食	0	果汁	2020-10-04 21:19:39.323633+08	0	0	\N	2020-10-04 21:19:39.323937+08	\N	\N	2	2020-09-27
2856	-7	饮食	0	十足	2020-10-04 21:19:55.186696+08	0	0	\N	2020-10-04 21:19:55.187065+08	\N	\N	2	2020-09-27
2857	-25	服饰美容	0	内裤	2020-10-04 21:20:18.174074+08	0	0	\N	2020-10-04 21:20:18.174396+08	\N	\N	2	2020-09-28
2858	-6	饮食	0	十足	2020-10-04 21:20:33.404936+08	0	0	\N	2020-10-04 21:20:33.405293+08	\N	\N	2	2020-09-28
2859	-156	服饰美容	0	包	2020-10-04 21:20:50.709871+08	0	0	\N	2020-10-04 21:20:50.710169+08	\N	\N	2	2020-09-28
2860	-12	饮食	0	饭	2020-10-04 21:21:44.676791+08	0	0	\N	2020-10-04 21:21:44.677134+08	\N	\N	2	2020-09-30
2861	-8	饮食	0	十足	2020-10-04 21:21:59.247997+08	0	0	\N	2020-10-04 21:21:59.248306+08	\N	\N	2	2020-10-01
2862	-9	生活日用	0	滤网	2020-10-04 21:22:21.224694+08	0	0	\N	2020-10-04 21:22:21.225082+08	\N	\N	2	2020-10-02
2863	-68	住房缴费	0	东兴电费	2020-10-04 21:22:45.131875+08	0	0	\N	2020-10-04 21:22:45.132186+08	\N	\N	2	2020-10-02
2864	-62	住房缴费	0	景湖水岸	2020-10-04 21:52:23.173582+08	0	0	\N	2020-10-04 21:52:23.174006+08	\N	\N	2	2020-10-02
2865	-200	饮食	0	老婆大人	2020-10-04 21:52:42.440148+08	0	0	\N	2020-10-04 21:52:42.440484+08	\N	\N	2	2020-10-03
2866	-48	服饰美容	0	单鞋	2020-10-04 21:53:08.185361+08	0	0	\N	2020-10-04 21:53:08.185657+08	\N	\N	2	2020-10-04
2867	-64	服饰美容	0	裙子	2020-10-04 21:53:20.524127+08	0	0	\N	2020-10-04 21:53:20.524456+08	\N	\N	2	2020-10-04
2869	-3	饮食	0	可乐	2020-10-04 21:54:33.473093+08	0	0	\N	2020-10-04 21:54:33.473431+08	\N	\N	2	2020-09-23
2870	-398	交通出行	0	途虎养车	2020-10-04 21:54:55.533049+08	0	0	\N	2020-10-04 21:54:55.533417+08	\N	\N	2	2020-09-24
2871	-25	交通出行	0	滤芯	2020-10-04 21:55:09.182549+08	0	0	\N	2020-10-04 21:55:09.182871+08	\N	\N	2	2020-09-24
2872	-8	饮食	0	果汁	2020-10-04 21:55:32.839204+08	0	0	\N	2020-10-04 21:55:32.839509+08	\N	\N	2	2020-09-24
2873	-7	饮食	0	牛奶	2020-10-04 21:56:11.441764+08	0	0	\N	2020-10-04 21:56:11.442075+08	\N	\N	2	2020-09-24
2874	-15	交通出行	0	停车费	2020-10-04 21:56:29.980419+08	0	0	\N	2020-10-04 21:56:29.980746+08	\N	\N	2	2020-09-24
2875	-75	交通出行	0	停车费	2020-10-04 21:57:01.55991+08	0	0	\N	2020-10-04 21:57:01.560226+08	\N	\N	2	2020-10-01
2876	-45	饮食	0	西梅	2020-10-04 21:57:16.058005+08	0	0	\N	2020-10-04 21:57:16.058303+08	\N	\N	2	2020-09-30
2877	-15	交通出行	0	停车费	2020-10-04 21:59:23.539432+08	0	0	\N	2020-10-04 21:59:23.539744+08	\N	\N	2	2020-10-01
2878	-450	饮食	0	月饼3箱	2020-10-09 12:34:24.973721+08	0	0	\N	2020-10-09 12:34:24.975981+08	\N	\N	1	2020-09-23
2879	-25	饮食	0	零食	2020-10-09 12:35:03.541648+08	0	0	\N	2020-10-09 12:35:03.541951+08	\N	\N	1	2020-09-25
2880	-199	生活日用	0	读道读书会	2020-10-09 12:35:27.581034+08	0	0	\N	2020-10-09 12:35:27.581352+08	\N	\N	1	2020-09-28
2881	-15	饮食	0	牛肉面	2020-10-09 12:35:54.492596+08	0	0	\N	2020-10-09 12:35:54.492908+08	\N	\N	1	2020-09-30
2882	-6	饮食	0	零食	2020-10-09 12:36:05.527189+08	0	0	\N	2020-10-09 12:36:05.527517+08	\N	\N	1	2020-09-30
2883	-48	饮食	0	牛肉面	2020-10-09 12:36:21.323522+08	0	0	\N	2020-10-09 12:36:21.323845+08	\N	\N	1	2020-10-02
2884	-29	饮食	0	零食	2020-10-09 12:36:38.250599+08	0	0	\N	2020-10-09 12:36:38.250924+08	\N	\N	1	2020-10-03
2885	-490	交通出行	0	前震	2020-10-09 12:37:04.738983+08	0	0	\N	2020-10-09 12:37:04.739365+08	\N	\N	1	2020-10-09
2886	-15	饮食	0	牛肉面	2020-10-09 12:37:15.267338+08	0	0	\N	2020-10-09 12:37:15.267668+08	\N	\N	1	2020-10-09
2887	-3	饮食	0	大饼油条	2020-10-09 12:37:58.752668+08	0	0	\N	2020-10-09 12:37:58.753034+08	\N	\N	1	2020-09-25
2888	-120	小孩健康	0	小孩白细胞过高住院	2020-10-09 12:38:37.109653+08	0	0	\N	2020-10-09 12:38:37.109973+08	\N	\N	1	2020-09-26
2889	-99	服饰美容	0	衣服	2020-10-09 12:39:02.985813+08	0	0	\N	2020-10-09 12:39:02.986122+08	\N	\N	1	2020-09-26
2890	-15	饮食	0	饮料	2020-10-09 12:39:26.788241+08	0	0	\N	2020-10-09 12:39:26.788554+08	\N	\N	1	2020-09-26
2891	-91	饮食	0	粥	2020-10-09 12:39:39.723664+08	0	0	\N	2020-10-09 12:39:39.723987+08	\N	\N	1	2020-09-26
2892	-100	饮食	0	老婆大人	2020-10-09 12:39:56.039681+08	0	0	\N	2020-10-09 12:39:56.040029+08	\N	\N	1	2020-09-26
2893	-20	通讯物流	0	话费	2020-10-09 12:40:16.562391+08	0	0	\N	2020-10-09 12:40:16.562724+08	\N	\N	1	2020-09-27
2894	-80	小孩玩具	0	变形金刚	2020-10-09 12:40:46.537514+08	0	0	\N	2020-10-09 12:40:46.537843+08	\N	\N	1	2020-09-27
2895	-100	通讯物流	0	话费	2020-10-09 12:41:10.196418+08	0	0	\N	2020-10-09 12:41:10.196766+08	\N	\N	1	2020-09-27
2896	-10	饮食	0	便利店	2020-10-09 12:42:03.198791+08	0	0	\N	2020-10-09 12:42:03.199092+08	\N	\N	1	2020-09-27
2897	-70	饮食	0	吃饭	2020-10-09 12:42:27.841304+08	0	0	\N	2020-10-09 12:42:27.841663+08	\N	\N	1	2020-09-28
2898	-20	通讯物流	0	话费	2020-10-09 12:43:33.641864+08	0	0	\N	2020-10-09 12:43:33.642202+08	\N	\N	1	2020-09-29
2899	-10	饮食	0	小吃	2020-10-09 12:43:56.893803+08	0	0	\N	2020-10-09 12:43:56.894102+08	\N	\N	1	2020-10-06
2900	-18	饮食	0	古茗	2020-10-12 11:29:24.720439+08	0	0	\N	2020-10-12 11:29:24.724308+08	\N	\N	1	2020-10-09
2901	-20	饮食	0	栗子	2020-10-12 11:29:36.958015+08	0	0	\N	2020-10-12 11:29:36.958332+08	\N	\N	1	2020-10-09
2902	-4748	通讯物流	0	三星S20	2020-10-12 11:30:48.728688+08	0	0	\N	2020-10-12 11:30:48.729063+08	\N	\N	1	2020-10-10
2904	-90	服饰美容	0	羊城故事	2020-10-19 22:34:55.864576+08	0	0	\N	2020-10-19 22:34:55.867002+08	\N	\N	2	2020-10-04
2905	-22	服饰美容	0	衬衫	2020-10-19 22:35:45.949001+08	0	0	\N	2020-10-19 22:35:45.949313+08	\N	\N	2	2020-10-04
2906	-43	服饰美容	0	腰带	2020-10-19 22:36:46.704524+08	0	0	\N	2020-10-19 22:36:46.704854+08	\N	\N	2	2020-10-05
2907	-620	饮食	0	山姆	2020-10-19 22:37:09.725385+08	0	0	\N	2020-10-19 22:37:09.725764+08	\N	\N	2	2020-10-05
2908	-55	饮食	0	山姆午餐	2020-10-19 22:37:27.631332+08	0	0	\N	2020-10-19 22:37:27.631656+08	\N	\N	2	2020-10-05
2909	-577	服饰美容	0	优衣库	2020-10-19 22:37:43.623621+08	0	0	\N	2020-10-19 22:37:43.623963+08	\N	\N	2	2020-10-05
2910	-130	服饰美容	0	迪卡侬	2020-10-19 22:38:00.437587+08	0	0	\N	2020-10-19 22:38:00.437886+08	\N	\N	2	2020-10-05
2911	-99	小孩玩具	0	玩具	2020-10-19 22:38:20.029238+08	0	0	\N	2020-10-19 22:38:20.029599+08	\N	\N	2	2020-10-05
2912	-18	饮食	0	古茗	2020-10-19 22:38:32.319764+08	0	0	\N	2020-10-19 22:38:32.320073+08	\N	\N	2	2020-10-05
2913	-6	饮食	0	麦当劳	2020-10-19 22:38:54.808178+08	0	0	\N	2020-10-19 22:38:54.808491+08	\N	\N	2	2020-10-07
2914	-20	小孩玩具	0	玩具	2020-10-19 22:39:11.609375+08	0	0	\N	2020-10-19 22:39:11.609785+08	\N	\N	2	2020-10-07
2915	-11	交通出行	0	停车费	2020-10-19 22:39:33.406716+08	0	0	\N	2020-10-19 22:39:33.407031+08	\N	\N	2	2020-10-07
2916	-40	服饰美容	0	裤子	2020-10-19 22:40:19.998824+08	0	0	\N	2020-10-19 22:40:19.99914+08	\N	\N	2	2020-10-08
2917	-117	服饰美容	0	衣服	2020-10-19 22:40:38.179471+08	0	0	\N	2020-10-19 22:40:38.179803+08	\N	\N	2	2020-10-08
2918	-89	服饰美容	0	衣服	2020-10-19 22:41:43.041969+08	0	0	\N	2020-10-19 22:41:43.042312+08	\N	\N	2	2020-10-08
2919	-75	服饰美容	0	裤子	2020-10-19 22:42:05.600001+08	0	0	\N	2020-10-19 22:42:05.600385+08	\N	\N	2	2020-10-08
2920	-13	服饰美容	0	打底衣	2020-10-19 22:43:03.224873+08	0	0	\N	2020-10-19 22:43:03.225227+08	\N	\N	2	2020-10-08
2921	-116	服饰美容	0	蘑菇街包	2020-10-19 22:47:57.242508+08	0	0	\N	2020-10-19 22:47:57.242829+08	\N	\N	2	2020-10-08
2923	-12	通讯物流	0	物流	2020-10-19 22:49:45.954865+08	0	0	\N	2020-10-19 22:49:45.955183+08	\N	\N	2	2020-10-09
2924	-12	通讯物流	0	物流	2020-10-19 22:50:03.342268+08	0	0	\N	2020-10-19 22:50:03.342582+08	\N	\N	2	2020-10-09
2926	-11	饮食	0	coco	2020-10-19 22:50:48.08761+08	0	0	\N	2020-10-19 22:50:48.087963+08	\N	\N	2	2020-10-11
2927	-9	饮食	0	草莓	2020-10-19 22:51:14.639287+08	0	0	\N	2020-10-19 22:51:14.639615+08	\N	\N	2	2020-10-12
2928	-11	饮食	0	早点	2020-10-19 22:51:37.433789+08	0	0	\N	2020-10-19 22:51:37.434134+08	\N	\N	2	2020-10-13
2929	-130	文教娱乐	0	溪口门票	2020-10-19 22:52:05.019685+08	0	0	\N	2020-10-19 22:52:05.019997+08	\N	\N	2	2020-10-17
2930	-27	饮食	0	o2	2020-10-19 22:52:28.91802+08	0	0	\N	2020-10-19 22:52:28.918356+08	\N	\N	2	2020-10-17
2931	-31	饮食	0	叮咚买菜	2020-10-19 22:52:55.138261+08	0	0	\N	2020-10-19 22:52:55.1386+08	\N	\N	2	2020-10-18
2932	-235	服饰美容	0	包	2020-10-19 22:53:17.883915+08	0	0	\N	2020-10-19 22:53:17.884235+08	\N	\N	2	2020-10-18
2933	-52	服饰美容	0	钱包	2020-10-19 22:53:43.999053+08	0	0	\N	2020-10-19 22:53:43.99937+08	\N	\N	2	2020-10-18
2934	-80	服饰美容	0	包	2020-10-19 22:54:05.733131+08	0	0	\N	2020-10-19 22:54:05.733455+08	\N	\N	2	2020-10-19
2935	-260	饮食	0	山姆卡	2020-10-19 22:55:31.197772+08	0	0	\N	2020-10-19 22:55:31.198086+08	\N	\N	2	2020-10-05
2936	-55	小孩玩具	0	玩具	2020-10-19 22:55:44.891724+08	0	0	\N	2020-10-19 22:55:44.892028+08	\N	\N	2	2020-10-05
2937	-52	饮食	0	7.5+5+25.8+12.8	2020-10-19 22:58:12.081842+08	0	0	\N	2020-10-19 22:58:12.08216+08	\N	\N	2	2020-10-13
2938	-12	饮食	0	西瓜	2020-10-19 22:58:55.757182+08	0	0	\N	2020-10-19 22:58:55.757511+08	\N	\N	2	2020-10-14
2939	-36	通讯物流	0	物流	2020-10-19 22:59:16.054966+08	0	0	\N	2020-10-19 22:59:16.055306+08	\N	\N	2	2020-10-16
2940	-50	饮食	0	肯德基	2020-10-19 22:59:31.039356+08	0	0	\N	2020-10-19 22:59:31.039675+08	\N	\N	2	2020-10-17
2941	-10	交通出行	0	停车费	2020-10-19 22:59:48.619216+08	0	0	\N	2020-10-19 22:59:48.619543+08	\N	\N	2	2020-10-17
2943	-206	服饰美容	0	蘑菇街还款	2020-10-19 23:02:09.279136+08	0	0	\N	2020-10-19 23:02:09.279448+08	\N	\N	2	2020-10-19
2944	-363	饮食	0	招行信用卡	2020-10-19 23:07:17.379878+08	0	0	\N	2020-10-19 23:07:17.380227+08	\N	\N	2	2020-10-19
2945	-6	饮食	0	早餐	2020-10-23 17:19:42.660483+08	0	0	\N	2020-10-23 17:19:42.662901+08	\N	\N	1	2020-10-13
2946	-87	饮食	0	美购	2020-10-23 17:20:01.333048+08	0	0	\N	2020-10-23 17:20:01.333372+08	\N	\N	1	2020-10-16
2947	-390	交通出行	0	溪口雪窦山门票X3	2020-10-23 17:21:31.101009+08	0	0	\N	2020-10-23 17:21:31.101337+08	\N	\N	1	2020-10-17
2948	-25	交通出行	0	雪窦山缆车儿童票	2020-10-23 17:22:00.695842+08	0	0	\N	2020-10-23 17:22:00.696163+08	\N	\N	1	2020-10-17
2949	-7	饮食	0	早餐	2020-10-23 17:22:13.820687+08	0	0	\N	2020-10-23 17:22:13.821065+08	\N	\N	1	2020-10-19
2950	-5	交通出行	0	停车费	2020-10-23 17:23:10.546867+08	0	0	\N	2020-10-23 17:23:10.547179+08	\N	\N	1	2020-10-12
2951	-40	小孩玩具	0	泡泡机	2020-10-23 17:23:34.057015+08	0	0	\N	2020-10-23 17:23:34.057332+08	\N	\N	1	2020-10-13
2952	-24	健康保险	0	皮肤药	2020-10-23 17:24:17.806295+08	0	0	\N	2020-10-23 17:24:17.806731+08	\N	\N	1	2020-10-14
2953	-7	饮食	0	早餐	2020-10-23 17:24:33.63505+08	0	0	\N	2020-10-23 17:24:33.635362+08	\N	\N	1	2020-10-21
2954	-7	饮食	0	早餐	2020-10-23 17:24:46.650174+08	0	0	\N	2020-10-23 17:24:46.650488+08	\N	\N	1	2020-10-23
2955	-29	生活日用	0	S20钢化膜	2020-10-23 17:25:11.669903+08	0	0	\N	2020-10-23 17:25:11.670215+08	\N	\N	1	2020-10-23
2956	-10	交通出行	0	停车费	2020-10-23 17:25:59.632427+08	0	0	\N	2020-10-23 17:25:59.632793+08	\N	\N	1	2020-10-17
2957	-15	饮食	0	牛肉面	2020-10-23 17:26:27.121134+08	0	0	\N	2020-10-23 17:26:27.121461+08	\N	\N	1	2020-10-18
2958	-5	饮食	0	零食	2020-10-23 17:26:37.359196+08	0	0	\N	2020-10-23 17:26:37.359539+08	\N	\N	1	2020-10-18
2959	-10	饮食	0	零食	2020-10-23 17:27:00.57025+08	0	0	\N	2020-10-23 17:27:00.570581+08	\N	\N	1	2020-10-18
2960	-50	饮食	0	零食	2020-10-23 17:27:22.72131+08	0	0	\N	2020-10-23 17:27:22.721634+08	\N	\N	1	2020-10-21
2961	-199	小孩生活用品	0	欧乐B D100kid	2020-10-23 17:28:42.311149+08	0	0	\N	2020-10-23 17:28:42.311572+08	\N	\N	1	2020-10-23
2962	-38	饮食	0	下应茶香香	2020-10-27 22:11:43.716795+08	0	0	\N	2020-10-27 22:11:43.719048+08	\N	\N	2	2020-10-20
2963	-6	饮食	0	早餐	2020-10-27 22:12:03.649488+08	0	0	\N	2020-10-27 22:12:03.649794+08	\N	\N	2	2020-10-21
2964	-19	生活日用	0	锅	2020-10-27 22:12:24.324062+08	0	0	\N	2020-10-27 22:12:24.324377+08	\N	\N	2	2020-10-21
2965	-5	饮食	0	早餐	2020-10-27 22:12:43.081023+08	0	0	\N	2020-10-27 22:12:43.081352+08	\N	\N	2	2020-10-22
2966	-8	生活日用	0	手机膜	2020-10-27 22:13:19.688646+08	0	0	\N	2020-10-27 22:13:19.689061+08	\N	\N	2	2020-10-22
2967	-328	生活日用	0	INtime卡	2020-10-27 22:13:45.962931+08	0	0	\N	2020-10-27 22:13:45.963256+08	\N	\N	2	2020-10-24
2968	-329	服饰美容	0	鞋子	2020-10-27 22:14:03.622623+08	0	0	\N	2020-10-27 22:14:03.622965+08	\N	\N	2	2020-10-24
2969	-11	生活日用	0	纸巾	2020-10-27 22:15:10.615958+08	0	0	\N	2020-10-27 22:15:10.616281+08	\N	\N	2	2020-10-25
2970	-11	生活日用	0	收纳盒	2020-10-27 22:15:33.562514+08	0	0	\N	2020-10-27 22:15:33.562857+08	\N	\N	2	2020-10-25
2971	-40	饮食	0	花茶	2020-10-27 22:15:59.536889+08	0	0	\N	2020-10-27 22:15:59.53734+08	\N	\N	2	2020-10-27
2972	-30	生活日用	0	拼多多月卡	2020-10-27 22:16:24.975324+08	0	0	\N	2020-10-27 22:16:24.975658+08	\N	\N	2	2020-10-27
2973	-11	生活日用	0	拼多多	2020-10-27 22:17:04.06678+08	0	0	\N	2020-10-27 22:17:04.067108+08	\N	\N	2	2020-10-27
2974	-32	饮食	0	葡萄	2020-10-27 22:18:46.700028+08	0	0	\N	2020-10-27 22:18:46.700342+08	\N	\N	2	2020-10-21
2975	-70	通讯物流	0	话费	2020-10-27 22:20:14.918183+08	0	0	\N	2020-10-27 22:20:14.918504+08	\N	\N	2	2020-10-05
2976	-50	饮食	0	奶茶	2020-10-27 22:20:45.264594+08	0	0	\N	2020-10-27 22:20:45.264921+08	\N	\N	2	2020-10-23
2977	-100	交通出行	0	加油	2020-10-27 22:20:57.277515+08	0	0	\N	2020-10-27 22:20:57.277904+08	\N	\N	2	2020-10-23
2978	-545	生活日用	0	山姆	2020-10-27 22:21:17.378347+08	0	0	\N	2020-10-27 22:21:17.378651+08	\N	\N	2	2020-10-25
2979	2900	收入	1	工资	2020-10-27 22:22:19.258262+08	0	0	\N	2020-10-27 22:22:19.258578+08	\N	\N	2	2020-10-23
2980	-29	生活日用	0	手机膜	2020-11-02 11:22:56.915935+08	0	0	\N	2020-11-02 11:22:56.918276+08	\N	\N	1	2020-10-23
2981	-42	饮食	0	美购	2020-11-02 11:23:18.144626+08	0	0	\N	2020-11-02 11:23:18.144942+08	\N	\N	1	2020-10-23
2982	-100	通讯物流	0	手机充值	2020-11-02 11:23:43.857478+08	0	0	\N	2020-11-02 11:23:43.857907+08	\N	\N	1	2020-10-24
2983	-100	生活日用	0	信用卡	2020-11-02 11:24:17.256708+08	0	0	\N	2020-11-02 11:24:17.257081+08	\N	\N	1	2020-10-25
2984	-27	生活日用	0	信用卡	2020-11-02 11:24:35.224767+08	0	0	\N	2020-11-02 11:24:35.225139+08	\N	\N	1	2020-10-27
2985	-6	饮食	0	早餐	2020-11-02 11:24:59.134276+08	0	0	\N	2020-11-02 11:24:59.134575+08	\N	\N	1	2020-10-27
2986	-7	饮食	0	早餐	2020-11-02 11:25:24.294705+08	0	0	\N	2020-11-02 11:25:24.295035+08	\N	\N	1	2020-10-29
2987	-5	交通出行	0	停车费	2020-11-02 11:25:40.578863+08	0	0	\N	2020-11-02 11:25:40.579179+08	\N	\N	1	2020-10-31
2988	-20	饮食	0	零食	2020-11-02 11:26:16.374713+08	0	0	\N	2020-11-02 11:26:16.375033+08	\N	\N	1	2020-11-01
2989	-99	宠物	0	宠物用品	2020-11-02 11:26:38.625692+08	0	0	\N	2020-11-02 11:26:38.626002+08	\N	\N	1	2020-11-02
2990	-20	饮食	0	零食	2020-11-02 11:27:19.710457+08	0	0	\N	2020-11-02 11:27:19.710809+08	\N	\N	1	2020-10-24
2991	-20	饮食	0	山姆牛肉卷	2020-11-02 11:27:48.025779+08	0	0	\N	2020-11-02 11:27:48.026098+08	\N	\N	1	2020-10-25
2992	-10	饮食	0	橘子	2020-11-02 11:28:21.865308+08	0	0	\N	2020-11-02 11:28:21.865617+08	\N	\N	1	2020-10-31
2994	15150	收入	1	十月工资	2020-11-03 09:18:22.641055+08	0	0	\N	2020-11-03 09:18:22.641375+08	\N	\N	1	2020-10-15
2995	14875	收入	1	二月工资	2020-11-03 09:19:50.458067+08	0	0	\N	2020-11-03 09:20:50.122062+08	\N	\N	1	2020-02-14
2993	14152	收入	1	九月工资	2020-11-03 09:18:00.309997+08	0	0	\N	2020-11-03 09:21:49.053746+08	\N	\N	1	2020-09-15
2996	-15	生活日用	0	桌子	2020-11-06 07:00:20.706466+08	0	0	\N	2020-11-06 07:00:20.708928+08	\N	\N	2	2020-10-27
2997	-3	生活日用	0	垃圾袋	2020-11-06 07:01:01.985856+08	0	0	\N	2020-11-06 07:01:01.986199+08	\N	\N	2	2020-10-27
2998	-6	饮食	0	早餐	2020-11-06 07:01:26.705075+08	0	0	\N	2020-11-06 07:01:26.705423+08	\N	\N	2	2020-10-28
2999	-15	小孩玩具	0	垃圾桶	2020-11-06 07:02:09.341008+08	0	0	\N	2020-11-06 07:02:09.341354+08	\N	\N	2	2020-10-28
3001	-313	服饰美容	0	衣服	2020-11-06 07:03:36.554732+08	0	0	\N	2020-11-06 07:03:36.555051+08	\N	\N	2	2020-10-31
3002	-40	小孩玩具	0	玩具	2020-11-06 07:03:53.535654+08	0	0	\N	2020-11-06 07:03:53.535978+08	\N	\N	2	2020-10-31
3003	-363	服饰美容	0	衣服	2020-11-06 07:04:27.134515+08	0	0	\N	2020-11-06 07:04:27.134827+08	\N	\N	2	2020-11-01
3004	-37	住房缴费	0	景湖水分	2020-11-06 07:05:03.469854+08	0	0	\N	2020-11-06 07:05:03.470158+08	\N	\N	2	2020-11-02
3005	-5	生活日用	0	戒尺	2020-11-06 07:05:29.504769+08	0	0	\N	2020-11-06 07:05:29.505111+08	\N	\N	2	2020-11-02
3006	-40	生活日用	0	拼多多	2020-11-06 07:06:42.265643+08	0	0	\N	2020-11-06 07:06:42.265989+08	\N	\N	2	2020-11-03
3007	-43	服饰美容	0	碎花裙	2020-11-06 07:07:27.79563+08	0	0	\N	2020-11-06 07:07:27.795958+08	\N	\N	2	2020-11-03
3008	-76	服饰美容	0	毛衣马甲	2020-11-06 07:08:04.039538+08	0	0	\N	2020-11-06 07:08:04.039854+08	\N	\N	2	2020-11-03
3009	-33	服饰美容	0	T恤	2020-11-06 07:08:33.430269+08	0	0	\N	2020-11-06 07:08:33.430613+08	\N	\N	2	2020-11-03
3010	-15	服饰美容	0	袜子	2020-11-06 07:09:01.235564+08	0	0	\N	2020-11-06 07:09:01.235871+08	\N	\N	2	2020-11-03
3011	-13	小孩生活用品	0	吸管	2020-11-06 07:09:33.915088+08	0	0	\N	2020-11-06 07:09:33.915442+08	\N	\N	2	2020-11-03
3012	-39	服饰美容	0	卫衣	2020-11-06 07:10:17.67037+08	0	0	\N	2020-11-06 07:10:17.670691+08	\N	\N	2	2020-11-03
3013	-134	饮食	0	酸奶	2020-11-06 07:10:46.10509+08	0	0	\N	2020-11-06 07:10:46.105398+08	\N	\N	2	2020-11-04
3014	-131	小孩健康	0	感冒	2020-11-06 07:11:49.229537+08	0	0	\N	2020-11-06 07:11:49.229865+08	\N	\N	2	2020-11-04
3015	-49	饮食	0	美购	2020-11-06 07:12:18.351172+08	0	0	\N	2020-11-06 07:12:18.351487+08	\N	\N	2	2020-11-04
3016	-53	住房缴费	0	东兴电费	2020-11-06 07:12:50.390505+08	0	0	\N	2020-11-06 07:12:50.39083+08	\N	\N	2	2020-11-04
3017	-49	住房缴费	0	景湖电费	2020-11-06 07:13:11.994913+08	0	0	\N	2020-11-06 07:13:11.995212+08	\N	\N	2	2020-11-04
3018	-6	饮食	0	早点	2020-11-06 07:13:36.735933+08	0	0	\N	2020-11-06 07:13:36.736274+08	\N	\N	2	2020-11-05
3019	-33	饮食	0	葡萄	2020-11-06 07:14:44.804654+08	0	0	\N	2020-11-06 07:14:44.805016+08	\N	\N	2	2020-10-29
3020	-19	饮食	0	西瓜	2020-11-06 07:14:58.490888+08	0	0	\N	2020-11-06 07:14:58.491198+08	\N	\N	2	2020-11-04
3021	-80	饮食	0	米	2020-11-06 07:16:13.230679+08	0	0	\N	2020-11-06 07:16:13.230999+08	\N	\N	2	2020-11-01
3022	-78	饮食	0	油	2020-11-06 07:16:41.879495+08	0	0	\N	2020-11-06 07:16:41.879819+08	\N	\N	2	2020-11-01
3023	-50	小孩健康	0	喷鼻水	2020-11-06 07:17:12.754297+08	0	0	\N	2020-11-06 07:17:12.754657+08	\N	\N	2	2020-11-05
3024	15150	收入	1	工资	2020-11-13 11:20:54.219303+08	0	0	\N	2020-11-13 11:20:54.221629+08	\N	\N	1	2020-11-13
3025	-24	健康保险	0	咳嗽药水	2020-11-13 11:22:11.009811+08	0	0	\N	2020-11-13 11:22:11.010133+08	\N	\N	1	2020-11-02
3026	-9	饮食	0	早餐	2020-11-13 11:22:30.040592+08	0	0	\N	2020-11-13 11:22:30.040891+08	\N	\N	1	2020-11-02
3027	-4	饮食	0	大饼油条	2020-11-13 11:22:54.688709+08	0	0	\N	2020-11-13 11:22:54.689083+08	\N	\N	1	2020-11-05
3028	-10	饮食	0	零食	2020-11-13 11:23:24.429471+08	0	0	\N	2020-11-13 11:23:24.429785+08	\N	\N	1	2020-11-05
3029	-7	饮食	0	早餐	2020-11-13 11:23:37.419914+08	0	0	\N	2020-11-13 11:23:37.420226+08	\N	\N	1	2020-11-06
3030	-26	小孩零食	0	老婆大人	2020-11-13 11:23:59.685673+08	0	0	\N	2020-11-13 11:23:59.685992+08	\N	\N	1	2020-11-07
3031	-30	交通出行	0	补胎	2020-11-13 11:24:26.84208+08	0	0	\N	2020-11-13 11:24:26.842399+08	\N	\N	1	2020-11-08
3032	-130	宠物	0	兔粮	2020-11-13 11:24:56.416719+08	0	0	\N	2020-11-13 11:24:56.417062+08	\N	\N	1	2020-11-09
3033	-10	交通出行	0	快洗	2020-11-13 11:25:23.035674+08	0	0	\N	2020-11-13 11:25:23.036035+08	\N	\N	1	2020-11-10
3034	-12	通讯物流	0	话费	2020-11-13 11:26:29.60652+08	0	0	\N	2020-11-13 11:26:29.60685+08	\N	\N	1	2020-11-10
3035	-8	饮食	0	早餐	2020-11-13 11:26:45.048371+08	0	0	\N	2020-11-13 11:26:45.048685+08	\N	\N	1	2020-11-12
3036	-10	交通出行	0	快洗	2020-11-13 11:27:03.971832+08	0	0	\N	2020-11-13 11:27:03.97213+08	\N	\N	1	2020-11-12
3037	-200	交通出行	0	加油	2020-11-13 11:27:18.938702+08	0	0	\N	2020-11-13 11:27:18.939026+08	\N	\N	1	2020-11-12
3038	-49	生活日用	0	信用卡	2020-11-13 11:29:23.760608+08	0	0	\N	2020-11-13 11:29:23.761007+08	\N	\N	1	2020-11-13
3039	-168	服饰美容	0	眼影	2020-11-15 23:44:21.184338+08	0	0	\N	2020-11-15 23:44:21.186842+08	\N	\N	2	2020-11-11
3040	-69	小孩生活用品	0	湿巾	2020-11-15 23:44:38.442508+08	0	0	\N	2020-11-15 23:44:38.442828+08	\N	\N	2	2020-11-11
3041	-92	住房缴费	0	东兴水费	2020-11-15 23:45:04.664041+08	0	0	\N	2020-11-15 23:45:04.664367+08	\N	\N	2	2020-11-11
3042	-384	服饰美容	0	gap衣服	2020-11-15 23:45:21.827696+08	0	0	\N	2020-11-15 23:45:21.828006+08	\N	\N	2	2020-11-11
3043	-128	生活日用	0	清风卷纸	2020-11-15 23:56:36.259372+08	0	0	\N	2020-11-15 23:56:36.259746+08	\N	\N	2	2020-11-11
3044	-54	生活日用	0	卷纸	2020-11-15 23:56:55.196998+08	0	0	\N	2020-11-15 23:56:55.197317+08	\N	\N	2	2020-11-11
3045	-15	交通出行	0	停车费	2020-11-15 23:57:57.364832+08	0	0	\N	2020-11-15 23:57:57.365203+08	\N	\N	2	2020-11-14
3046	-34	服饰美容	0	眼线笔睫毛夹	2020-11-15 23:58:58.730409+08	0	0	\N	2020-11-15 23:58:58.730708+08	\N	\N	2	2020-11-15
3047	-60	服饰美容	0	高光	2020-11-15 23:59:35.806297+08	0	0	\N	2020-11-15 23:59:35.806628+08	\N	\N	2	2020-11-15
3048	-65	服饰美容	0	睫毛膏	2020-11-15 23:59:47.459247+08	0	0	\N	2020-11-15 23:59:47.459601+08	\N	\N	2	2020-11-15
3049	-30	服饰美容	0	腮红	2020-11-15 23:59:58.776203+08	0	0	\N	2020-11-15 23:59:58.776495+08	\N	\N	2	2020-11-15
3050	-54	服饰美容	0	卸妆水	2020-11-16 00:00:18.604251+08	0	0	\N	2020-11-16 00:00:18.604565+08	\N	\N	2	2020-11-15
3051	-208	服饰美容	0	鞋子	2020-11-16 00:00:32.31814+08	0	0	\N	2020-11-16 00:00:32.318443+08	\N	\N	2	2020-11-15
3052	-300	饮食	0	大米	2020-11-16 00:02:20.66215+08	0	0	\N	2020-11-16 00:02:20.662449+08	\N	\N	2	2020-11-10
3053	-120	文教娱乐	0	达人谷	2020-11-16 00:02:51.469353+08	0	0	\N	2020-11-16 00:02:51.46969+08	\N	\N	2	2020-11-13
3054	-2500	交通出行	0	加油卡	2020-11-16 00:11:56.326758+08	0	0	\N	2020-11-16 00:11:56.327076+08	\N	\N	2	2020-11-13
3055	-12	生活日用	0	口罩	2020-11-28 16:22:38.918757+08	0	0	\N	2020-11-28 16:22:38.921148+08	\N	\N	2	2020-11-16
3056	-8	饮食	0	早餐	2020-11-28 16:23:19.522098+08	0	0	\N	2020-11-28 16:23:19.522407+08	\N	\N	2	2020-11-17
3057	-72	服饰美容	0	护手霜	2020-11-28 16:23:45.96815+08	0	0	\N	2020-11-28 16:23:45.968453+08	\N	\N	2	2020-11-19
3058	-38	服饰美容	0	袜子	2020-11-28 16:24:05.704813+08	0	0	\N	2020-11-28 16:24:05.705156+08	\N	\N	2	2020-11-20
3059	-24	小孩服饰	0	内裤	2020-11-28 16:24:21.590021+08	0	0	\N	2020-11-28 16:24:21.59035+08	\N	\N	2	2020-11-20
3060	-66	服饰美容	0	打底衫	2020-11-28 16:25:24.751831+08	0	0	\N	2020-11-28 16:25:24.752247+08	\N	\N	2	2020-11-20
3061	-42	饮食	0	小吃	2020-11-28 16:25:55.49845+08	0	0	\N	2020-11-28 16:25:55.498785+08	\N	\N	2	2020-11-21
3062	-128	服饰美容	0	urbars	2020-11-28 16:26:25.083098+08	0	0	\N	2020-11-28 16:26:25.083401+08	\N	\N	2	2020-11-22
3063	-36	健康保险	0	止疼药	2020-11-28 16:26:46.995426+08	0	0	\N	2020-11-28 16:26:46.995747+08	\N	\N	2	2020-11-22
3064	-39	生活日用	0	口罩	2020-11-28 16:27:09.236353+08	0	0	\N	2020-11-28 16:27:09.236661+08	\N	\N	2	2020-11-24
3065	-200	饮食	0	奶茶	2020-11-28 16:27:29.246605+08	0	0	\N	2020-11-28 16:27:29.24695+08	\N	\N	2	2020-11-25
3066	-79	饮食	0	阿七牛肉	2020-11-28 16:28:04.354766+08	0	0	\N	2020-11-28 16:28:04.35509+08	\N	\N	2	2020-11-27
3067	-24	饮食	0	rio酒	2020-11-28 16:28:38.970123+08	0	0	\N	2020-11-28 16:28:38.970426+08	\N	\N	2	2020-11-27
3068	-18	生活日用	0	快递	2020-11-28 16:29:24.002047+08	0	0	\N	2020-11-28 16:29:24.002351+08	\N	\N	2	2020-11-16
3069	-48	饮食	0	菠萝蜜	2020-11-28 16:29:42.821575+08	0	0	\N	2020-11-28 16:29:42.821892+08	\N	\N	2	2020-11-16
3070	-205	宠物	0	兔粮	2020-11-28 16:31:49.429237+08	0	0	\N	2020-11-28 16:31:49.429586+08	\N	\N	1	2020-11-13
3071	2934	收入	1	工资	2020-11-28 16:32:07.855026+08	0	0	\N	2020-11-28 16:32:07.855344+08	\N	\N	2	2020-11-24
3072	-18	饮食	0	达人谷食物	2020-11-28 16:32:26.859559+08	0	0	\N	2020-11-28 16:32:26.859849+08	\N	\N	1	2020-11-14
3073	-10	交通出行	0	停车费	2020-11-28 16:32:48.85825+08	0	0	\N	2020-11-28 16:32:48.858586+08	\N	\N	1	2020-11-14
3074	50965	收入	1	提成	2020-11-28 16:32:58.533154+08	0	0	\N	2020-11-28 16:32:58.533474+08	\N	\N	2	2020-11-24
3076	-106	交通出行	0	达人谷漂流	2020-11-28 16:33:30.636499+08	0	0	\N	2020-11-28 16:33:30.636816+08	\N	\N	1	2020-11-14
3077	-4	饮食	0	早餐	2020-11-28 16:33:47.267829+08	0	0	\N	2020-11-28 16:33:47.268166+08	\N	\N	1	2020-11-17
3078	-10	通讯物流	0	话费	2020-11-28 16:34:05.27251+08	0	0	\N	2020-11-28 16:34:05.272839+08	\N	\N	1	2020-11-18
3079	-4	饮食	0	早餐	2020-11-28 16:34:21.579157+08	0	0	\N	2020-11-28 16:34:21.579488+08	\N	\N	1	2020-11-19
3080	-5	饮食	0	早餐	2020-11-28 16:34:34.940574+08	0	0	\N	2020-11-28 16:34:34.94088+08	\N	\N	1	2020-11-15
3081	-807	饮食	0	京东	2020-11-28 16:34:45.629103+08	0	0	\N	2020-11-28 16:34:45.629433+08	\N	\N	2	2020-11-28
3082	-100	饮食	0	老婆大人	2020-11-28 16:35:03.406504+08	0	0	\N	2020-11-28 16:35:03.406835+08	\N	\N	1	2020-11-20
3083	-20	饮食	0	超市	2020-11-28 16:35:19.346622+08	0	0	\N	2020-11-28 16:35:19.346921+08	\N	\N	1	2020-11-20
3084	-5	饮食	0	年糕干	2020-11-28 16:35:53.345881+08	0	0	\N	2020-11-28 16:35:53.346221+08	\N	\N	1	2020-11-20
3085	-30	饮食	0	零食	2020-11-28 16:36:34.499809+08	0	0	\N	2020-11-28 16:36:34.500149+08	\N	\N	1	2020-11-21
3086	-15	生活日用	0	康乃馨	2020-11-28 16:36:57.614794+08	0	0	\N	2020-11-28 16:36:57.615134+08	\N	\N	1	2020-11-22
3087	-30	小孩玩具	0	泥人X2	2020-11-28 16:37:21.099393+08	0	0	\N	2020-11-28 16:37:21.099746+08	\N	\N	1	2020-11-22
3088	-4	饮食	0	早餐	2020-11-28 16:37:36.093186+08	0	0	\N	2020-11-28 16:37:36.093511+08	\N	\N	1	2020-11-25
3089	-100	通讯物流	0	话费	2020-11-28 16:37:53.739298+08	0	0	\N	2020-11-28 16:37:53.739601+08	\N	\N	1	2020-11-26
3090	-20	饮食	0	零食	2020-11-28 16:38:39.598514+08	0	0	\N	2020-11-28 16:38:39.598846+08	\N	\N	1	2020-11-14
3091	-60	文教娱乐	0	飞船体验	2020-11-30 18:56:16.834511+08	0	0	\N	2020-11-30 18:56:16.836808+08	\N	\N	2	2020-11-29
3093	-311	饮食	0	日料	2020-11-30 18:56:56.701902+08	0	0	\N	2020-11-30 18:56:56.702203+08	\N	\N	2	2020-11-29
3094	-896	服饰美容	0	优衣库	2020-11-30 18:57:13.761436+08	0	0	\N	2020-11-30 18:57:13.761763+08	\N	\N	2	2020-11-29
3095	-167	小孩服饰	0	毛衣	2020-11-30 18:57:34.399365+08	0	0	\N	2020-11-30 18:57:34.399672+08	\N	\N	2	2020-11-29
3096	-768	饮食	0	山姆	2020-11-30 18:57:49.317882+08	0	0	\N	2020-11-30 18:57:49.318194+08	\N	\N	2	2020-11-29
3097	-5	交通出行	0	停车费	2020-11-30 18:58:15.126133+08	0	0	\N	2020-11-30 18:58:15.126452+08	\N	\N	2	2020-11-29
3098	-4	生活日用	0	笑脸	2020-11-30 18:58:33.742392+08	0	0	\N	2020-11-30 18:58:33.742712+08	\N	\N	2	2020-11-30
3099	-7	生活日用	0	美工刀	2020-11-30 18:58:49.496991+08	0	0	\N	2020-11-30 18:58:49.497307+08	\N	\N	2	2020-11-30
3100	-20	小孩零食	0	奶酪	2020-11-30 18:59:29.543487+08	0	0	\N	2020-11-30 18:59:29.543829+08	\N	\N	2	2020-11-29
3101	-10	交通出行	0	停车费	2020-11-30 18:59:42.689095+08	0	0	\N	2020-11-30 18:59:42.689408+08	\N	\N	2	2020-11-29
3102	-40	饮食	0	山姆	2020-11-30 18:59:55.696427+08	0	0	\N	2020-11-30 18:59:55.696756+08	\N	\N	2	2020-11-29
3103	-326	小孩健康	0	流感疫苗	2020-12-05 19:42:15.85447+08	0	0	\N	2020-12-05 19:42:15.856824+08	\N	\N	2	2020-12-01
3104	-21	小孩玩具	0	义乌商品市场	2020-12-05 19:42:31.724365+08	0	0	\N	2020-12-05 19:42:31.724679+08	\N	\N	2	2020-12-01
3105	-56	住房缴费	0	东兴电费	2020-12-05 19:42:57.801808+08	0	0	\N	2020-12-05 19:42:57.802116+08	\N	\N	2	2020-12-02
3106	-50	住房缴费	0	景湖电费	2020-12-05 19:43:15.766173+08	0	0	\N	2020-12-05 19:43:15.766499+08	\N	\N	2	2020-12-02
3108	-21	小孩健康	0	挂号妇儿医院	2020-12-05 19:44:20.973269+08	0	0	\N	2020-12-05 19:44:20.973591+08	\N	\N	2	2020-12-03
3109	-47	小孩健康	0	药费	2020-12-05 19:44:40.276235+08	0	0	\N	2020-12-05 19:44:40.276609+08	\N	\N	2	2020-12-03
3110	-55	饮食	0	汉堡王	2020-12-05 19:45:03.956181+08	0	0	\N	2020-12-05 19:45:03.956491+08	\N	\N	2	2020-12-03
3111	-150	服饰美容	0	打底裤	2020-12-05 19:45:22.544186+08	0	0	\N	2020-12-05 19:45:22.544535+08	\N	\N	2	2020-12-04
3112	-260	服饰美容	0	烫发	2020-12-05 19:45:36.678272+08	0	0	\N	2020-12-05 19:45:36.678592+08	\N	\N	2	2020-12-04
3113	-237	饮食	0	宁波味道	2020-12-05 19:45:54.544189+08	0	0	\N	2020-12-05 19:45:54.544488+08	\N	\N	2	2020-12-05
3114	-222	饮食	0	山姆	2020-12-05 19:46:09.802474+08	0	0	\N	2020-12-05 19:46:09.802791+08	\N	\N	2	2020-12-05
3115	-8	饮食	0	果汁	2020-12-05 19:47:07.285942+08	0	0	\N	2020-12-05 19:47:07.286257+08	\N	\N	2	2020-12-03
3116	-30	文教娱乐	0	水上乐园门票	2020-12-05 19:47:35.313262+08	0	0	\N	2020-12-05 19:47:35.313583+08	\N	\N	2	2020-12-03
3117	-428	服饰美容	0	衣服	2020-12-05 19:47:48.545296+08	0	0	\N	2020-12-05 19:47:48.545652+08	\N	\N	2	2020-12-04
3118	-90	饮食	0	山姆	2020-12-05 19:47:59.822357+08	0	0	\N	2020-12-05 19:47:59.822667+08	\N	\N	2	2020-12-05
3119	-2	生活日用	0	纸巾	2020-12-07 14:18:27.100241+08	0	0	\N	2020-12-07 14:18:27.103697+08	\N	\N	1	2020-11-29
3120	-3	通讯物流	0	流量	2020-12-07 14:18:55.209191+08	0	0	\N	2020-12-07 14:18:55.209513+08	\N	\N	1	2020-11-30
3121	-100	通讯物流	0	话费	2020-12-07 14:19:12.049211+08	0	0	\N	2020-12-07 14:19:12.049529+08	\N	\N	1	2020-12-03
3122	-5	交通出行	0	停车费	2020-12-07 14:19:26.609623+08	0	0	\N	2020-12-07 14:19:26.609914+08	\N	\N	1	2020-12-05
3123	-34	宠物	0	提摩西草	2020-12-07 14:19:53.300265+08	0	0	\N	2020-12-07 14:19:53.300683+08	\N	\N	1	2020-12-06
3124	-15	饮食	0	冰淇淋	2020-12-07 14:20:08.570908+08	0	0	\N	2020-12-07 14:20:08.571302+08	\N	\N	1	2020-12-06
3125	-49	生活日用	0	信用卡	2020-12-07 14:20:24.443621+08	0	0	\N	2020-12-07 14:20:24.443924+08	\N	\N	1	2020-12-07
3126	-19	饮食	0	汉堡王	2020-12-07 14:21:04.179851+08	0	0	\N	2020-12-07 14:21:04.180167+08	\N	\N	1	2020-11-29
3127	15150	收入	1	工资	2020-12-14 17:37:35.061051+08	0	0	\N	2020-12-14 17:37:35.063412+08	\N	\N	1	2020-12-14
3128	-100	通讯物流	0	话费	2020-12-14 17:38:07.574281+08	0	0	\N	2020-12-14 17:38:07.574583+08	\N	\N	1	2020-12-12
3129	-499	服饰美容	0	polo羽绒服	2020-12-14 17:38:33.39378+08	0	0	\N	2020-12-14 17:38:33.394092+08	\N	\N	1	2020-12-12
3518	-10	饮食	0	肯德基	2021-04-08 12:14:13.455273+08	0	0	\N	2021-04-08 12:14:13.45556+08	\N	\N	2	2021-04-03
3130	-26	小孩零食	0	三只松鼠草莓干x2	2020-12-14 17:39:14.825425+08	0	0	\N	2020-12-14 17:39:14.825861+08	\N	\N	1	2020-12-12
3131	-38	饮食	0	羊肉汤	2020-12-14 17:39:44.366391+08	0	0	\N	2020-12-14 17:39:44.36678+08	\N	\N	1	2020-12-12
3132	-18	饮食	0	甘蔗	2020-12-14 17:40:00.605253+08	0	0	\N	2020-12-14 17:40:00.605559+08	\N	\N	1	2020-12-13
3133	-588	服饰美容	0	优衣库	2020-12-14 17:41:15.604372+08	0	0	\N	2020-12-14 17:41:15.604711+08	\N	\N	1	2020-12-12
3134	-14370	健康保险	0	长生人寿	2020-12-20 17:50:24.702038+08	0	0	\N	2020-12-20 17:50:24.704261+08	\N	\N	1	2020-12-15
3135	-30	饮食	0	百变小串	2020-12-30 14:02:44.756719+08	0	0	\N	2020-12-30 14:02:44.759128+08	\N	\N	2	2020-12-06
3136	-50	饮食	0	小吃20＋20＋10	2020-12-30 14:03:19.90427+08	0	0	\N	2020-12-30 14:03:19.904615+08	\N	\N	2	2020-12-06
3137	-19	生活日用	0	张小泉的剪刀	2020-12-30 14:03:58.692051+08	0	0	\N	2020-12-30 14:03:58.692364+08	\N	\N	2	2020-12-06
3138	-156	小孩服饰	0	睡衣	2020-12-30 14:04:24.203594+08	0	0	\N	2020-12-30 14:04:24.203907+08	\N	\N	2	2020-12-07
3139	-23	生活日用	0	美购	2020-12-30 14:04:50.112628+08	0	0	\N	2020-12-30 14:04:50.112951+08	\N	\N	2	2020-12-08
3140	-4	饮食	0	水果	2020-12-30 14:05:06.724804+08	0	0	\N	2020-12-30 14:05:06.725161+08	\N	\N	2	2020-12-08
3141	-21	饮食	0	食其家	2020-12-30 14:05:38.536434+08	0	0	\N	2020-12-30 14:05:38.536762+08	\N	\N	2	2020-12-09
3142	-160	生活日用	0	四件套	2020-12-30 14:05:57.693765+08	0	0	\N	2020-12-30 14:05:57.694059+08	\N	\N	2	2020-12-10
3143	-12	生活日用	0	发箍	2020-12-30 14:06:16.690899+08	0	0	\N	2020-12-30 14:06:16.691215+08	\N	\N	2	2020-12-10
3144	-124	生活日用	0	四件套	2020-12-30 14:06:35.685985+08	0	0	\N	2020-12-30 14:06:35.686296+08	\N	\N	2	2020-12-10
3145	-56	服饰美容	0	精油	2020-12-30 14:07:00.833846+08	0	0	\N	2020-12-30 14:07:00.834172+08	\N	\N	2	2020-12-10
3146	-60	饮食	0	云石林	2020-12-30 14:07:22.642625+08	0	0	\N	2020-12-30 14:07:22.642944+08	\N	\N	2	2020-12-12
3147	-19	饮食	0	o2	2020-12-30 14:07:39.041683+08	0	0	\N	2020-12-30 14:07:39.042031+08	\N	\N	2	2020-12-12
3148	-230	小孩服饰	0	鞋	2020-12-30 14:08:06.526862+08	0	0	\N	2020-12-30 14:08:06.527176+08	\N	\N	2	2020-12-12
3149	-100	饮食	0	老婆大人	2020-12-30 14:08:17.316052+08	0	0	\N	2020-12-30 14:08:17.316362+08	\N	\N	2	2020-12-12
3150	-798	服饰美容	0	优衣库	2020-12-30 14:08:39.795438+08	0	0	\N	2020-12-30 14:08:39.795777+08	\N	\N	2	2020-12-12
3151	-89	服饰美容	0	光腿神器	2020-12-30 14:09:05.732252+08	0	0	\N	2020-12-30 14:09:05.732575+08	\N	\N	2	2020-12-13
3152	-100	生活日用	0	沙发套	2020-12-30 14:09:24.492946+08	0	0	\N	2020-12-30 14:09:24.493332+08	\N	\N	2	2020-12-15
3153	-63	交通出行	0	中石化充值	2020-12-30 14:10:03.010503+08	0	0	\N	2020-12-30 14:10:03.011081+08	\N	\N	2	2020-12-18
3154	-118	饮食	0	吸吸	2020-12-30 14:10:25.123043+08	0	0	\N	2020-12-30 14:10:25.123378+08	\N	\N	2	2020-12-18
3155	-4	饮食	0	早餐	2020-12-30 14:10:49.582488+08	0	0	\N	2020-12-30 14:10:49.582805+08	\N	\N	2	2020-12-19
3156	-13	饮食	0	饮食	2020-12-30 14:11:06.772705+08	0	0	\N	2020-12-30 14:11:06.773057+08	\N	\N	2	2020-12-19
3157	-26	饮食	0	水果	2020-12-30 14:11:40.175932+08	0	0	\N	2020-12-30 14:11:40.176292+08	\N	\N	2	2020-12-20
3158	-164	服饰美容	0	衣服	2020-12-30 14:11:57.237871+08	0	0	\N	2020-12-30 14:11:57.238214+08	\N	\N	2	2020-12-20
3159	-89	服饰美容	0	毛呢裤子	2020-12-30 14:12:19.038099+08	0	0	\N	2020-12-30 14:12:19.038454+08	\N	\N	2	2020-12-22
3160	-25	通讯物流	0	话费充值	2020-12-30 14:12:49.114128+08	0	0	\N	2020-12-30 14:12:49.114447+08	\N	\N	2	2020-12-23
3161	-5	生活日用	0	刷子手套	2020-12-30 14:13:23.565062+08	0	0	\N	2020-12-30 14:13:23.56538+08	\N	\N	2	2020-12-23
3162	-16	生活日用	0	羽绒服干洗剂	2020-12-30 14:13:42.304484+08	0	0	\N	2020-12-30 14:13:42.304809+08	\N	\N	2	2020-12-24
3163	-22	饮食	0	三江购物	2020-12-30 14:14:04.913491+08	0	0	\N	2020-12-30 14:14:04.913821+08	\N	\N	2	2020-12-25
3164	-14	交通出行	0	地铁到慈城来往	2020-12-30 14:14:37.619383+08	0	0	\N	2020-12-30 14:14:37.619715+08	\N	\N	2	2020-12-26
3165	-8	交通出行	0	地铁鼓楼	2020-12-30 14:15:04.23283+08	0	0	\N	2020-12-30 14:15:04.233189+08	\N	\N	2	2020-12-27
3166	-16	饮食	0	o2	2020-12-30 14:15:17.380169+08	0	0	\N	2020-12-30 14:15:17.380496+08	\N	\N	2	2020-12-27
3167	-60	生活日用	0	名创	2020-12-30 14:15:34.070727+08	0	0	\N	2020-12-30 14:15:34.071033+08	\N	\N	2	2020-12-27
3168	-20	饮食	0	矮子馅饼	2020-12-30 14:15:47.874712+08	0	0	\N	2020-12-30 14:15:47.875008+08	\N	\N	2	2020-12-27
3169	-23	饮食	0	奶奶美食	2020-12-30 14:16:06.854245+08	0	0	\N	2020-12-30 14:16:06.854595+08	\N	\N	2	2020-12-27
3170	-6	生活日用	0	义乌	2020-12-30 14:16:21.460778+08	0	0	\N	2020-12-30 14:16:21.461136+08	\N	\N	2	2020-12-29
3171	-74	服饰美容	0	粉底	2020-12-30 14:16:52.195349+08	0	0	\N	2020-12-30 14:16:52.195656+08	\N	\N	2	2020-12-30
3172	-150	人情往来	0	开业送礼	2020-12-30 14:18:04.137004+08	0	0	\N	2020-12-30 14:18:04.137332+08	\N	\N	2	2020-12-11
3173	-40	文教娱乐	0	四季荟	2020-12-30 14:18:17.838342+08	0	0	\N	2020-12-30 14:18:17.838687+08	\N	\N	2	2020-12-11
3174	-20	交通出行	0	万达	2020-12-30 14:18:36.678079+08	0	0	\N	2020-12-30 14:18:36.678391+08	\N	\N	2	2020-12-12
3175	-37	饮食	0	美购	2020-12-30 14:18:51.695529+08	0	0	\N	2020-12-30 14:18:51.695869+08	\N	\N	2	2020-12-15
3176	-19	饮食	0	水果	2020-12-30 14:19:05.930354+08	0	0	\N	2020-12-30 14:19:05.930671+08	\N	\N	2	2020-12-15
3177	-18	饮食	0	草莓	2020-12-30 14:19:21.975281+08	0	0	\N	2020-12-30 14:19:21.97564+08	\N	\N	2	2020-12-16
3178	-11	饮食	0	coco奶茶	2020-12-30 14:20:04.216887+08	0	0	\N	2020-12-30 14:20:04.21728+08	\N	\N	2	2020-12-25
3179	-9	饮食	0	馄饨	2020-12-30 14:20:25.293221+08	0	0	\N	2020-12-30 14:20:25.293528+08	\N	\N	2	2020-12-27
3180	2900	收入	1	11月工资	2020-12-30 14:21:12.04344+08	0	0	\N	2020-12-30 14:21:12.04376+08	\N	\N	2	2020-12-24
3181	-17	住房缴费	0	景湖水费	2021-01-10 20:11:12.990503+08	0	0	\N	2021-01-10 20:11:12.992713+08	\N	\N	2	2021-01-01
3182	-30	生活日用	0	景湖电费	2021-01-10 20:11:32.991409+08	0	0	\N	2021-01-10 20:11:32.991745+08	\N	\N	2	2021-01-02
3183	-160	住房缴费	0	东兴电费	2021-01-10 20:11:49.488647+08	0	0	\N	2021-01-10 20:11:49.488994+08	\N	\N	2	2021-01-02
3184	-32	饮食	0	喜茶明州里	2021-01-10 20:12:14.955455+08	0	0	\N	2021-01-10 20:12:14.955796+08	\N	\N	2	2021-01-03
3185	-11	交通出行	0	地铁公交	2021-01-10 20:12:58.106605+08	0	0	\N	2021-01-10 20:12:58.106918+08	\N	\N	2	2021-01-03
3186	-8	住房缴费	0	农夫山泉	2021-01-10 20:14:41.227251+08	0	0	\N	2021-01-10 20:14:41.227573+08	\N	\N	2	2021-01-03
3187	-28	饮食	0	寿司	2021-01-10 20:14:56.143645+08	0	0	\N	2021-01-10 20:14:56.143968+08	\N	\N	2	2021-01-03
3188	-14	生活日用	0	吸管	2021-01-10 20:15:22.880903+08	0	0	\N	2021-01-10 20:15:22.881246+08	\N	\N	2	2021-01-03
3189	-93	小孩生活用品	0	护肤乳	2021-01-10 20:15:54.889625+08	0	0	\N	2021-01-10 20:15:54.889943+08	\N	\N	2	2021-01-04
3190	-16	生活日用	0	定时开关	2021-01-10 20:16:16.553188+08	0	0	\N	2021-01-10 20:16:16.553528+08	\N	\N	2	2021-01-05
3191	-40	生活日用	0	美购	2021-01-10 20:16:37.294036+08	0	0	\N	2021-01-10 20:16:37.294332+08	\N	\N	2	2021-01-06
3192	-32	生活日用	0	插座	2021-01-10 20:16:54.627925+08	0	0	\N	2021-01-10 20:16:54.628214+08	\N	\N	2	2021-01-07
3193	-358	饮食	0	意坊	2021-01-10 20:17:10.922921+08	0	0	\N	2021-01-10 20:17:10.923241+08	\N	\N	2	2021-01-09
3194	-14	饮食	0	巴比包子	2021-01-10 20:17:23.497513+08	0	0	\N	2021-01-10 20:17:23.49783+08	\N	\N	2	2021-01-10
3195	-23	饮食	0	coco	2021-01-10 20:17:35.799913+08	0	0	\N	2021-01-10 20:17:35.800245+08	\N	\N	2	2021-01-10
3196	-27	文教娱乐	0	电影	2021-01-10 20:17:49.86042+08	0	0	\N	2021-01-10 20:17:49.860738+08	\N	\N	2	2021-01-10
3197	-13	饮食	0	草莓	2021-01-10 20:22:53.457571+08	0	0	\N	2021-01-10 20:22:53.45788+08	\N	\N	2	2021-01-05
3198	-100	饮食	0	聚餐	2021-01-10 20:24:24.271476+08	0	0	\N	2021-01-10 20:24:24.271802+08	\N	\N	2	2021-01-08
3199	-40	饮食	0	肯德基	2021-01-10 20:24:52.041455+08	0	0	\N	2021-01-10 20:24:52.041807+08	\N	\N	2	2021-01-09
3200	-13	饮食	0	鸡排	2021-01-10 20:25:06.444654+08	0	0	\N	2021-01-10 20:25:06.445+08	\N	\N	2	2021-01-10
3201	-9	饮食	0	肯德基	2021-01-10 20:25:15.350727+08	0	0	\N	2021-01-10 20:25:15.351033+08	\N	\N	2	2021-01-10
3202	-588	生活日用	0	信用卡还款	2021-01-12 12:59:13.480316+08	0	0	\N	2021-01-12 12:59:13.48274+08	\N	\N	1	2020-12-14
3203	-5	交通出行	0	停车费	2021-01-12 12:59:40.757231+08	0	0	\N	2021-01-12 12:59:40.757537+08	\N	\N	1	2020-12-17
3204	-170	生活日用	0	小米充气宝	2021-01-12 13:00:06.989854+08	0	0	\N	2021-01-12 13:00:06.990171+08	\N	\N	1	2020-12-18
3205	-28	健康保险	0	药	2021-01-12 13:00:42.108239+08	0	0	\N	2021-01-12 13:00:42.108561+08	\N	\N	1	2020-12-20
3206	-7	交通出行	0	地铁	2021-01-12 13:01:04.542744+08	0	0	\N	2021-01-12 13:01:04.543117+08	\N	\N	1	2020-12-26
3208	-188	饮食	0	牛肉面	2021-01-12 13:01:54.886888+08	0	0	\N	2021-01-12 13:01:54.887183+08	\N	\N	1	2020-12-26
3209	-10	交通出行	0	嘀嘀	2021-01-12 13:02:12.357087+08	0	0	\N	2021-01-12 13:02:12.357397+08	\N	\N	1	2020-12-26
3210	-10	饮食	0	年糕团	2021-01-12 13:02:33.340725+08	0	0	\N	2021-01-12 13:02:33.34108+08	\N	\N	1	2020-12-26
3211	-40	饮食	0	年糕	2021-01-12 13:02:50.897621+08	0	0	\N	2021-01-12 13:02:50.897961+08	\N	\N	1	2020-12-26
3212	-7	交通出行	0	嘀嘀	2021-01-12 13:03:06.77131+08	0	0	\N	2021-01-12 13:03:06.771652+08	\N	\N	1	2020-12-26
3213	-4	交通出行	0	地铁	2021-01-12 13:03:22.806442+08	0	0	\N	2021-01-12 13:03:22.80675+08	\N	\N	1	2020-12-27
3214	-42	饮食	0	鼓楼美食	2021-01-12 13:03:52.070024+08	0	0	\N	2021-01-12 13:03:52.070337+08	\N	\N	1	2020-12-27
3215	-4	交通出行	0	地铁	2021-01-12 13:04:09.900545+08	0	0	\N	2021-01-12 13:04:09.900854+08	\N	\N	1	2020-12-27
3216	-130	宠物	0	兔粮	2021-01-12 13:04:23.199363+08	0	0	\N	2021-01-12 13:04:23.19972+08	\N	\N	1	2020-12-27
3217	-32	宠物	0	兔子食物	2021-01-12 13:04:43.43747+08	0	0	\N	2021-01-12 13:04:43.437794+08	\N	\N	1	2020-12-27
3218	-15	小孩玩具	0	跳绳	2021-01-12 13:05:04.488869+08	0	0	\N	2021-01-12 13:05:04.489228+08	\N	\N	1	2020-12-29
3219	-15	饮食	0	零食	2021-01-12 13:05:30.660062+08	0	0	\N	2021-01-12 13:05:30.660373+08	\N	\N	1	2021-01-03
3220	-3	交通出行	0	地铁	2021-01-12 13:05:47.570399+08	0	0	\N	2021-01-12 13:05:47.57074+08	\N	\N	1	2021-01-03
3221	-4	交通出行	0	公交	2021-01-12 13:05:58.536921+08	0	0	\N	2021-01-12 13:05:58.537339+08	\N	\N	1	2021-01-03
3222	-15	饮食	0	煎饼	2021-01-12 13:06:12.038006+08	0	0	\N	2021-01-12 13:06:12.038337+08	\N	\N	1	2021-01-03
3223	-4	交通出行	0	地铁	2021-01-12 13:06:26.136724+08	0	0	\N	2021-01-12 13:06:26.13706+08	\N	\N	1	2021-01-03
3224	-5	饮食	0	可乐	2021-01-12 13:06:56.040024+08	0	0	\N	2021-01-12 13:06:56.04033+08	\N	\N	1	2021-01-09
3225	-39	宠物	0	提摩西草	2021-01-12 13:07:20.434072+08	0	0	\N	2021-01-12 13:07:20.434381+08	\N	\N	1	2021-01-10
3226	-55	生活日用	0	生活日用	2021-01-12 13:08:11.512017+08	0	0	\N	2021-01-12 13:08:11.512335+08	\N	\N	1	2020-12-29
3227	-27	文教娱乐	0	电影票	2021-01-12 13:09:22.779673+08	0	0	\N	2021-01-12 13:09:22.779971+08	\N	\N	1	2021-01-10
3228	14936	收入	1	工资	2021-01-15 09:55:44.716839+08	0	0	\N	2021-01-15 09:55:44.719378+08	\N	\N	1	2021-01-15
3229	-26	宠物	0	小麦草	2021-01-15 09:56:27.350142+08	0	0	\N	2021-01-15 09:56:27.350448+08	\N	\N	1	2021-01-13
3230	-10	交通出行	0	行车记录仪线	2021-01-15 09:56:45.641445+08	0	0	\N	2021-01-15 09:56:45.641809+08	\N	\N	1	2021-01-14
3231	-102	住房缴费	0	东兴水费	2021-01-23 16:10:19.72746+08	0	0	\N	2021-01-23 16:10:19.729805+08	\N	\N	2	2021-01-13
3232	-100	饮食	0	老婆大人	2021-01-23 16:10:37.092169+08	0	0	\N	2021-01-23 16:10:37.092485+08	\N	\N	2	2021-01-13
3233	-60	饮食	0	美购	2021-01-23 16:10:59.526477+08	0	0	\N	2021-01-23 16:10:59.52679+08	\N	\N	2	2021-01-15
3234	-60	生活日用	0	被子	2021-01-23 16:11:15.631784+08	0	0	\N	2021-01-23 16:11:15.632108+08	\N	\N	2	2021-01-16
3236	-8	饮食	0	饭团	2021-01-23 16:11:56.127885+08	0	0	\N	2021-01-23 16:11:56.128195+08	\N	\N	2	2021-01-17
3237	-23	饮食	0	欧文	2021-01-23 16:12:09.340361+08	0	0	\N	2021-01-23 16:12:09.340685+08	\N	\N	2	2021-01-17
3238	-19	生活日用	0	一次性口罩	2021-01-23 16:12:40.148689+08	0	0	\N	2021-01-23 16:12:40.149048+08	\N	\N	2	2021-01-18
3239	-20	生活日用	0	心心厨房纸	2021-01-23 16:13:04.054512+08	0	0	\N	2021-01-23 16:13:04.054809+08	\N	\N	2	2021-01-20
3240	-188	人情往来	0	招财猫	2021-01-23 16:13:48.060086+08	0	0	\N	2021-01-23 16:13:48.060387+08	\N	\N	2	2021-01-21
3241	-6	饮食	0	肯德基	2021-01-23 16:14:47.265794+08	0	0	\N	2021-01-23 16:14:47.266128+08	\N	\N	2	2021-01-15
3242	-21	饮食	0	肯德基	2021-01-23 16:15:12.71102+08	0	0	\N	2021-01-23 16:15:12.711512+08	\N	\N	2	2021-01-23
3243	-24	饮食	0	小杨生煎	2021-01-28 17:58:10.0213+08	0	0	\N	2021-01-28 17:58:10.023702+08	\N	\N	2	2021-01-26
3244	-5	交通出行	0	停车	2021-01-28 17:58:23.195855+08	0	0	\N	2021-01-28 17:58:23.196194+08	\N	\N	2	2021-01-26
3245	-328	饮食	0	绿资	2021-01-28 18:00:42.360387+08	0	0	\N	2021-01-28 18:00:42.36072+08	\N	\N	2	2021-01-23
3246	-10	饮食	0	肯德基	2021-01-28 18:00:53.480622+08	0	0	\N	2021-01-28 18:00:53.480951+08	\N	\N	2	2021-01-25
3247	-70	饮食	0	零食	2021-01-30 09:49:08.159524+08	0	0	\N	2021-01-30 09:49:08.161928+08	\N	\N	1	2021-01-15
3248	-28	生活日用	0	手机套	2021-01-30 09:49:42.479173+08	0	0	\N	2021-01-30 09:49:42.479482+08	\N	\N	1	2021-01-16
3249	-36	生活日用	0	卡罗拉遮阳板	2021-01-30 09:50:19.019345+08	0	0	\N	2021-01-30 09:50:19.019642+08	\N	\N	1	2021-01-16
3250	-12	饮食	0	吃饭	2021-01-30 09:50:37.748365+08	0	0	\N	2021-01-30 09:50:37.748837+08	\N	\N	1	2021-01-17
3251	-16	饮食	0	羊肉汤	2021-01-30 09:51:02.221965+08	0	0	\N	2021-01-30 09:51:02.222265+08	\N	\N	1	2021-01-17
3252	-27	饮食	0	水果	2021-01-30 09:51:34.571791+08	0	0	\N	2021-01-30 09:51:34.572119+08	\N	\N	1	2021-01-23
3253	-47	宠物	0	提摩西	2021-01-30 09:52:05.972606+08	0	0	\N	2021-01-30 09:52:05.972984+08	\N	\N	1	2021-01-30
3254	-12	宠物	0	木屑	2021-01-30 09:52:20.759484+08	0	0	\N	2021-01-30 09:52:20.759829+08	\N	\N	1	2021-01-30
3255	-120	宠物	0	布格斯兔粮	2021-01-30 09:52:37.0568+08	0	0	\N	2021-01-30 09:52:37.057147+08	\N	\N	1	2021-01-30
3256	-20	饮食	0	古茗	2021-01-30 09:53:16.122131+08	0	0	\N	2021-01-30 09:53:16.122436+08	\N	\N	1	2021-01-17
3257	-48	饮食	0	酸菜鱼	2021-01-30 09:53:34.863955+08	0	0	\N	2021-01-30 09:53:34.864277+08	\N	\N	1	2021-01-17
3259	-880	小孩奶粉	0	卡洛塔尼四段X4	2021-01-30 09:54:27.734375+08	0	0	\N	2021-01-30 09:54:27.734688+08	\N	\N	1	2021-01-21
3260	-40	饮食	0	美购	2021-02-02 14:17:20.7303+08	0	0	\N	2021-02-02 14:17:20.732695+08	\N	\N	2	2021-01-28
3261	-10	生活日用	0	纸巾	2021-02-02 14:17:35.251472+08	0	0	\N	2021-02-02 14:17:35.251794+08	\N	\N	2	2021-01-29
3262	-20	生活日用	0	拖把	2021-02-02 14:18:03.330044+08	0	0	\N	2021-02-02 14:18:03.33036+08	\N	\N	2	2021-01-29
3263	-198	小孩服饰	0	衣服	2021-02-02 14:18:41.060142+08	0	0	\N	2021-02-02 14:18:41.060497+08	\N	\N	2	2021-01-31
3264	-164	饮食	0	章鱼	2021-02-02 14:19:09.658202+08	0	0	\N	2021-02-02 14:19:09.65853+08	\N	\N	2	2021-01-31
3265	-417	小孩服饰	0	鞋子	2021-02-02 14:19:27.171964+08	0	0	\N	2021-02-02 14:19:27.172286+08	\N	\N	2	2021-01-31
3266	-78	小孩服饰	0	内衣	2021-02-02 14:20:13.504443+08	0	0	\N	2021-02-02 14:20:13.504759+08	\N	\N	2	2021-01-31
3267	-23	交通出行	0	停车费	2021-02-02 14:20:35.81537+08	0	0	\N	2021-02-02 14:20:35.81568+08	\N	\N	2	2021-01-31
3268	-993	饮食	0	山姆	2021-02-02 14:23:28.701162+08	0	0	\N	2021-02-02 14:23:28.70149+08	\N	\N	2	2021-01-29
3269	2900	收入	1	12月工资	2021-02-02 14:25:17.264883+08	0	0	\N	2021-02-02 14:25:17.265232+08	\N	\N	2	2021-01-22
3270	-45	饮食	0	美食	2021-02-05 10:35:55.375998+08	0	0	\N	2021-02-05 10:35:55.378233+08	\N	\N	1	2021-01-31
3271	-12	饮食	0	肯德基圣诞	2021-02-05 10:36:20.55017+08	0	0	\N	2021-02-05 10:36:20.550475+08	\N	\N	1	2021-01-31
3272	-5	饮食	0	可乐	2021-02-05 10:36:39.129755+08	0	0	\N	2021-02-05 10:36:39.130069+08	\N	\N	1	2021-01-31
3273	-100	服饰美容	0	理发充值	2021-02-05 10:37:01.739103+08	0	0	\N	2021-02-05 10:37:01.739434+08	\N	\N	1	2021-02-02
3274	-36	饮食	0	烧烤	2021-02-05 10:37:16.661948+08	0	0	\N	2021-02-05 10:37:16.662267+08	\N	\N	1	2021-02-02
3275	-8	饮食	0	一鸣早餐	2021-02-05 10:38:22.670323+08	0	0	\N	2021-02-05 10:38:22.670658+08	\N	\N	1	2021-02-04
3276	-15	饮食	0	牛肉面	2021-02-05 10:39:57.81903+08	0	0	\N	2021-02-05 10:39:57.819331+08	\N	\N	1	2021-02-05
3277	34920	收入	1	奖金	2021-02-05 10:42:41.250394+08	0	0	\N	2021-02-05 10:42:41.250719+08	\N	\N	1	2021-02-04
3278	14932	收入	1	工资	2021-02-05 10:43:58.625753+08	0	0	\N	2021-02-05 10:43:58.626059+08	\N	\N	1	2021-02-05
3279	-492	小孩服饰	0	衣服	2021-02-05 15:10:44.606264+08	0	0	\N	2021-02-05 15:10:44.606572+08	\N	\N	2	2021-02-01
3280	-299	服饰美容	0	羽绒服婆婆	2021-02-05 15:11:01.763762+08	0	0	\N	2021-02-05 15:11:01.764096+08	\N	\N	2	2021-02-02
3281	-11	生活日用	0	拼多多	2021-02-05 15:11:23.840362+08	0	0	\N	2021-02-05 15:11:23.840686+08	\N	\N	2	2021-02-02
3282	-28	饮食	0	麻薯粉	2021-02-05 15:11:49.258727+08	0	0	\N	2021-02-05 15:11:49.259037+08	\N	\N	2	2021-02-02
3284	-30	住房缴费	0	电费景湖水岸	2021-02-05 15:12:45.286245+08	0	0	\N	2021-02-05 15:12:45.286557+08	\N	\N	2	2021-02-03
3285	-162	住房缴费	0	东兴电费	2021-02-05 15:13:07.330348+08	0	0	\N	2021-02-05 15:13:07.330694+08	\N	\N	2	2021-02-03
3286	-50	服饰美容	0	衣服	2021-02-05 15:13:27.008817+08	0	0	\N	2021-02-05 15:13:27.009185+08	\N	\N	2	2021-02-04
3287	-15	生活日用	0	老鼠贴	2021-02-05 15:13:45.39278+08	0	0	\N	2021-02-05 15:13:45.393121+08	\N	\N	2	2021-02-04
3288	-136	小孩服饰	0	衣服	2021-02-05 15:14:03.287954+08	0	0	\N	2021-02-05 15:14:03.288274+08	\N	\N	2	2021-02-05
3289	-17	小孩服饰	0	袜子	2021-02-05 15:14:18.63956+08	0	0	\N	2021-02-05 15:14:18.639877+08	\N	\N	2	2021-02-05
3290	-24	饮食	0	微信	2021-02-05 15:14:45.885236+08	0	0	\N	2021-02-05 15:14:45.885557+08	\N	\N	2	2021-02-05
3291	-1200	人情往来	0	江陆大爸爸70岁	2021-02-12 20:29:59.6143+08	0	0	\N	2021-02-12 20:29:59.616622+08	\N	\N	1	2021-02-12
3292	-500	人情往来	0	宁波嬷嬷新年红包	2021-02-12 20:30:28.603529+08	0	0	\N	2021-02-12 20:30:28.603867+08	\N	\N	1	2021-02-12
3293	-600	人情往来	0	聪聪新年红包	2021-02-13 21:36:23.761771+08	0	0	\N	2021-02-13 21:36:23.764018+08	\N	\N	1	2021-02-13
3294	-600	人情往来	0	萌萌新年红包	2021-02-13 21:36:56.253733+08	0	0	\N	2021-02-13 21:36:56.254047+08	\N	\N	1	2021-02-13
3295	-1200	交通出行	0	包子新年红包	2021-02-13 21:37:27.144733+08	0	0	\N	2021-02-13 21:37:27.145097+08	\N	\N	1	2021-02-13
3296	-2000	人情往来	0	给爸爸红包	2021-02-13 21:45:46.894894+08	0	0	\N	2021-02-13 21:45:46.895212+08	\N	\N	1	2021-02-13
3297	-16	饮食	0	奶茶	2021-02-13 21:48:08.597835+08	0	0	\N	2021-02-13 21:48:08.598185+08	\N	\N	2	2021-02-06
3298	-292	小孩服饰	0	毛衣裤子	2021-02-13 21:48:38.934129+08	0	0	\N	2021-02-13 21:48:38.934435+08	\N	\N	2	2021-02-07
3299	-6	饮食	0	牛奶	2021-02-13 21:49:09.593107+08	0	0	\N	2021-02-13 21:49:09.593418+08	\N	\N	2	2021-02-10
3300	-100	饮食	0	老婆大人	2021-02-13 21:49:28.539141+08	0	0	\N	2021-02-13 21:49:28.539448+08	\N	\N	2	2021-02-10
3301	-26	饮食	0	小杨生煎	2021-02-13 21:49:51.396603+08	0	0	\N	2021-02-13 21:49:51.396943+08	\N	\N	2	2021-02-10
3302	-574	服饰美容	0	衣服	2021-02-13 21:50:27.612256+08	0	0	\N	2021-02-13 21:50:27.612581+08	\N	\N	2	2021-02-10
3303	-100	饮食	0	老婆大人	2021-02-13 21:50:47.478486+08	0	0	\N	2021-02-13 21:50:47.478892+08	\N	\N	2	2021-02-10
3304	-30	饮食	0	沙糖桔	2021-02-13 21:51:07.210404+08	0	0	\N	2021-02-13 21:51:07.210711+08	\N	\N	2	2021-02-13
3305	-118	饮食	0	车厘子	2021-02-13 21:52:26.593673+08	0	0	\N	2021-02-13 21:52:26.593977+08	\N	\N	2	2021-02-05
3306	-63	饮食	0	牛肉	2021-02-13 21:55:22.867978+08	0	0	\N	2021-02-13 21:55:22.868305+08	\N	\N	2	2021-02-06
3307	-43	小孩玩具	0	摔炮	2021-02-13 21:55:55.773724+08	0	0	\N	2021-02-13 21:55:55.774034+08	\N	\N	2	2021-02-09
3308	-6	饮食	0	肯德基	2021-02-13 21:56:11.281673+08	0	0	\N	2021-02-13 21:56:11.281973+08	\N	\N	2	2021-02-10
3309	-10	交通出行	0	停车费	2021-02-13 21:56:29.925892+08	0	0	\N	2021-02-13 21:56:29.926234+08	\N	\N	2	2021-02-10
3310	-166	服饰美容	0	皮带	2021-02-13 21:59:33.110756+08	0	0	\N	2021-02-13 21:59:33.111082+08	\N	\N	2	2021-02-10
3312	-644	饮食	0	山姆超市	2021-02-13 22:05:11.148895+08	0	0	\N	2021-02-13 22:05:11.149259+08	\N	\N	2	2021-02-10
3313	-888	饮食	0	山姆超市	2021-02-13 22:05:33.096783+08	0	0	\N	2021-02-13 22:05:33.09716+08	\N	\N	2	2021-02-11
3314	-100	饮食	0	老婆大人	2021-02-13 22:06:10.649624+08	0	0	\N	2021-02-13 22:06:10.649973+08	\N	\N	2	2021-02-11
3315	-12	小孩玩具	0	气球玩具	2021-02-28 21:02:23.641341+08	0	0	\N	2021-02-28 21:02:23.644115+08	\N	\N	2	2021-02-13
3316	-28	生活日用	0	润唇膏	2021-02-28 21:02:44.636786+08	0	0	\N	2021-02-28 21:02:44.637147+08	\N	\N	2	2021-02-15
3317	-8	饮食	0	美购	2021-02-28 21:03:00.522081+08	0	0	\N	2021-02-28 21:03:00.522382+08	\N	\N	2	2021-02-15
3318	-75	生活日用	0	超市	2021-02-28 21:03:23.405193+08	0	0	\N	2021-02-28 21:03:23.405505+08	\N	\N	2	2021-02-15
3319	-24	饮食	0	日料	2021-02-28 21:03:50.409052+08	0	0	\N	2021-02-28 21:03:50.409359+08	\N	\N	2	2021-02-16
3320	-20	文教娱乐	0	电影票	2021-02-28 21:04:11.633735+08	0	0	\N	2021-02-28 21:04:11.634045+08	\N	\N	2	2021-02-18
3321	-6	生活日用	0	一次性抹布	2021-02-28 21:04:42.079808+08	0	0	\N	2021-02-28 21:04:42.080124+08	\N	\N	2	2021-02-19
3322	-11	饮食	0	一点点	2021-02-28 21:04:57.922383+08	0	0	\N	2021-02-28 21:04:57.922691+08	\N	\N	2	2021-02-20
3323	-11	饮食	0	一点点	2021-02-28 21:05:08.534023+08	0	0	\N	2021-02-28 21:05:08.53437+08	\N	\N	2	2021-02-20
3324	-10	小孩服饰	0	袜子	2021-02-28 21:05:28.86069+08	0	0	\N	2021-02-28 21:05:28.861021+08	\N	\N	2	2021-02-20
3325	-5	交通出行	0	停车费	2021-02-28 21:05:42.220787+08	0	0	\N	2021-02-28 21:05:42.22117+08	\N	\N	2	2021-02-20
3326	-25	生活日用	0	美购	2021-02-28 21:06:01.746759+08	0	0	\N	2021-02-28 21:06:01.747071+08	\N	\N	2	2021-02-21
3327	-17	饮食	0	水果	2021-02-28 21:06:19.66648+08	0	0	\N	2021-02-28 21:06:19.666798+08	\N	\N	2	2021-02-21
3328	-58	服饰美容	0	耳钉	2021-02-28 21:06:40.819552+08	0	0	\N	2021-02-28 21:06:40.819872+08	\N	\N	2	2021-02-23
3329	-8	服饰美容	0	洗脸巾	2021-02-28 21:06:59.815698+08	0	0	\N	2021-02-28 21:06:59.816023+08	\N	\N	2	2021-02-25
3330	-138	生活日用	0	餐巾纸	2021-02-28 21:07:23.55503+08	0	0	\N	2021-02-28 21:07:23.555384+08	\N	\N	2	2021-02-26
3331	-25	饮食	0	糖葫芦	2021-02-28 21:08:06.119919+08	0	0	\N	2021-02-28 21:08:06.120258+08	\N	\N	2	2021-02-27
3332	-40	小孩服饰	0	鞋子	2021-02-28 21:08:22.209922+08	0	0	\N	2021-02-28 21:08:22.21022+08	\N	\N	2	2021-02-27
3333	-27	饮食	0	鲍师傅	2021-02-28 21:08:39.880207+08	0	0	\N	2021-02-28 21:08:39.880529+08	\N	\N	2	2021-02-27
3334	-45	生活日用	0	绞股蓝	2021-02-28 21:08:59.58396+08	0	0	\N	2021-02-28 21:08:59.584268+08	\N	\N	2	2021-02-27
3335	-18	服饰美容	0	袖套	2021-02-28 21:09:14.640769+08	0	0	\N	2021-02-28 21:09:14.641126+08	\N	\N	2	2021-02-27
3336	-7	饮食	0	冰激凌	2021-02-28 21:09:26.504068+08	0	0	\N	2021-02-28 21:09:26.504368+08	\N	\N	2	2021-02-28
3337	-122	饮食	0	肯德基	2021-02-28 21:10:19.664276+08	0	0	\N	2021-02-28 21:10:19.664626+08	\N	\N	2	2021-02-15
3338	-4	生活日用	0	电池	2021-02-28 21:10:46.340166+08	0	0	\N	2021-02-28 21:10:46.34048+08	\N	\N	2	2021-02-16
3339	-150	交通出行	0	加油	2021-02-28 21:11:03.973511+08	0	0	\N	2021-02-28 21:11:03.973852+08	\N	\N	2	2021-02-18
3340	-24	饮食	0	肯德基	2021-02-28 21:11:23.719984+08	0	0	\N	2021-02-28 21:11:23.720283+08	\N	\N	2	2021-02-20
3341	-27	通讯物流	0	话费	2021-02-28 21:12:07.899628+08	0	0	\N	2021-02-28 21:12:07.899942+08	\N	\N	2	2021-02-19
3342	-5	生活日用	0	拼多多	2021-02-28 21:12:27.097806+08	0	0	\N	2021-02-28 21:12:27.098124+08	\N	\N	2	2021-02-23
3343	-8	饮食	0	美团	2021-02-28 21:12:44.174337+08	0	0	\N	2021-02-28 21:12:44.174667+08	\N	\N	2	2021-02-26
3344	-100	其他消费	0	班费	2021-02-28 21:13:22.330112+08	0	0	\N	2021-02-28 21:13:22.330421+08	\N	\N	2	2021-02-26
3345	-30	生活日用	0	拼多多会员	2021-02-28 21:13:43.738958+08	0	0	\N	2021-02-28 21:13:43.739256+08	\N	\N	2	2021-02-26
3346	-62	文教娱乐	0	腾讯会员	2021-02-28 21:16:37.874952+08	0	0	\N	2021-02-28 21:16:37.875265+08	\N	\N	2	2021-02-26
3347	-8	饮食	0	一鸣早餐	2021-03-03 17:59:27.160565+08	0	0	\N	2021-03-03 17:59:27.16294+08	\N	\N	1	2021-02-07
3348	-16	交通出行	0	洗车	2021-03-03 17:59:47.235735+08	0	0	\N	2021-03-03 17:59:47.236055+08	\N	\N	1	2021-02-07
3349	-85	服饰美容	0	衣服	2021-03-03 18:00:25.295307+08	0	0	\N	2021-03-03 18:00:25.295638+08	\N	\N	1	2021-02-10
3350	-30	饮食	0	串串	2021-03-03 18:00:55.84519+08	0	0	\N	2021-03-03 18:00:55.845504+08	\N	\N	1	2021-02-12
3351	-36	饮食	0	冰淇淋X2	2021-03-03 18:01:26.605699+08	0	0	\N	2021-03-03 18:01:26.606042+08	\N	\N	1	2021-02-12
3352	-25	饮食	0	鹌鹑X2	2021-03-03 18:01:44.616884+08	0	0	\N	2021-03-03 18:01:44.61725+08	\N	\N	1	2021-02-12
3353	-28	饮食	0	水果	2021-03-03 18:02:06.245385+08	0	0	\N	2021-03-03 18:02:06.245721+08	\N	\N	1	2021-02-17
3354	-17	饮食	0	超市	2021-03-03 18:02:35.585152+08	0	0	\N	2021-03-03 18:02:35.585476+08	\N	\N	1	2021-02-17
3355	-20	文教娱乐	0	电影票	2021-03-03 18:02:57.319333+08	0	0	\N	2021-03-03 18:02:57.319657+08	\N	\N	1	2021-02-20
3356	-75	文教娱乐	0	冰雪大世界装备和饮食	2021-03-03 18:03:37.614391+08	0	0	\N	2021-03-03 18:03:37.614692+08	\N	\N	1	2021-02-19
3357	-28	饮食	0	水果	2021-03-03 18:03:54.954711+08	0	0	\N	2021-03-03 18:03:54.955024+08	\N	\N	1	2021-02-20
3358	-4	交通出行	0	地铁	2021-03-03 18:04:15.474427+08	0	0	\N	2021-03-03 18:04:15.474733+08	\N	\N	1	2021-02-26
3359	-28	饮食	0	米线	2021-03-03 18:04:30.01097+08	0	0	\N	2021-03-03 18:04:30.011325+08	\N	\N	1	2021-02-26
3360	-446	服饰美容	0	无印良品	2021-03-03 18:04:49.495189+08	0	0	\N	2021-03-03 18:04:49.495505+08	\N	\N	1	2021-02-26
3361	-10	饮食	0	饮料	2021-03-03 18:05:04.35038+08	0	0	\N	2021-03-03 18:05:04.350705+08	\N	\N	1	2021-02-26
3362	-4	交通出行	0	地铁	2021-03-03 18:05:19.465699+08	0	0	\N	2021-03-03 18:05:19.466001+08	\N	\N	1	2021-02-26
3363	-40	生活日用	0	超市	2021-03-03 18:06:30.649159+08	0	0	\N	2021-03-03 18:06:30.649488+08	\N	\N	1	2021-02-10
3364	-165	文教娱乐	0	冰雪大世界门票X3	2021-03-03 18:07:12.971227+08	0	0	\N	2021-03-03 18:07:12.97156+08	\N	\N	1	2021-02-19
3365	-20	交通出行	0	停车费	2021-03-03 18:07:37.745857+08	0	0	\N	2021-03-03 18:07:37.746189+08	\N	\N	1	2021-02-23
3367	-161	服饰美容	0	西装	2021-03-07 19:34:51.650217+08	0	0	\N	2021-03-07 19:34:51.652753+08	\N	\N	2	2021-03-02
3368	-56	住房缴费	0	景湖56	2021-03-07 19:35:24.805513+08	0	0	\N	2021-03-07 19:35:24.805827+08	\N	\N	2	2021-03-02
3369	-20	通讯物流	0	话费	2021-03-07 19:35:41.884354+08	0	0	\N	2021-03-07 19:35:41.884673+08	\N	\N	2	2021-03-02
3370	-66	小孩服饰	0	被套	2021-03-07 19:36:00.882348+08	0	0	\N	2021-03-07 19:36:00.882672+08	\N	\N	2	2021-03-03
3371	-189	小孩生活用品	0	被芯	2021-03-07 19:36:24.835251+08	0	0	\N	2021-03-07 19:36:24.835557+08	\N	\N	2	2021-03-03
3373	-94	住房缴费	0	东兴电费	2021-03-07 19:37:04.513887+08	0	0	\N	2021-03-07 19:37:04.51423+08	\N	\N	2	2021-03-03
3374	-16	生活日用	0	老友记视频	2021-03-07 19:46:24.817458+08	0	0	\N	2021-03-07 19:46:24.817799+08	\N	\N	2	2021-03-05
3375	-176	生活日用	0	乐购	2021-03-07 19:46:41.342736+08	0	0	\N	2021-03-07 19:46:41.343053+08	\N	\N	2	2021-03-05
3376	-192	生活日用	0	乐购	2021-03-07 19:46:58.508294+08	0	0	\N	2021-03-07 19:46:58.508613+08	\N	\N	2	2021-03-05
3377	-296	生活日用	0	乐歌	2021-03-07 19:47:09.615936+08	0	0	\N	2021-03-07 19:47:09.616237+08	\N	\N	2	2021-03-05
3378	-200	饮食	0	o2	2021-03-07 19:47:32.750231+08	0	0	\N	2021-03-07 19:47:32.750567+08	\N	\N	2	2021-03-06
3379	-134	生活日用	0	无印良品	2021-03-07 19:47:56.143598+08	0	0	\N	2021-03-07 19:47:56.143944+08	\N	\N	2	2021-03-06
3380	-9	生活日用	0	泵头	2021-03-07 19:48:28.395903+08	0	0	\N	2021-03-07 19:48:28.396215+08	\N	\N	2	2021-03-07
3381	-22	小孩文具	0	台球	2021-03-07 19:49:29.437022+08	0	0	\N	2021-03-07 19:49:29.437329+08	\N	\N	2	2021-03-01
3382	-123	饮食	0	美团	2021-03-07 19:51:19.335608+08	0	0	\N	2021-03-07 19:51:19.33593+08	\N	\N	2	2021-03-04
3383	-177	生活日用	0	蓝牙耳机	2021-03-07 19:51:40.859552+08	0	0	\N	2021-03-07 19:51:40.85989+08	\N	\N	2	2021-03-06
3384	-22	饮食	0	肯德基	2021-03-07 19:51:57.949809+08	0	0	\N	2021-03-07 19:51:57.950157+08	\N	\N	2	2021-03-07
3385	-223	饮食	0	钙片	2021-03-07 19:52:12.344693+08	0	0	\N	2021-03-07 19:52:12.345029+08	\N	\N	2	2021-03-07
3386	-270	生活日用	0	吹风机京东	2021-03-07 19:53:11.470075+08	0	0	\N	2021-03-07 19:53:11.470412+08	\N	\N	2	2021-03-07
3387	-291	饮食	0	山姆	2021-03-07 19:57:05.349791+08	0	0	\N	2021-03-07 19:57:05.350119+08	\N	\N	2	2021-03-06
3388	-41	通讯物流	0	话费	2021-03-07 19:57:39.578764+08	0	0	\N	2021-03-07 19:57:39.579071+08	\N	\N	2	2021-02-19
3389	-2199	生活日用	0	空调	2021-03-07 20:02:08.081854+08	0	0	\N	2021-03-07 20:02:08.082198+08	\N	\N	2	2021-03-01
3390	-20	文教娱乐	0	电影票	2021-03-07 20:02:29.058622+08	0	0	\N	2021-03-07 20:02:29.058939+08	\N	\N	2	2021-03-07
3391	-100	饮食	0	老婆大人	2021-03-14 20:01:11.035127+08	0	0	\N	2021-03-14 20:01:11.037663+08	\N	\N	2	2021-03-08
3393	-92	住房缴费	0	东兴水费	2021-03-14 20:01:47.157024+08	0	0	\N	2021-03-14 20:01:47.157337+08	\N	\N	2	2021-03-09
3394	-21	饮食	0	美购	2021-03-14 20:02:11.419998+08	0	0	\N	2021-03-14 20:02:11.420317+08	\N	\N	2	2021-03-10
3395	-39	小孩服饰	0	雨靴	2021-03-14 20:02:34.604382+08	0	0	\N	2021-03-14 20:02:34.604725+08	\N	\N	2	2021-03-12
3396	-287	住房缴费	0	有限电视	2021-03-14 20:02:57.405419+08	0	0	\N	2021-03-14 20:02:57.405727+08	\N	\N	2	2021-03-13
3397	-8	饮食	0	古茗	2021-03-14 20:03:09.834992+08	0	0	\N	2021-03-14 20:03:09.835318+08	\N	\N	2	2021-03-13
3398	-5	交通出行	0	停车费	2021-03-14 20:03:23.99992+08	0	0	\N	2021-03-14 20:03:24.00023+08	\N	\N	2	2021-03-13
3399	-33	饮食	0	牛肉面	2021-03-14 20:03:39.484247+08	0	0	\N	2021-03-14 20:03:39.484563+08	\N	\N	2	2021-03-14
3400	-29	小孩玩具	0	飞行棋	2021-03-14 20:03:56.132819+08	0	0	\N	2021-03-14 20:03:56.133183+08	\N	\N	2	2021-03-14
3401	-24	饮食	0	鸭脖	2021-03-14 20:04:26.117517+08	0	0	\N	2021-03-14 20:04:26.117894+08	\N	\N	2	2021-03-14
3402	-200	交通出行	0	加油	2021-03-14 20:06:13.309314+08	0	0	\N	2021-03-14 20:06:13.309626+08	\N	\N	2	2021-03-10
3403	-7	饮食	0	肯德基	2021-03-14 20:06:25.036074+08	0	0	\N	2021-03-14 20:06:25.036386+08	\N	\N	2	2021-03-13
3404	-19	生活日用	0	置物架	2021-03-14 20:06:51.11097+08	0	0	\N	2021-03-14 20:06:51.111303+08	\N	\N	2	2021-03-13
3405	-19	饮食	0	凤梨	2021-03-14 20:07:06.711338+08	0	0	\N	2021-03-14 20:07:06.711653+08	\N	\N	2	2021-03-13
3406	-5	交通出行	0	停车场	2021-03-14 20:07:23.931435+08	0	0	\N	2021-03-14 20:07:23.931747+08	\N	\N	2	2021-03-13
3407	-212	小孩玩具	0	火火兔	2021-03-14 20:08:56.815055+08	0	0	\N	2021-03-14 20:08:56.815373+08	\N	\N	2	2021-03-09
3408	-4420	小孩教育	0	幼儿园学费	2021-03-21 10:10:47.587393+08	0	0	\N	2021-03-21 10:10:47.589763+08	\N	\N	1	2021-03-04
3409	-100	通讯物流	0	话费	2021-03-21 10:11:09.786603+08	0	0	\N	2021-03-21 10:11:09.786931+08	\N	\N	1	2021-03-07
3410	-58	饮食	0	酸菜鱼	2021-03-21 10:11:37.569943+08	0	0	\N	2021-03-21 10:11:37.57023+08	\N	\N	1	2021-03-07
3411	-12	饮食	0	棒冰	2021-03-21 10:12:08.900241+08	0	0	\N	2021-03-21 10:12:08.90054+08	\N	\N	1	2021-03-11
3412	-39	宠物	0	提摩西草	2021-03-21 10:12:36.675858+08	0	0	\N	2021-03-21 10:12:36.6762+08	\N	\N	1	2021-03-13
3413	-9	小孩玩具	0	飞行棋	2021-03-21 10:13:03.818296+08	0	0	\N	2021-03-21 10:13:03.818592+08	\N	\N	1	2021-03-14
3414	-1142	交通出行	0	厦门机票x3	2021-03-21 10:13:31.857857+08	0	0	\N	2021-03-21 10:13:31.858155+08	\N	\N	1	2021-03-15
3415	-588	交通出行	0	厦门火车票x2	2021-03-21 10:13:59.667732+08	0	0	\N	2021-03-21 10:13:59.668031+08	\N	\N	1	2021-03-15
3416	-50	通讯物流	0	话费	2021-03-21 10:14:21.603408+08	0	0	\N	2021-03-21 10:14:21.60378+08	\N	\N	1	2021-03-17
3417	-112	饮食	0	烧烤	2021-03-21 10:14:48.628801+08	0	0	\N	2021-03-21 10:14:48.629161+08	\N	\N	1	2021-03-19
3418	-14	饮食	0	coco	2021-03-21 10:15:28.448949+08	0	0	\N	2021-03-21 10:15:28.449309+08	\N	\N	1	2021-03-07
3419	-12	交通出行	0	洗车	2021-03-21 10:15:44.868723+08	0	0	\N	2021-03-21 10:15:44.869082+08	\N	\N	1	2021-03-13
3420	-70	交通出行	0	鼓浪屿船票x2	2021-03-21 10:16:12.750292+08	0	0	\N	2021-03-21 10:16:12.7506+08	\N	\N	1	2021-03-20
3422	-10	生活日用	0	罐子	2021-03-25 19:35:18.015555+08	0	0	\N	2021-03-25 19:35:18.017904+08	\N	\N	2	2021-03-17
3423	-9	小孩生活用品	0	套子	2021-03-25 19:35:44.970492+08	0	0	\N	2021-03-25 19:35:44.970821+08	\N	\N	2	2021-03-20
3424	-27	生活日用	0	餐盒	2021-03-25 19:35:56.976408+08	0	0	\N	2021-03-25 19:35:56.976737+08	\N	\N	2	2021-03-20
3425	-30	生活日用	0	新江厦	2021-03-25 19:36:27.091699+08	0	0	\N	2021-03-25 19:36:27.091998+08	\N	\N	2	2021-03-21
3426	-10	交通出行	0	停车费	2021-03-25 19:36:53.427184+08	0	0	\N	2021-03-25 19:36:53.427497+08	\N	\N	2	2021-03-21
3427	-100	生活日用	0	双肩包	2021-03-25 19:37:03.074875+08	0	0	\N	2021-03-25 19:37:03.075194+08	\N	\N	2	2021-03-21
3428	-4	饮食	0	早餐	2021-03-25 19:37:56.064182+08	0	0	\N	2021-03-25 19:37:56.064514+08	\N	\N	2	2021-03-18
3429	-9	生活日用	0	拼多多	2021-03-25 19:38:16.799859+08	0	0	\N	2021-03-25 19:38:16.800165+08	\N	\N	2	2021-03-18
3430	-46	饮食	0	西瓜	2021-03-25 19:38:36.676007+08	0	0	\N	2021-03-25 19:38:36.67634+08	\N	\N	2	2021-03-21
3431	-5	饮食	0	年糕	2021-03-25 19:38:54.432525+08	0	0	\N	2021-03-25 19:38:54.433027+08	\N	\N	2	2021-03-21
3432	-3	饮食	0	早饭	2021-03-25 19:39:21.145776+08	0	0	\N	2021-03-25 19:39:21.146087+08	\N	\N	2	2021-03-24
3433	3900	收入	1	2月工资	2021-03-25 19:41:12.26958+08	0	0	\N	2021-03-25 19:41:12.269905+08	\N	\N	2	2021-03-23
3434	14936	收入	1	工资	2021-03-26 11:43:18.945778+08	0	0	\N	2021-03-26 11:43:18.948364+08	\N	\N	1	2021-03-26
3435	-100	饮食	0	老婆大人	2021-03-29 08:31:32.52405+08	0	0	\N	2021-03-29 08:31:32.526503+08	\N	\N	2	2021-03-25
3436	-56	饮食	0	宇包王	2021-03-29 08:33:24.052487+08	0	0	\N	2021-03-29 08:33:24.052809+08	\N	\N	2	2021-03-27
3437	-12	饮食	0	泡芙	2021-03-29 08:33:41.298323+08	0	0	\N	2021-03-29 08:33:41.298622+08	\N	\N	2	2021-03-27
3438	-20	饮食	0	鱼丸	2021-03-29 08:33:59.63775+08	0	0	\N	2021-03-29 08:33:59.638086+08	\N	\N	2	2021-03-27
3439	-746	交通出行	0	厦门民宿X3	2021-03-29 08:34:09.155528+08	0	0	\N	2021-03-29 08:34:09.155834+08	\N	\N	1	2021-03-22
3440	-30	饮食	0	马铃薯	2021-03-29 08:34:19.318056+08	0	0	\N	2021-03-29 08:34:19.318378+08	\N	\N	2	2021-03-27
3441	-59	生活日用	0	燃气报警器	2021-03-29 08:34:41.942531+08	0	0	\N	2021-03-29 08:34:41.94287+08	\N	\N	1	2021-03-24
3442	-60	服饰美容	0	洗脚	2021-03-29 08:34:55.392605+08	0	0	\N	2021-03-29 08:34:55.392914+08	\N	\N	2	2021-03-27
3443	-39	交通出行	0	厦门机场到民宿	2021-03-29 08:35:12.411497+08	0	0	\N	2021-03-29 08:35:12.411823+08	\N	\N	1	2021-03-26
3444	-20	饮食	0	新夏虾面	2021-03-29 08:35:34.973109+08	0	0	\N	2021-03-29 08:35:34.973492+08	\N	\N	2	2021-03-28
3445	-12	饮食	0	汤包	2021-03-29 08:36:05.558945+08	0	0	\N	2021-03-29 08:36:05.559253+08	\N	\N	2	2021-03-28
3447	-8	饮食	0	阿杰五香	2021-03-29 08:36:22.178599+08	0	0	\N	2021-03-29 08:36:22.17895+08	\N	\N	2	2021-03-28
3448	-10	饮食	0	蛋	2021-03-29 08:36:37.613509+08	0	0	\N	2021-03-29 08:36:37.613834+08	\N	\N	2	2021-03-28
3449	-10	饮食	0	里脊肉	2021-03-29 08:36:50.336317+08	0	0	\N	2021-03-29 08:36:50.336621+08	\N	\N	1	2021-03-26
3450	-36	饮食	0	沙茶面	2021-03-29 08:36:52.841646+08	0	0	\N	2021-03-29 08:36:52.841953+08	\N	\N	2	2021-03-28
3451	-3	饮食	0	水	2021-03-29 08:37:09.215961+08	0	0	\N	2021-03-29 08:37:09.216256+08	\N	\N	1	2021-03-26
3452	-30	饮食	0	绵绵冰	2021-03-29 08:37:20.972043+08	0	0	\N	2021-03-29 08:37:20.972371+08	\N	\N	2	2021-03-28
3454	-10	饮食	0	鱿鱼	2021-03-29 08:38:25.122447+08	0	0	\N	2021-03-29 08:38:25.122809+08	\N	\N	1	2021-03-26
3455	-20	饮食	0	菠萝蜜	2021-03-29 08:38:36.651509+08	0	0	\N	2021-03-29 08:38:36.651821+08	\N	\N	1	2021-03-26
3456	-2	饮食	0	水	2021-03-29 08:38:45.596516+08	0	0	\N	2021-03-29 08:38:45.596831+08	\N	\N	1	2021-03-26
3457	-55	饮食	0	沙茶面+炸五香	2021-03-29 08:39:57.291567+08	0	0	\N	2021-03-29 08:39:57.29189+08	\N	\N	1	2021-03-27
3458	-28	饮食	0	冰淇淋	2021-03-29 08:40:21.756579+08	0	0	\N	2021-03-29 08:40:21.756901+08	\N	\N	1	2021-03-27
3459	-60	交通出行	0	菽妆花园门票X2	2021-03-29 08:42:10.106559+08	0	0	\N	2021-03-29 08:42:10.106867+08	\N	\N	1	2021-03-27
3460	-92	饮食	0	苏小糖	2021-03-29 08:42:32.156392+08	0	0	\N	2021-03-29 08:42:32.156761+08	\N	\N	1	2021-03-27
3461	-12	饮食	0	肠粉	2021-03-29 08:42:54.176383+08	0	0	\N	2021-03-29 08:42:54.17672+08	\N	\N	1	2021-03-27
3462	-9	饮食	0	饮料	2021-03-29 08:43:22.470765+08	0	0	\N	2021-03-29 08:43:22.471055+08	\N	\N	1	2021-03-27
3463	-6	生活日用	0	肥皂	2021-03-29 08:43:55.855835+08	0	0	\N	2021-03-29 08:43:55.856134+08	\N	\N	1	2021-03-27
3464	-10	饮食	0	西瓜汁	2021-03-29 08:44:23.371887+08	0	0	\N	2021-03-29 08:44:23.37219+08	\N	\N	1	2021-03-27
3465	-87	饮食	0	姜母鸭	2021-03-29 08:44:43.196725+08	0	0	\N	2021-03-29 08:44:43.197091+08	\N	\N	1	2021-03-27
3466	-57	饮食	0	芒果+释迦+莲雾	2021-03-29 08:45:22.707945+08	0	0	\N	2021-03-29 08:45:22.708268+08	\N	\N	1	2021-03-27
3467	-28	饮食	0	菠萝蜜	2021-03-29 08:46:06.486187+08	0	0	\N	2021-03-29 08:46:06.486494+08	\N	\N	1	2021-03-27
3468	-19	生活日用	0	皮卡丘	2021-03-29 08:46:39.286306+08	0	0	\N	2021-03-29 08:46:39.286621+08	\N	\N	1	2021-03-28
3469	-11	交通出行	0	打车	2021-03-29 08:46:57.871446+08	0	0	\N	2021-03-29 08:46:57.87188+08	\N	\N	1	2021-03-28
3470	-12	饮食	0	八婆婆烧仙草	2021-03-29 08:47:18.756383+08	0	0	\N	2021-03-29 08:47:18.756687+08	\N	\N	1	2021-03-28
3471	-24	生活日用	0	退热贴	2021-03-29 08:47:47.166263+08	0	0	\N	2021-03-29 08:47:47.166563+08	\N	\N	1	2021-03-28
3472	-21	交通出行	0	打车	2021-03-29 08:48:08.926421+08	0	0	\N	2021-03-29 08:48:08.926831+08	\N	\N	1	2021-03-28
3473	-10	小孩玩具	0	沙滩铲子	2021-03-29 08:49:01.422145+08	0	0	\N	2021-03-29 08:49:01.422472+08	\N	\N	1	2021-03-28
3474	-5	饮食	0	大饼	2021-03-29 08:49:23.085682+08	0	0	\N	2021-03-29 08:49:23.085997+08	\N	\N	1	2021-03-28
3475	-13	饮食	0	水果	2021-03-29 08:49:48.851793+08	0	0	\N	2021-03-29 08:49:48.852102+08	\N	\N	1	2021-03-28
3476	-30	生活日用	0	画	2021-03-29 08:50:12.741635+08	0	0	\N	2021-03-29 08:50:12.74195+08	\N	\N	1	2021-03-28
3477	-25	饮食	0	鸡爪	2021-03-29 08:50:26.506213+08	0	0	\N	2021-03-29 08:50:26.506543+08	\N	\N	1	2021-03-28
3478	-9	饮食	0	青芒	2021-03-29 08:51:06.230441+08	0	0	\N	2021-03-29 08:51:06.230751+08	\N	\N	1	2021-03-26
3479	-12	交通出行	0	打车	2021-03-29 08:52:08.086821+08	0	0	\N	2021-03-29 08:52:08.087136+08	\N	\N	1	2021-03-27
3480	-4	饮食	0	水	2021-03-29 08:52:38.261324+08	0	0	\N	2021-03-29 08:52:38.261623+08	\N	\N	1	2021-03-27
3481	-14	交通出行	0	打车	2021-03-29 08:52:55.061386+08	0	0	\N	2021-03-29 08:52:55.061705+08	\N	\N	1	2021-03-27
3482	-16	饮食	0	里脊肉	2021-03-29 08:53:11.016742+08	0	0	\N	2021-03-29 08:53:11.017125+08	\N	\N	1	2021-03-27
3483	-17	交通出行	0	打车	2021-03-29 08:53:39.162043+08	0	0	\N	2021-03-29 08:53:39.16237+08	\N	\N	1	2021-03-28
3484	-25	饮食	0	蘑菇传奇	2021-03-29 08:53:58.442324+08	0	0	\N	2021-03-29 08:53:58.44265+08	\N	\N	1	2021-03-28
3485	-130	饮食	0	姜母鸭	2021-03-29 08:54:19.506385+08	0	0	\N	2021-03-29 08:54:19.506687+08	\N	\N	1	2021-03-28
3486	-37	交通出行	0	打车家到机场	2021-03-29 08:54:55.39188+08	0	0	\N	2021-03-29 08:54:55.392182+08	\N	\N	1	2021-03-26
3488	-1	交通出行	0	厦门公交	2021-04-01 09:20:33.558549+08	0	0	\N	2021-04-01 09:20:33.558921+08	\N	\N	1	2021-03-28
3489	-9	饮食	0	饮料	2021-04-01 09:21:12.764845+08	0	0	\N	2021-04-01 09:21:12.765215+08	\N	\N	1	2021-03-29
3490	-45	饮食	0	水果	2021-04-01 09:21:41.338862+08	0	0	\N	2021-04-01 09:21:41.339219+08	\N	\N	1	2021-03-29
3493	-1	交通出行	0	厦门BRT	2021-04-01 09:22:34.702622+08	0	0	\N	2021-04-01 09:22:34.702958+08	\N	\N	1	2021-03-29
3494	-6	交通出行	0	厦门地铁	2021-04-01 09:22:48.714734+08	0	0	\N	2021-04-01 09:22:48.715065+08	\N	\N	1	2021-03-29
3495	-10	饮食	0	火车兰花豆	2021-04-01 09:23:53.894616+08	0	0	\N	2021-04-01 09:23:53.894953+08	\N	\N	1	2021-03-29
3496	-48	饮食	0	火车盒饭	2021-04-01 09:24:08.384794+08	0	0	\N	2021-04-01 09:24:08.385142+08	\N	\N	1	2021-03-29
3497	-4	交通出行	0	地铁	2021-04-01 09:24:25.756764+08	0	0	\N	2021-04-01 09:24:25.757129+08	\N	\N	1	2021-03-29
3498	-5	通讯物流	0	手机充值	2021-04-01 09:24:51.28843+08	0	0	\N	2021-04-01 09:24:51.28878+08	\N	\N	1	2021-03-31
3499	-100	交通出行	0	手机充值	2021-04-01 09:25:06.214855+08	0	0	\N	2021-04-01 09:25:06.215155+08	\N	\N	1	2021-04-01
3500	-30	饮食	0	餐饮	2021-04-08 12:06:42.680146+08	0	0	\N	2021-04-08 12:06:42.682503+08	\N	\N	2	2021-03-29
3501	-180	饮食	0	水产	2021-04-08 12:06:57.814133+08	0	0	\N	2021-04-08 12:06:57.814519+08	\N	\N	2	2021-03-29
3502	-57	饮食	0	皮皮虾	2021-04-08 12:07:14.421062+08	0	0	\N	2021-04-08 12:07:14.421373+08	\N	\N	2	2021-03-29
3503	-60	饮食	0	加工费	2021-04-08 12:07:31.901288+08	0	0	\N	2021-04-08 12:07:31.90172+08	\N	\N	2	2021-03-29
3504	-66	饮食	0	水果	2021-04-08 12:08:00.906098+08	0	0	\N	2021-04-08 12:08:00.906432+08	\N	\N	2	2021-03-29
3505	-11	交通出行	0	出行	2021-04-08 12:08:19.928258+08	0	0	\N	2021-04-08 12:08:19.928584+08	\N	\N	2	2021-03-29
3506	-24	小孩文具	0	识字卡	2021-04-08 12:08:58.056339+08	0	0	\N	2021-04-08 12:08:58.056633+08	\N	\N	2	2021-03-30
3507	-23	饮食	0	美购	2021-04-08 12:09:23.575072+08	0	0	\N	2021-04-08 12:09:23.575363+08	\N	\N	2	2021-04-01
3508	-50	住房缴费	0	景湖电费	2021-04-08 12:09:44.347827+08	0	0	\N	2021-04-08 12:09:44.348145+08	\N	\N	2	2021-04-02
3509	-60	饮食	0	三只松鼠	2021-04-08 12:10:17.221779+08	0	0	\N	2021-04-08 12:10:17.222118+08	\N	\N	2	2021-04-03
3510	-11	饮食	0	饮料	2021-04-08 12:10:33.401764+08	0	0	\N	2021-04-08 12:10:33.402081+08	\N	\N	2	2021-04-03
3511	-92	住房缴费	0	东兴电费	2021-04-08 12:10:52.266154+08	0	0	\N	2021-04-08 12:10:52.26645+08	\N	\N	2	2021-04-03
3512	-177	服饰美容	0	鞋子	2021-04-08 12:11:10.779838+08	0	0	\N	2021-04-08 12:11:10.780129+08	\N	\N	2	2021-04-03
3513	-68	饮食	0	新江厦	2021-04-08 12:11:46.793831+08	0	0	\N	2021-04-08 12:11:46.794133+08	\N	\N	2	2021-04-04
3514	-60	饮食	0	西瓜	2021-04-08 12:12:03.580374+08	0	0	\N	2021-04-08 12:12:03.580667+08	\N	\N	2	2021-04-04
3515	-19	饮食	0	沙茶面	2021-04-08 12:13:09.093282+08	0	0	\N	2021-04-08 12:13:09.093591+08	\N	\N	2	2021-03-29
3516	-18	饮食	0	美团	2021-04-08 12:13:31.112888+08	0	0	\N	2021-04-08 12:13:31.113251+08	\N	\N	2	2021-03-30
3517	-150	交通出行	0	加油	2021-04-08 12:14:00.715583+08	0	0	\N	2021-04-08 12:14:00.715933+08	\N	\N	2	2021-03-31
3519	-38	饮食	0	耙耙柑	2021-04-08 12:15:06.931871+08	0	0	\N	2021-04-08 12:15:06.93217+08	\N	\N	2	2021-04-03
3520	-107	饮食	0	烧烤	2021-04-08 12:15:28.079805+08	0	0	\N	2021-04-08 12:15:28.080111+08	\N	\N	2	2021-04-06
3521	-568	服饰美容	0	衣服	2021-04-08 20:48:33.540629+08	0	0	\N	2021-04-08 20:48:33.540951+08	\N	\N	2	2021-04-08
3522	25918	收入	1	2020年提成	2021-04-08 20:49:03.729584+08	0	0	\N	2021-04-08 20:49:03.729912+08	\N	\N	2	2021-04-08
3523	-10	饮食	0	零食	2021-04-15 13:38:23.868619+08	0	0	\N	2021-04-15 13:38:23.870726+08	\N	\N	1	2021-04-03
3524	-130	宠物	0	宠物用品	2021-04-15 13:38:50.409064+08	0	0	\N	2021-04-15 13:38:50.40937+08	\N	\N	1	2021-04-06
3525	-7	饮食	0	肠粉	2021-04-15 13:39:14.261712+08	0	0	\N	2021-04-15 13:39:14.262034+08	\N	\N	1	2021-04-07
3526	-12	饮食	0	臭豆腐	2021-04-15 13:39:25.935112+08	0	0	\N	2021-04-15 13:39:25.93541+08	\N	\N	1	2021-04-07
3527	-29	饮食	0	美购	2021-04-15 13:39:48.097228+08	0	0	\N	2021-04-15 13:39:48.097554+08	\N	\N	1	2021-04-08
3528	-67	饮食	0	汤包	2021-04-15 13:40:05.150823+08	0	0	\N	2021-04-15 13:40:05.151144+08	\N	\N	1	2021-04-10
3529	-63	饮食	0	海鲜面	2021-04-15 13:40:22.555585+08	0	0	\N	2021-04-15 13:40:22.555884+08	\N	\N	1	2021-04-10
3530	-26	生活日用	0	扫地机器人配件	2021-04-15 13:40:54.083012+08	0	0	\N	2021-04-15 13:40:54.083305+08	\N	\N	1	2021-04-10
3531	-60	饮食	0	趴趴柑	2021-04-15 13:41:22.269976+08	0	0	\N	2021-04-15 13:41:22.270289+08	\N	\N	1	2021-04-11
3532	-161	饮食	0	春子园	2021-04-15 13:41:43.590992+08	0	0	\N	2021-04-15 13:41:43.591305+08	\N	\N	1	2021-04-11
3533	-880	小孩奶粉	0	卡洛塔尼奶粉X4	2021-04-15 13:43:04.224408+08	0	0	\N	2021-04-15 13:43:04.224728+08	\N	\N	1	2021-04-06
3534	-18	饮食	0	矿泉水	2021-04-15 13:43:43.704603+08	0	0	\N	2021-04-15 13:43:43.704899+08	\N	\N	1	2021-04-10
3535	-5	饮食	0	零食	2021-04-15 13:44:11.219811+08	0	0	\N	2021-04-15 13:44:11.220122+08	\N	\N	1	2021-04-10
3536	14936	收入	1	工资	2021-04-15 13:45:34.417306+08	0	0	\N	2021-04-15 13:45:34.41766+08	\N	\N	1	2021-04-15
3537	-30	服饰美容	0	裤子	2021-04-19 14:45:50.12534+08	0	0	\N	2021-04-19 14:45:50.12777+08	\N	\N	2	2021-04-09
3538	-30	饮食	0	零食	2021-04-19 14:46:13.035998+08	0	0	\N	2021-04-19 14:46:13.036308+08	\N	\N	2	2021-04-10
3539	-39	饮食	0	美购	2021-04-19 14:46:29.025414+08	0	0	\N	2021-04-19 14:46:29.02573+08	\N	\N	2	2021-04-11
3540	-98	文教娱乐	0	教程	2021-04-19 14:46:50.914801+08	0	0	\N	2021-04-19 14:46:50.915096+08	\N	\N	2	2021-04-13
3541	-100	住房缴费	0	违章缴费	2021-04-19 14:47:29.845365+08	0	0	\N	2021-04-19 14:47:29.84568+08	\N	\N	2	2021-04-14
3542	-270	交通出行	0	汽车年检	2021-04-19 14:47:56.56563+08	0	0	\N	2021-04-19 14:47:56.565951+08	\N	\N	2	2021-04-15
3543	-5	饮食	0	停车费	2021-04-19 14:49:22.561128+08	0	0	\N	2021-04-19 14:49:22.561485+08	\N	\N	2	2021-04-15
3544	-13	饮食	0	寻茶说	2021-04-19 14:49:42.305789+08	0	0	\N	2021-04-19 14:49:42.30611+08	\N	\N	2	2021-04-15
3545	-30	饮食	0	水果	2021-04-19 14:50:06.045732+08	0	0	\N	2021-04-19 14:50:06.046078+08	\N	\N	2	2021-04-17
3546	-35	饮食	0	零食	2021-04-19 14:50:19.615799+08	0	0	\N	2021-04-19 14:50:19.616127+08	\N	\N	2	2021-04-17
3547	-20	饮食	0	汉堡	2021-04-19 14:50:33.030647+08	0	0	\N	2021-04-19 14:50:33.030953+08	\N	\N	2	2021-04-17
3548	-31	饮食	0	粉粉乐	2021-04-19 14:50:57.665782+08	0	0	\N	2021-04-19 14:50:57.666119+08	\N	\N	2	2021-04-18
3549	-195	饮食	0	版急超市	2021-04-19 14:51:26.325779+08	0	0	\N	2021-04-19 14:51:26.326129+08	\N	\N	2	2021-04-18
3550	-78	饮食	0	晚饭	2021-04-19 14:51:45.545513+08	0	0	\N	2021-04-19 14:51:45.545843+08	\N	\N	2	2021-04-18
3551	-94	服饰美容	0	生活用品	2021-04-19 14:52:05.430906+08	0	0	\N	2021-04-19 14:52:05.431216+08	\N	\N	2	2021-04-19
3552	-40	饮食	0	肯德基	2021-04-19 14:52:34.155132+08	0	0	\N	2021-04-19 14:52:34.155429+08	\N	\N	2	2021-04-10
3553	-200	饮食	0	加油	2021-04-19 14:54:00.568044+08	0	0	\N	2021-04-19 14:54:00.568363+08	\N	\N	2	2021-04-12
3554	-40	服饰美容	0	衣服	2021-04-19 14:54:21.123976+08	0	0	\N	2021-04-19 14:54:21.124272+08	\N	\N	2	2021-04-13
3555	-28	饮食	0	牛肉面	2021-04-19 14:55:12.286515+08	0	0	\N	2021-04-19 14:55:12.286832+08	\N	\N	2	2021-04-15
3556	-11	饮食	0	O2	2021-04-19 14:59:19.196662+08	0	0	\N	2021-04-19 14:59:19.197036+08	\N	\N	2	2021-04-15
3557	-128	饮食	0	饮食	2021-04-19 14:59:54.035132+08	0	0	\N	2021-04-19 14:59:54.035425+08	\N	\N	2	2021-04-18
3558	-5	饮食	0	零食	2021-04-23 22:02:37.021976+08	0	0	\N	2021-04-23 22:02:37.024292+08	\N	\N	2	2021-04-20
3559	-230	生活日用	0	电风扇	2021-04-23 22:02:55.741726+08	0	0	\N	2021-04-23 22:02:55.742058+08	\N	\N	2	2021-04-21
3560	-243	饮食	0	春子园	2021-04-23 22:03:47.505873+08	0	0	\N	2021-04-23 22:03:47.506193+08	\N	\N	2	2021-04-23
3561	-194	服饰美容	0	唯品会包包	2021-04-23 22:04:24.63106+08	0	0	\N	2021-04-23 22:04:24.631428+08	\N	\N	2	2021-04-19
3562	-9	通讯物流	0	快递	2021-04-23 22:04:48.138177+08	0	0	\N	2021-04-23 22:04:48.138491+08	\N	\N	2	2021-04-21
3563	-37	饮食	0	水果	2021-04-23 22:05:08.726474+08	0	0	\N	2021-04-23 22:05:08.726785+08	\N	\N	2	2021-04-21
3565	2900	收入	1	3月工资	2021-04-23 22:05:58.788074+08	0	0	\N	2021-04-23 22:05:58.78837+08	\N	\N	2	2021-04-22
3566	13122	收入	1	2020年提成	2021-04-23 22:08:34.274429+08	0	0	\N	2021-04-23 22:08:34.274783+08	\N	\N	2	2021-04-16
3567	-7083	健康保险	0	重疾险	2021-04-24 19:29:09.532847+08	0	0	\N	2021-04-24 19:29:09.535145+08	\N	\N	2	2021-04-24
3568	-296	健康保险	0	一年保险	2021-04-24 19:29:20.059132+08	0	0	\N	2021-04-24 19:29:20.059471+08	\N	\N	2	2021-04-24
3569	-3482	健康保险	0	车险	2021-04-24 19:30:56.134648+08	0	0	\N	2021-04-24 19:30:56.134968+08	\N	\N	2	2021-04-24
3570	-17	生活日用	0	玩具	2021-04-24 19:31:24.191161+08	0	0	\N	2021-04-24 19:31:24.191477+08	\N	\N	2	2021-04-24
3571	-36	饮食	0	酸菜鱼	2021-04-24 19:31:39.965986+08	0	0	\N	2021-04-24 19:31:39.966309+08	\N	\N	2	2021-04-24
3572	-24	饮食	0	酸奶	2021-04-24 19:31:50.68736+08	0	0	\N	2021-04-24 19:31:50.687691+08	\N	\N	2	2021-04-24
3573	-10	生活日用	0	手机壳	2021-04-24 19:32:31.368074+08	0	0	\N	2021-04-24 19:32:31.368381+08	\N	\N	2	2021-04-24
3574	-24	小孩玩具	0	识字卡	2021-04-24 19:32:42.375434+08	0	0	\N	2021-04-24 19:32:42.375805+08	\N	\N	2	2021-04-24
3575	-209	健康保险	0	维生素	2021-04-24 19:49:54.027256+08	0	0	\N	2021-04-24 19:49:54.027598+08	\N	\N	2	2021-04-24
3576	-7	小孩文具	0	蚕宝宝	2021-04-25 11:38:52.830839+08	0	0	\N	2021-04-25 11:38:52.833264+08	\N	\N	1	2021-04-15
3577	-40	生活日用	0	泡脚粉	2021-04-25 11:39:16.70865+08	0	0	\N	2021-04-25 11:39:16.709006+08	\N	\N	1	2021-04-15
3578	-25	饮食	0	零食	2021-04-25 11:40:14.389317+08	0	0	\N	2021-04-25 11:40:14.389646+08	\N	\N	1	2021-04-17
3579	-100	饮食	0	老婆大人	2021-04-29 06:43:03.070659+08	0	0	\N	2021-04-29 06:43:03.073046+08	\N	\N	2	2021-04-25
3580	-200	交通出行	0	加油	2021-04-29 06:44:33.571133+08	0	0	\N	2021-04-29 06:44:33.571469+08	\N	\N	2	2021-04-25
3581	-1000	交通出行	0	油卡	2021-04-29 06:47:31.3485+08	0	0	\N	2021-04-29 06:47:31.348817+08	\N	\N	2	2021-04-25
3582	-500	交通出行	0	油卡	2021-04-29 06:47:52.025071+08	0	0	\N	2021-04-29 06:47:52.025388+08	\N	\N	2	2021-04-25
3583	-5	饮食	0	葱油饼	2021-05-02 17:54:21.686321+08	0	0	\N	2021-05-02 17:54:21.688669+08	\N	\N	2	2021-04-29
3584	-3	交通出行	0	停车费	2021-05-02 17:54:41.626333+08	0	0	\N	2021-05-02 17:54:41.626648+08	\N	\N	2	2021-04-29
3585	-200	小孩服饰	0	鞋子	2021-05-02 17:55:00.589324+08	0	0	\N	2021-05-02 17:55:00.589652+08	\N	\N	2	2021-04-30
3586	-29	饮食	0	三只松鼠	2021-05-02 17:55:34.051821+08	0	0	\N	2021-05-02 17:55:34.052132+08	\N	\N	2	2021-04-30
3587	-100	饮食	0	老婆大人	2021-05-02 17:55:47.86791+08	0	0	\N	2021-05-02 17:55:47.868221+08	\N	\N	2	2021-04-30
3588	-5	通讯物流	0	话费	2021-05-02 17:56:21.930837+08	0	0	\N	2021-05-02 17:56:21.931133+08	\N	\N	2	2021-05-01
3589	-17	生活日用	0	收纳盒	2021-05-02 17:56:42.770701+08	0	0	\N	2021-05-02 17:56:42.771037+08	\N	\N	2	2021-05-01
3590	-644	饮食	0	火锅	2021-05-02 17:56:58.375535+08	0	0	\N	2021-05-02 17:56:58.375856+08	\N	\N	2	2021-05-01
3591	-6	饮食	0	香肠	2021-05-02 17:57:12.498555+08	0	0	\N	2021-05-02 17:57:12.498866+08	\N	\N	2	2021-05-01
3592	-10	住房缴费	0	景湖水岸水费	2021-05-02 17:57:39.55023+08	0	0	\N	2021-05-02 17:57:39.550533+08	\N	\N	2	2021-05-02
3593	-20	通讯物流	0	话费	2021-05-02 17:57:57.370193+08	0	0	\N	2021-05-02 17:57:57.370492+08	\N	\N	2	2021-05-02
3594	-42	生活日用	0	汉堡机	2021-05-02 17:58:10.009335+08	0	0	\N	2021-05-02 17:58:10.009642+08	\N	\N	2	2021-05-02
3595	-91	住房缴费	0	东兴电费	2021-05-02 17:58:32.227609+08	0	0	\N	2021-05-02 17:58:32.227914+08	\N	\N	2	2021-05-02
3596	-32	住房缴费	0	景湖电费	2021-05-02 17:58:46.816171+08	0	0	\N	2021-05-02 17:58:46.816539+08	\N	\N	2	2021-05-02
3597	-61	饮食	0	西瓜	2021-05-02 17:59:28.748877+08	0	0	\N	2021-05-02 17:59:28.749238+08	\N	\N	2	2021-04-29
3598	-9	饮食	0	肯德基	2021-05-02 17:59:47.963772+08	0	0	\N	2021-05-02 17:59:47.964072+08	\N	\N	2	2021-04-30
3599	-134	饮食	0	阪急	2021-05-08 10:54:03.17101+08	0	0	\N	2021-05-08 10:54:03.17342+08	\N	\N	1	2021-04-25
3600	-366	服饰美容	0	优衣库	2021-05-08 10:54:24.406654+08	0	0	\N	2021-05-08 10:54:24.406991+08	\N	\N	1	2021-04-30
3601	-30	饮食	0	西瓜	2021-05-08 10:54:42.650461+08	0	0	\N	2021-05-08 10:54:42.650788+08	\N	\N	1	2021-05-03
3602	-18	饮食	0	零食	2021-05-08 10:55:30.88125+08	0	0	\N	2021-05-08 10:55:30.881548+08	\N	\N	1	2021-05-03
3603	-18	饮食	0	巴必屋	2021-05-08 10:55:58.957312+08	0	0	\N	2021-05-08 10:55:58.95763+08	\N	\N	1	2021-05-05
3604	-6	饮食	0	冰淇淋	2021-05-08 10:56:12.811913+08	0	0	\N	2021-05-08 10:56:12.81224+08	\N	\N	1	2021-05-05
3605	-18	饮食	0	古茗	2021-05-08 10:57:13.220061+08	0	0	\N	2021-05-08 10:57:13.220396+08	\N	\N	1	2021-05-05
3606	-23	饮食	0	戏文零食	2021-05-08 10:57:55.449765+08	0	0	\N	2021-05-08 10:57:55.450061+08	\N	\N	1	2021-05-05
3607	-70	生活日用	0	眼镜X2	2021-05-08 10:58:14.316292+08	0	0	\N	2021-05-08 10:58:14.316655+08	\N	\N	1	2021-05-07
3608	-194	宠物	0	兔粮	2021-05-08 10:58:33.855983+08	0	0	\N	2021-05-08 10:58:33.856281+08	\N	\N	1	2021-05-07
3609	-25	饮食	0	牛排面	2021-05-08 10:58:49.320123+08	0	0	\N	2021-05-08 10:58:49.320478+08	\N	\N	1	2021-05-08
3610	-33	饮食	0	麦当劳	2021-05-08 10:59:39.170936+08	0	0	\N	2021-05-08 10:59:39.171306+08	\N	\N	1	2021-05-04
3611	-15	饮食	0	鸡柳	2021-05-08 10:59:59.310687+08	0	0	\N	2021-05-08 10:59:59.311007+08	\N	\N	1	2021-05-05
3612	-21	饮食	0	零食	2021-05-08 11:00:24.791647+08	0	0	\N	2021-05-08 11:00:24.791943+08	\N	\N	1	2021-05-05
3613	-308	小孩服饰	0	衣服	2021-05-11 12:51:37.892715+08	0	0	\N	2021-05-11 12:51:37.912983+08	\N	\N	2	2021-05-03
3614	-144	饮食	0	衣服	2021-05-11 12:51:54.442057+08	0	0	\N	2021-05-11 12:51:54.442424+08	\N	\N	2	2021-05-03
3615	-17	饮食	0	古茗	2021-05-11 12:53:13.809701+08	0	0	\N	2021-05-11 12:53:13.810078+08	\N	\N	2	2021-05-03
3616	-706	服饰美容	0	衣服鞋子	2021-05-11 12:53:39.032353+08	0	0	\N	2021-05-11 12:53:39.032656+08	\N	\N	2	2021-05-04
3617	-369	服饰美容	0	鞋子	2021-05-11 12:54:00.091325+08	0	0	\N	2021-05-11 12:54:00.091657+08	\N	\N	2	2021-05-04
3618	-17	饮食	0	古茗	2021-05-11 12:54:17.815439+08	0	0	\N	2021-05-11 12:54:17.815823+08	\N	\N	2	2021-05-05
3619	-33	生活日用	0	电子称	2021-05-11 12:54:43.192078+08	0	0	\N	2021-05-11 12:54:43.19244+08	\N	\N	2	2021-05-05
3620	-498	服饰美容	0	护肤品	2021-05-11 12:55:07.782162+08	0	0	\N	2021-05-11 12:55:07.7825+08	\N	\N	2	2021-05-08
3621	-21	生活日用	0	iPad壳	2021-05-11 12:55:31.829787+08	0	0	\N	2021-05-11 12:55:31.83014+08	\N	\N	2	2021-05-08
3622	-17	饮食	0	棉签	2021-05-11 12:55:53.491764+08	0	0	\N	2021-05-11 12:55:53.492075+08	\N	\N	2	2021-05-08
3623	-79	生活日用	0	会员费	2021-05-11 12:58:00.180865+08	0	0	\N	2021-05-11 12:58:00.181204+08	\N	\N	2	2021-05-03
3624	-150	服饰美容	0	公公衣服	2021-05-11 12:58:25.832101+08	0	0	\N	2021-05-11 12:58:25.832409+08	\N	\N	2	2021-05-04
3625	-21	饮食	0	早餐	2021-05-11 13:02:00.166842+08	0	0	\N	2021-05-11 13:02:00.167161+08	\N	\N	2	2021-05-11
3626	-34	住房缴费	0	东兴水费	2021-05-21 17:51:00.861077+08	0	0	\N	2021-05-21 17:51:00.897037+08	\N	\N	2	2021-05-13
3627	-23	生活日用	0	置物架	2021-05-21 17:51:14.298917+08	0	0	\N	2021-05-21 17:51:14.299271+08	\N	\N	2	2021-05-13
3628	-200	住房缴费	0	天然气充值	2021-05-21 17:51:50.511077+08	0	0	\N	2021-05-21 17:51:50.511427+08	\N	\N	2	2021-05-15
3629	-20	小孩玩具	0	玩具	2021-05-21 17:52:05.020989+08	0	0	\N	2021-05-21 17:52:05.021335+08	\N	\N	2	2021-05-15
3630	-14	生活日用	0	双v	2021-05-21 17:52:44.25054+08	0	0	\N	2021-05-21 17:52:44.250894+08	\N	\N	2	2021-05-15
3631	-3	交通出行	0	停车费	2021-05-21 17:53:10.304138+08	0	0	\N	2021-05-21 17:53:10.304499+08	\N	\N	2	2021-05-16
3632	-31	饮食	0	水果	2021-05-21 17:53:27.906343+08	0	0	\N	2021-05-21 17:53:27.906662+08	\N	\N	2	2021-05-16
3633	-6	生活日用	0	桌垫	2021-05-21 17:53:50.07575+08	0	0	\N	2021-05-21 17:53:50.076058+08	\N	\N	2	2021-05-18
3634	-31	生活日用	0	置物架	2021-05-21 17:54:45.504746+08	0	0	\N	2021-05-21 17:54:45.505106+08	\N	\N	2	2021-05-18
3635	-56	饮食	0	美购	2021-05-21 17:55:01.499895+08	0	0	\N	2021-05-21 17:55:01.500222+08	\N	\N	2	2021-05-18
3636	-374	服饰美容	0	迪卡侬	2021-05-21 19:35:19.625889+08	0	0	\N	2021-05-21 19:35:19.626209+08	\N	\N	2	2021-05-15
3637	-8	交通出行	0	停车费	2021-05-21 19:35:37.515856+08	0	0	\N	2021-05-21 19:35:37.516174+08	\N	\N	2	2021-05-16
3638	-35	饮食	0	蓝莓	2021-05-21 19:35:54.756143+08	0	0	\N	2021-05-21 19:35:54.756446+08	\N	\N	2	2021-05-16
3639	-123	生活日用	0	京东到家油	2021-05-21 19:36:25.767807+08	0	0	\N	2021-05-21 19:36:25.768137+08	\N	\N	2	2021-05-20
3640	-169	生活日用	0	电风扇	2021-05-21 19:36:41.35073+08	0	0	\N	2021-05-21 19:36:41.351039+08	\N	\N	2	2021-05-21
3641	-90	饮食	0	牛奶	2021-05-21 19:36:48.656122+08	0	0	\N	2021-05-21 19:36:48.656449+08	\N	\N	2	2021-05-21
3642	-49	饮食	0	美团	2021-05-21 19:38:43.550412+08	0	0	\N	2021-05-21 19:38:43.550744+08	\N	\N	2	2021-05-21
3643	-1000	健康保险	0	牙膜	2021-05-30 14:26:13.101482+08	0	0	\N	2021-05-30 14:26:13.103784+08	\N	\N	2	2021-05-22
3644	-39	饮食	0	拼多多	2021-05-30 14:26:55.214582+08	0	0	\N	2021-05-30 14:26:55.214961+08	\N	\N	2	2021-05-23
3645	-6	饮食	0	土豆	2021-05-30 14:27:38.289434+08	0	0	\N	2021-05-30 14:27:38.28983+08	\N	\N	2	2021-05-23
3646	-30	生活日用	0	笔记本支架	2021-05-30 14:28:04.572061+08	0	0	\N	2021-05-30 14:28:04.57238+08	\N	\N	2	2021-05-25
3647	-20	生活日用	0	碗	2021-05-30 14:28:22.503751+08	0	0	\N	2021-05-30 14:28:22.504052+08	\N	\N	2	2021-05-25
3648	-20	生活日用	0	碗	2021-05-30 14:28:40.75758+08	0	0	\N	2021-05-30 14:28:40.757883+08	\N	\N	2	2021-05-25
3649	-10	生活日用	0	碗	2021-05-30 14:28:58.131908+08	0	0	\N	2021-05-30 14:28:58.132217+08	\N	\N	2	2021-05-25
3650	-9	饮食	0	早餐	2021-05-30 14:29:22.595943+08	0	0	\N	2021-05-30 14:29:22.596265+08	\N	\N	2	2021-05-27
3651	-17	健康保险	0	医保挂号	2021-05-30 14:29:48.047058+08	0	0	\N	2021-05-30 14:29:48.04739+08	\N	\N	2	2021-05-27
3652	-2	交通出行	0	停车费	2021-05-30 14:30:13.256656+08	0	0	\N	2021-05-30 14:30:13.257003+08	\N	\N	2	2021-05-27
3653	-10	健康保险	0	挂号	2021-05-30 14:30:26.839883+08	0	0	\N	2021-05-30 14:30:26.840178+08	\N	\N	2	2021-05-27
3654	-5	交通出行	0	停车费	2021-05-30 14:30:44.60797+08	0	0	\N	2021-05-30 14:30:44.608278+08	\N	\N	2	2021-05-27
3655	-13	生活日用	0	杯刷	2021-05-30 14:31:05.613531+08	0	0	\N	2021-05-30 14:31:05.613873+08	\N	\N	2	2021-05-28
3656	-20	生活日用	0	玻璃水	2021-05-30 14:31:18.146235+08	0	0	\N	2021-05-30 14:31:18.146579+08	\N	\N	2	2021-05-29
3657	-11	生活日用	0	发泡	2021-05-30 14:31:50.17472+08	0	0	\N	2021-05-30 14:31:50.175073+08	\N	\N	2	2021-05-30
3658	-13	生活日用	0	塑封膜	2021-05-30 14:32:04.609095+08	0	0	\N	2021-05-30 14:32:04.609408+08	\N	\N	2	2021-05-30
3659	-99	交通出行	0	水上乐园	2021-05-30 14:35:09.979047+08	0	0	\N	2021-05-30 14:35:09.979375+08	\N	\N	2	2021-05-22
3660	-3	交通出行	0	停车费	2021-05-30 14:35:30.258245+08	0	0	\N	2021-05-30 14:35:30.258638+08	\N	\N	2	2021-05-22
3661	-739	生活日用	0	山姆	2021-05-30 14:35:52.131299+08	0	0	\N	2021-05-30 14:35:52.131626+08	\N	\N	2	2021-05-22
3662	-20	饮食	0	牛肉卷	2021-05-30 14:36:05.594516+08	0	0	\N	2021-05-30 14:36:05.594844+08	\N	\N	2	2021-05-22
3663	-10	饮食	0	山姆果汁	2021-05-30 14:36:28.492029+08	0	0	\N	2021-05-30 14:36:28.492344+08	\N	\N	2	2021-05-22
3664	-5	饮食	0	年糕	2021-05-30 14:37:06.774583+08	0	0	\N	2021-05-30 14:37:06.774978+08	\N	\N	2	2021-05-23
3665	-79	服饰美容	0	衣服	2021-05-30 14:37:22.75016+08	0	0	\N	2021-05-30 14:37:22.750481+08	\N	\N	2	2021-05-23
3666	-30	饮食	0	寿司	2021-05-30 14:37:39.75861+08	0	0	\N	2021-05-30 14:37:39.758906+08	\N	\N	2	2021-05-23
3667	-16	饮食	0	饼	2021-05-30 14:37:58.065536+08	0	0	\N	2021-05-30 14:37:58.065894+08	\N	\N	2	2021-05-23
3668	-16	饮食	0	群主酸菜鱼	2021-05-30 14:38:20.856601+08	0	0	\N	2021-05-30 14:38:20.856921+08	\N	\N	2	2021-05-23
3669	2300	收入	1	多得到	2021-05-30 14:38:53.870865+08	0	0	\N	2021-05-30 14:38:53.871165+08	\N	\N	2	2021-05-26
3670	-4	饮食	0	蔬菜	2021-05-30 14:39:13.486345+08	0	0	\N	2021-05-30 14:39:13.486712+08	\N	\N	2	2021-05-29
3671	-250	饮食	0	美团	2021-05-30 14:42:16.7132+08	0	0	\N	2021-05-30 14:42:16.71352+08	\N	\N	2	2021-05-30
3672	4297	收入	1	4月工资	2021-05-30 14:43:04.235614+08	0	0	\N	2021-05-30 14:43:04.235925+08	\N	\N	2	2021-05-25
3673	-19	生活日用	0	双v雨伞	2021-05-30 15:06:16.133264+08	0	0	\N	2021-05-30 15:06:16.1336+08	\N	\N	2	2021-05-30
3674	-10	饮食	0	早餐	2021-05-31 09:51:52.706059+08	0	0	\N	2021-05-31 09:51:52.708336+08	\N	\N	1	2021-05-10
3675	-23	饮食	0	水果	2021-05-31 09:52:10.84562+08	0	0	\N	2021-05-31 09:52:10.84593+08	\N	\N	1	2021-05-12
3676	-196	饮食	0	阪急	2021-05-31 09:52:33.376261+08	0	0	\N	2021-05-31 09:52:33.376568+08	\N	\N	1	2021-05-14
3677	-918	生活日用	0	buds pro	2021-05-31 09:52:54.600567+08	0	0	\N	2021-05-31 09:52:54.600876+08	\N	\N	1	2021-05-14
3678	-29	生活日用	0	超市	2021-05-31 09:53:43.191483+08	0	0	\N	2021-05-31 09:53:43.19179+08	\N	\N	1	2021-05-15
3679	-249	生活日用	0	fit2手环	2021-05-31 09:54:18.886893+08	0	0	\N	2021-05-31 09:54:18.8872+08	\N	\N	1	2021-05-19
3680	-15	饮食	0	早餐	2021-05-31 09:54:50.20998+08	0	0	\N	2021-05-31 09:54:50.210283+08	\N	\N	1	2021-05-20
3681	-5	交通出行	0	停车费	2021-05-31 09:55:31.405562+08	0	0	\N	2021-05-31 09:55:31.405867+08	\N	\N	1	2021-05-22
3682	-31	饮食	0	生日蛋糕	2021-05-31 09:55:58.407476+08	0	0	\N	2021-05-31 09:55:58.407817+08	\N	\N	1	2021-05-24
3683	-8	交通出行	0	停车费	2021-05-31 09:56:13.806603+08	0	0	\N	2021-05-31 09:56:13.806926+08	\N	\N	1	2021-05-24
3684	-16	饮食	0	早餐	2021-05-31 09:56:30.015456+08	0	0	\N	2021-05-31 09:56:30.015788+08	\N	\N	1	2021-05-27
3685	-180	生活日用	0	闲鱼fit2	2021-05-31 09:56:57.731039+08	0	0	\N	2021-05-31 09:56:57.731366+08	\N	\N	1	2021-05-28
3686	-160	生活日用	0	ghelper会员一年	2021-05-31 09:57:44.640865+08	0	0	\N	2021-05-31 09:57:44.641217+08	\N	\N	1	2021-05-28
3687	-15	交通出行	0	打车	2021-05-31 09:57:59.980993+08	0	0	\N	2021-05-31 09:57:59.981325+08	\N	\N	1	2021-05-28
3688	-60	饮食	0	牛肉	2021-05-31 09:58:15.905383+08	0	0	\N	2021-05-31 09:58:15.905707+08	\N	\N	1	2021-05-29
3689	-35	饮食	0	虾	2021-05-31 09:58:31.021589+08	0	0	\N	2021-05-31 09:58:31.021936+08	\N	\N	1	2021-05-29
3690	-2	饮食	0	黄瓜	2021-05-31 09:58:43.740886+08	0	0	\N	2021-05-31 09:58:43.741249+08	\N	\N	1	2021-05-29
3691	-99	生活日用	0	水上乐园季票	2021-05-31 09:59:30.36056+08	0	0	\N	2021-05-31 09:59:30.360866+08	\N	\N	1	2021-05-28
3692	-75	生活日用	0	美购	2021-06-03 21:31:29.303723+08	0	0	\N	2021-06-03 21:31:29.306053+08	\N	\N	2	2021-05-30
3693	-300	饮食	0	欧文充值	2021-06-03 21:31:47.141362+08	0	0	\N	2021-06-03 21:31:47.141684+08	\N	\N	2	2021-06-02
3694	-318	小孩玩具	0	旺旺队	2021-06-03 21:33:16.00633+08	0	0	\N	2021-06-03 21:33:16.006659+08	\N	\N	2	2021-06-03
3695	-132	生活日用	0	眼镜	2021-06-03 21:33:33.160868+08	0	0	\N	2021-06-03 21:33:33.161228+08	\N	\N	2	2021-06-03
3696	-54	住房缴费	0	景湖水费	2021-06-03 21:33:56.831949+08	0	0	\N	2021-06-03 21:33:56.83227+08	\N	\N	2	2021-06-03
3697	-84	住房缴费	0	东兴电费	2021-06-03 21:34:16.019807+08	0	0	\N	2021-06-03 21:34:16.02011+08	\N	\N	2	2021-06-03
3698	-100	通讯物流	0	话费	2021-06-03 21:34:31.794184+08	0	0	\N	2021-06-03 21:34:31.794535+08	\N	\N	2	2021-06-03
3699	-248	饮食	0	蛋糕	2021-06-03 21:34:46.711027+08	0	0	\N	2021-06-03 21:34:46.711393+08	\N	\N	2	2021-06-03
3700	-88	文教娱乐	0	88VIP天猫	2021-06-09 17:31:08.771638+08	0	0	\N	2021-06-09 17:31:08.773948+08	\N	\N	2	2021-06-05
3701	-89	服饰美容	0	回力鞋	2021-06-09 17:31:25.320454+08	0	0	\N	2021-06-09 17:31:25.320765+08	\N	\N	2	2021-06-05
3702	-30	服饰美容	0	儿童袜子	2021-06-09 17:31:42.745212+08	0	0	\N	2021-06-09 17:31:42.745545+08	\N	\N	2	2021-06-05
3703	-64	饮食	0	叮咚买菜	2021-06-09 17:32:05.380762+08	0	0	\N	2021-06-09 17:32:05.38111+08	\N	\N	2	2021-06-06
3704	-62	饮食	0	叮咚买菜	2021-06-09 17:32:18.690557+08	0	0	\N	2021-06-09 17:32:18.690965+08	\N	\N	2	2021-06-06
3705	-19	生活日用	0	数据线	2021-06-09 17:32:38.971134+08	0	0	\N	2021-06-09 17:32:38.971464+08	\N	\N	2	2021-06-07
3706	-20	饮食	0	百果园	2021-06-09 17:32:54.212123+08	0	0	\N	2021-06-09 17:32:54.212437+08	\N	\N	2	2021-06-07
3707	-169	服饰美容	0	衣服	2021-06-09 17:33:08.525341+08	0	0	\N	2021-06-09 17:33:08.525702+08	\N	\N	2	2021-06-08
3708	-180	通讯物流	0	话费	2021-06-09 17:34:33.226253+08	0	0	\N	2021-06-09 17:34:33.226585+08	\N	\N	2	2021-06-08
3709	-180	通讯物流	0	话费	2021-06-09 17:34:43.350667+08	0	0	\N	2021-06-09 17:34:43.350966+08	\N	\N	2	2021-06-09
3710	-180	通讯物流	0	话费	2021-06-09 17:34:52.644877+08	0	0	\N	2021-06-09 17:34:52.645233+08	\N	\N	2	2021-06-09
3711	-8	交通出行	0	停车费	2021-06-15 09:26:03.566638+08	0	0	\N	2021-06-15 09:26:03.568925+08	\N	\N	1	2021-05-31
3712	-40	生活日用	0	无线鼠键	2021-06-15 09:26:29.286249+08	0	0	\N	2021-06-15 09:26:29.286644+08	\N	\N	1	2021-06-01
3713	-15	饮食	0	零食	2021-06-15 09:27:31.999215+08	0	0	\N	2021-06-15 09:27:31.99953+08	\N	\N	1	2021-06-05
3714	-1560	饮食	0	妈妈生日	2021-06-15 09:27:47.215039+08	0	0	\N	2021-06-15 09:27:47.21533+08	\N	\N	1	2021-06-05
3715	-241	饮食	0	阪急	2021-06-15 09:28:07.655231+08	0	0	\N	2021-06-15 09:28:07.655563+08	\N	\N	1	2021-06-10
3716	-1	生活日用	0	网易云首月VIP	2021-06-15 09:28:55.816106+08	0	0	\N	2021-06-15 09:28:55.81645+08	\N	\N	1	2021-06-03
3717	-270	生活日用	0	飞利浦电动牙刷	2021-06-15 09:29:59.874727+08	0	0	\N	2021-06-15 09:29:59.87504+08	\N	\N	1	2021-06-10
3718	16123	收入	1	工资	2021-06-15 09:31:50.191164+08	0	0	\N	2021-06-15 09:32:33.320046+08	\N	\N	1	2021-05-14
3719	15593	收入	1	工资	2021-06-15 11:33:43.674684+08	0	0	\N	2021-06-15 11:33:43.675011+08	\N	\N	1	2021-06-15
3720	-55	生活日用	0	洗衣液	2021-06-15 12:12:36.567788+08	0	0	\N	2021-06-15 12:12:36.568106+08	\N	\N	2	2021-06-11
3721	-1162	健康保险	0	体检	2021-06-15 12:13:03.252522+08	0	0	\N	2021-06-15 12:13:03.252837+08	\N	\N	2	2021-06-12
3722	-8	生活日用	0	保鲜盒	2021-06-15 12:13:23.095852+08	0	0	\N	2021-06-15 12:13:23.096167+08	\N	\N	2	2021-06-13
3723	-23	生活日用	0	袋子	2021-06-15 12:13:36.367824+08	0	0	\N	2021-06-15 12:13:36.368158+08	\N	\N	2	2021-06-12
3724	-83	服饰美容	0	连衣裙	2021-06-15 12:13:55.110093+08	0	0	\N	2021-06-15 12:13:55.110407+08	\N	\N	2	2021-06-13
3725	-26	饮食	0	美团外卖	2021-06-15 12:14:11.21359+08	0	0	\N	2021-06-15 12:14:11.213917+08	\N	\N	2	2021-06-14
3726	-19	生活日用	0	碗	2021-06-15 12:14:52.635448+08	0	0	\N	2021-06-15 12:14:52.635759+08	\N	\N	2	2021-06-13
3727	-201	生活日用	0	牙刷头	2021-06-15 12:15:54.506244+08	0	0	\N	2021-06-15 12:15:54.506581+08	\N	\N	2	2021-06-10
3728	-143	生活日用	0	电蒸锅奶奶	2021-06-15 12:16:17.467417+08	0	0	\N	2021-06-15 12:16:17.467773+08	\N	\N	2	2021-06-10
3729	-39	饮食	0	牛奶	2021-06-15 12:16:30.06022+08	0	0	\N	2021-06-15 12:16:30.060548+08	\N	\N	2	2021-06-13
3730	-134	小孩生活用品	0	水杯	2021-06-19 15:00:12.651259+08	0	0	\N	2021-06-19 15:00:12.65353+08	\N	\N	2	2021-06-16
3731	-23	生活日用	0	垃圾桶	2021-06-19 15:00:55.990583+08	0	0	\N	2021-06-19 15:00:55.990893+08	\N	\N	2	2021-06-16
3732	-75	小孩健康	0	医院	2021-06-19 15:01:15.440944+08	0	0	\N	2021-06-19 15:01:15.441283+08	\N	\N	2	2021-06-16
3733	-15	交通出行	0	停车费	2021-06-19 15:01:38.460788+08	0	0	\N	2021-06-19 15:01:38.461128+08	\N	\N	2	2021-06-16
3734	-199	饮食	0	特仑苏5箱	2021-06-19 15:01:59.305961+08	0	0	\N	2021-06-19 15:01:59.306267+08	\N	\N	2	2021-06-16
3735	-104	生活日用	0	餐巾纸抽纸	2021-06-19 15:02:32.182034+08	0	0	\N	2021-06-19 15:02:32.182356+08	\N	\N	2	2021-06-17
3736	-18	小孩健康	0	雾化	2021-06-19 15:02:55.625378+08	0	0	\N	2021-06-19 15:02:55.625698+08	\N	\N	2	2021-06-17
3737	-15	饮食	0	午餐	2021-06-19 15:03:10.033749+08	0	0	\N	2021-06-19 15:03:10.034056+08	\N	\N	2	2021-06-17
3738	-101	饮食	0	金龙鱼油	2021-06-19 15:03:32.001253+08	0	0	\N	2021-06-19 15:03:32.001574+08	\N	\N	2	2021-06-18
3739	-30	生活日用	0	电池	2021-06-19 15:03:51.397648+08	0	0	\N	2021-06-19 15:03:51.397958+08	\N	\N	2	2021-06-18
3740	-195	饮食	0	火锅	2021-06-19 15:04:07.68778+08	0	0	\N	2021-06-19 15:04:07.688116+08	\N	\N	2	2021-06-19
3741	-15	住房缴费	0	停车费	2021-06-19 15:04:21.870337+08	0	0	\N	2021-06-19 15:04:21.87066+08	\N	\N	2	2021-06-19
3742	-252	饮食	0	5桶油	2021-06-19 15:05:07.517443+08	0	0	\N	2021-06-19 15:05:07.517771+08	\N	\N	2	2021-06-16
3743	-100	生活日用	0	洗衣液	2021-06-19 15:05:23.09046+08	0	0	\N	2021-06-19 15:05:23.090779+08	\N	\N	2	2021-06-16
3744	-12	小孩健康	0	中医院挂号	2021-06-19 15:05:40.950661+08	0	0	\N	2021-06-19 15:05:40.950971+08	\N	\N	2	2021-06-17
3745	-35	通讯物流	0	顺丰手机	2021-06-19 15:06:04.595942+08	0	0	\N	2021-06-19 15:06:04.596254+08	\N	\N	2	2021-06-18
3746	-16	饮食	0	美团	2021-06-19 15:06:14.790289+08	0	0	\N	2021-06-19 15:06:14.790612+08	\N	\N	2	2021-06-19
3747	-131	生活日用	0	餐巾纸	2021-06-19 15:06:54.330142+08	0	0	\N	2021-06-19 15:06:54.330444+08	\N	\N	2	2021-06-16
3748	-150	交通出行	0	机动车检测	2021-06-25 16:45:51.301325+08	0	0	\N	2021-06-25 16:45:51.303736+08	\N	\N	1	2021-06-16
3749	-159	小孩其他	0	看医生	2021-06-25 16:46:16.435879+08	0	0	\N	2021-06-25 16:46:16.436199+08	\N	\N	1	2021-06-16
3750	-210	宠物	0	兔粮x2	2021-06-25 16:46:39.035633+08	0	0	\N	2021-06-25 16:46:39.035953+08	\N	\N	1	2021-06-17
3751	-70	生活日用	0	银泰城	2021-06-25 16:48:11.820506+08	0	0	\N	2021-06-25 16:48:11.820825+08	\N	\N	1	2021-06-19
3752	-200	生活日用	0	理发充值	2021-06-25 16:48:28.471131+08	0	0	\N	2021-06-25 16:48:28.471439+08	\N	\N	1	2021-06-20
3753	-36	饮食	0	绝味鸭脖	2021-06-25 16:48:45.740386+08	0	0	\N	2021-06-25 16:48:45.740717+08	\N	\N	1	2021-06-20
3754	-6	饮食	0	早餐	2021-06-25 16:48:58.55141+08	0	0	\N	2021-06-25 16:48:58.551746+08	\N	\N	1	2021-06-25
3755	-2570	交通出行	0	车险2293＋277车险无忧	2021-06-25 16:50:26.036743+08	0	0	\N	2021-06-25 16:50:26.037118+08	\N	\N	1	2021-06-15
3756	-25	文教娱乐	0	电影票	2021-06-25 16:54:07.280847+08	0	0	\N	2021-06-25 16:54:07.281206+08	\N	\N	1	2021-06-20
3757	-19	生活日用	0	创口贴	2021-07-02 21:45:01.870753+08	0	0	\N	2021-07-02 21:45:01.873193+08	\N	\N	2	2021-06-19
3758	-678	人情往来	0	手机	2021-07-02 21:45:42.973988+08	0	0	\N	2021-07-02 21:45:42.97433+08	\N	\N	2	2021-06-19
3759	-19	生活日用	0	绝味	2021-07-02 21:46:10.754238+08	0	0	\N	2021-07-02 21:46:10.75455+08	\N	\N	2	2021-06-20
3760	-35	交通出行	0	补胎	2021-07-02 21:46:49.694097+08	0	0	\N	2021-07-02 21:46:49.694403+08	\N	\N	2	2021-06-22
3761	-101	小孩服饰	0	衣服	2021-07-02 21:51:42.349806+08	0	0	\N	2021-07-02 21:51:42.350146+08	\N	\N	2	2021-06-22
3762	-30	服饰美容	0	包	2021-07-02 21:52:06.16095+08	0	0	\N	2021-07-02 21:52:06.161297+08	\N	\N	2	2021-06-22
3763	-20	交通出行	0	补胎	2021-07-03 14:29:32.771417+08	0	0	\N	2021-07-03 14:29:32.773925+08	\N	\N	2	2021-06-22
3764	-34	饮食	0	麦当劳	2021-07-03 14:30:03.850983+08	0	0	\N	2021-07-03 14:30:03.851318+08	\N	\N	2	2021-06-25
3765	-28	服饰美容	0	肩带	2021-07-03 14:30:23.870565+08	0	0	\N	2021-07-03 14:30:23.870921+08	\N	\N	2	2021-06-26
3766	-330	服饰美容	0	衣服	2021-07-03 14:30:44.37823+08	0	0	\N	2021-07-03 14:30:44.378606+08	\N	\N	2	2021-06-26
3767	-29	小孩玩具	0	飞行棋	2021-07-03 14:31:11.544992+08	0	0	\N	2021-07-03 14:31:11.545304+08	\N	\N	2	2021-06-26
3768	-31	生活日用	0	剪刀	2021-07-03 14:31:29.690588+08	0	0	\N	2021-07-03 14:31:29.690945+08	\N	\N	2	2021-06-27
3769	-29	饮食	0	寿司	2021-07-03 14:31:49.994829+08	0	0	\N	2021-07-03 14:31:49.995142+08	\N	\N	2	2021-06-27
3770	-14	生活日用	0	笔	2021-07-03 14:32:09.649789+08	0	0	\N	2021-07-03 14:32:09.650119+08	\N	\N	2	2021-06-28
3771	-4	饮食	0	早餐	2021-07-03 14:32:32.825738+08	0	0	\N	2021-07-03 14:32:32.826068+08	\N	\N	2	2021-06-30
3772	-1500	交通出行	0	加油	2021-07-03 14:32:51.320415+08	0	0	\N	2021-07-03 14:32:51.320743+08	\N	\N	2	2021-06-30
3773	-27	饮食	0	寿司	2021-07-03 14:33:05.291993+08	0	0	\N	2021-07-03 14:33:05.292305+08	\N	\N	2	2021-06-30
3774	-15	饮食	0	古茗	2021-07-03 14:33:24.791329+08	0	0	\N	2021-07-03 14:33:24.791664+08	\N	\N	2	2021-07-01
3775	-35	饮食	0	咳嗽糖浆	2021-07-03 14:33:43.760737+08	0	0	\N	2021-07-03 14:33:43.7611+08	\N	\N	2	2021-07-01
3776	-65	住房缴费	0	景湖电费	2021-07-03 14:34:14.95995+08	0	0	\N	2021-07-03 14:34:14.960263+08	\N	\N	2	2021-07-02
3777	-19	小孩玩具	0	篮球	2021-07-03 14:34:39.325793+08	0	0	\N	2021-07-03 14:34:39.32614+08	\N	\N	2	2021-07-02
3778	-3	交通出行	0	停车费	2021-07-03 14:34:52.647888+08	0	0	\N	2021-07-03 14:34:52.648211+08	\N	\N	2	2021-07-03
3779	-39	交通出行	0	高德打车	2021-07-03 14:35:11.980064+08	0	0	\N	2021-07-03 14:35:11.980396+08	\N	\N	2	2021-07-03
3780	-70	饮食	0	熏鱼	2021-07-03 14:35:31.95614+08	0	0	\N	2021-07-03 14:35:31.95644+08	\N	\N	2	2021-07-03
3781	-48	住房缴费	0	景湖水费	2021-07-03 14:35:53.786184+08	0	0	\N	2021-07-03 14:35:53.786544+08	\N	\N	2	2021-07-03
3782	-15	饮食	0	牛肉面	2021-07-03 14:36:33.105674+08	0	0	\N	2021-07-03 14:36:33.105973+08	\N	\N	2	2021-06-24
3783	-6	饮食	0	停车费	2021-07-03 14:36:53.220325+08	0	0	\N	2021-07-03 14:36:53.220648+08	\N	\N	2	2021-06-26
3784	-6	交通出行	0	停车费	2021-07-03 14:37:30.473202+08	0	0	\N	2021-07-03 14:37:30.473528+08	\N	\N	2	2021-06-26
3785	-15	饮食	0	牛肉面	2021-07-03 14:38:06.961841+08	0	0	\N	2021-07-03 14:38:06.962187+08	\N	\N	2	2021-06-29
3786	-228	服饰美容	0	衣服	2021-07-03 14:38:31.426067+08	0	0	\N	2021-07-03 14:38:31.426386+08	\N	\N	2	2021-07-02
3787	-39	饮食	0	火龙果	2021-07-03 14:38:52.295695+08	0	0	\N	2021-07-03 14:38:52.296002+08	\N	\N	2	2021-07-02
3788	-176	饮食	0	4袋米	2021-07-03 14:41:51.060358+08	0	0	\N	2021-07-03 14:41:51.060679+08	\N	\N	2	2021-06-19
3789	-149	生活日用	0	面包超人止痒贴	2021-07-03 14:42:30.911948+08	0	0	\N	2021-07-03 14:42:30.912245+08	\N	\N	2	2021-06-24
3790	-93	住房缴费	0	东兴电费	2021-07-10 18:37:16.696236+08	0	0	\N	2021-07-10 18:37:16.698701+08	\N	\N	2	2021-07-03
3791	-100	饮食	0	老婆大人	2021-07-10 18:37:31.711631+08	0	0	\N	2021-07-10 18:37:31.71194+08	\N	\N	2	2021-07-04
3792	-61	饮食	0	超市	2021-07-10 18:37:54.795357+08	0	0	\N	2021-07-10 18:37:54.795666+08	\N	\N	2	2021-07-05
3793	-65	饮食	0	榴莲	2021-07-10 18:38:17.78588+08	0	0	\N	2021-07-10 18:38:17.786221+08	\N	\N	2	2021-07-06
3794	-41	生活日用	0	插座	2021-07-10 18:38:36.115075+08	0	0	\N	2021-07-10 18:38:36.115374+08	\N	\N	2	2021-07-06
3795	-59	服饰美容	0	衣服	2021-07-10 18:38:55.181502+08	0	0	\N	2021-07-10 18:38:55.181874+08	\N	\N	2	2021-07-06
3796	-126	服饰美容	0	衣服	2021-07-10 18:39:07.566312+08	0	0	\N	2021-07-10 18:39:07.566638+08	\N	\N	2	2021-07-06
3797	-10	生活日用	0	餐巾纸	2021-07-10 18:39:20.970797+08	0	0	\N	2021-07-10 18:39:20.971098+08	\N	\N	2	2021-07-10
3798	-7	生活日用	0	防水袋	2021-07-10 18:39:40.495233+08	0	0	\N	2021-07-10 18:39:40.495573+08	\N	\N	2	2021-07-09
3799	-13	生活日用	0	雨衣	2021-07-10 18:39:59.780665+08	0	0	\N	2021-07-10 18:39:59.780992+08	\N	\N	2	2021-07-10
3800	-20	健康保险	0	云南白药贴	2021-07-10 18:40:16.860018+08	0	0	\N	2021-07-10 18:40:16.860336+08	\N	\N	2	2021-07-10
3801	-20	生活日用	0	土	2021-07-10 18:40:48.795981+08	0	0	\N	2021-07-10 18:40:48.796293+08	\N	\N	2	2021-07-05
3802	-10	生活日用	0	花盆	2021-07-10 18:41:17.417541+08	0	0	\N	2021-07-10 18:41:17.417931+08	\N	\N	2	2021-07-07
3803	-99	饮食	0	香肠	2021-07-10 18:41:45.180588+08	0	0	\N	2021-07-10 18:41:45.180884+08	\N	\N	2	2021-07-08
3804	-55	生活日用	0	防晒霜	2021-07-10 18:42:02.411036+08	0	0	\N	2021-07-10 18:42:02.411383+08	\N	\N	2	2021-07-09
3805	-210	文教娱乐	0	漂流	2021-07-10 18:42:26.330682+08	0	0	\N	2021-07-10 18:42:26.330991+08	\N	\N	2	2021-07-09
3806	-47	饮食	0	牛肉面	2021-07-10 18:42:42.490846+08	0	0	\N	2021-07-10 18:42:42.491162+08	\N	\N	2	2021-07-10
3807	-68	饮食	0	西瓜	2021-07-10 18:42:54.235843+08	0	0	\N	2021-07-10 18:42:54.236152+08	\N	\N	2	2021-07-10
3808	-35	饮食	0	葡萄	2021-07-10 18:43:04.126334+08	0	0	\N	2021-07-10 18:43:04.126675+08	\N	\N	2	2021-07-10
3809	-25	饮食	0	水蜜桃	2021-07-10 18:43:20.261071+08	0	0	\N	2021-07-10 18:43:20.261377+08	\N	\N	2	2021-07-10
3811	-11	小孩玩具	0	飞行棋	2021-07-13 15:38:47.361561+08	0	0	\N	2021-07-13 15:38:47.361885+08	\N	\N	1	2021-06-27
3810	-118	饮食	0	牛骨头面	2021-07-13 15:38:15.063431+08	0	0	\N	2021-07-13 15:39:57.809748+08	\N	\N	1	2021-06-26
3812	-15	饮食	0	牛肉面	2021-07-13 15:40:58.268181+08	0	0	\N	2021-07-13 15:40:58.268518+08	\N	\N	1	2021-06-30
3813	-2	交通出行	0	停车费	2021-07-13 15:41:09.173695+08	0	0	\N	2021-07-13 15:41:09.174026+08	\N	\N	1	2021-06-30
3814	-322	交通出行	0	加油	2021-07-13 15:41:26.568384+08	0	0	\N	2021-07-13 15:41:26.568698+08	\N	\N	1	2021-06-30
3815	-7	饮食	0	早餐	2021-07-13 15:41:39.978772+08	0	0	\N	2021-07-13 15:41:39.979075+08	\N	\N	1	2021-07-01
3816	-18	小孩零食	0	小馒头	2021-07-13 15:41:59.620723+08	0	0	\N	2021-07-13 15:41:59.621059+08	\N	\N	1	2021-07-03
3817	-32	饮食	0	水果	2021-07-13 15:42:14.443524+08	0	0	\N	2021-07-13 15:42:14.44383+08	\N	\N	1	2021-07-03
3818	-6	交通出行	0	停车费	2021-07-13 15:42:28.072498+08	0	0	\N	2021-07-13 15:42:28.072853+08	\N	\N	1	2021-07-03
3819	-37	交通出行	0	打车费	2021-07-13 15:42:42.575272+08	0	0	\N	2021-07-13 15:42:42.575605+08	\N	\N	1	2021-07-03
3820	-1000	交通出行	0	特斯拉订金	2021-07-13 15:43:19.22613+08	0	0	\N	2021-07-13 15:43:19.226446+08	\N	\N	1	2021-07-08
3821	-10	交通出行	0	停车费	2021-07-13 15:43:47.964578+08	0	0	\N	2021-07-13 15:43:47.964874+08	\N	\N	1	2021-07-10
3822	-6	小孩零食	0	薯条	2021-07-13 15:44:17.677877+08	0	0	\N	2021-07-13 15:44:17.678184+08	\N	\N	1	2021-07-10
3823	-3	交通出行	0	地铁	2021-07-13 15:44:36.017637+08	0	0	\N	2021-07-13 15:44:36.017943+08	\N	\N	1	2021-07-11
3824	-46	饮食	0	麦当劳	2021-07-13 15:44:48.392648+08	0	0	\N	2021-07-13 15:44:48.393146+08	\N	\N	1	2021-07-11
3825	-58	饮食	0	寿司	2021-07-13 15:45:03.487621+08	0	0	\N	2021-07-13 15:45:03.487932+08	\N	\N	1	2021-07-11
3826	-20	饮食	0	果汁	2021-07-13 15:46:15.738864+08	0	0	\N	2021-07-13 15:46:15.739177+08	\N	\N	1	2021-07-11
3827	-30	饮食	0	周黑鸭	2021-07-13 15:46:27.727599+08	0	0	\N	2021-07-13 15:46:27.727902+08	\N	\N	1	2021-07-11
3828	-3	交通出行	0	地铁	2021-07-13 15:46:42.971153+08	0	0	\N	2021-07-13 15:46:42.97152+08	\N	\N	1	2021-07-11
3830	-20	健康保险	0	药膏	2021-07-22 19:11:55.825264+08	0	0	\N	2021-07-22 19:11:55.827706+08	\N	\N	2	2021-07-10
3831	-169	住房缴费	0	东兴水费	2021-07-22 19:12:21.967794+08	0	0	\N	2021-07-22 19:12:21.968093+08	\N	\N	2	2021-07-11
3832	-3	交通出行	0	地铁	2021-07-22 19:12:46.462404+08	0	0	\N	2021-07-22 19:12:46.462731+08	\N	\N	2	2021-07-11
3833	-90	小孩服饰	0	T恤	2021-07-22 19:13:29.086056+08	0	0	\N	2021-07-22 19:13:29.086402+08	\N	\N	2	2021-07-11
3834	-204	小孩服饰	0	衣服	2021-07-22 19:14:03.414247+08	0	0	\N	2021-07-22 19:14:03.414567+08	\N	\N	2	2021-07-11
3835	-295	小孩服饰	0	鞋子	2021-07-22 19:14:38.230016+08	0	0	\N	2021-07-22 19:14:38.230361+08	\N	\N	2	2021-07-11
3836	-143	服饰美容	0	衣服	2021-07-22 19:15:01.409909+08	0	0	\N	2021-07-22 19:15:01.410229+08	\N	\N	2	2021-07-11
3837	-134	服饰美容	0	鞋子	2021-07-22 19:15:10.106365+08	0	0	\N	2021-07-22 19:15:10.10673+08	\N	\N	2	2021-07-11
3838	-10	文教娱乐	0	刮刮乐	2021-07-22 19:15:39.259482+08	0	0	\N	2021-07-22 19:15:39.259809+08	\N	\N	2	2021-07-11
3839	-20	生活日用	0	熏香	2021-07-22 19:15:52.304296+08	0	0	\N	2021-07-22 19:15:52.304603+08	\N	\N	2	2021-07-11
3840	-3	交通出行	0	地铁	2021-07-22 19:16:04.40533+08	0	0	\N	2021-07-22 19:16:04.405668+08	\N	\N	2	2021-07-11
3841	-28	小孩玩具	0	太空沙	2021-07-22 19:16:25.050252+08	0	0	\N	2021-07-22 19:16:25.050609+08	\N	\N	2	2021-07-11
3842	-23	饮食	0	酸菜鱼	2021-07-22 19:16:52.379937+08	0	0	\N	2021-07-22 19:16:52.380267+08	\N	\N	2	2021-07-13
3843	-49	饮食	0	菠萝蜜	2021-07-22 19:17:17.960536+08	0	0	\N	2021-07-22 19:17:17.960877+08	\N	\N	2	2021-07-13
3844	-23	饮食	0	午饭	2021-07-22 19:17:38.664798+08	0	0	\N	2021-07-22 19:17:38.665145+08	\N	\N	2	2021-07-15
3845	-40	文教娱乐	0	刮刮乐	2021-07-22 19:19:34.914371+08	0	0	\N	2021-07-22 19:19:34.914725+08	\N	\N	2	2021-07-18
3846	-198	小孩健康	0	鱼肝油	2021-07-22 19:19:52.805172+08	0	0	\N	2021-07-22 19:19:52.8055+08	\N	\N	2	2021-07-18
3847	-9	交通出行	0	停车费	2021-07-22 19:20:19.925725+08	0	0	\N	2021-07-22 19:20:19.926033+08	\N	\N	2	2021-07-18
3848	-16	生活日用	0	手机壳	2021-07-22 19:20:36.609571+08	0	0	\N	2021-07-22 19:20:36.609901+08	\N	\N	2	2021-07-18
3849	-15	饮食	0	鱿鱼	2021-07-22 19:20:51.86981+08	0	0	\N	2021-07-22 19:20:51.87013+08	\N	\N	2	2021-07-18
3850	-15	饮食	0	薯条	2021-07-22 19:21:03.975001+08	0	0	\N	2021-07-22 19:21:03.975314+08	\N	\N	2	2021-07-18
3851	-12	小孩文具	0	游泳圈	2021-07-22 19:21:46.944407+08	0	0	\N	2021-07-22 19:21:46.944718+08	\N	\N	2	2021-07-18
3852	-17	饮食	0	臊子面	2021-07-22 19:22:13.259281+08	0	0	\N	2021-07-22 19:22:13.259639+08	\N	\N	2	2021-07-19
3853	-83	饮食	0	超市	2021-07-22 19:22:38.230431+08	0	0	\N	2021-07-22 19:22:38.230778+08	\N	\N	2	2021-07-19
3854	-19	生活日用	0	袋子	2021-07-22 19:23:01.899932+08	0	0	\N	2021-07-22 19:23:01.900237+08	\N	\N	2	2021-07-19
3855	-19	小孩玩具	0	水枪	2021-07-22 19:23:22.940543+08	0	0	\N	2021-07-22 19:23:22.940869+08	\N	\N	2	2021-07-19
3856	-86	生活日用	0	落地扇	2021-07-22 19:23:44.329463+08	0	0	\N	2021-07-22 19:23:44.32978+08	\N	\N	2	2021-07-19
3857	-53	服饰美容	0	内衣	2021-07-22 19:24:01.675192+08	0	0	\N	2021-07-22 19:24:01.675561+08	\N	\N	2	2021-07-19
3858	-100	饮食	0	老婆大人	2021-07-22 19:24:35.575388+08	0	0	\N	2021-07-22 19:24:35.575733+08	\N	\N	2	2021-07-21
3859	-17	服饰美容	0	罩衫	2021-07-22 19:24:53.257122+08	0	0	\N	2021-07-22 19:24:53.25742+08	\N	\N	2	2021-07-22
3860	-3000	小孩教育	0	暑假班	2021-07-22 19:25:29.140497+08	0	0	\N	2021-07-22 19:25:29.140826+08	\N	\N	2	2021-07-10
3861	-15	饮食	0	可乐	2021-07-22 19:25:45.280849+08	0	0	\N	2021-07-22 19:25:45.281222+08	\N	\N	2	2021-07-22
3862	-149	文教娱乐	0	教育	2021-07-22 19:25:57.225392+08	0	0	\N	2021-07-22 19:25:57.225708+08	\N	\N	2	2021-07-22
3863	-7668	小孩健康	0	小孩保险	2021-07-25 09:02:02.790876+08	0	0	\N	2021-07-25 09:02:02.793217+08	\N	\N	1	2021-07-25
3864	-9	交通出行	0	打车	2021-07-25 09:03:24.206155+08	0	0	\N	2021-07-25 09:03:24.206466+08	\N	\N	1	2021-07-15
3865	-15	生活日用	0	拆机工具	2021-07-25 09:03:52.382261+08	0	0	\N	2021-07-25 09:03:52.382579+08	\N	\N	1	2021-07-15
3866	-2260	通讯物流	0	S20Fe	2021-07-25 09:04:26.171281+08	0	0	\N	2021-07-25 09:04:26.171588+08	\N	\N	1	2021-07-16
3867	-2	交通出行	0	公交	2021-07-25 09:04:49.065989+08	0	0	\N	2021-07-25 09:04:49.066289+08	\N	\N	1	2021-07-17
3868	-13	交通出行	0	停车费	2021-07-25 09:05:12.853834+08	0	0	\N	2021-07-25 09:05:12.854197+08	\N	\N	1	2021-07-17
3869	-4	饮食	0	早餐	2021-07-25 09:05:45.910802+08	0	0	\N	2021-07-25 09:05:45.911102+08	\N	\N	1	2021-07-20
3870	-59	小孩文具	0	故事书	2021-07-25 09:06:18.542829+08	0	0	\N	2021-07-25 09:06:18.543121+08	\N	\N	1	2021-07-20
3872	-20	饮食	0	水上乐园柜子	2021-07-25 09:08:39.351094+08	0	0	\N	2021-07-25 09:08:39.351409+08	\N	\N	1	2021-07-16
3873	-70	饮食	0	食其家	2021-07-25 09:09:20.101441+08	0	0	\N	2021-07-25 09:09:20.101759+08	\N	\N	1	2021-07-18
3874	-31	生活日用	0	彩漂	2021-07-26 22:12:46.610157+08	0	0	\N	2021-07-26 22:12:46.612418+08	\N	\N	2	2021-07-23
3875	-30	饮食	0	群主请客	2021-07-26 22:13:04.725+08	0	0	\N	2021-07-26 22:13:04.725337+08	\N	\N	2	2021-07-24
3876	-67	生活日用	0	鞋子	2021-07-26 22:13:21.469533+08	0	0	\N	2021-07-26 22:13:21.469869+08	\N	\N	2	2021-07-25
3877	-14	生活日用	0	餐盒	2021-07-26 22:13:46.123079+08	0	0	\N	2021-07-26 22:13:46.123431+08	\N	\N	2	2021-07-25
3878	-6	生活日用	0	漏网	2021-07-26 22:14:06.343617+08	0	0	\N	2021-07-26 22:14:06.34394+08	\N	\N	2	2021-07-25
3879	-28	服饰美容	0	拖鞋	2021-07-26 22:14:32.222739+08	0	0	\N	2021-07-26 22:14:32.223035+08	\N	\N	2	2021-07-26
3881	-57	生活日用	0	美购	2021-07-26 22:15:03.398993+08	0	0	\N	2021-07-26 22:15:03.399304+08	\N	\N	2	2021-07-26
3882	-6	生活日用	0	拼多多月卡	2021-07-26 22:15:36.795305+08	0	0	\N	2021-07-26 22:15:36.795768+08	\N	\N	2	2021-07-25
3883	-15	饮食	0	南瓜	2021-07-26 22:15:52.704855+08	0	0	\N	2021-07-26 22:15:52.705244+08	\N	\N	2	2021-07-26
3884	4200	收入	1	6月工资	2021-07-26 22:23:46.035524+08	0	0	\N	2021-07-26 22:23:46.035838+08	\N	\N	2	2021-07-23
3885	-200	交通出行	0	公交卡	2021-08-01 16:36:53.762224+08	0	0	\N	2021-08-01 16:36:53.766243+08	\N	\N	2	2021-07-31
3887	-152	人情往来	0	看舅舅媳妇	2021-08-01 16:38:15.71537+08	0	0	\N	2021-08-01 16:38:15.715775+08	\N	\N	2	2021-08-01
3888	-27	饮食	0	烧烤	2021-08-05 17:05:13.445549+08	0	0	\N	2021-08-05 17:05:13.447908+08	\N	\N	2	2021-08-01
3889	-161	住房缴费	0	东兴电费	2021-08-05 17:08:37.944809+08	0	0	\N	2021-08-05 17:08:37.945164+08	\N	\N	2	2021-08-02
3890	-110	住房缴费	0	景湖水岸电费	2021-08-05 17:09:11.554121+08	0	0	\N	2021-08-05 17:09:11.554424+08	\N	\N	2	2021-08-02
3891	-5	生活日用	0	美购	2021-08-05 17:09:37.265019+08	0	0	\N	2021-08-05 17:09:37.265324+08	\N	\N	2	2021-08-04
3892	-227	生活日用	0	电饭煲	2021-08-05 17:09:53.924484+08	0	0	\N	2021-08-05 17:09:53.92479+08	\N	\N	2	2021-08-05
3893	-33	饮食	0	猪油渣	2021-08-07 21:37:51.157726+08	0	0	\N	2021-08-07 21:37:51.161524+08	\N	\N	2	2021-08-05
3894	-13	饮食	0	古茗	2021-08-07 21:38:09.565487+08	0	0	\N	2021-08-07 21:38:09.565802+08	\N	\N	2	2021-08-07
3895	-30	饮食	0	山竹	2021-08-07 21:38:34.672055+08	0	0	\N	2021-08-07 21:38:34.672356+08	\N	\N	2	2021-08-05
3896	-25	饮食	0	葡萄	2021-08-07 21:38:45.986764+08	0	0	\N	2021-08-07 21:38:45.987101+08	\N	\N	2	2021-08-06
3897	-20	文教娱乐	0	刮刮乐	2021-08-07 21:39:02.830858+08	0	0	\N	2021-08-07 21:39:02.831177+08	\N	\N	2	2021-08-07
3898	-21	饮食	0	肯德基	2021-08-07 21:39:12.528775+08	0	0	\N	2021-08-07 21:39:12.529119+08	\N	\N	2	2021-08-07
3899	-9	交通出行	0	停车费	2021-08-07 21:39:27.094975+08	0	0	\N	2021-08-07 21:39:27.095317+08	\N	\N	2	2021-08-07
3901	-4	饮食	0	早餐	2021-08-11 15:29:53.409028+08	0	0	\N	2021-08-11 15:29:53.409338+08	\N	\N	1	2021-07-31
3902	-45	饮食	0	零食	2021-08-11 15:30:14.323946+08	0	0	\N	2021-08-11 15:30:14.324265+08	\N	\N	1	2021-08-02
3903	-103	饮食	0	牛蛙	2021-08-11 15:30:28.208928+08	0	0	\N	2021-08-11 15:30:28.209274+08	\N	\N	1	2021-08-07
3904	-158	饮食	0	火锅	2021-08-11 15:31:31.929871+08	0	0	\N	2021-08-11 15:31:31.930178+08	\N	\N	1	2021-07-30
3905	-3	生活日用	0	充电宝	2021-08-11 15:31:49.888839+08	0	0	\N	2021-08-11 15:31:49.889182+08	\N	\N	1	2021-07-30
3906	-40	饮食	0	零食	2021-08-11 15:33:22.849667+08	0	0	\N	2021-08-11 15:33:22.849973+08	\N	\N	1	2021-07-16
3907	-216	饮食	0	华润万家	2021-08-16 20:00:36.75038+08	0	0	\N	2021-08-16 20:00:36.752645+08	\N	\N	2	2021-08-08
3908	-10	生活日用	0	餐巾纸	2021-08-16 20:00:53.115312+08	0	0	\N	2021-08-16 20:00:53.115642+08	\N	\N	2	2021-08-08
3909	-26	饮食	0	猪油渣	2021-08-16 20:01:16.91967+08	0	0	\N	2021-08-16 20:01:16.919977+08	\N	\N	2	2021-08-09
3910	-200	饮食	0	老宁波	2021-08-16 20:01:35.769721+08	0	0	\N	2021-08-16 20:01:35.770025+08	\N	\N	2	2021-08-10
3911	-21	文教娱乐	0	书本	2021-08-16 20:02:31.65485+08	0	0	\N	2021-08-16 20:02:31.655216+08	\N	\N	2	2021-08-12
3912	-54	交通出行	0	货拉拉	2021-08-16 20:03:11.574554+08	0	0	\N	2021-08-16 20:03:11.574932+08	\N	\N	2	2021-08-13
3913	-32	生活日用	0	玻璃碗	2021-08-16 20:03:40.705238+08	0	0	\N	2021-08-16 20:03:40.705559+08	\N	\N	2	2021-08-14
3914	-56	饮食	0	点心	2021-08-16 20:04:06.824541+08	0	0	\N	2021-08-16 20:04:06.824869+08	\N	\N	2	2021-08-15
3915	-23	饮食	0	寿司	2021-08-16 20:04:36.774958+08	0	0	\N	2021-08-16 20:04:36.775325+08	\N	\N	2	2021-08-15
3916	-24	饮食	0	晚饭	2021-08-16 20:04:58.414736+08	0	0	\N	2021-08-16 20:04:58.415064+08	\N	\N	2	2021-08-16
3917	-5	交通出行	0	停车费	2021-08-16 20:05:31.289621+08	0	0	\N	2021-08-16 20:05:31.289923+08	\N	\N	2	2021-08-08
3918	-125	服饰美容	0	连衣裙	2021-08-16 20:05:51.759669+08	0	0	\N	2021-08-16 20:05:51.759965+08	\N	\N	2	2021-08-08
3919	-5	通讯物流	0	快递费	2021-08-16 20:06:41.490462+08	0	0	\N	2021-08-16 20:06:41.490811+08	\N	\N	2	2021-08-14
3920	-35	饮食	0	猕猴桃	2021-08-16 20:06:56.565972+08	0	0	\N	2021-08-16 20:06:56.56628+08	\N	\N	2	2021-08-15
3921	-6	饮食	0	酸奶	2021-08-16 20:07:16.650351+08	0	0	\N	2021-08-16 20:07:16.650653+08	\N	\N	2	2021-08-15
3922	-43	饮食	0	葡萄	2021-08-16 20:07:30.344546+08	0	0	\N	2021-08-16 20:07:30.344854+08	\N	\N	2	2021-08-15
3923	-29	饮食	0	外卖	2021-08-20 22:02:07.042835+08	0	0	\N	2021-08-20 22:02:07.045186+08	\N	\N	2	2021-08-20
3924	-15	饮食	0	土豆片	2021-08-24 19:35:48.808529+08	0	0	\N	2021-08-24 19:35:48.810883+08	\N	\N	2	2021-08-21
3925	-39	饮食	0	炸鸡	2021-08-24 19:36:18.339097+08	0	0	\N	2021-08-24 19:36:18.339443+08	\N	\N	2	2021-08-22
3926	-15	饮食	0	炸鸡	2021-08-24 19:37:49.320496+08	0	0	\N	2021-08-24 19:37:49.320814+08	\N	\N	2	2021-08-22
3927	-11	饮食	0	午饭	2021-08-24 19:38:31.604676+08	0	0	\N	2021-08-24 19:38:31.605121+08	\N	\N	2	2021-08-23
3928	-17	健康保险	0	医院挂号	2021-08-29 07:00:57.130233+08	0	0	\N	2021-08-29 07:00:57.146353+08	\N	\N	2	2021-08-27
3929	-826	健康保险	0	HPV4价第一针	2021-08-29 07:01:19.473226+08	0	0	\N	2021-08-29 07:01:19.47358+08	\N	\N	2	2021-08-27
3930	-15	饮食	0	牛肉面	2021-08-29 07:01:55.735879+08	0	0	\N	2021-08-29 07:01:55.736183+08	\N	\N	2	2021-08-28
3931	-10	饮食	0	寿司	2021-08-29 07:02:08.118176+08	0	0	\N	2021-08-29 07:02:08.11848+08	\N	\N	2	2021-08-28
3932	-1	饮食	0	打包费	2021-08-29 07:02:32.562738+08	0	0	\N	2021-08-29 07:02:32.563068+08	\N	\N	2	2021-08-28
3933	-155	饮食	0	山姆	2021-08-29 07:03:38.187909+08	0	0	\N	2021-08-29 07:03:38.188234+08	\N	\N	2	2021-08-25
3934	-13	饮食	0	午餐	2021-08-29 07:03:58.204607+08	0	0	\N	2021-08-29 07:03:58.204942+08	\N	\N	2	2021-08-27
3935	-37	饮食	0	酸菜鱼	2021-08-29 07:04:24.540403+08	0	0	\N	2021-08-29 07:04:24.540713+08	\N	\N	2	2021-08-28
3936	-8	生活日用	0	拼多多	2021-08-29 07:04:44.594087+08	0	0	\N	2021-08-29 07:04:44.594407+08	\N	\N	2	2021-08-28
3937	-87	宠物	0	食物	2021-09-01 18:18:48.685003+08	0	0	\N	2021-09-01 18:18:48.687243+08	\N	\N	1	2021-08-11
3938	-2	交通出行	0	公交	2021-09-01 18:19:11.754325+08	0	0	\N	2021-09-01 18:19:11.754676+08	\N	\N	1	2021-08-14
3939	-33	饮食	0	美购	2021-09-01 18:19:34.49913+08	0	0	\N	2021-09-01 18:19:34.499446+08	\N	\N	1	2021-08-14
3940	-80	饮食	0	水果	2021-09-01 18:20:21.289099+08	0	0	\N	2021-09-01 18:20:21.289398+08	\N	\N	1	2021-08-15
3941	-5	交通出行	0	停车	2021-09-01 18:20:41.579512+08	0	0	\N	2021-09-01 18:20:41.579865+08	\N	\N	1	2021-08-15
3942	-100	通讯物流	0	话费	2021-09-01 18:21:10.969452+08	0	0	\N	2021-09-01 18:21:10.969766+08	\N	\N	1	2021-08-16
3944	-630	交通出行	0	随车充	2021-09-01 18:22:38.955098+08	0	0	\N	2021-09-01 18:22:38.955406+08	\N	\N	1	2021-08-21
3945	-4	饮食	0	早餐	2021-09-01 18:22:58.895454+08	0	0	\N	2021-09-01 18:22:58.895791+08	\N	\N	1	2021-08-24
3946	-320	交通出行	0	充电桩保护箱	2021-09-01 18:24:00.070278+08	0	0	\N	2021-09-01 18:24:00.070584+08	\N	\N	1	2021-08-25
3947	-311	交通出行	0	充电桩电线和其他工具	2021-09-01 18:25:22.294838+08	0	0	\N	2021-09-01 18:25:22.295165+08	\N	\N	1	2021-08-28
3948	-68	交通出行	0	充电桩运费	2021-09-01 18:26:53.349749+08	0	0	\N	2021-09-01 18:26:53.350059+08	\N	\N	1	2021-08-28
3949	-39	饮食	0	麦当劳	2021-09-01 18:27:09.656234+08	0	0	\N	2021-09-01 18:27:09.656563+08	\N	\N	1	2021-08-29
3950	-56	饮食	0	美购	2021-09-01 18:27:30.320519+08	0	0	\N	2021-09-01 18:27:30.320905+08	\N	\N	1	2021-08-29
3951	-170	饮食	0	水果	2021-09-01 18:27:49.745458+08	0	0	\N	2021-09-01 18:27:49.745779+08	\N	\N	1	2021-08-29
3952	-316	交通出行	0	特斯拉配件	2021-09-01 18:28:13.259379+08	0	0	\N	2021-09-01 18:28:13.259688+08	\N	\N	1	2021-08-30
3953	-6	交通出行	0	停车费	2021-09-01 18:29:47.615334+08	0	0	\N	2021-09-01 18:29:47.615639+08	\N	\N	1	2021-08-11
3954	-7686	健康保险	0	特斯拉保险	2021-09-01 18:30:19.830414+08	0	0	\N	2021-09-01 18:30:19.83076+08	\N	\N	1	2021-08-24
3955	-15	通讯物流	0	车牌运费	2021-09-01 18:30:57.515375+08	0	0	\N	2021-09-01 18:30:57.515688+08	\N	\N	1	2021-08-28
3957	-226000	交通出行	0	modely276000-卡罗拉60000	2021-09-01 18:34:50.974782+08	0	0	\N	2021-09-01 18:34:50.975106+08	\N	\N	1	2021-08-20
3959	-19	饮食	0	麦当劳	2021-09-02 07:14:22.781581+08	0	0	\N	2021-09-02 07:14:22.781899+08	\N	\N	2	2021-08-29
3960	-18	生活日用	0	湿厕纸	2021-09-02 07:14:50.240201+08	0	0	\N	2021-09-02 07:14:50.240516+08	\N	\N	2	2021-08-31
3961	-45	生活日用	0	厨房贴纸	2021-09-02 07:15:18.577058+08	0	0	\N	2021-09-02 07:15:18.577412+08	\N	\N	2	2021-09-01
3962	-100	通讯物流	0	话费充值	2021-09-02 07:15:36.857103+08	0	0	\N	2021-09-02 07:15:36.857409+08	\N	\N	2	2021-09-01
3963	-168	服饰美容	0	鞋子	2021-09-02 07:15:54.265856+08	0	0	\N	2021-09-02 07:15:54.266189+08	\N	\N	2	2021-09-02
3964	-7	交通出行	0	小遛电动车	2021-09-02 07:16:59.020823+08	0	0	\N	2021-09-02 07:16:59.021167+08	\N	\N	2	2021-09-01
3965	-28	生活日用	0	剃须刀	2021-09-02 07:17:25.689097+08	0	0	\N	2021-09-02 07:17:25.689408+08	\N	\N	2	2021-08-31
3967	-25	饮食	0	寿司	2021-09-02 07:17:56.445702+08	0	0	\N	2021-09-02 07:17:56.446004+08	\N	\N	2	2021-08-31
3968	-148	饮食	0	牛奶	2021-09-02 07:18:17.363287+08	0	0	\N	2021-09-02 07:18:17.363607+08	\N	\N	2	2021-09-01
3969	-679	生活日用	0	剃须刀	2021-09-02 07:18:48.937641+08	0	0	\N	2021-09-02 07:18:48.937977+08	\N	\N	2	2021-09-01
3970	-41	住房缴费	0	景湖水费	2021-09-05 21:47:38.348731+08	0	0	\N	2021-09-05 21:47:38.351181+08	\N	\N	2	2021-09-02
3971	3600	收入	1	工龄奖	2021-09-05 21:48:06.983128+08	0	0	\N	2021-09-05 21:48:06.983451+08	\N	\N	2	2021-09-03
3972	-88	住房缴费	0	景湖电费	2021-09-05 21:48:39.830944+08	0	0	\N	2021-09-05 21:48:39.831251+08	\N	\N	2	2021-09-03
3973	-10	饮食	0	饼	2021-09-05 21:49:00.852668+08	0	0	\N	2021-09-05 21:49:00.853049+08	\N	\N	2	2021-09-04
3974	-25	饮食	0	羊肉包	2021-09-05 21:49:20.740556+08	0	0	\N	2021-09-05 21:49:20.740921+08	\N	\N	2	2021-09-04
3975	-34	饮食	0	美购	2021-09-05 21:49:32.515687+08	0	0	\N	2021-09-05 21:49:32.515979+08	\N	\N	2	2021-09-04
3976	-398	饮食	0	美团午饭	2021-09-05 21:49:49.134771+08	0	0	\N	2021-09-05 21:49:49.135092+08	\N	\N	2	2021-09-05
3977	-37	饮食	0	饮料	2021-09-05 21:50:03.7011+08	0	0	\N	2021-09-05 21:50:03.701416+08	\N	\N	2	2021-09-05
3978	-180	通讯物流	0	电话费	2021-09-05 21:50:56.391725+08	0	0	\N	2021-09-05 21:50:56.392097+08	\N	\N	2	2021-09-02
3979	-180	通讯物流	0	电话费	2021-09-05 21:51:16.571378+08	0	0	\N	2021-09-05 21:51:16.571767+08	\N	\N	2	2021-09-02
3980	-90	通讯物流	0	电话费	2021-09-05 21:51:30.797209+08	0	0	\N	2021-09-05 21:51:30.797535+08	\N	\N	2	2021-09-02
3981	-3840	小孩教育	0	48节画画	2021-09-05 21:52:02.473247+08	0	0	\N	2021-09-05 21:52:02.473557+08	\N	\N	2	2021-09-04
3982	-22	饮食	0	肯德基	2021-09-05 21:52:17.190728+08	0	0	\N	2021-09-05 21:52:17.191136+08	\N	\N	2	2021-09-04
3983	-5	生活日用	0	洗脚	2021-09-05 21:52:33.337206+08	0	0	\N	2021-09-05 21:52:33.337505+08	\N	\N	2	2021-09-05
3984	-6	饮食	0	香肠	2021-09-05 21:52:50.172429+08	0	0	\N	2021-09-05 21:52:50.172746+08	\N	\N	2	2021-09-05
3985	-10	交通出行	0	停车费	2021-09-05 21:53:06.58988+08	0	0	\N	2021-09-05 21:53:06.590183+08	\N	\N	2	2021-09-05
3986	-92	住房缴费	0	东兴水费	2021-09-12 19:05:37.195007+08	0	0	\N	2021-09-12 19:05:37.198745+08	\N	\N	2	2021-09-08
3987	-35	小孩服饰	0	内裤	2021-09-12 19:05:59.944387+08	0	0	\N	2021-09-12 19:05:59.944678+08	\N	\N	2	2021-09-09
3988	-10	文教娱乐	0	课程	2021-09-12 19:06:23.500458+08	0	0	\N	2021-09-12 19:06:23.500777+08	\N	\N	2	2021-09-09
3989	-20	饮食	0	麦当劳早餐	2021-09-12 19:06:40.999093+08	0	0	\N	2021-09-12 19:06:40.999387+08	\N	\N	2	2021-09-10
3990	-14	小孩服饰	0	袜子	2021-09-12 19:07:27.0398+08	0	0	\N	2021-09-12 19:07:27.040112+08	\N	\N	2	2021-09-09
3991	-124	生活日用	0	席子	2021-09-12 19:07:43.265047+08	0	0	\N	2021-09-12 19:07:43.265367+08	\N	\N	2	2021-09-10
3992	-20	生活日用	0	勺子	2021-09-12 19:08:04.015423+08	0	0	\N	2021-09-12 19:08:04.015743+08	\N	\N	2	2021-09-11
3993	-30	饮食	0	美团外卖	2021-09-12 19:08:30.399992+08	0	0	\N	2021-09-12 19:08:30.400298+08	\N	\N	2	2021-09-11
3994	-5	交通出行	0	停车费	2021-09-12 19:08:48.875071+08	0	0	\N	2021-09-12 19:08:48.875375+08	\N	\N	2	2021-09-12
3995	-60	饮食	0	山姆	2021-09-12 19:09:00.795646+08	0	0	\N	2021-09-12 19:09:00.796117+08	\N	\N	2	2021-09-12
3996	-525	饮食	0	山姆	2021-09-12 19:09:26.389524+08	0	0	\N	2021-09-12 19:09:26.389884+08	\N	\N	2	2021-09-12
3997	-12	饮食	0	山姆饮料	2021-09-12 19:09:36.504547+08	0	0	\N	2021-09-12 19:09:36.504878+08	\N	\N	2	2021-09-12
3998	-5	生活日用	0	鞋胶	2021-09-22 17:44:16.360352+08	0	0	\N	2021-09-22 17:44:16.362834+08	\N	\N	1	2021-09-01
3999	-141	交通出行	0	modely配件	2021-09-22 17:44:50.881344+08	0	0	\N	2021-09-22 17:44:50.881726+08	\N	\N	1	2021-09-03
4000	-43	生活日用	0	安全锤	2021-09-22 17:45:24.754401+08	0	0	\N	2021-09-22 17:45:24.754691+08	\N	\N	1	2021-09-03
4001	-30	交通出行	0	充电	2021-09-22 17:45:59.014543+08	0	0	\N	2021-09-22 17:45:59.01487+08	\N	\N	1	2021-09-05
4002	-113	饮食	0	象山面馆	2021-09-22 17:46:39.954881+08	0	0	\N	2021-09-22 17:46:39.955188+08	\N	\N	1	2021-09-05
4003	-5074	小孩教育	0	幼儿园学费	2021-09-22 17:47:18.699491+08	0	0	\N	2021-09-22 17:47:18.699794+08	\N	\N	1	2021-09-07
4004	-22	饮食	0	零食	2021-09-22 17:47:35.159562+08	0	0	\N	2021-09-22 17:47:35.159865+08	\N	\N	1	2021-09-07
4005	-76	饮食	0	水果	2021-09-22 17:47:49.41387+08	0	0	\N	2021-09-22 17:47:49.414162+08	\N	\N	1	2021-09-11
4006	-125	饮食	0	美购	2021-09-22 17:48:04.099555+08	0	0	\N	2021-09-22 17:48:04.099864+08	\N	\N	1	2021-09-11
4007	-56	饮食	0	美购	2021-09-22 17:48:19.014306+08	0	0	\N	2021-09-22 17:48:19.014662+08	\N	\N	1	2021-09-11
4009	-12	饮食	0	馄饨	2021-09-22 17:48:50.274701+08	0	0	\N	2021-09-22 17:48:50.275007+08	\N	\N	1	2021-09-12
4010	-48	生活日用	0	药店	2021-09-22 17:49:13.579532+08	0	0	\N	2021-09-22 17:49:13.579846+08	\N	\N	1	2021-09-13
4011	-14	生活日用	0	超市	2021-09-22 17:49:32.964754+08	0	0	\N	2021-09-22 17:49:32.965047+08	\N	\N	1	2021-09-14
4012	-25	交通出行	0	缆车小孩半价票	2021-09-22 17:50:06.835988+08	0	0	\N	2021-09-22 17:50:06.836305+08	\N	\N	1	2021-09-20
4013	-20	饮食	0	零食	2021-09-22 17:50:26.47408+08	0	0	\N	2021-09-22 17:50:26.474416+08	\N	\N	1	2021-09-20
4014	-145	饮食	0	奉化牛肉面	2021-09-22 17:50:47.680171+08	0	0	\N	2021-09-22 17:50:47.680493+08	\N	\N	1	2021-09-20
4015	-37	生活日用	0	洗车毛巾	2021-09-22 17:51:05.494266+08	0	0	\N	2021-09-22 17:51:05.494603+08	\N	\N	1	2021-09-22
4016	-99	生活日用	0	汽车吸尘器	2021-09-22 17:51:26.579115+08	0	0	\N	2021-09-22 17:51:26.579479+08	\N	\N	1	2021-09-22
4017	-37	生活日用	0	手机壳	2021-09-22 17:51:41.096383+08	0	0	\N	2021-09-22 17:51:41.096695+08	\N	\N	1	2021-09-22
4018	-120	健康保险	0	太平洋甬宁保	2021-09-22 17:52:36.980404+08	0	0	\N	2021-09-22 17:52:36.980734+08	\N	\N	1	2021-09-02
4019	-5	交通出行	0	停车	2021-09-22 17:52:55.100638+08	0	0	\N	2021-09-22 17:52:55.100948+08	\N	\N	1	2021-09-04
4020	-33	饮食	0	蜜雪冰城	2021-09-22 17:53:28.990507+08	0	0	\N	2021-09-22 17:53:28.990839+08	\N	\N	1	2021-09-12
4021	-94	饮食	0	华莱士	2021-09-22 17:53:49.381043+08	0	0	\N	2021-09-22 17:53:49.38135+08	\N	\N	1	2021-09-12
4022	-34	饮食	0	零食	2021-09-22 17:54:14.879943+08	0	0	\N	2021-09-22 17:54:14.880249+08	\N	\N	1	2021-09-17
4023	-6	文教娱乐	0	爱奇艺	2021-09-22 19:09:22.879838+08	0	0	\N	2021-09-22 19:09:22.880155+08	\N	\N	2	2021-09-13
4024	-14	生活日用	0	垃圾袋	2021-09-22 19:09:40.95446+08	0	0	\N	2021-09-22 19:09:40.954779+08	\N	\N	2	2021-09-14
4025	-122	饮食	0	午饭	2021-09-22 19:09:57.945442+08	0	0	\N	2021-09-22 19:09:57.945752+08	\N	\N	2	2021-09-16
4026	-5	交通出行	0	停车费	2021-09-22 19:10:16.672209+08	0	0	\N	2021-09-22 19:10:16.672539+08	\N	\N	2	2021-09-16
4027	-200	饮食	0	老宁波充值	2021-09-22 19:10:36.327877+08	0	0	\N	2021-09-22 19:10:36.328175+08	\N	\N	2	2021-09-17
4028	-20	生活日用	0	超市	2021-09-22 19:10:57.324693+08	0	0	\N	2021-09-22 19:10:57.325016+08	\N	\N	2	2021-09-17
4029	-80	饮食	0	水果	2021-09-22 19:11:21.963875+08	0	0	\N	2021-09-22 19:11:21.964203+08	\N	\N	2	2021-09-20
4030	-320	文教娱乐	0	雪窦山	2021-09-22 19:11:40.248761+08	0	0	\N	2021-09-22 19:11:40.249046+08	\N	\N	2	2021-09-20
4031	-40	文教娱乐	0	雪窦山	2021-09-22 19:11:56.971285+08	0	0	\N	2021-09-22 19:11:56.971587+08	\N	\N	2	2021-09-20
4032	-20	生活日用	0	绞股蓝	2021-09-22 19:12:18.286288+08	0	0	\N	2021-09-22 19:12:18.28662+08	\N	\N	2	2021-09-21
4033	-153	饮食	0	饮料	2021-09-22 19:13:07.11639+08	0	0	\N	2021-09-22 19:13:07.116677+08	\N	\N	2	2021-09-21
4034	-12	饮食	0	麦当劳	2021-09-22 19:13:22.011373+08	0	0	\N	2021-09-22 19:13:22.011701+08	\N	\N	2	2021-09-21
4035	-7	生活日用	0	口罩	2021-09-22 19:13:33.0207+08	0	0	\N	2021-09-22 19:13:33.021033+08	\N	\N	2	2021-09-22
4036	-5	交通出行	0	停车费	2021-09-22 19:14:43.089371+08	0	0	\N	2021-09-22 19:14:43.089669+08	\N	\N	2	2021-09-14
4037	-5	交通出行	0	停车费	2021-09-22 19:14:57.156053+08	0	0	\N	2021-09-22 19:14:57.15635+08	\N	\N	2	2021-09-15
4038	-25	饮食	0	午饭	2021-09-22 19:15:19.975349+08	0	0	\N	2021-09-22 19:15:19.975783+08	\N	\N	2	2021-09-18
4039	-125	饮食	0	千层饼	2021-09-22 19:15:36.171407+08	0	0	\N	2021-09-22 19:15:36.171705+08	\N	\N	2	2021-09-20
4040	-5	交通出行	0	停车费	2021-09-22 19:16:42.259558+08	0	0	\N	2021-09-22 19:16:42.259881+08	\N	\N	2	2021-09-21
4041	15593	收入	1	工资	2021-09-23 13:37:33.670502+08	0	0	\N	2021-09-23 13:39:34.466385+08	\N	\N	1	2021-07-15
4042	15593	收入	1	工资	2021-09-23 13:38:03.020486+08	0	0	\N	2021-09-23 13:39:45.469221+08	\N	\N	1	2021-08-13
4043	15512	收入	1	工资	2021-09-23 13:38:29.764853+08	0	0	\N	2021-09-23 13:39:53.057121+08	\N	\N	1	2021-09-15
4044	-25	交通出行	0	地铁	2021-09-30 11:14:04.975404+08	0	0	\N	2021-09-30 11:14:04.980469+08	\N	\N	1	2021-09-25
4045	-140	小孩健康	0	牙齿涂氟	2021-09-30 11:14:41.985942+08	0	0	\N	2021-09-30 11:14:41.986347+08	\N	\N	1	2021-09-25
4046	-4	交通出行	0	地铁	2021-09-30 11:14:55.175698+08	0	0	\N	2021-09-30 11:14:55.176104+08	\N	\N	1	2021-09-25
4047	-10	文教娱乐	0	特斯拉网络	2021-09-30 11:15:23.151307+08	0	0	\N	2021-09-30 11:15:23.151651+08	\N	\N	1	2021-09-26
4048	-25	生活日用	0	副驾驶安全带固定器	2021-09-30 11:15:50.759817+08	0	0	\N	2021-09-30 11:15:50.760142+08	\N	\N	1	2021-09-30
4049	-98	小孩教育	0	小孩试听课X4	2021-09-30 16:49:31.225677+08	0	0	\N	2021-09-30 16:49:31.225986+08	\N	\N	1	2021-09-30
4050	-5	交通出行	0	地铁	2021-10-07 20:15:16.615614+08	0	0	\N	2021-10-07 20:15:16.619462+08	\N	\N	2	2021-09-25
4051	-18	饮食	0	小馒头	2021-10-07 20:15:31.534516+08	0	0	\N	2021-10-07 20:15:31.534827+08	\N	\N	2	2021-09-25
4052	-4	交通出行	0	地铁	2021-10-07 20:15:43.077661+08	0	0	\N	2021-10-07 20:15:43.077991+08	\N	\N	2	2021-09-25
4053	-16	饮食	0	古茗	2021-10-07 20:16:08.061542+08	0	0	\N	2021-10-07 20:16:08.061851+08	\N	\N	2	2021-09-26
4054	-5	生活日用	0	毛巾	2021-10-07 20:16:22.589837+08	0	0	\N	2021-10-07 20:16:22.590153+08	\N	\N	2	2021-09-26
4055	-17	生活日用	0	手机壳	2021-10-07 20:16:41.019269+08	0	0	\N	2021-10-07 20:16:41.019601+08	\N	\N	2	2021-09-28
4056	-5	小孩服饰	0	贴纸	2021-10-07 20:17:24.897543+08	0	0	\N	2021-10-07 20:17:24.897876+08	\N	\N	2	2021-09-29
4057	-10	饮食	0	古茗奶茶	2021-10-07 20:17:43.846412+08	0	0	\N	2021-10-07 20:17:43.846748+08	\N	\N	2	2021-09-29
4058	-40	饮食	0	麦当劳	2021-10-07 20:17:59.248359+08	0	0	\N	2021-10-07 20:17:59.248712+08	\N	\N	2	2021-09-29
4059	-38	服饰美容	0	开衫	2021-10-07 20:18:18.870723+08	0	0	\N	2021-10-07 20:18:18.87103+08	\N	\N	2	2021-09-29
4060	-5	饮食	0	水果	2021-10-07 20:18:38.338542+08	0	0	\N	2021-10-07 20:18:38.338862+08	\N	\N	2	2021-09-30
4061	-6	饮食	0	冰激凌	2021-10-07 20:18:56.011264+08	0	0	\N	2021-10-07 20:18:56.01158+08	\N	\N	2	2021-09-30
4062	-15	饮食	0	甘蔗	2021-10-07 20:20:24.034916+08	0	0	\N	2021-10-07 20:20:24.035271+08	\N	\N	2	2021-10-01
4063	-5	交通出行	0	停车费	2021-10-07 20:20:38.485905+08	0	0	\N	2021-10-07 20:20:38.486208+08	\N	\N	2	2021-10-01
4064	-32	饮食	0	酸菜鱼	2021-10-07 20:21:00.466395+08	0	0	\N	2021-10-07 20:21:00.466729+08	\N	\N	2	2021-10-02
4065	-183	住房缴费	0	电费	2021-10-07 20:21:19.989896+08	0	0	\N	2021-10-07 20:21:19.990254+08	\N	\N	2	2021-10-02
4066	-16	饮食	0	古茗	2021-10-07 20:21:35.843497+08	0	0	\N	2021-10-07 20:21:35.843804+08	\N	\N	2	2021-10-02
4067	-26	饮食	0	芭比	2021-10-07 20:21:46.114931+08	0	0	\N	2021-10-07 20:21:46.115256+08	\N	\N	2	2021-10-02
4068	-38	饮食	0	新江厦购物	2021-10-07 20:22:07.841881+08	0	0	\N	2021-10-07 20:22:07.842186+08	\N	\N	2	2021-10-02
4069	-43	饮食	0	水果	2021-10-07 20:22:27.693609+08	0	0	\N	2021-10-07 20:22:27.693957+08	\N	\N	2	2021-10-03
4070	-40	饮食	0	麦当劳	2021-10-07 20:22:41.868814+08	0	0	\N	2021-10-07 20:22:41.869137+08	\N	\N	2	2021-10-04
4071	-290	饮食	0	午餐	2021-10-07 20:22:55.28523+08	0	0	\N	2021-10-07 20:22:55.285568+08	\N	\N	2	2021-10-04
4072	-269	住房缴费	0	住宿	2021-10-07 20:23:13.126261+08	0	0	\N	2021-10-07 20:23:13.126679+08	\N	\N	2	2021-10-04
4073	-35	生活日用	0	购物	2021-10-07 20:23:27.979967+08	0	0	\N	2021-10-07 20:23:27.980263+08	\N	\N	2	2021-10-05
4074	-56	生活日用	0	游泳圈	2021-10-07 20:23:49.655522+08	0	0	\N	2021-10-07 20:23:49.655829+08	\N	\N	2	2021-10-05
4075	-15	饮食	0	古茗	2021-10-07 20:25:43.791095+08	0	0	\N	2021-10-07 20:25:43.791517+08	\N	\N	2	2021-09-29
4076	-18	饮食	0	古茗	2021-10-07 20:26:18.173085+08	0	0	\N	2021-10-07 20:26:18.173401+08	\N	\N	2	2021-09-29
4077	-20	饮食	0	古茗	2021-10-07 20:26:34.812585+08	0	0	\N	2021-10-07 20:26:34.812911+08	\N	\N	2	2021-10-02
4078	-4	饮食	0	早餐	2021-10-07 20:27:21.560248+08	0	0	\N	2021-10-07 20:27:21.560603+08	\N	\N	2	2021-09-30
4079	-550	饮食	0	山姆	2021-10-07 20:27:46.36264+08	0	0	\N	2021-10-07 20:27:46.362959+08	\N	\N	2	2021-10-02
4080	-20	文教娱乐	0	照片	2021-10-07 20:28:11.414097+08	0	0	\N	2021-10-07 20:28:11.414478+08	\N	\N	2	2021-10-04
4081	-158	服饰美容	0	拖鞋	2021-10-07 20:29:28.566049+08	0	0	\N	2021-10-07 20:29:28.566404+08	\N	\N	2	2021-10-01
4083	-26	饮食	0	烧烤	2021-10-22 17:21:51.665227+08	0	0	\N	2021-10-22 17:21:51.665538+08	\N	\N	2	2021-10-07
4084	-25	饮食	0	米糕	2021-10-22 17:22:15.821539+08	0	0	\N	2021-10-22 17:22:15.821864+08	\N	\N	2	2021-10-07
4085	-18	饮食	0	哈里哈里	2021-10-22 17:22:29.950198+08	0	0	\N	2021-10-22 17:22:29.950544+08	\N	\N	2	2021-10-07
4086	-45	交通出行	0	空调滤芯	2021-10-22 17:23:04.786062+08	0	0	\N	2021-10-22 17:23:04.786433+08	\N	\N	2	2021-10-10
4087	-4	饮食	0	绿资	2021-10-22 17:23:24.295567+08	0	0	\N	2021-10-22 17:23:24.295898+08	\N	\N	2	2021-10-11
4088	-19	文教娱乐	0	爱奇艺VIP	2021-10-22 17:23:44.075594+08	0	0	\N	2021-10-22 17:23:44.075933+08	\N	\N	2	2021-10-12
4089	-12	生活日用	0	胶枪	2021-10-22 17:24:33.745343+08	0	0	\N	2021-10-22 17:24:33.745643+08	\N	\N	2	2021-10-16
4090	-103	住房缴费	0	电费	2021-10-22 17:24:49.962681+08	0	0	\N	2021-10-22 17:24:49.963128+08	\N	\N	2	2021-10-16
4091	-19	饮食	0	鸡柳饼	2021-10-22 17:25:57.819591+08	0	0	\N	2021-10-22 17:25:57.819902+08	\N	\N	2	2021-10-17
4092	-97	饮食	0	小实验	2021-10-22 17:26:28.26587+08	0	0	\N	2021-10-22 17:26:28.266197+08	\N	\N	2	2021-10-17
4093	-29	饮食	0	水果摊	2021-10-22 17:26:44.230493+08	0	0	\N	2021-10-22 17:26:44.230812+08	\N	\N	2	2021-10-17
4094	-21	小孩玩具	0	篮球	2021-10-22 17:27:15.200762+08	0	0	\N	2021-10-22 17:27:15.201086+08	\N	\N	2	2021-10-17
4095	-35	饮食	0	烧烤	2021-10-22 17:28:27.401643+08	0	0	\N	2021-10-22 17:28:27.401988+08	\N	\N	2	2021-10-17
4096	-10	饮食	0	馄饨	2021-10-22 17:28:52.945809+08	0	0	\N	2021-10-22 17:28:52.94611+08	\N	\N	2	2021-10-18
4097	-15	饮食	0	古茗	2021-10-22 17:29:09.975342+08	0	0	\N	2021-10-22 17:29:09.975638+08	\N	\N	2	2021-10-21
4098	-44	饮食	0	叮咚买菜	2021-10-22 17:29:26.386377+08	0	0	\N	2021-10-22 17:29:26.386704+08	\N	\N	2	2021-10-21
4099	-92	文教娱乐	0	电影票	2021-10-22 17:30:11.740273+08	0	0	\N	2021-10-22 17:30:11.740634+08	\N	\N	2	2021-10-09
4100	-10	交通出行	0	停车费	2021-10-22 17:30:31.26536+08	0	0	\N	2021-10-22 17:30:31.265682+08	\N	\N	2	2021-10-10
4101	-100	交通出行	0	国家电网	2021-10-26 09:31:33.930368+08	0	0	\N	2021-10-26 09:31:33.934044+08	\N	\N	1	2021-10-04
4102	-10	饮食	0	零食	2021-10-26 09:31:50.614849+08	0	0	\N	2021-10-26 09:31:50.615136+08	\N	\N	1	2021-10-04
4103	-50	交通出行	0	国家电网	2021-10-26 09:32:15.809673+08	0	0	\N	2021-10-26 09:32:15.809991+08	\N	\N	1	2021-10-06
4104	-28	饮食	0	水果	2021-10-26 09:32:34.585564+08	0	0	\N	2021-10-26 09:32:34.585874+08	\N	\N	1	2021-10-06
4105	-40	饮食	0	零食	2021-10-26 09:32:54.529892+08	0	0	\N	2021-10-26 09:32:54.530185+08	\N	\N	1	2021-10-06
4106	-47	生活日用	0	日用	2021-10-26 09:33:15.346213+08	0	0	\N	2021-10-26 09:33:15.346557+08	\N	\N	1	2021-10-07
4107	-18	生活日用	0	日用	2021-10-26 09:33:31.990066+08	0	0	\N	2021-10-26 09:33:31.99041+08	\N	\N	1	2021-10-07
4108	-2	交通出行	0	公交	2021-10-26 09:33:52.854912+08	0	0	\N	2021-10-26 09:33:52.855202+08	\N	\N	1	2021-10-17
4109	-494	服饰美容	0	衣服	2021-10-26 09:34:17.429577+08	0	0	\N	2021-10-26 09:34:17.42988+08	\N	\N	1	2021-10-17
4110	-14	小孩玩具	0	玩具	2021-10-26 09:34:40.990518+08	0	0	\N	2021-10-26 09:34:40.990833+08	\N	\N	1	2021-10-17
4111	-6	饮食	0	包子	2021-10-26 09:35:00.71428+08	0	0	\N	2021-10-26 09:35:00.71464+08	\N	\N	1	2021-10-23
4112	-10	饮食	0	水果	2021-10-26 09:35:19.155256+08	0	0	\N	2021-10-26 09:35:19.155625+08	\N	\N	1	2021-10-23
4113	-980	小孩其他	0	篮球十二节	2021-10-26 09:35:46.385406+08	0	0	\N	2021-10-26 09:35:46.385719+08	\N	\N	1	2021-10-23
4114	-5	交通出行	0	停车费	2021-10-26 09:36:43.820117+08	0	0	\N	2021-10-26 09:36:43.820421+08	\N	\N	1	2021-10-04
4115	-10	饮食	0	零食	2021-10-26 09:36:59.444965+08	0	0	\N	2021-10-26 09:36:59.445258+08	\N	\N	1	2021-10-04
4116	-10	饮食	0	饮料	2021-10-26 09:37:12.659693+08	0	0	\N	2021-10-26 09:37:12.660065+08	\N	\N	1	2021-10-04
4117	-15	饮食	0	零食	2021-10-26 09:37:27.083765+08	0	0	\N	2021-10-26 09:37:27.0841+08	\N	\N	1	2021-10-04
4118	-1000	交通出行	0	金华游	2021-10-26 09:37:52.954573+08	0	0	\N	2021-10-26 09:37:52.954916+08	\N	\N	1	2021-10-06
4119	-10	饮食	0	coco	2021-10-26 09:38:10.06929+08	0	0	\N	2021-10-26 09:38:10.069617+08	\N	\N	1	2021-10-09
4120	-40	饮食	0	三江	2021-10-26 09:38:56.635344+08	0	0	\N	2021-10-26 09:38:56.635666+08	\N	\N	1	2021-10-12
4121	-297	生活日用	0	被子	2021-11-06 08:56:59.377772+08	0	0	\N	2021-11-06 08:56:59.384303+08	\N	\N	2	2021-10-23
4122	-794	服饰美容	0	迪卡侬	2021-11-06 08:57:19.109193+08	0	0	\N	2021-11-06 08:57:19.109539+08	\N	\N	2	2021-10-24
4123	-27	小孩玩具	0	儿童餐具	2021-11-06 08:57:48.223644+08	0	0	\N	2021-11-06 08:57:48.223967+08	\N	\N	2	2021-10-27
4124	-46	饮食	0	美购	2021-11-06 08:58:07.09302+08	0	0	\N	2021-11-06 08:58:07.093325+08	\N	\N	2	2021-10-28
4125	-30	饮食	0	馄饨料	2021-11-06 08:59:09.957995+08	0	0	\N	2021-11-06 08:59:09.958383+08	\N	\N	2	2021-10-29
4126	-100	饮食	0	老婆大人	2021-11-06 08:59:31.176874+08	0	0	\N	2021-11-06 08:59:31.17718+08	\N	\N	2	2021-10-30
4127	-25	饮食	0	水果	2021-11-06 08:59:51.957593+08	0	0	\N	2021-11-06 08:59:51.957951+08	\N	\N	2	2021-10-30
4128	-128	服饰美容	0	蘑菇街	2021-11-06 09:00:15.879693+08	0	0	\N	2021-11-06 09:00:15.88003+08	\N	\N	2	2021-10-30
4129	-122	生活日用	0	洗车	2021-11-06 09:00:48.336371+08	0	0	\N	2021-11-06 09:00:48.33671+08	\N	\N	2	2021-11-01
4130	-21	生活日用	0	球球线	2021-11-06 09:01:08.541112+08	0	0	\N	2021-11-06 09:01:08.541431+08	\N	\N	2	2021-11-01
4131	-308	服饰美容	0	衣服	2021-11-06 09:01:26.133921+08	0	0	\N	2021-11-06 09:01:26.134293+08	\N	\N	2	2021-11-01
4132	-91	饮食	0	米	2021-11-06 09:01:45.767905+08	0	0	\N	2021-11-06 09:01:45.768244+08	\N	\N	2	2021-11-01
4133	-100	饮食	0	米	2021-11-06 09:02:11.463277+08	0	0	\N	2021-11-06 09:02:11.463583+08	\N	\N	2	2021-11-01
4134	-41	住房缴费	0	景湖水岸	2021-11-06 09:02:49.443273+08	0	0	\N	2021-11-06 09:02:49.443569+08	\N	\N	2	2021-11-02
4135	-100	饮食	0	老婆大人	2021-11-06 09:03:04.844653+08	0	0	\N	2021-11-06 09:03:04.845004+08	\N	\N	2	2021-11-02
4136	-20	饮食	0	奶茶	2021-11-06 09:03:21.513317+08	0	0	\N	2021-11-06 09:03:21.513657+08	\N	\N	2	2021-11-03
4137	-18	生活日用	0	管道疏通	2021-11-06 09:03:47.767285+08	0	0	\N	2021-11-06 09:03:47.76763+08	\N	\N	2	2021-11-03
4138	-100	服饰美容	0	老爹鞋	2021-11-06 09:05:28.559552+08	0	0	\N	2021-11-06 09:05:28.559856+08	\N	\N	2	2021-11-03
4139	-53	服饰美容	0	运动鞋	2021-11-06 09:05:42.915331+08	0	0	\N	2021-11-06 09:05:42.915662+08	\N	\N	2	2021-11-03
4140	-123	住房缴费	0	东兴电费	2021-11-06 09:06:01.75268+08	0	0	\N	2021-11-06 09:06:01.753011+08	\N	\N	2	2021-11-03
4141	-54	住房缴费	0	景湖电费	2021-11-06 09:06:29.400228+08	0	0	\N	2021-11-06 09:06:29.400576+08	\N	\N	2	2021-11-05
4142	-14	饮食	0	美团	2021-11-06 09:07:51.16284+08	0	0	\N	2021-11-06 09:07:51.16318+08	\N	\N	2	2021-10-23
4143	-34	饮食	0	叮咚买菜	2021-11-06 09:08:22.606589+08	0	0	\N	2021-11-06 09:08:22.606936+08	\N	\N	2	2021-10-24
4144	-13	饮食	0	美团	2021-11-06 09:08:40.697449+08	0	0	\N	2021-11-06 09:08:40.6978+08	\N	\N	2	2021-10-26
4145	-200	交通出行	0	加油	2021-11-06 09:09:02.657471+08	0	0	\N	2021-11-06 09:09:02.657789+08	\N	\N	2	2021-10-27
4146	-10	文教娱乐	0	打球	2021-11-06 09:09:55.989861+08	0	0	\N	2021-11-06 09:09:55.990157+08	\N	\N	2	2021-10-28
4147	-56	服饰美容	0	拼多多	2021-11-06 09:10:05.983238+08	0	0	\N	2021-11-06 09:10:05.983563+08	\N	\N	2	2021-10-29
4148	-3	交通出行	0	停车费	2021-11-06 09:10:30.36922+08	0	0	\N	2021-11-06 09:10:30.369551+08	\N	\N	2	2021-10-29
4149	-649	生活日用	0	电瓶车	2021-11-06 09:10:46.980481+08	0	0	\N	2021-11-06 09:10:46.980801+08	\N	\N	2	2021-11-01
4150	-2	饮食	0	新美心	2021-11-06 09:11:31.71231+08	0	0	\N	2021-11-06 09:11:31.71266+08	\N	\N	2	2021-11-02
4151	-5	生活日用	0	cdr	2021-11-06 09:11:48.939993+08	0	0	\N	2021-11-06 09:11:48.940346+08	\N	\N	2	2021-11-03
4152	-13	生活日用	0	义乌商品	2021-11-06 09:12:04.302427+08	0	0	\N	2021-11-06 09:12:04.302758+08	\N	\N	2	2021-11-05
4153	-10	交通出行	0	特斯拉网络服务	2021-11-15 17:57:06.735953+08	0	0	\N	2021-11-15 17:57:06.744795+08	\N	\N	1	2021-10-26
4154	-5	交通出行	0	停车费	2021-11-15 17:57:25.675291+08	0	0	\N	2021-11-15 17:57:25.675591+08	\N	\N	1	2021-10-29
4155	-15	饮食	0	包子	2021-11-15 17:57:43.654945+08	0	0	\N	2021-11-15 17:57:43.655273+08	\N	\N	1	2021-10-30
4156	-50	通讯物流	0	话费	2021-11-15 17:58:04.734666+08	0	0	\N	2021-11-15 17:58:04.734984+08	\N	\N	1	2021-10-30
4157	-600	小孩健康	0	儿子社保	2021-11-15 17:58:42.554641+08	0	0	\N	2021-11-15 17:58:42.554973+08	\N	\N	1	2021-11-01
4158	-15	小孩文具	0	偏旁	2021-11-15 17:59:05.04017+08	0	0	\N	2021-11-15 17:59:05.040465+08	\N	\N	1	2021-11-03
4159	-100	饮食	0	老婆大人	2021-11-15 17:59:24.079868+08	0	0	\N	2021-11-15 17:59:24.0802+08	\N	\N	1	2021-11-06
4160	-40	饮食	0	零食	2021-11-15 18:00:54.575528+08	0	0	\N	2021-11-15 18:00:54.575863+08	\N	\N	1	2021-11-07
4161	-880	小孩奶粉	0	奶粉	2021-11-15 18:02:20.439014+08	0	0	\N	2021-11-15 18:02:20.43936+08	\N	\N	1	2021-10-26
4162	-600	通讯物流	0	电信网络	2021-11-15 18:02:45.473686+08	0	0	\N	2021-11-15 18:02:45.473995+08	\N	\N	1	2021-11-03
4163	-2	交通出行	0	停车费	2021-11-15 18:03:05.578888+08	0	0	\N	2021-11-15 18:03:05.579179+08	\N	\N	1	2021-11-06
4164	-115	饮食	0	水果	2021-11-15 18:03:23.908201+08	0	0	\N	2021-11-15 18:03:23.90853+08	\N	\N	1	2021-11-07
4165	-10	饮食	0	零食	2021-11-15 18:03:41.484472+08	0	0	\N	2021-11-15 18:03:41.484797+08	\N	\N	1	2021-11-07
4166	-2	交通出行	0	停车	2021-11-15 18:03:58.93423+08	0	0	\N	2021-11-15 18:03:58.934575+08	\N	\N	1	2021-11-07
4167	-78	饮食	0	买车	2021-11-15 18:04:37.218952+08	0	0	\N	2021-11-15 18:04:37.219321+08	\N	\N	1	2021-11-13
4168	-102	饮食	0	宁大步行街	2021-11-15 18:06:50.029036+08	0	0	\N	2021-11-15 18:06:50.029336+08	\N	\N	1	2021-11-13
4169	-298	服饰美容	0	优衣库	2021-11-15 18:07:05.235744+08	0	0	\N	2021-11-15 18:07:05.236094+08	\N	\N	1	2021-11-14
4170	-21	饮食	0	午饭	2021-11-15 22:13:35.469047+08	0	0	\N	2021-11-15 22:13:35.46934+08	\N	\N	2	2021-11-06
4171	-8	生活日用	0	窗帘轨道	2021-11-15 22:14:11.11841+08	0	0	\N	2021-11-15 22:14:11.118752+08	\N	\N	2	2021-11-07
4172	-21	饮食	0	嵊州年糕	2021-11-15 22:14:34.887851+08	0	0	\N	2021-11-15 22:14:34.888333+08	\N	\N	2	2021-11-07
4173	-50	饮食	0	八戒猪蹄	2021-11-15 22:15:07.963337+08	0	0	\N	2021-11-15 22:15:07.963659+08	\N	\N	2	2021-11-07
4174	-200	饮食	0	鸡公煲	2021-11-15 22:15:23.076725+08	0	0	\N	2021-11-15 22:15:23.077029+08	\N	\N	2	2021-11-07
4175	-38	饮食	0	美购	2021-11-15 22:15:41.256082+08	0	0	\N	2021-11-15 22:15:41.256373+08	\N	\N	2	2021-11-08
4176	-14	生活日用	0	餐巾纸	2021-11-15 22:16:15.677929+08	0	0	\N	2021-11-15 22:16:15.678251+08	\N	\N	2	2021-11-09
4177	-32	饮食	0	叮咚买菜	2021-11-15 22:16:46.617624+08	0	0	\N	2021-11-15 22:16:46.617962+08	\N	\N	2	2021-11-10
4178	-16	生活日用	0	餐巾纸	2021-11-15 22:17:13.262604+08	0	0	\N	2021-11-15 22:17:13.262923+08	\N	\N	2	2021-11-11
4179	-293	文教娱乐	0	耳机	2021-11-15 22:17:38.355238+08	0	0	\N	2021-11-15 22:17:38.355544+08	\N	\N	2	2021-11-11
4180	-30	饮食	0	牛奶	2021-11-15 22:17:58.018635+08	0	0	\N	2021-11-15 22:17:58.01899+08	\N	\N	2	2021-11-11
4181	-29	饮食	0	美购	2021-11-15 22:18:25.920962+08	0	0	\N	2021-11-15 22:18:25.921266+08	\N	\N	2	2021-11-11
4182	-80	生活日用	0	生活用品	2021-11-15 22:19:20.809539+08	0	0	\N	2021-11-15 22:19:20.809847+08	\N	\N	2	2021-11-11
4183	-69	饮食	0	美团	2021-11-15 22:19:46.596594+08	0	0	\N	2021-11-15 22:19:46.596901+08	\N	\N	2	2021-11-14
4184	-100	住房缴费	0	天然气东兴	2021-11-15 22:20:17.031183+08	0	0	\N	2021-11-15 22:20:17.031489+08	\N	\N	2	2021-11-15
4185	-100	住房缴费	0	天然气	2021-11-15 22:20:36.108014+08	0	0	\N	2021-11-15 22:20:36.108369+08	\N	\N	2	2021-11-15
4186	-24	服饰美容	0	袜子	2021-11-15 22:21:06.231832+08	0	0	\N	2021-11-15 22:21:06.232175+08	\N	\N	2	2021-11-15
4187	-49	小孩服饰	0	拖鞋	2021-11-15 22:22:11.497884+08	0	0	\N	2021-11-15 22:22:11.498183+08	\N	\N	2	2021-11-07
4188	-11	饮食	0	coco	2021-11-15 22:22:26.327897+08	0	0	\N	2021-11-15 22:22:26.328221+08	\N	\N	2	2021-11-07
4189	-3	饮食	0	矿泉水	2021-11-15 22:22:52.246015+08	0	0	\N	2021-11-15 22:22:52.246376+08	\N	\N	2	2021-11-07
4190	-10	交通出行	0	停车费	2021-11-15 22:23:34.828333+08	0	0	\N	2021-11-15 22:23:34.828656+08	\N	\N	2	2021-11-07
4191	-7	生活日用	0	电子	2021-11-15 22:23:58.911494+08	0	0	\N	2021-11-15 22:23:58.911799+08	\N	\N	2	2021-11-13
4192	-25	饮食	0	脆皮五花肉	2021-11-15 22:24:22.922887+08	0	0	\N	2021-11-15 22:24:22.92321+08	\N	\N	2	2021-11-13
4193	-10	饮食	0	鸡蛋糕	2021-11-15 22:24:37.679936+08	0	0	\N	2021-11-15 22:24:37.680283+08	\N	\N	2	2021-11-13
4194	-65	服饰美容	0	袜子	2021-11-15 22:24:52.223227+08	0	0	\N	2021-11-15 22:24:52.223569+08	\N	\N	2	2021-11-13
4195	-20	饮食	0	猪油渣	2021-11-15 22:25:28.524369+08	0	0	\N	2021-11-15 22:25:28.524698+08	\N	\N	2	2021-11-13
4196	-141	小孩服饰	0	衣服	2021-11-15 22:25:49.128335+08	0	0	\N	2021-11-15 22:25:49.128706+08	\N	\N	2	2021-11-14
4197	-91	服饰美容	0	衣服	2021-11-15 22:25:59.176135+08	0	0	\N	2021-11-15 22:25:59.176427+08	\N	\N	2	2021-11-14
4198	-81	小孩玩具	0	名创	2021-11-15 22:26:17.734917+08	0	0	\N	2021-11-15 22:26:17.735248+08	\N	\N	2	2021-11-14
4199	-5	交通出行	0	停车费	2021-11-15 22:26:38.846658+08	0	0	\N	2021-11-15 22:26:38.846971+08	\N	\N	2	2021-11-14
4200	-48	生活日用	0	拼多多	2021-11-15 22:27:19.760194+08	0	0	\N	2021-11-15 22:27:19.760544+08	\N	\N	2	2021-11-14
4201	-24	服饰美容	0	打底袜	2021-11-28 07:36:18.023941+08	0	0	\N	2021-11-28 07:36:18.027829+08	\N	\N	2	2021-11-15
4202	-100	通讯物流	0	188	2021-11-28 07:36:43.486982+08	0	0	\N	2021-11-28 07:36:43.487327+08	\N	\N	2	2021-11-16
4203	-5	交通出行	0	停车费	2021-11-28 07:37:41.798617+08	0	0	\N	2021-11-28 07:37:41.798941+08	\N	\N	2	2021-11-19
4204	-48	服饰美容	0	阔腿裤	2021-11-28 07:38:05.179347+08	0	0	\N	2021-11-28 07:38:05.179732+08	\N	\N	2	2021-11-19
4205	-122	住房缴费	0	东兴水费	2021-11-28 07:38:59.097091+08	0	0	\N	2021-11-28 07:38:59.097397+08	\N	\N	2	2021-11-19
4206	-22	饮食	0	午饭	2021-11-28 07:39:18.567312+08	0	0	\N	2021-11-28 07:39:18.567607+08	\N	\N	2	2021-11-20
4207	-14	服饰美容	0	袜子	2021-11-28 07:39:40.759806+08	0	0	\N	2021-11-28 07:39:40.760152+08	\N	\N	2	2021-11-20
4208	-51	饮食	0	布朗尼	2021-11-28 07:40:00.510501+08	0	0	\N	2021-11-28 07:40:00.510856+08	\N	\N	2	2021-11-21
4209	-15	饮食	0	午饭	2021-11-28 07:40:21.604409+08	0	0	\N	2021-11-28 07:40:21.604775+08	\N	\N	2	2021-11-23
4210	-40	生活日用	0	鲜花	2021-11-28 07:40:48.568033+08	0	0	\N	2021-11-28 07:40:48.568352+08	\N	\N	2	2021-11-25
4211	-100	饮食	0	土特产	2021-11-28 07:41:08.62957+08	0	0	\N	2021-11-28 07:41:08.629892+08	\N	\N	2	2021-11-26
4212	-118	饮食	0	大渝火锅	2021-11-28 07:41:33.772529+08	0	0	\N	2021-11-28 07:41:33.77283+08	\N	\N	2	2021-11-27
4213	-200	交通出行	0	油卡	2021-11-28 07:42:28.841272+08	0	0	\N	2021-11-28 07:42:28.841613+08	\N	\N	2	2021-11-17
4214	-6	饮食	0	早饭	2021-11-28 07:43:01.457585+08	0	0	\N	2021-11-28 07:43:01.457898+08	\N	\N	2	2021-11-21
4215	-5	生活日用	0	花瓶	2021-11-28 07:44:21.829262+08	0	0	\N	2021-11-28 07:44:21.829604+08	\N	\N	2	2021-11-21
4216	-40	饮食	0	新江厦	2021-11-28 07:45:18.873494+08	0	0	\N	2021-11-28 07:45:18.873793+08	\N	\N	2	2021-11-21
4217	-28	小孩生活用品	0	筷子	2021-11-28 07:45:52.326016+08	0	0	\N	2021-11-28 07:45:52.326396+08	\N	\N	2	2021-11-21
4218	-11	生活日用	0	袖套	2021-11-28 07:46:11.904991+08	0	0	\N	2021-11-28 07:46:11.905343+08	\N	\N	2	2021-11-22
4219	-25	生活日用	0	碗	2021-11-28 07:46:35.243169+08	0	0	\N	2021-11-28 07:46:35.243478+08	\N	\N	2	2021-11-25
4220	-10	交通出行	0	停车费	2021-11-28 07:46:49.29899+08	0	0	\N	2021-11-28 07:46:49.299335+08	\N	\N	2	2021-11-27
4221	-13	生活日用	0	围裙	2021-11-28 07:47:03.354215+08	0	0	\N	2021-11-28 07:47:03.354563+08	\N	\N	2	2021-11-28
4222	15512	收入	1	十月工资	2021-12-09 21:55:48.619669+08	0	0	\N	2021-12-09 21:55:48.622858+08	\N	\N	1	2021-11-15
4223	15279	收入	1	工资	2021-12-09 21:56:19.907217+08	0	0	\N	2021-12-09 21:56:19.907562+08	\N	\N	1	2021-11-15
4224	-1039	服饰美容	0	服饰	2021-12-09 21:57:21.670416+08	0	0	\N	2021-12-09 21:57:21.670779+08	\N	\N	1	2021-11-20
4225	-33	宠物	0	兔子尿不湿	2021-12-09 21:57:47.326106+08	0	0	\N	2021-12-09 21:57:47.326462+08	\N	\N	1	2021-11-21
4226	-29	生活日用	0	种菜	2021-12-09 21:58:24.41074+08	0	0	\N	2021-12-09 21:58:24.411092+08	\N	\N	1	2021-11-21
4227	-29	饮食	0	叮咚买菜	2021-12-09 21:58:42.233726+08	0	0	\N	2021-12-09 21:58:42.23403+08	\N	\N	1	2021-11-21
4228	-10	交通出行	0	特斯拉网络	2021-12-09 21:59:09.685764+08	0	0	\N	2021-12-09 21:59:09.686131+08	\N	\N	1	2021-11-26
4229	-53	生活日用	0	种菜	2021-12-09 21:59:32.401166+08	0	0	\N	2021-12-09 21:59:32.401506+08	\N	\N	1	2021-11-28
4230	-39	饮食	0	麦当劳	2021-12-09 22:00:20.776742+08	0	0	\N	2021-12-09 22:00:20.77709+08	\N	\N	1	2021-11-17
4231	-5	交通出行	0	停车费	2021-12-09 22:00:53.486135+08	0	0	\N	2021-12-09 22:00:53.486514+08	\N	\N	1	2021-11-19
4232	-100	生活日用	0	理发充值	2021-12-09 22:01:14.909116+08	0	0	\N	2021-12-09 22:01:14.909409+08	\N	\N	1	2021-11-20
4233	-4	交通出行	0	停车	2021-12-09 22:01:39.008558+08	0	0	\N	2021-12-09 22:01:39.008882+08	\N	\N	1	2021-11-20
4234	-23	饮食	0	叮咚	2021-12-09 22:01:55.385662+08	0	0	\N	2021-12-09 22:01:55.385993+08	\N	\N	1	2021-11-23
4235	-40	交通出行	0	保国寺门票x2	2021-12-09 22:03:25.754484+08	0	0	\N	2021-12-09 22:03:25.754813+08	\N	\N	1	2021-11-27
4236	-18	饮食	0	零食	2021-12-09 22:03:49.031818+08	0	0	\N	2021-12-09 22:03:49.032155+08	\N	\N	1	2021-11-28
4237	-10	交通出行	0	停车费	2021-12-09 22:04:11.475824+08	0	0	\N	2021-12-09 22:04:11.476125+08	\N	\N	1	2021-11-28
4238	-106	饮食	0	烧烤食物	2021-12-09 22:05:03.463711+08	0	0	\N	2021-12-09 22:05:03.464052+08	\N	\N	1	2021-12-05
4239	-139	小孩玩具	0	魔克利	2021-12-09 22:05:38.587393+08	0	0	\N	2021-12-09 22:05:38.587738+08	\N	\N	1	2021-12-06
4240	-15	饮食	0	早餐	2021-12-09 22:06:11.279088+08	0	0	\N	2021-12-09 22:06:11.279425+08	\N	\N	1	2021-12-08
4241	-3	交通出行	0	地铁	2021-12-09 22:06:25.822459+08	0	0	\N	2021-12-09 22:06:25.822816+08	\N	\N	1	2021-12-08
4242	-13	饮食	0	一点点	2021-12-09 22:06:42.616962+08	0	0	\N	2021-12-09 22:06:42.617273+08	\N	\N	1	2021-12-08
4243	-32	饮食	0	午餐	2021-12-09 22:06:55.9788+08	0	0	\N	2021-12-09 22:06:55.979133+08	\N	\N	1	2021-12-08
4244	-3	通讯物流	0	手机充电	2021-12-09 22:07:15.440797+08	0	0	\N	2021-12-09 22:07:15.441087+08	\N	\N	1	2021-12-08
4245	-2	交通出行	0	地铁	2021-12-09 22:07:28.221575+08	0	0	\N	2021-12-09 22:07:28.221884+08	\N	\N	1	2021-12-08
4246	-3	交通出行	0	自行车	2021-12-09 22:07:44.344681+08	0	0	\N	2021-12-09 22:07:44.345009+08	\N	\N	1	2021-12-08
4247	-82	饮食	0	晚餐	2021-12-09 22:07:57.485346+08	0	0	\N	2021-12-09 22:07:57.485685+08	\N	\N	1	2021-12-08
4248	-64	饮食	0	喜茶x2	2021-12-09 22:08:21.307067+08	0	0	\N	2021-12-09 22:08:21.307367+08	\N	\N	1	2021-12-08
4249	-16	饮食	0	早餐	2021-12-09 22:08:42.438887+08	0	0	\N	2021-12-09 22:08:42.439241+08	\N	\N	1	2021-12-09
4250	-72	饮食	0	天津麻花	2021-12-09 22:08:59.969546+08	0	0	\N	2021-12-09 22:08:59.96987+08	\N	\N	1	2021-12-09
4251	-39	生活日用	0	种菜	2021-12-09 22:10:04.405849+08	0	0	\N	2021-12-09 22:10:04.406228+08	\N	\N	1	2021-12-01
4252	-601	生活日用	0	山姆	2021-12-09 22:10:29.55135+08	0	0	\N	2021-12-09 22:10:29.551709+08	\N	\N	1	2021-12-04
4253	-11	饮食	0	饮料	2021-12-09 22:12:30.850215+08	0	0	\N	2021-12-09 22:12:30.850579+08	\N	\N	1	2021-12-05
4254	-12	交通出行	0	出行	2021-12-09 22:14:33.660841+08	0	0	\N	2021-12-09 22:14:33.661145+08	\N	\N	1	2021-12-05
4255	-9	饮食	0	早餐	2021-12-09 22:15:14.554432+08	0	0	\N	2021-12-09 22:15:14.554798+08	\N	\N	1	2021-12-07
4256	-110	饮食	0	天津特产	2021-12-09 22:15:39.025183+08	0	0	\N	2021-12-09 22:15:39.025477+08	\N	\N	1	2021-12-08
4257	-1	交通出行	0	公交	2021-12-09 22:15:52.740424+08	0	0	\N	2021-12-09 22:15:52.740763+08	\N	\N	1	2021-12-08
4258	-2	交通出行	0	公交	2021-12-09 22:16:18.693739+08	0	0	\N	2021-12-09 22:16:18.694045+08	\N	\N	1	2021-12-08
4259	-30	交通出行	0	打车	2021-12-09 22:16:34.94125+08	0	0	\N	2021-12-09 22:16:34.941543+08	\N	\N	1	2021-12-08
4260	-64	宠物	0	兔粮	2021-12-09 22:16:54.463643+08	0	0	\N	2021-12-09 22:16:54.463953+08	\N	\N	1	2021-12-09
4261	-14370	健康保险	0	保险	2021-12-10 08:01:40.477507+08	0	0	\N	2021-12-10 08:01:40.517043+08	\N	\N	1	2021-12-10
4262	-24	饮食	0	美购	2021-12-12 20:34:48.001674+08	0	0	\N	2021-12-12 20:34:48.005595+08	\N	\N	2	2021-11-29
4263	-85	生活日用	0	桌面版	2021-12-12 20:35:15.240933+08	0	0	\N	2021-12-12 20:35:15.241249+08	\N	\N	2	2021-12-02
4264	-45	生活日用	0	儿童坐垫	2021-12-12 20:35:34.853871+08	0	0	\N	2021-12-12 20:35:34.854175+08	\N	\N	2	2021-12-02
4265	-116	生活日用	0	棉花垫被	2021-12-12 20:35:58.007474+08	0	0	\N	2021-12-12 20:35:58.007838+08	\N	\N	2	2021-12-03
4266	-123	住房缴费	0	东兴电费	2021-12-12 20:36:31.590158+08	0	0	\N	2021-12-12 20:36:31.590487+08	\N	\N	2	2021-12-03
4267	-8	饮食	0	麦当劳	2021-12-12 20:36:51.172788+08	0	0	\N	2021-12-12 20:36:51.173101+08	\N	\N	2	2021-12-04
4268	-100	饮食	0	叮咚买菜	2021-12-12 20:37:03.753319+08	0	0	\N	2021-12-12 20:37:03.75367+08	\N	\N	2	2021-12-05
4269	-100	饮食	0	老婆大人	2021-12-12 20:37:23.907368+08	0	0	\N	2021-12-12 20:37:23.907709+08	\N	\N	2	2021-12-07
4270	-32	生活日用	0	美购超市	2021-12-12 20:37:57.57105+08	0	0	\N	2021-12-12 20:37:57.571383+08	\N	\N	2	2021-12-07
4271	-13	饮食	0	蜜雪冰城	2021-12-12 20:38:30.533114+08	0	0	\N	2021-12-12 20:38:30.533467+08	\N	\N	2	2021-12-10
4272	-345	小孩服饰	0	衣服	2021-12-12 20:38:52.101641+08	0	0	\N	2021-12-12 20:38:52.101986+08	\N	\N	2	2021-12-11
4273	-99	小孩服饰	0	内衣	2021-12-12 20:39:11.706774+08	0	0	\N	2021-12-12 20:39:11.707074+08	\N	\N	2	2021-12-11
4274	-80	饮食	0	叮咚买菜	2021-12-12 20:39:34.069968+08	0	0	\N	2021-12-12 20:39:34.070305+08	\N	\N	2	2021-12-12
4275	-17	生活日用	0	口罩	2021-12-12 20:39:52.715268+08	0	0	\N	2021-12-12 20:39:52.715644+08	\N	\N	2	2021-12-12
4276	-260	生活日用	0	水热毯	2021-12-12 20:40:08.66635+08	0	0	\N	2021-12-12 20:40:08.666667+08	\N	\N	2	2021-12-12
4277	-19	生活日用	0	晾衣绳	2021-12-12 20:40:24.713645+08	0	0	\N	2021-12-12 20:40:24.713945+08	\N	\N	2	2021-12-12
4278	-35	生活日用	0	相册本	2021-12-12 20:40:39.079421+08	0	0	\N	2021-12-12 20:40:39.079771+08	\N	\N	2	2021-12-12
4279	-11	饮食	0	蜜雪冰城	2021-12-12 20:40:48.984941+08	0	0	\N	2021-12-12 20:40:48.98529+08	\N	\N	2	2021-12-12
4280	-4	交通出行	0	停车费	2021-12-12 20:42:45.849323+08	0	0	\N	2021-12-12 20:42:45.84963+08	\N	\N	2	2021-11-28
4281	-126	通讯物流	0	快递费	2021-12-12 20:43:09.044215+08	0	0	\N	2021-12-12 20:43:09.044567+08	\N	\N	2	2021-11-29
4282	-142	小孩生活用品	0	椅子	2021-12-12 20:43:26.007875+08	0	0	\N	2021-12-12 20:43:26.008209+08	\N	\N	2	2021-11-29
4283	-65	小孩文具	0	画画工具	2021-12-12 20:44:27.17711+08	0	0	\N	2021-12-12 20:44:27.177405+08	\N	\N	2	2021-11-29
4284	-200	交通出行	0	加油	2021-12-12 20:44:43.012881+08	0	0	\N	2021-12-12 20:44:43.013175+08	\N	\N	2	2021-12-02
4285	-4	交通出行	0	停车	2021-12-12 20:44:55.984961+08	0	0	\N	2021-12-12 20:44:55.985258+08	\N	\N	2	2021-12-04
4286	-5	生活日用	0	拼多多	2021-12-12 20:45:22.150789+08	0	0	\N	2021-12-12 20:45:22.151083+08	\N	\N	2	2021-12-06
4287	-40	生活日用	0	香薰	2021-12-12 20:47:22.471935+08	0	0	\N	2021-12-12 20:47:22.472259+08	\N	\N	2	2021-12-11
4288	-92	生活日用	0	沃尔玛	2021-12-12 20:47:40.230715+08	0	0	\N	2021-12-12 20:47:40.231003+08	\N	\N	2	2021-12-11
4289	-20	交通出行	0	停车费	2021-12-12 20:47:58.217608+08	0	0	\N	2021-12-12 20:47:58.21795+08	\N	\N	2	2021-12-11
4290	-101	生活日用	0	餐巾纸	2021-12-21 20:43:22.82275+08	0	0	\N	2021-12-21 20:43:22.825912+08	\N	\N	2	2021-12-13
4291	-160	生活日用	0	相片纸	2021-12-21 20:43:48.327377+08	0	0	\N	2021-12-21 20:43:48.327752+08	\N	\N	2	2021-12-13
4292	-7	生活日用	0	餐巾纸	2021-12-21 20:44:08.590729+08	0	0	\N	2021-12-21 20:44:08.591062+08	\N	\N	2	2021-12-13
4293	-80	住房缴费	0	景湖电费	2021-12-21 20:44:53.017403+08	0	0	\N	2021-12-21 20:44:53.0177+08	\N	\N	2	2021-12-14
4294	-10	生活日用	0	调料瓶	2021-12-21 20:45:19.130701+08	0	0	\N	2021-12-21 20:45:19.131051+08	\N	\N	2	2021-12-14
4295	-208	饮食	0	油	2021-12-21 20:45:51.796991+08	0	0	\N	2021-12-21 20:45:51.797334+08	\N	\N	2	2021-12-14
4296	-208	服饰美容	0	优衣库	2021-12-21 20:46:10.931117+08	0	0	\N	2021-12-21 20:46:10.931547+08	\N	\N	2	2021-12-15
4297	-100	通讯物流	0	充值	2021-12-21 20:46:30.289406+08	0	0	\N	2021-12-21 20:46:30.289712+08	\N	\N	2	2021-12-16
4298	-43	小孩健康	0	妇儿医院	2021-12-21 20:46:55.405911+08	0	0	\N	2021-12-21 20:46:55.406225+08	\N	\N	2	2021-12-17
4299	-100	小孩健康	0	妇儿医院	2021-12-21 20:47:16.929177+08	0	0	\N	2021-12-21 20:47:16.929512+08	\N	\N	2	2021-12-17
4300	-153	饮食	0	叮咚买菜	2021-12-21 20:47:37.951284+08	0	0	\N	2021-12-21 20:47:37.951607+08	\N	\N	2	2021-12-18
4301	-23	小孩健康	0	妇儿医院	2021-12-21 20:47:53.372936+08	0	0	\N	2021-12-21 20:47:53.373227+08	\N	\N	2	2021-12-18
4302	-48	小孩健康	0	妇儿医院	2021-12-21 20:48:13.868579+08	0	0	\N	2021-12-21 20:48:13.868911+08	\N	\N	2	2021-12-18
4303	-18	小孩零食	0	小馒头	2021-12-21 20:48:33.887973+08	0	0	\N	2021-12-21 20:48:33.888308+08	\N	\N	2	2021-12-19
4304	-138	小孩教育	0	妇儿医院	2021-12-21 20:49:06.479667+08	0	0	\N	2021-12-21 20:49:06.480044+08	\N	\N	2	2021-12-19
4305	-5	交通出行	0	停车费	2021-12-21 20:49:28.582597+08	0	0	\N	2021-12-21 20:49:28.582919+08	\N	\N	2	2021-12-19
4306	-14	饮食	0	美团	2021-12-21 20:50:34.309615+08	0	0	\N	2021-12-21 20:50:34.30995+08	\N	\N	2	2021-12-14
4307	-228	生活日用	0	洞洞板	2021-12-21 20:51:15.784422+08	0	0	\N	2021-12-21 20:51:15.784772+08	\N	\N	2	2021-12-16
4308	-15	生活日用	0	拼多多	2021-12-21 20:51:45.5149+08	0	0	\N	2021-12-21 20:51:45.515206+08	\N	\N	2	2021-12-16
4309	-10	饮食	0	饼	2021-12-21 20:52:05.528518+08	0	0	\N	2021-12-21 20:52:05.528846+08	\N	\N	2	2021-12-18
4310	-5	交通出行	0	停车费	2021-12-21 20:52:32.863833+08	0	0	\N	2021-12-21 20:52:32.864168+08	\N	\N	2	2021-12-18
4311	-200	交通出行	0	加油	2021-12-21 20:53:05.754455+08	0	0	\N	2021-12-21 20:53:05.754826+08	\N	\N	2	2021-12-21
4312	-23	小孩健康	0	妇儿挂号	2021-12-27 16:03:03.581173+08	0	0	\N	2021-12-27 16:03:03.584287+08	\N	\N	2	2021-12-22
4313	-30	小孩健康	0	妇儿	2021-12-27 16:03:13.700924+08	0	0	\N	2021-12-27 16:03:13.701255+08	\N	\N	2	2021-12-22
4314	-16	饮食	0	蜜雪	2021-12-27 16:03:32.670579+08	0	0	\N	2021-12-27 16:03:32.670917+08	\N	\N	2	2021-12-23
4315	-5	交通出行	0	停车	2021-12-27 16:03:52.265024+08	0	0	\N	2021-12-27 16:03:52.265314+08	\N	\N	2	2021-12-24
4316	-13	饮食	0	蜜雪	2021-12-27 16:04:10.665474+08	0	0	\N	2021-12-27 16:04:10.665808+08	\N	\N	2	2021-12-24
4317	-37	饮食	0	水果	2021-12-27 16:04:25.575843+08	0	0	\N	2021-12-27 16:04:25.576158+08	\N	\N	2	2021-12-25
4318	-400	小孩服饰	0	衣服	2021-12-27 16:04:43.390231+08	0	0	\N	2021-12-27 16:04:43.390573+08	\N	\N	2	2021-12-25
4319	-15	饮食	0	章鱼丸子	2021-12-27 16:04:58.346092+08	0	0	\N	2021-12-27 16:04:58.346472+08	\N	\N	2	2021-12-25
4320	-10	交通出行	0	停车费	2021-12-27 16:05:14.75282+08	0	0	\N	2021-12-27 16:05:14.753142+08	\N	\N	2	2021-12-25
4321	-41	饮食	0	牛奶	2021-12-27 16:05:57.186139+08	0	0	\N	2021-12-27 16:05:57.186497+08	\N	\N	2	2021-12-22
4322	-3	交通出行	0	妇儿停车	2021-12-27 16:06:31.176363+08	0	0	\N	2021-12-27 16:06:31.176729+08	\N	\N	2	2021-12-22
4323	-27	饮食	0	汉堡王	2021-12-27 16:06:50.991223+08	0	0	\N	2021-12-27 16:06:50.991664+08	\N	\N	2	2021-12-22
4324	-34	饮食	0	午餐	2021-12-27 16:07:09.096052+08	0	0	\N	2021-12-27 16:07:09.096391+08	\N	\N	2	2021-12-23
4325	-5	交通出行	0	停车	2021-12-27 16:07:28.940942+08	0	0	\N	2021-12-27 16:07:28.941311+08	\N	\N	2	2021-12-25
4326	-27	饮食	0	群主请客	2021-12-27 16:08:08.874354+08	0	0	\N	2021-12-27 16:08:08.874703+08	\N	\N	2	2021-12-26
4327	-17	饮食	0	群主请客	2021-12-27 16:08:19.135627+08	0	0	\N	2021-12-27 16:08:19.136018+08	\N	\N	2	2021-12-26
4328	-18	饮食	0	绝味鸭脖	2021-12-27 16:08:31.745908+08	0	0	\N	2021-12-27 16:08:31.74622+08	\N	\N	2	2021-12-26
4329	-23	饮食	0	章鱼丸子	2021-12-27 16:08:46.615223+08	0	0	\N	2021-12-27 16:08:46.615519+08	\N	\N	2	2021-12-26
4330	22821	收入	1	2021上半年提成	2021-12-27 16:10:02.178478+08	0	0	\N	2021-12-27 16:10:02.178917+08	\N	\N	2	2021-12-27
4331	4610	收入	1	2021年11月工资	2021-12-27 16:10:39.049597+08	0	0	\N	2021-12-27 16:10:39.049917+08	\N	\N	2	2021-12-24
4332	100	收入	1	补贴餐费	2021-12-27 16:11:08.381814+08	0	0	\N	2021-12-27 16:11:08.382151+08	\N	\N	2	2021-12-26
4333	2993	收入	1	2021年1月工资	2021-12-27 16:19:22.945714+08	0	0	\N	2021-12-27 16:19:22.94602+08	\N	\N	2	2021-11-27
4334	4051	收入	1	2021年5月工资	2021-12-27 16:19:54.076712+08	0	0	\N	2021-12-27 16:19:54.077037+08	\N	\N	2	2021-11-27
4335	4256	收入	1	2021年7月工资	2021-12-27 16:20:21.301097+08	0	0	\N	2021-12-27 16:20:21.30143+08	\N	\N	2	2021-11-27
4336	4401	收入	1	2021年8月工资	2021-12-27 16:20:43.941841+08	0	0	\N	2021-12-27 16:20:43.942159+08	\N	\N	2	2021-11-27
4337	4674	收入	1	2021年9月工资	2021-12-27 16:21:06.196582+08	0	0	\N	2021-12-27 16:21:06.196907+08	\N	\N	2	2021-11-27
4338	4865	收入	1	2021年10月工资	2021-12-27 16:21:34.836595+08	0	0	\N	2021-12-27 16:21:34.837048+08	\N	\N	2	2021-11-27
4339	-6	饮食	0	水果	2021-12-29 18:01:37.266633+08	0	0	\N	2021-12-29 18:01:37.269943+08	\N	\N	1	2021-12-18
4340	-5	交通出行	0	停车	2021-12-29 18:01:52.279888+08	0	0	\N	2021-12-29 18:01:52.280226+08	\N	\N	1	2021-12-18
4341	-68	生活日用	0	拐杖	2021-12-29 18:02:12.999992+08	0	0	\N	2021-12-29 18:02:13.00032+08	\N	\N	1	2021-12-25
4342	-3	交通出行	0	停车	2021-12-29 18:02:28.115077+08	0	0	\N	2021-12-29 18:02:28.115426+08	\N	\N	1	2021-12-25
4343	-10	生活日用	0	特斯拉网络	2021-12-29 18:02:49.521409+08	0	0	\N	2021-12-29 18:02:49.521731+08	\N	\N	1	2021-12-26
4344	-39	宠物	0	提莫西草	2021-12-29 18:03:11.340797+08	0	0	\N	2021-12-29 18:03:11.341131+08	\N	\N	1	2021-12-28
4345	-48	生活日用	0	种菜围栏	2021-12-29 18:04:10.969785+08	0	0	\N	2021-12-29 18:04:10.970096+08	\N	\N	1	2021-12-28
4346	-45	饮食	0	零食	2021-12-29 18:06:31.925651+08	0	0	\N	2021-12-29 18:06:31.92604+08	\N	\N	1	2021-12-09
4347	-4	交通出行	0	停车	2021-12-29 18:06:44.835712+08	0	0	\N	2021-12-29 18:06:44.836019+08	\N	\N	1	2021-12-10
4348	-643	小孩服饰	0	优衣库	2021-12-29 18:07:10.546832+08	0	0	\N	2021-12-29 18:07:10.547212+08	\N	\N	1	2021-12-11
4349	-8	交通出行	0	停车费	2021-12-29 18:07:28.741488+08	0	0	\N	2021-12-29 18:07:28.741821+08	\N	\N	1	2021-12-14
4350	-80	饮食	0	美购	2021-12-29 18:07:52.740089+08	0	0	\N	2021-12-29 18:07:52.740401+08	\N	\N	1	2021-12-14
4352	-720	交通出行	0	停车费x2	2021-12-29 18:08:35.075798+08	0	0	\N	2021-12-29 18:08:35.076181+08	\N	\N	1	2021-12-14
4353	-10	交通出行	0	停车费	2021-12-29 18:08:55.391575+08	0	0	\N	2021-12-29 18:08:55.391917+08	\N	\N	1	2021-12-17
4354	-18	饮食	0	美团	2021-12-29 18:09:10.536082+08	0	0	\N	2021-12-29 18:09:10.536387+08	\N	\N	1	2021-12-18
4355	-29	小孩健康	0	妇儿医院	2021-12-29 18:09:33.191261+08	0	0	\N	2021-12-29 18:09:33.191571+08	\N	\N	1	2021-12-18
4356	-75	小孩健康	0	妇儿医院	2021-12-29 18:09:55.067726+08	0	0	\N	2021-12-29 18:09:55.068066+08	\N	\N	1	2021-12-18
4357	-10	饮食	0	烧饼	2021-12-29 18:10:09.760063+08	0	0	\N	2021-12-29 18:10:09.760364+08	\N	\N	1	2021-12-19
4358	-23	小孩健康	0	妇儿医院	2021-12-29 18:10:28.380927+08	0	0	\N	2021-12-29 18:10:28.381297+08	\N	\N	1	2021-12-19
4359	-13	饮食	0	一鸣	2021-12-29 18:11:00.901774+08	0	0	\N	2021-12-29 18:11:00.902093+08	\N	\N	1	2021-12-23
4360	-139	生活日用	0	Zara香片	2021-12-29 18:11:35.045249+08	0	0	\N	2021-12-29 18:11:35.045738+08	\N	\N	1	2021-12-25
4361	-30	交通出行	0	补胎	2021-12-29 18:11:59.235554+08	0	0	\N	2021-12-29 18:11:59.23589+08	\N	\N	1	2021-12-27
4362	-3	交通出行	0	停车费	2021-12-29 18:12:14.5154+08	0	0	\N	2021-12-29 18:12:14.515739+08	\N	\N	1	2021-12-27
4363	15483	收入	1	工资	2021-12-29 21:34:05.387868+08	0	0	\N	2021-12-29 21:34:05.388217+08	\N	\N	1	2021-12-15
4364	-34	住房缴费	0	景湖水费	2022-01-03 10:23:03.299649+08	0	0	\N	2022-01-03 10:23:03.302944+08	\N	\N	2	2022-01-02
4365	-166	住房缴费	0	东兴电费	2022-01-03 10:23:29.487418+08	0	0	\N	2022-01-03 10:23:29.487757+08	\N	\N	2	2022-01-02
4366	-90	住房缴费	0	景湖电费	2022-01-03 10:23:45.90793+08	0	0	\N	2022-01-03 10:23:45.90825+08	\N	\N	2	2022-01-02
4367	-130	服饰美容	0	bb霜	2022-01-03 10:29:16.49108+08	0	0	\N	2022-01-03 10:29:16.491403+08	\N	\N	2	2021-12-28
4368	-106	小孩玩具	0	鞭炮	2022-01-03 10:29:46.7666+08	0	0	\N	2022-01-03 10:29:46.766935+08	\N	\N	2	2021-12-31
4369	-3	饮食	0	柠檬	2022-01-03 10:30:03.524065+08	0	0	\N	2022-01-03 10:30:03.524394+08	\N	\N	2	2022-01-02
4370	-5	小孩玩具	0	灯笼	2022-01-03 10:30:23.608704+08	0	0	\N	2022-01-03 10:30:23.609031+08	\N	\N	2	2022-01-03
4371	-303	服饰美容	0	阿玛尼	2022-01-03 10:51:54.7563+08	0	0	\N	2022-01-03 10:51:54.75665+08	\N	\N	2	2022-01-02
4372	-20	饮食	0	蜜雪冰城	2022-01-12 11:14:29.479429+08	0	0	\N	2022-01-12 11:14:29.482624+08	\N	\N	2	2022-01-03
4373	-25	饮食	0	美购超市	2022-01-12 11:14:51.435134+08	0	0	\N	2022-01-12 11:14:51.435539+08	\N	\N	2	2022-01-05
4374	-4	饮食	0	蜜雪冰城	2022-01-12 11:15:07.681385+08	0	0	\N	2022-01-12 11:15:07.681724+08	\N	\N	2	2022-01-06
4375	-16	交通出行	0	打车	2022-01-12 11:15:22.290526+08	0	0	\N	2022-01-12 11:15:22.290836+08	\N	\N	2	2022-01-06
4376	-30	饮食	0	华莱士午餐	2022-01-12 11:15:41.00553+08	0	0	\N	2022-01-12 11:15:41.005882+08	\N	\N	2	2022-01-07
4377	-198	服饰美容	0	三福	2022-01-12 11:16:09.868989+08	0	0	\N	2022-01-12 11:16:09.869299+08	\N	\N	2	2022-01-09
4378	-106	生活日用	0	棉花被	2022-01-12 11:16:46.447038+08	0	0	\N	2022-01-12 11:16:46.447364+08	\N	\N	2	2022-01-09
4381	-405	服饰美容	0	优衣库	2022-01-12 11:18:04.747882+08	0	0	\N	2022-01-12 11:18:04.748239+08	\N	\N	2	2022-01-06
4382	-29	生活日用	0	会员	2022-01-12 11:18:34.271307+08	0	0	\N	2022-01-12 11:18:34.271666+08	\N	\N	2	2022-01-08
4383	-67	服饰美容	0	MUJI	2022-01-12 11:18:49.928452+08	0	0	\N	2022-01-12 11:18:49.928791+08	\N	\N	2	2022-01-08
4384	-148	文教娱乐	0	京东会员	2022-01-12 11:19:09.568634+08	0	0	\N	2022-01-12 11:19:09.568941+08	\N	\N	2	2022-01-09
4385	-8	生活日用	0	拼多多	2022-01-12 11:19:36.39881+08	0	0	\N	2022-01-12 11:19:36.399137+08	\N	\N	2	2022-01-11
4386	100	收入	1	手机倒卖	2022-01-12 11:20:04.142656+08	0	0	\N	2022-01-12 11:20:04.143018+08	\N	\N	2	2022-01-09
4387	-19	生活日用	0	手机壳	2022-01-15 12:40:08.003111+08	0	0	\N	2022-01-15 12:40:08.006569+08	\N	\N	2	2022-01-11
4388	-35	饮食	0	可乐	2022-01-15 12:40:54.827509+08	0	0	\N	2022-01-15 12:40:54.827864+08	\N	\N	2	2022-01-13
4389	-5	交通出行	0	停车费	2022-01-15 12:41:04.667893+08	0	0	\N	2022-01-15 12:41:04.668236+08	\N	\N	2	2022-01-15
4390	250	收入	1	厨师机	2022-01-24 16:12:26.01337+08	0	0	\N	2022-01-24 16:12:26.016875+08	\N	\N	1	2021-12-29
4391	-40	宠物	0	提莫西草	2022-01-24 16:12:46.326199+08	0	0	\N	2022-01-24 16:12:46.326625+08	\N	\N	1	2021-12-30
4392	-35	生活日用	0	手机后盖	2022-01-24 16:13:22.785596+08	0	0	\N	2022-01-24 16:13:22.785947+08	\N	\N	1	2021-12-30
4393	-17	生活日用	0	种子	2022-01-24 16:14:32.03072+08	0	0	\N	2022-01-24 16:14:32.031054+08	\N	\N	1	2022-01-03
4394	-17	生活日用	0	育苗盆X3	2022-01-24 23:15:14.71764+08	0	0	\N	2022-01-24 23:15:14.718013+08	\N	\N	1	2022-01-06
4395	-57	饮食	0	牛肉	2022-01-24 23:15:49.584964+08	0	0	\N	2022-01-24 23:15:49.585332+08	\N	\N	1	2022-01-08
4396	-20	饮食	0	菜	2022-01-24 23:16:13.151828+08	0	0	\N	2022-01-24 23:16:13.15224+08	\N	\N	1	2022-01-08
4397	-23	饮食	0	菜	2022-01-24 23:16:32.894272+08	0	0	\N	2022-01-24 23:16:32.894675+08	\N	\N	1	2022-01-08
4398	-7	饮食	0	零食	2022-01-24 23:16:57.764723+08	0	0	\N	2022-01-24 23:16:57.765038+08	\N	\N	1	2022-01-09
4399	-11	饮食	0	零食	2022-01-24 23:17:23.997043+08	0	0	\N	2022-01-24 23:17:23.997414+08	\N	\N	1	2022-01-16
4400	-48	饮食	0	菜	2022-01-24 23:17:55.432105+08	0	0	\N	2022-01-24 23:17:55.432438+08	\N	\N	1	2022-01-23
4402	-5	饮食	0	胡椒粉	2022-01-24 23:19:11.514702+08	0	0	\N	2022-01-24 23:19:11.515042+08	\N	\N	1	2022-01-02
4403	-24	饮食	0	水果	2022-01-24 23:19:28.705558+08	0	0	\N	2022-01-24 23:19:28.705916+08	\N	\N	1	2022-01-02
4404	-447	小孩玩具	0	小孩玩具和营养片	2022-01-24 23:20:08.665201+08	0	0	\N	2022-01-24 23:20:08.665536+08	\N	\N	1	2022-01-07
4405	-12	饮食	0	馄饨	2022-01-24 23:20:30.7826+08	0	0	\N	2022-01-24 23:20:30.782939+08	\N	\N	1	2022-01-08
4406	-45	饮食	0	菜场	2022-01-24 23:21:10.403369+08	0	0	\N	2022-01-24 23:21:10.403766+08	\N	\N	1	2022-01-08
4407	-284	饮食	0	进口食品	2022-01-24 23:21:28.407871+08	0	0	\N	2022-01-24 23:21:28.408213+08	\N	\N	1	2022-01-08
4408	-35	小孩玩具	0	VR	2022-01-24 23:21:52.495557+08	0	0	\N	2022-01-24 23:21:52.495928+08	\N	\N	1	2022-01-08
4409	-6	饮食	0	发粉	2022-01-24 23:22:24.651672+08	0	0	\N	2022-01-24 23:22:24.652043+08	\N	\N	1	2022-01-09
4410	-10	交通出行	0	停车费	2022-01-24 23:22:43.871192+08	0	0	\N	2022-01-24 23:22:43.871584+08	\N	\N	1	2022-01-16
4411	-215	饮食	0	烧烤	2022-01-24 23:23:02.62013+08	0	0	\N	2022-01-24 23:23:02.620443+08	\N	\N	1	2022-01-18
4412	-2	交通出行	0	停车	2022-01-24 23:23:16.459856+08	0	0	\N	2022-01-24 23:23:16.460201+08	\N	\N	1	2022-01-18
4413	-45	服饰美容	0	理发	2022-01-24 23:23:39.636819+08	0	0	\N	2022-01-24 23:23:39.6372+08	\N	\N	1	2022-01-21
4414	-9	交通出行	0	停车	2022-01-24 23:23:51.22744+08	0	0	\N	2022-01-24 23:23:51.227798+08	\N	\N	1	2022-01-24
4415	16062	收入	1	工资	2022-01-25 11:23:33.675676+08	0	0	\N	2022-01-25 11:23:33.678926+08	\N	\N	1	2022-01-15
4416	44245	收入	1	奖金	2022-01-25 11:23:54.211101+08	0	0	\N	2022-01-25 11:23:54.211443+08	\N	\N	1	2022-01-25
4417	-6	通讯物流	0	快递费	2022-01-25 14:57:27.877326+08	0	0	\N	2022-01-25 14:57:27.877689+08	\N	\N	2	2022-01-16
4418	-68	住房缴费	0	东兴水费	2022-01-25 14:58:00.907832+08	0	0	\N	2022-01-25 14:58:00.908225+08	\N	\N	2	2022-01-16
4419	-100	通讯物流	0	手机充值	2022-01-25 14:58:19.690408+08	0	0	\N	2022-01-25 14:58:19.69074+08	\N	\N	2	2022-01-16
4420	-5	交通出行	0	地铁	2022-01-25 14:58:40.335745+08	0	0	\N	2022-01-25 14:58:40.336102+08	\N	\N	2	2022-01-18
4421	-8	饮食	0	大麦茶	2022-01-25 14:59:01.420148+08	0	0	\N	2022-01-25 14:59:01.420531+08	\N	\N	2	2022-01-19
4422	-8	饮食	0	蜜雪冰城	2022-01-25 14:59:18.092321+08	0	0	\N	2022-01-25 14:59:18.09267+08	\N	\N	2	2022-01-19
4423	-10	通讯物流	0	话费	2022-01-25 15:16:38.207864+08	0	0	\N	2022-01-25 15:16:38.208177+08	\N	\N	2	2022-01-21
4424	-18	文教娱乐	0	百度会员	2022-01-25 15:19:15.948003+08	0	0	\N	2022-01-25 15:19:15.948395+08	\N	\N	2	2022-01-21
4425	-37	饮食	0	叮咚买菜	2022-01-25 15:19:42.545175+08	0	0	\N	2022-01-25 15:19:42.545477+08	\N	\N	2	2022-01-23
4426	-18	饮食	0	外卖炸鸡	2022-01-25 15:20:03.368796+08	0	0	\N	2022-01-25 15:20:03.369108+08	\N	\N	2	2022-01-24
4427	-113	服饰美容	0	回力鞋子	2022-01-25 15:20:23.680581+08	0	0	\N	2022-01-25 15:20:23.680959+08	\N	\N	2	2022-01-25
4428	-200	交通出行	0	加油	2022-01-25 15:23:13.39686+08	0	0	\N	2022-01-25 15:23:13.397215+08	\N	\N	2	2022-01-15
4429	-309	服饰美容	0	包	2022-01-25 15:23:45.263266+08	0	0	\N	2022-01-25 15:23:45.263614+08	\N	\N	2	2022-01-15
4430	-14	饮食	0	午饭	2022-01-25 15:24:05.639195+08	0	0	\N	2022-01-25 15:24:05.639564+08	\N	\N	2	2022-01-17
4431	-3	生活日用	0	拼多多	2022-01-25 15:24:44.166773+08	0	0	\N	2022-01-25 15:24:44.167168+08	\N	\N	2	2022-01-17
4433	-8	小孩健康	0	妇儿医院	2022-01-25 15:25:43.668998+08	0	0	\N	2022-01-25 15:25:43.669324+08	\N	\N	2	2022-01-20
4434	-10	饮食	0	饼	2022-01-25 15:26:28.130422+08	0	0	\N	2022-01-25 15:26:28.130818+08	\N	\N	2	2022-01-23
4435	-5	饮食	0	馄饨皮	2022-01-25 15:26:47.107184+08	0	0	\N	2022-01-25 15:26:47.107551+08	\N	\N	2	2022-01-23
4436	-20	生活日用	0	洗车刷子	2022-01-25 15:27:05.130908+08	0	0	\N	2022-01-25 15:27:05.131266+08	\N	\N	2	2022-01-25
4437	-16	小孩文具	0	画纸	2022-01-25 15:27:18.807931+08	0	0	\N	2022-01-25 15:27:18.808259+08	\N	\N	2	2022-01-25
4438	4275	收入	1	2021年12月工资	2022-01-25 15:27:58.029075+08	0	0	\N	2022-01-25 15:27:58.029437+08	\N	\N	2	2022-01-25
4439	1800	收入	1	工龄奖	2022-01-25 15:28:12.148796+08	0	0	\N	2022-01-25 15:28:12.149137+08	\N	\N	2	2022-01-25
4440	-33	饮食	0	绿姿	2022-01-30 22:07:19.97693+08	0	0	\N	2022-01-30 22:07:19.980005+08	\N	\N	2	2022-01-26
4441	-23	饮食	0	绿姿	2022-01-30 22:07:30.831774+08	0	0	\N	2022-01-30 22:07:30.832087+08	\N	\N	2	2022-01-26
4442	-365	服饰美容	0	喵街会员	2022-01-30 22:08:11.082267+08	0	0	\N	2022-01-30 22:08:11.08266+08	\N	\N	2	2022-01-28
4443	-466	服饰美容	0	阿迪达斯鞋子	2022-01-30 22:08:31.130877+08	0	0	\N	2022-01-30 22:08:31.131207+08	\N	\N	2	2022-01-28
4444	-89	小孩健康	0	内衣套装	2022-01-30 22:08:50.777128+08	0	0	\N	2022-01-30 22:08:50.777433+08	\N	\N	2	2022-01-28
4445	-764	小孩服饰	0	mqd手机	2022-01-30 22:09:17.237303+08	0	0	\N	2022-01-30 22:09:17.237653+08	\N	\N	2	2022-01-28
4446	-425	小孩服饰	0	耐克鞋子	2022-01-30 22:09:38.461682+08	0	0	\N	2022-01-30 22:09:38.461982+08	\N	\N	2	2022-01-28
4447	-6	饮食	0	肯德基甜筒	2022-01-30 22:10:02.081525+08	0	0	\N	2022-01-30 22:10:02.081989+08	\N	\N	2	2022-01-28
4448	-204	饮食	0	油	2022-01-30 22:10:24.716196+08	0	0	\N	2022-01-30 22:10:24.716534+08	\N	\N	2	2022-01-29
4449	-36	饮食	0	油	2022-01-30 22:10:36.837106+08	0	0	\N	2022-01-30 22:10:36.837445+08	\N	\N	2	2022-01-29
4450	-454	服饰美容	0	他她鞋子	2022-01-30 22:11:00.980899+08	0	0	\N	2022-01-30 22:11:00.981196+08	\N	\N	2	2022-01-30
4451	-810	服饰美容	0	衣服	2022-01-30 22:11:13.851527+08	0	0	\N	2022-01-30 22:11:13.851842+08	\N	\N	2	2022-01-30
4452	-149	服饰美容	0	优衣库裤子	2022-01-30 22:11:27.777478+08	0	0	\N	2022-01-30 22:11:27.777793+08	\N	\N	2	2022-01-30
4453	-10	交通出行	0	两次停车费	2022-01-30 22:12:57.444174+08	0	0	\N	2022-01-30 22:12:57.444495+08	\N	\N	2	2022-01-26
4454	-15	饮食	0	三个大饼	2022-01-30 22:13:14.763422+08	0	0	\N	2022-01-30 22:13:14.763782+08	\N	\N	2	2022-01-29
4455	-33	饮食	0	草莓	2022-01-30 22:13:31.73373+08	0	0	\N	2022-01-30 22:13:31.734041+08	\N	\N	2	2022-01-29
4456	-32	饮食	0	叮咚买菜	2022-01-30 22:13:54.486089+08	0	0	\N	2022-01-30 22:13:54.486515+08	\N	\N	2	2022-01-30
4457	-1225	饮食	0	山姆	2022-01-30 22:14:05.48659+08	0	0	\N	2022-01-30 22:14:05.486969+08	\N	\N	2	2022-01-30
4458	-30	饮食	0	牛肉卷	2022-01-30 22:14:21.024267+08	0	0	\N	2022-01-30 22:14:21.024612+08	\N	\N	2	2022-01-30
4459	-630	服饰美容	0	Lee牛仔裤	2022-01-30 22:14:34.38736+08	0	0	\N	2022-01-30 22:14:34.387701+08	\N	\N	2	2022-01-30
4460	-136	住房缴费	0	东兴电费	2022-02-09 22:06:20.219588+08	0	0	\N	2022-02-09 22:06:20.222567+08	\N	\N	2	2022-02-02
4461	-175	住房缴费	0	景湖电费	2022-02-09 22:06:34.861035+08	0	0	\N	2022-02-09 22:06:34.861382+08	\N	\N	2	2022-02-02
4462	-23	文教娱乐	0	电影票	2022-02-09 22:06:58.999172+08	0	0	\N	2022-02-09 22:06:58.999516+08	\N	\N	2	2022-02-05
4463	-45	饮食	0	古茗	2022-02-09 22:07:13.051276+08	0	0	\N	2022-02-09 22:07:13.051588+08	\N	\N	2	2022-02-05
4464	-50	饮食	0	爆米花	2022-02-09 22:07:21.317622+08	0	0	\N	2022-02-09 22:07:21.317932+08	\N	\N	2	2022-02-05
4465	-6	生活日用	0	小卖部	2022-02-09 22:07:46.175631+08	0	0	\N	2022-02-09 22:07:46.175951+08	\N	\N	2	2022-02-06
4466	-22	生活日用	0	一次性餐盒	2022-02-09 22:08:10.99165+08	0	0	\N	2022-02-09 22:08:10.992009+08	\N	\N	2	2022-02-08
4467	-100	饮食	0	老婆大人	2022-02-09 22:08:22.961984+08	0	0	\N	2022-02-09 22:08:22.962418+08	\N	\N	2	2022-02-09
4468	-78	饮食	0	阪急超市	2022-02-09 22:08:48.624123+08	0	0	\N	2022-02-09 22:08:48.624447+08	\N	\N	2	2022-02-09
4469	-24	饮食	0	gram饼	2022-02-09 22:09:07.69607+08	0	0	\N	2022-02-09 22:09:07.696371+08	\N	\N	2	2022-02-09
4470	-48	饮食	0	叮咚买菜	2022-02-09 22:09:42.612028+08	0	0	\N	2022-02-09 22:09:42.612336+08	\N	\N	2	2022-02-04
4471	-30	交通出行	0	补胎	2022-02-09 22:10:03.725027+08	0	0	\N	2022-02-09 22:10:03.72536+08	\N	\N	2	2022-02-08
4472	-37	文教娱乐	0	cgv	2022-02-09 22:10:21.148207+08	0	0	\N	2022-02-09 22:10:21.148549+08	\N	\N	2	2022-02-09
4473	-9	交通出行	0	停车费	2022-02-09 22:10:36.871367+08	0	0	\N	2022-02-09 22:10:36.871715+08	\N	\N	2	2022-02-09
4474	-40	饮食	0	美团	2022-02-09 22:12:24.422892+08	0	0	\N	2022-02-09 22:12:24.423251+08	\N	\N	2	2022-02-09
4475	-10	交通出行	0	特斯拉娱乐包月	2022-02-23 08:40:37.306522+08	0	0	\N	2022-02-23 08:40:37.309721+08	\N	\N	1	2022-01-26
4476	-32	饮食	0	牛肉干	2022-02-23 08:41:08.264708+08	0	0	\N	2022-02-23 08:41:08.265019+08	\N	\N	1	2022-01-28
4477	-15	饮食	0	鹌鹑	2022-02-23 08:41:40.741815+08	0	0	\N	2022-02-23 08:41:40.74211+08	\N	\N	1	2022-01-30
4478	-32	生活日用	0	菜种子	2022-02-23 08:42:02.957717+08	0	0	\N	2022-02-23 08:42:02.95806+08	\N	\N	1	2022-01-31
4479	-19	生活日用	0	养菜工具	2022-02-23 08:42:30.357156+08	0	0	\N	2022-02-23 08:42:30.357491+08	\N	\N	1	2022-01-31
4480	-98	文教娱乐	0	电影	2022-02-23 08:42:57.805975+08	0	0	\N	2022-02-23 08:42:57.806349+08	\N	\N	1	2022-02-05
4481	-40	生活日用	0	养菜	2022-02-23 08:43:22.228752+08	0	0	\N	2022-02-23 08:43:22.229048+08	\N	\N	1	2022-02-07
4482	-12	饮食	0	包子	2022-02-23 08:43:39.882167+08	0	0	\N	2022-02-23 08:43:39.88257+08	\N	\N	1	2022-02-08
4483	-4	交通出行	0	地铁	2022-02-23 08:44:01.466915+08	0	0	\N	2022-02-23 08:44:01.467283+08	\N	\N	1	2022-02-10
4484	-37	生活日用	0	养菜	2022-02-23 08:44:25.541363+08	0	0	\N	2022-02-23 08:44:25.54166+08	\N	\N	1	2022-02-10
4485	-6	文教娱乐	0	电影	2022-02-23 08:45:19.824857+08	0	0	\N	2022-02-23 08:45:19.825208+08	\N	\N	1	2022-02-12
4486	-3	饮食	0	饮料	2022-02-23 08:45:39.632471+08	0	0	\N	2022-02-23 08:45:39.632792+08	\N	\N	1	2022-02-15
4487	-48	宠物	0	兔粮	2022-02-23 08:45:59.87295+08	0	0	\N	2022-02-23 08:45:59.87331+08	\N	\N	1	2022-02-17
4489	-210	生活日用	0	生活日用	2022-02-23 09:57:02.494286+08	0	0	\N	2022-02-23 09:57:02.494679+08	\N	\N	1	2022-01-29
4490	-342	饮食	0	水果	2022-02-23 09:57:47.980772+08	0	0	\N	2022-02-23 09:57:47.981105+08	\N	\N	1	2022-01-29
4491	-299	服饰美容	0	衣服	2022-02-23 10:00:07.204834+08	0	0	\N	2022-02-23 10:00:07.205178+08	\N	\N	1	2022-01-30
4492	-105	饮食	0	美食	2022-02-23 10:00:55.154988+08	0	0	\N	2022-02-23 10:00:55.155282+08	\N	\N	1	2022-02-02
4493	-36	饮食	0	水果	2022-02-23 10:01:33.500791+08	0	0	\N	2022-02-23 10:01:33.5011+08	\N	\N	1	2022-02-04
4494	-96	饮食	0	饮食	2022-02-23 10:02:37.891765+08	0	0	\N	2022-02-23 10:02:37.892067+08	\N	\N	1	2022-02-09
4495	-69	饮食	0	医院	2022-02-23 10:03:13.70775+08	0	0	\N	2022-02-23 10:03:13.708087+08	\N	\N	1	2022-02-12
4496	-299	小孩教育	0	磁力贴	2022-02-23 10:03:45.669483+08	0	0	\N	2022-02-23 10:03:45.669809+08	\N	\N	1	2022-02-16
4497	-2	交通出行	0	停车	2022-02-23 10:04:19.353984+08	0	0	\N	2022-02-23 10:04:19.354274+08	\N	\N	1	2022-02-19
4498	-72	饮食	0	美团	2022-02-23 10:04:49.026067+08	0	0	\N	2022-02-23 10:04:49.02646+08	\N	\N	1	2022-02-22
4499	17031	收入	1	工资+1000专利提交	2022-02-23 10:06:55.922872+08	0	0	\N	2022-02-23 10:06:55.92321+08	\N	\N	1	2022-02-15
4500	-12	交通出行	0	公交地铁	2022-02-23 18:10:43.627826+08	0	0	\N	2022-02-23 18:10:43.628247+08	\N	\N	1	2022-02-23
4501	-16	交通出行	0	打车	2022-02-23 18:10:57.774075+08	0	0	\N	2022-02-23 18:10:57.774549+08	\N	\N	1	2022-02-23
4502	-36	小孩零食	0	糖	2022-02-23 18:11:11.603086+08	0	0	\N	2022-02-23 18:11:11.603425+08	\N	\N	1	2022-02-23
4503	-4809	小孩教育	0	中班学费	2022-02-23 18:11:35.282088+08	0	0	\N	2022-02-23 18:11:35.282459+08	\N	\N	1	2022-02-23
4504	-200	住房缴费	0	东兴天然气	2022-02-26 11:28:04.327287+08	0	0	\N	2022-02-26 11:28:04.330497+08	\N	\N	2	2022-02-09
4505	-15	饮食	0	华莱士	2022-02-26 11:28:31.589702+08	0	0	\N	2022-02-26 11:28:31.590043+08	\N	\N	2	2022-02-12
4506	-74	饮食	0	美购超市	2022-02-26 11:29:08.901302+08	0	0	\N	2022-02-26 11:29:08.901627+08	\N	\N	2	2022-02-13
4507	-560	服饰美容	0	包	2022-02-26 11:29:24.709841+08	0	0	\N	2022-02-26 11:29:24.710186+08	\N	\N	2	2022-02-15
4508	-8	服饰美容	0	袜子	2022-02-26 11:29:42.585604+08	0	0	\N	2022-02-26 11:29:42.585941+08	\N	\N	2	2022-02-15
4509	-35	饮食	0	麦当劳	2022-02-26 11:30:08.411612+08	0	0	\N	2022-02-26 11:30:08.411944+08	\N	\N	2	2022-02-19
4510	-16	饮食	0	古茗奶茶	2022-02-26 11:30:28.070157+08	0	0	\N	2022-02-26 11:30:28.070534+08	\N	\N	2	2022-02-19
4511	-50	饮食	0	牛肉面	2022-02-26 11:30:45.757971+08	0	0	\N	2022-02-26 11:30:45.758471+08	\N	\N	2	2022-02-19
4512	-17	饮食	0	麦当劳	2022-02-26 11:31:00.451376+08	0	0	\N	2022-02-26 11:31:00.451702+08	\N	\N	2	2022-02-20
4513	-15	饮食	0	煎饼	2022-02-26 11:31:11.673485+08	0	0	\N	2022-02-26 11:31:11.673802+08	\N	\N	2	2022-02-20
4514	-57	饮食	0	手工蛋卷	2022-02-26 11:31:26.312941+08	0	0	\N	2022-02-26 11:31:26.313325+08	\N	\N	2	2022-02-20
4515	-9	生活日用	0	果盘	2022-02-26 11:31:47.183394+08	0	0	\N	2022-02-26 11:31:47.183742+08	\N	\N	2	2022-02-22
4516	-71	饮食	0	大米	2022-02-26 11:32:02.109682+08	0	0	\N	2022-02-26 11:32:02.110095+08	\N	\N	2	2022-02-23
4517	-200	交通出行	0	建行	2022-02-26 11:32:46.405666+08	0	0	\N	2022-02-26 11:32:46.405969+08	\N	\N	2	2022-02-24
4518	-107	饮食	0	牛奶2箱	2022-02-26 11:33:13.281113+08	0	0	\N	2022-02-26 11:33:13.281431+08	\N	\N	2	2022-02-25
4519	-18	服饰美容	0	修眉刀	2022-02-26 11:33:36.508407+08	0	0	\N	2022-02-26 11:33:36.508757+08	\N	\N	2	2022-02-26
4520	-350	服饰美容	0	兰蔻粉底液	2022-02-26 11:34:34.961005+08	0	0	\N	2022-02-26 11:34:34.961334+08	\N	\N	2	2022-02-10
4521	-20	交通出行	0	停车费	2022-02-26 11:35:10.001865+08	0	0	\N	2022-02-26 11:35:10.002182+08	\N	\N	2	2022-02-11
4522	-5	交通出行	0	停车费	2022-02-26 11:35:48.266717+08	0	0	\N	2022-02-26 11:35:48.267024+08	\N	\N	2	2022-02-16
4523	-740	服饰美容	0	理发卡	2022-02-26 11:36:11.82725+08	0	0	\N	2022-02-26 11:36:11.827599+08	\N	\N	2	2022-02-18
4524	-3	交通出行	0	停车费	2022-02-26 11:36:41.827504+08	0	0	\N	2022-02-26 11:36:41.82791+08	\N	\N	2	2022-02-19
4525	-399	小孩其他	0	游乐场	2022-02-26 11:37:06.963014+08	0	0	\N	2022-02-26 11:37:06.963352+08	\N	\N	2	2022-02-20
4526	-24	饮食	0	蛋卷	2022-02-26 11:37:22.179507+08	0	0	\N	2022-02-26 11:37:22.179956+08	\N	\N	2	2022-02-20
4527	-5	交通出行	0	停车费	2022-02-26 11:37:44.718031+08	0	0	\N	2022-02-26 11:37:44.718416+08	\N	\N	2	2022-02-23
4528	-200	交通出行	0	加油	2022-02-26 11:38:01.207114+08	0	0	\N	2022-02-26 11:38:01.207448+08	\N	\N	2	2022-02-23
4529	-30	饮食	0	美购	2022-02-26 11:38:19.657671+08	0	0	\N	2022-02-26 11:38:19.658003+08	\N	\N	2	2022-02-24
4530	-100	小孩教育	0	班费	2022-02-26 11:38:47.009777+08	0	0	\N	2022-02-26 11:38:47.010082+08	\N	\N	2	2022-02-25
4531	-5	交通出行	0	停车费	2022-02-26 11:39:01.613343+08	0	0	\N	2022-02-26 11:39:01.613686+08	\N	\N	2	2022-02-26
4533	-23	饮食	0	麦当劳	2022-02-28 11:15:27.743904+08	0	0	\N	2022-02-28 11:15:27.744211+08	\N	\N	2	2022-02-27
4534	-168	饮食	0	九田午餐	2022-02-28 11:15:45.517411+08	0	0	\N	2022-02-28 11:15:45.517779+08	\N	\N	2	2022-02-27
4535	-33	生活日用	0	去油剂	2022-02-28 11:16:01.844744+08	0	0	\N	2022-02-28 11:16:01.845044+08	\N	\N	2	2022-02-27
4536	-30	服饰美容	0	吊带衫	2022-02-28 11:16:47.755121+08	0	0	\N	2022-02-28 11:16:47.7555+08	\N	\N	2	2022-02-27
4537	-15	饮食	0	汉堡	2022-03-05 21:07:49.820623+08	0	0	\N	2022-03-05 21:07:49.824483+08	\N	\N	2	2022-03-01
4538	-34	住房缴费	0	景湖水费	2022-03-05 21:08:27.246507+08	0	0	\N	2022-03-05 21:08:27.246843+08	\N	\N	2	2022-03-02
4539	-122	住房缴费	0	景湖电费	2022-03-05 21:08:52.994571+08	0	0	\N	2022-03-05 21:08:52.994909+08	\N	\N	2	2022-03-04
4540	-201	住房缴费	0	东兴电费	2022-03-05 21:09:10.476023+08	0	0	\N	2022-03-05 21:09:10.476358+08	\N	\N	2	2022-03-05
4541	-12	通讯物流	0	顺丰运费	2022-03-05 21:09:53.220207+08	0	0	\N	2022-03-05 21:09:53.220552+08	\N	\N	2	2022-03-01
4542	-328	饮食	0	绿姿	2022-03-05 21:10:10.71807+08	0	0	\N	2022-03-05 21:10:10.718443+08	\N	\N	2	2022-03-01
4543	-5	饮食	0	早餐	2022-03-05 21:10:25.405632+08	0	0	\N	2022-03-05 21:10:25.405975+08	\N	\N	2	2022-03-02
4544	-12	饮食	0	荷叶	2022-03-05 21:10:43.320446+08	0	0	\N	2022-03-05 21:10:43.320778+08	\N	\N	2	2022-03-02
4545	-18	饮食	0	牛肉面	2022-03-05 21:10:55.462835+08	0	0	\N	2022-03-05 21:10:55.463168+08	\N	\N	2	2022-03-04
4546	-7	饮食	0	饮料	2022-03-05 21:11:24.23516+08	0	0	\N	2022-03-05 21:11:24.235505+08	\N	\N	2	2022-03-04
4547	-6	饮食	0	馄饨	2022-03-05 21:11:33.90957+08	0	0	\N	2022-03-05 21:11:33.909998+08	\N	\N	2	2022-03-05
4548	-69	饮食	0	阿阔牛肉	2022-03-05 21:11:52.276217+08	0	0	\N	2022-03-05 21:11:52.276565+08	\N	\N	2	2022-03-05
4549	-10	小孩服饰	0	袜子	2022-03-05 21:12:38.660008+08	0	0	\N	2022-03-05 21:12:38.660343+08	\N	\N	2	2022-03-02
4550	-32	饮食	0	三江购物	2022-03-05 21:12:51.976488+08	0	0	\N	2022-03-05 21:12:51.976844+08	\N	\N	2	2022-03-04
4551	-18	通讯物流	0	换卡套餐	2022-03-12 13:33:27.945601+08	0	0	\N	2022-03-12 13:33:27.949041+08	\N	\N	2	2022-03-07
4552	-60	生活日用	0	洗面奶	2022-03-12 13:33:46.803677+08	0	0	\N	2022-03-12 13:33:46.804033+08	\N	\N	2	2022-03-07
4553	-21	饮食	0	叫了只鸡	2022-03-12 13:34:09.635576+08	0	0	\N	2022-03-12 13:34:09.635926+08	\N	\N	2	2022-03-08
4554	-24	饮食	0	奶茶	2022-03-12 13:34:28.202083+08	0	0	\N	2022-03-12 13:34:28.202431+08	\N	\N	2	2022-03-08
4555	-68	饮食	0	叮咚买菜	2022-03-12 13:34:47.804216+08	0	0	\N	2022-03-12 13:34:47.804576+08	\N	\N	2	2022-03-12
4556	-16	生活日用	0	万痛筋骨贴	2022-03-12 13:35:09.912667+08	0	0	\N	2022-03-12 13:35:09.913014+08	\N	\N	2	2022-03-12
4557	-5	交通出行	0	停车费	2022-03-12 13:35:42.906277+08	0	0	\N	2022-03-12 13:35:42.906644+08	\N	\N	2	2022-03-07
4558	-12	饮食	0	橘子	2022-03-12 13:36:00.645184+08	0	0	\N	2022-03-12 13:36:00.645528+08	\N	\N	2	2022-03-09
4559	-5	饮食	0	早餐	2022-03-12 13:36:19.71336+08	0	0	\N	2022-03-12 13:36:19.713724+08	\N	\N	2	2022-03-11
4560	-5	交通出行	0	停车费	2022-03-12 13:36:34.944106+08	0	0	\N	2022-03-12 13:36:34.94443+08	\N	\N	2	2022-03-11
4561	-46	文教娱乐	0	走遍美国	2022-03-15 12:30:40.093882+08	0	0	\N	2022-03-15 12:30:40.097252+08	\N	\N	2	2022-03-13
4562	-349	饮食	0	云海肴	2022-03-15 12:31:26.475673+08	0	0	\N	2022-03-15 12:31:26.476005+08	\N	\N	2	2022-03-13
4563	-10	服饰美容	0	名创优品	2022-03-15 12:31:46.640239+08	0	0	\N	2022-03-15 12:31:46.64057+08	\N	\N	2	2022-03-13
4564	-9	生活日用	0	美纹胶	2022-03-15 12:32:01.388642+08	0	0	\N	2022-03-15 12:32:01.388993+08	\N	\N	2	2022-03-14
4565	-25	生活日用	0	贴	2022-03-15 12:32:34.390572+08	0	0	\N	2022-03-15 12:32:34.390924+08	\N	\N	2	2022-03-15
4566	-25	饮食	0	汉堡	2022-03-15 12:32:45.425277+08	0	0	\N	2022-03-15 12:32:45.42559+08	\N	\N	2	2022-03-15
4567	-6	生活日用	0	泥土	2022-03-15 12:33:25.983626+08	0	0	\N	2022-03-15 12:33:25.983939+08	\N	\N	2	2022-03-12
4568	-200	交通出行	0	油费	2022-03-15 12:33:43.871246+08	0	0	\N	2022-03-15 12:33:43.871556+08	\N	\N	2	2022-03-14
4569	-3	交通出行	0	停车费	2022-03-15 12:34:00.709013+08	0	0	\N	2022-03-15 12:34:00.709384+08	\N	\N	2	2022-03-13
4570	-3	饮食	0	烧饼	2022-03-15 12:34:16.118411+08	0	0	\N	2022-03-15 12:34:16.11877+08	\N	\N	2	2022-03-13
4571	-35	生活日用	0	三江	2022-03-15 12:34:46.146376+08	0	0	\N	2022-03-15 12:34:46.146743+08	\N	\N	2	2022-03-14
4572	-19	小孩玩具	0	彩泥	2022-03-18 18:16:01.796583+08	0	0	\N	2022-03-18 18:16:01.802019+08	\N	\N	2	2022-03-15
4573	-18	小孩服饰	0	裤子	2022-03-18 18:16:46.327813+08	0	0	\N	2022-03-18 18:16:46.328165+08	\N	\N	2	2022-03-15
4574	-61	住房缴费	0	东兴水费	2022-03-18 18:17:04.81084+08	0	0	\N	2022-03-18 18:17:04.811189+08	\N	\N	2	2022-03-17
4575	-103	饮食	0	大米	2022-03-22 15:32:05.672659+08	0	0	\N	2022-03-22 15:32:05.676469+08	\N	\N	2	2022-03-19
4576	-154	饮食	0	午餐	2022-03-22 15:32:21.422479+08	0	0	\N	2022-03-22 15:32:21.422802+08	\N	\N	2	2022-03-20
4577	-20	生活日用	0	彩票	2022-03-22 15:32:44.592104+08	0	0	\N	2022-03-22 15:32:44.592434+08	\N	\N	2	2022-03-20
4578	-17	生活日用	0	启路	2022-03-22 15:33:00.216955+08	0	0	\N	2022-03-22 15:33:00.217409+08	\N	\N	2	2022-03-20
4579	-240	文教娱乐	0	有线电视	2022-03-22 15:33:20.761484+08	0	0	\N	2022-03-22 15:33:20.761817+08	\N	\N	2	2022-03-21
4580	-32	生活日用	0	洗手液	2022-03-22 15:33:39.087187+08	0	0	\N	2022-03-22 15:33:39.087531+08	\N	\N	2	2022-03-22
4581	-10	饮食	0	馄饨	2022-03-22 15:34:26.247147+08	0	0	\N	2022-03-22 15:34:26.247475+08	\N	\N	2	2022-03-19
4582	-66	饮食	0	阿七牛肉面	2022-03-22 15:34:47.000893+08	0	0	\N	2022-03-22 15:34:47.001202+08	\N	\N	2	2022-03-19
4583	-335	饮食	0	山姆	2022-03-22 15:35:05.650413+08	0	0	\N	2022-03-22 15:35:05.650775+08	\N	\N	2	2022-03-19
4584	-19	交通出行	0	停车费	2022-03-22 15:35:25.150604+08	0	0	\N	2022-03-22 15:35:25.150946+08	\N	\N	2	2022-03-19
4585	-5	生活日用	0	启路	2022-03-22 15:35:43.12189+08	0	0	\N	2022-03-22 15:35:43.122513+08	\N	\N	2	2022-03-20
4586	-15	交通出行	0	停车费	2022-03-22 15:36:14.240785+08	0	0	\N	2022-03-22 15:36:14.241115+08	\N	\N	2	2022-03-20
4587	-8	饮食	0	水果	2022-03-25 10:07:07.191264+08	0	0	\N	2022-03-25 10:07:07.195346+08	\N	\N	1	2022-02-25
4588	-20	饮食	0	水果	2022-03-25 10:07:20.596194+08	0	0	\N	2022-03-25 10:07:20.59657+08	\N	\N	1	2022-02-26
4589	-24	小孩玩具	0	斗兽棋	2022-03-25 10:07:44.036497+08	0	0	\N	2022-03-25 10:07:44.03683+08	\N	\N	1	2022-02-26
4590	-10	交通出行	0	特斯拉包月	2022-03-25 10:08:02.446107+08	0	0	\N	2022-03-25 10:08:02.446484+08	\N	\N	1	2022-02-26
4591	-30	生活日用	0	豆芽盆	2022-03-25 10:08:59.756751+08	0	0	\N	2022-03-25 10:08:59.75707+08	\N	\N	1	2022-03-01
4592	-20	饮食	0	甘蔗	2022-03-25 10:09:20.471827+08	0	0	\N	2022-03-25 10:09:20.472173+08	\N	\N	1	2022-03-05
4593	-82	生活日用	0	日用品	2022-03-25 10:09:45.073809+08	0	0	\N	2022-03-25 10:09:45.07413+08	\N	\N	1	2022-03-06
4594	-17	饮食	0	美购	2022-03-25 10:10:03.046872+08	0	0	\N	2022-03-25 10:10:03.047183+08	\N	\N	1	2022-03-07
4595	-10	生活日用	0	花盆	2022-03-25 10:10:30.586231+08	0	0	\N	2022-03-25 10:10:30.586652+08	\N	\N	1	2022-03-10
4596	-4	生活日用	0	生菜种子	2022-03-25 10:10:53.072167+08	0	0	\N	2022-03-25 10:10:53.072487+08	\N	\N	1	2022-03-10
4597	-45	宠物	0	提莫西	2022-03-25 10:11:17.152191+08	0	0	\N	2022-03-25 10:11:17.152518+08	\N	\N	1	2022-03-11
4598	-200	生活日用	0	理发	2022-03-25 10:11:40.331001+08	0	0	\N	2022-03-25 10:11:40.331341+08	\N	\N	1	2022-03-12
4599	-3	饮食	0	甜筒	2022-03-25 10:11:54.865945+08	0	0	\N	2022-03-25 10:11:54.866262+08	\N	\N	1	2022-03-12
4600	-31	生活日用	0	花盆	2022-03-25 10:12:10.701256+08	0	0	\N	2022-03-25 10:12:10.701615+08	\N	\N	1	2022-03-12
4601	-40	生活日用	0	名创优品	2022-03-25 10:12:33.876608+08	0	0	\N	2022-03-25 10:12:33.876979+08	\N	\N	1	2022-03-13
4602	-8	生活日用	0	葱头	2022-03-25 10:13:13.495882+08	0	0	\N	2022-03-25 10:13:13.496214+08	\N	\N	1	2022-03-17
4603	-40	生活日用	0	泡脚药	2022-03-25 10:13:32.871495+08	0	0	\N	2022-03-25 10:13:32.871836+08	\N	\N	1	2022-03-19
4604	-161	饮食	0	腊肉香肠	2022-03-25 10:14:34.40826+08	0	0	\N	2022-03-25 10:14:34.408597+08	\N	\N	1	2022-02-25
4605	-100	通讯物流	0	话费	2022-03-25 10:14:50.755479+08	0	0	\N	2022-03-25 10:14:50.755832+08	\N	\N	1	2022-02-25
4606	-8	交通出行	0	停车	2022-03-25 10:15:05.921219+08	0	0	\N	2022-03-25 10:15:05.921536+08	\N	\N	1	2022-03-08
4607	-10	饮食	0	烧饼	2022-03-25 10:15:34.996474+08	0	0	\N	2022-03-25 10:15:34.996834+08	\N	\N	1	2022-03-12
4608	-10	交通出行	0	停车	2022-03-25 10:15:46.175514+08	0	0	\N	2022-03-25 10:15:46.17589+08	\N	\N	1	2022-03-12
4609	-22	饮食	0	水果	2022-03-25 10:16:05.925184+08	0	0	\N	2022-03-25 10:16:05.925499+08	\N	\N	1	2022-03-24
4610	-12	小孩文具	0	洞洞笔	2022-03-30 09:19:43.736755+08	0	0	\N	2022-03-30 09:19:43.74031+08	\N	\N	2	2022-03-23
4611	-20	小孩玩具	0	蜗牛	2022-03-30 09:20:02.515905+08	0	0	\N	2022-03-30 09:20:02.516223+08	\N	\N	2	2022-03-24
4612	-100	通讯物流	0	话费	2022-03-30 09:21:54.529432+08	0	0	\N	2022-03-30 09:21:54.52988+08	\N	\N	2	2022-03-24
4613	-18	饮食	0	牛肉面	2022-03-30 09:22:22.342361+08	0	0	\N	2022-03-30 09:22:22.342705+08	\N	\N	2	2022-03-26
4614	-15	饮食	0	酥肉	2022-03-30 09:22:49.287601+08	0	0	\N	2022-03-30 09:22:49.287935+08	\N	\N	2	2022-03-26
4615	-5	饮食	0	香肠	2022-03-30 09:22:58.81297+08	0	0	\N	2022-03-30 09:22:58.81332+08	\N	\N	2	2022-03-26
4616	-10	饮食	0	coco	2022-03-30 09:23:11.210596+08	0	0	\N	2022-03-30 09:23:11.210938+08	\N	\N	2	2022-03-26
4617	-49	小孩玩具	0	小火车	2022-03-30 09:23:25.930305+08	0	0	\N	2022-03-30 09:23:25.930665+08	\N	\N	2	2022-03-27
4618	-31	饮食	0	肯德基	2022-03-30 09:23:38.042671+08	0	0	\N	2022-03-30 09:23:38.042993+08	\N	\N	2	2022-03-27
4619	-28	健康保险	0	医院	2022-03-30 09:23:54.677102+08	0	0	\N	2022-03-30 09:23:54.67744+08	\N	\N	2	2022-03-28
4620	-100	饮食	0	三观码头	2022-03-30 09:24:07.429145+08	0	0	\N	2022-03-30 09:24:07.429485+08	\N	\N	2	2022-03-28
4621	-14	生活日用	0	钢化膜	2022-03-30 09:24:27.158837+08	0	0	\N	2022-03-30 09:24:27.159177+08	\N	\N	2	2022-03-29
4622	-5	交通出行	0	停车费	2022-03-30 09:29:42.487442+08	0	0	\N	2022-03-30 09:29:42.487897+08	\N	\N	2	2022-03-27
4623	-5	交通出行	0	停车费	2022-03-30 09:29:57.507004+08	0	0	\N	2022-03-30 09:29:57.507351+08	\N	\N	2	2022-03-27
4624	-10	饮食	0	肯德基	2022-03-30 09:30:07.091993+08	0	0	\N	2022-03-30 09:30:07.0924+08	\N	\N	2	2022-03-27
4625	-30	生活日用	0	厨房湿巾	2022-03-30 09:30:21.378975+08	0	0	\N	2022-03-30 09:30:21.379352+08	\N	\N	2	2022-03-27
4626	-20	饮食	0	牛肉面	2022-03-30 09:30:36.944954+08	0	0	\N	2022-03-30 09:30:36.945288+08	\N	\N	2	2022-03-28
4627	-87	饮食	0	大米	2022-04-17 21:15:28.748217+08	0	0	\N	2022-04-17 21:15:28.752353+08	\N	\N	2	2022-03-31
4628	-20	通讯物流	0	话费	2022-04-17 21:15:54.10597+08	0	0	\N	2022-04-17 21:15:54.106291+08	\N	\N	2	2022-04-01
4629	-149	住房缴费	0	东兴电费	2022-04-17 21:16:22.678481+08	0	0	\N	2022-04-17 21:16:22.678785+08	\N	\N	2	2022-04-03
4630	-66	住房缴费	0	景湖电费	2022-04-17 21:16:41.909529+08	0	0	\N	2022-04-17 21:16:41.910044+08	\N	\N	2	2022-04-03
4631	-12	小孩玩具	0	捞鱼网	2022-04-17 21:17:02.612884+08	0	0	\N	2022-04-17 21:17:02.613188+08	\N	\N	2	2022-04-04
4632	-12	服饰美容	0	补洞贴	2022-04-17 21:17:28.597188+08	0	0	\N	2022-04-17 21:17:28.597494+08	\N	\N	2	2022-04-06
4633	-11	饮食	0	冰雪蜜城	2022-04-17 21:17:47.263326+08	0	0	\N	2022-04-17 21:17:47.263662+08	\N	\N	2	2022-04-10
4634	-13	服饰美容	0	袜子	2022-04-17 21:18:07.652896+08	0	0	\N	2022-04-17 21:18:07.653266+08	\N	\N	2	2022-04-13
4635	-37	饮食	0	绞股蓝	2022-04-17 21:18:27.034146+08	0	0	\N	2022-04-17 21:18:27.034529+08	\N	\N	2	2022-04-14
4636	-27	小孩玩具	0	捞鱼网	2022-04-17 21:18:43.056882+08	0	0	\N	2022-04-17 21:18:43.057217+08	\N	\N	2	2022-04-16
4637	-70	饮食	0	美购	2022-04-17 21:18:56.460195+08	0	0	\N	2022-04-17 21:18:56.460569+08	\N	\N	2	2022-04-16
4638	-29	饮食	0	烧烤	2022-04-17 21:19:13.688201+08	0	0	\N	2022-04-17 21:19:13.688547+08	\N	\N	2	2022-04-16
4639	-33	服饰美容	0	衣服	2022-04-17 21:19:28.098866+08	0	0	\N	2022-04-17 21:19:28.099179+08	\N	\N	2	2022-04-17
4640	-30	饮食	0	大神卡肯德基	2022-04-17 21:19:49.368201+08	0	0	\N	2022-04-17 21:19:49.368522+08	\N	\N	2	2022-04-17
4641	-10	饮食	0	肯德基	2022-04-17 21:20:00.061355+08	0	0	\N	2022-04-17 21:20:00.06166+08	\N	\N	2	2022-04-17
4642	-45	服饰美容	0	首饰	2022-04-17 21:20:10.678127+08	0	0	\N	2022-04-17 21:20:10.678529+08	\N	\N	2	2022-04-17
4643	-250	交通出行	0	加油	2022-04-17 21:21:20.01305+08	0	0	\N	2022-04-17 21:21:20.013361+08	\N	\N	2	2022-04-01
4644	-10	饮食	0	大饼	2022-04-17 21:21:35.158656+08	0	0	\N	2022-04-17 21:21:35.159001+08	\N	\N	2	2022-04-02
4645	-3	交通出行	0	停车费	2022-04-17 21:21:52.177484+08	0	0	\N	2022-04-17 21:21:52.177806+08	\N	\N	2	2022-04-03
4646	-21	饮食	0	水果	2022-04-17 21:22:16.912772+08	0	0	\N	2022-04-17 21:22:16.913109+08	\N	\N	2	2022-04-03
4647	-1200	文教娱乐	0	公司注销	2022-04-17 21:22:43.576322+08	0	0	\N	2022-04-17 21:22:43.576793+08	\N	\N	2	2022-04-09
4648	-10	饮食	0	烧饼	2022-04-17 21:22:55.006057+08	0	0	\N	2022-04-17 21:22:55.006524+08	\N	\N	2	2022-04-10
4649	-40	服饰美容	0	睡衣	2022-04-17 21:23:25.792883+08	0	0	\N	2022-04-17 21:23:25.793213+08	\N	\N	2	2022-04-12
4650	-3	饮食	0	糖糕	2022-04-17 21:23:46.962905+08	0	0	\N	2022-04-17 21:23:46.963371+08	\N	\N	2	2022-04-16
4651	3925	收入	1	二月工资	2022-04-17 21:32:20.944902+08	0	0	\N	2022-04-17 21:32:20.945244+08	\N	\N	2	2022-03-28
4652	2894	收入	1	1月工资	2022-04-17 21:32:50.618654+08	0	0	\N	2022-04-17 21:32:50.618991+08	\N	\N	2	2022-03-17
4653	-10	交通出行	0	特斯拉网络	2022-04-18 17:25:03.901821+08	0	0	\N	2022-04-18 17:25:03.905293+08	\N	\N	1	2022-03-26
4654	-12	饮食	0	零售	2022-04-18 17:25:21.125607+08	0	0	\N	2022-04-18 17:25:21.125954+08	\N	\N	1	2022-03-27
4655	-187	小孩健康	0	妇儿医院发烧	2022-04-18 17:26:01.556497+08	0	0	\N	2022-04-18 17:26:01.556907+08	\N	\N	1	2022-03-30
4656	-21	饮食	0	古茗	2022-04-18 17:26:37.816361+08	0	0	\N	2022-04-18 17:26:37.816719+08	\N	\N	1	2022-03-30
4657	-3680	小孩教育	0	托班一个月	2022-04-18 17:27:04.03131+08	0	0	\N	2022-04-18 17:27:04.031689+08	\N	\N	1	2022-03-30
4658	-3	饮食	0	蜜雪冰城	2022-04-18 17:27:25.116216+08	0	0	\N	2022-04-18 17:27:25.116614+08	\N	\N	1	2022-03-31
4659	-270	饮食	0	牛肉面	2022-04-18 17:27:45.60611+08	0	0	\N	2022-04-18 17:27:45.606503+08	\N	\N	1	2022-04-03
4660	-141	饮食	0	美购	2022-04-18 17:28:06.586654+08	0	0	\N	2022-04-18 17:28:06.587056+08	\N	\N	1	2022-04-07
4661	-16	宠物	0	填竹	2022-04-18 17:28:49.240996+08	0	0	\N	2022-04-18 17:28:49.241355+08	\N	\N	1	2022-04-09
4662	-22	饮食	0	方便面	2022-04-18 17:29:05.514502+08	0	0	\N	2022-04-18 17:29:05.514819+08	\N	\N	1	2022-04-09
4663	-166	饮食	0	美购	2022-04-18 17:29:21.070568+08	0	0	\N	2022-04-18 17:29:21.070925+08	\N	\N	1	2022-04-10
4664	-20	饮食	0	古茗	2022-04-18 17:29:37.276279+08	0	0	\N	2022-04-18 17:29:37.276608+08	\N	\N	1	2022-04-11
4665	-25	饮食	0	午餐	2022-04-18 17:30:00.991252+08	0	0	\N	2022-04-18 17:30:00.991576+08	\N	\N	1	2022-04-13
4666	-56	生活日用	0	核酸x2	2022-04-18 17:30:27.496398+08	0	0	\N	2022-04-18 17:30:27.496727+08	\N	\N	1	2022-04-13
4667	-25	生活日用	0	HDMI转换线	2022-04-18 17:30:49.27514+08	0	0	\N	2022-04-18 17:30:49.275463+08	\N	\N	1	2022-04-15
4668	-9	饮食	0	饮食	2022-04-18 17:31:11.441669+08	0	0	\N	2022-04-18 17:31:11.442029+08	\N	\N	1	2022-04-17
4669	-25	饮食	0	午餐	2022-04-18 17:31:55.040443+08	0	0	\N	2022-04-18 17:31:55.040809+08	\N	\N	1	2022-03-30
4670	-87	交通出行	0	奉化玩	2022-04-18 17:32:32.680299+08	0	0	\N	2022-04-18 17:32:32.680674+08	\N	\N	1	2022-04-03
4671	-34	饮食	0	零售	2022-04-18 17:33:19.175423+08	0	0	\N	2022-04-18 17:33:19.175769+08	\N	\N	1	2022-04-05
4672	-10	饮食	0	零售	2022-04-18 17:33:43.850071+08	0	0	\N	2022-04-18 17:33:43.850427+08	\N	\N	1	2022-04-07
4673	-13	饮食	0	水饺	2022-04-18 17:33:59.649493+08	0	0	\N	2022-04-18 17:33:59.649821+08	\N	\N	1	2022-04-09
4674	-2	通讯物流	0	手机充电	2022-04-18 17:34:23.485521+08	0	0	\N	2022-04-18 17:34:23.485867+08	\N	\N	1	2022-04-09
4675	-38	交通出行	0	保养费用	2022-04-18 17:34:54.964999+08	0	0	\N	2022-04-18 17:34:54.965345+08	\N	\N	1	2022-04-09
4676	-35	生活日用	0	交通出行	2022-04-18 17:35:42.211632+08	0	0	\N	2022-04-18 17:35:42.211985+08	\N	\N	1	2022-04-09
4677	-10	饮食	0	零食	2022-04-18 17:36:18.720552+08	0	0	\N	2022-04-18 17:36:18.720903+08	\N	\N	1	2022-04-17
4678	16062	收入	1	三月工资	2022-04-18 17:37:34.725685+08	0	0	\N	2022-04-18 17:37:34.726044+08	\N	\N	1	2022-03-18
4679	16062	收入	1	四月工资	2022-04-18 17:37:55.203306+08	0	0	\N	2022-04-18 17:37:55.203698+08	\N	\N	1	2022-04-15
4680	-50	服饰美容	0	裙子	2022-04-25 17:54:31.532583+08	0	0	\N	2022-04-25 17:54:31.535815+08	\N	\N	2	2022-04-17
4681	-40	服饰美容	0	蘑菇街	2022-04-25 17:54:51.486494+08	0	0	\N	2022-04-25 17:54:51.486841+08	\N	\N	2	2022-04-17
4682	-100	饮食	0	老婆大人	2022-04-25 17:55:33.579076+08	0	0	\N	2022-04-25 17:55:33.579428+08	\N	\N	2	2022-04-18
4683	-52	饮食	0	绞股蓝	2022-04-25 17:55:52.70157+08	0	0	\N	2022-04-25 17:55:52.701896+08	\N	\N	2	2022-04-20
4684	-36	小孩生活用品	0	文具	2022-04-25 17:56:14.728114+08	0	0	\N	2022-04-25 17:56:14.728473+08	\N	\N	2	2022-04-21
4685	-37	饮食	0	烧烤	2022-04-25 17:59:51.802396+08	0	0	\N	2022-04-25 17:59:51.802792+08	\N	\N	2	2022-04-22
4686	-28	饮食	0	午饭	2022-04-25 18:00:34.187307+08	0	0	\N	2022-04-25 18:00:34.187646+08	\N	\N	2	2022-04-24
4687	-3275	交通出行	0	车险	2022-04-25 18:52:03.323798+08	0	0	\N	2022-04-25 18:52:03.324132+08	\N	\N	2	2022-04-25
4688	-24	饮食	0	饮食	2022-04-25 19:18:42.405525+08	0	0	\N	2022-04-25 19:18:42.405859+08	\N	\N	2	2022-04-21
4689	-18	饮食	0	午饭	2022-04-25 19:44:19.01755+08	0	0	\N	2022-04-25 19:44:19.017904+08	\N	\N	2	2022-04-23
4690	-250	交通出行	0	加油	2022-04-25 19:45:13.892117+08	0	0	\N	2022-04-25 19:45:13.892447+08	\N	\N	2	2022-04-25
4691	-6	文教娱乐	0	咪咕英超	2022-04-28 13:13:11.641033+08	0	0	\N	2022-04-28 13:13:11.644487+08	\N	\N	1	2022-04-23
4692	-15	生活日用	0	柠檬树	2022-04-28 13:14:27.187169+08	0	0	\N	2022-04-28 13:14:27.187523+08	\N	\N	1	2022-04-21
4693	-100	通讯物流	0	手机充值	2022-04-28 13:14:47.902189+08	0	0	\N	2022-04-28 13:14:47.902568+08	\N	\N	1	2022-04-26
4694	-10	交通出行	0	特斯拉网络	2022-04-28 13:15:06.610642+08	0	0	\N	2022-04-28 13:15:06.611016+08	\N	\N	1	2022-04-26
4695	-26	饮食	0	肯德基	2022-05-06 11:26:34.099969+08	0	0	\N	2022-05-06 11:26:34.103424+08	\N	\N	2	2022-04-30
4696	-22	饮食	0	肯德基	2022-05-06 11:26:56.870105+08	0	0	\N	2022-05-06 11:26:56.870616+08	\N	\N	2	2022-05-01
4697	-156	住房缴费	0	东兴电费	2022-05-06 11:27:18.030062+08	0	0	\N	2022-05-06 11:27:18.030457+08	\N	\N	2	2022-05-02
4698	-38	住房缴费	0	景湖电费	2022-05-06 11:27:41.059968+08	0	0	\N	2022-05-06 11:27:41.060378+08	\N	\N	2	2022-05-02
4699	-21	住房缴费	0	水费	2022-05-06 11:28:01.928121+08	0	0	\N	2022-05-06 11:28:01.928479+08	\N	\N	2	2022-05-03
4700	-60	饮食	0	肯德基	2022-05-06 11:28:19.718883+08	0	0	\N	2022-05-06 11:28:19.719269+08	\N	\N	2	2022-05-04
4701	-15	饮食	0	袜子	2022-05-06 11:28:33.342504+08	0	0	\N	2022-05-06 11:28:33.342896+08	\N	\N	2	2022-05-04
4702	-94	饮食	0	烧烤	2022-05-06 11:29:21.522892+08	0	0	\N	2022-05-06 11:29:21.523241+08	\N	\N	2	2022-04-28
4703	-68	饮食	0	新江厦	2022-05-06 11:29:51.552235+08	0	0	\N	2022-05-06 11:29:51.552704+08	\N	\N	2	2022-05-01
4704	-25	饮食	0	小吃	2022-05-06 11:30:12.160079+08	0	0	\N	2022-05-06 11:30:12.160429+08	\N	\N	2	2022-05-01
4705	-11	饮食	0	小吃	2022-05-06 11:30:33.664928+08	0	0	\N	2022-05-06 11:30:33.665318+08	\N	\N	2	2022-05-01
4706	-18	饮食	0	午餐	2022-05-06 11:30:50.624079+08	0	0	\N	2022-05-06 11:30:50.624481+08	\N	\N	2	2022-05-05
4707	-7	饮食	0	早餐	2022-05-06 11:31:04.516643+08	0	0	\N	2022-05-06 11:31:04.517063+08	\N	\N	2	2022-05-06
4708	-80	饮食	0	老婆大人	2022-05-06 11:31:27.762462+08	0	0	\N	2022-05-06 11:31:27.762849+08	\N	\N	2	2022-04-30
4709	-316	饮食	0	柏悦自助餐	2022-05-06 11:31:42.158891+08	0	0	\N	2022-05-06 11:31:42.159288+08	\N	\N	2	2022-05-03
4710	-80	饮食	0	老婆大人	2022-05-06 11:31:58.211019+08	0	0	\N	2022-05-06 11:31:58.211412+08	\N	\N	2	2022-05-04
4711	28000	收入	1	三月工资和提成	2022-05-06 11:32:39.163425+08	0	0	\N	2022-05-06 11:32:39.163924+08	\N	\N	2	2022-04-28
4712	-15	生活日用	0	纸巾	2022-05-10 11:21:22.397039+08	0	0	\N	2022-05-10 11:21:22.401053+08	\N	\N	2	2022-05-06
4713	-40	小孩生活用品	0	止痒贴	2022-05-10 11:21:40.534672+08	0	0	\N	2022-05-10 11:21:40.535006+08	\N	\N	2	2022-05-06
4714	-16	小孩生活用品	0	牙刷	2022-05-10 11:21:56.406569+08	0	0	\N	2022-05-10 11:21:56.406887+08	\N	\N	2	2022-05-06
4715	-110	服饰美容	0	裙子	2022-05-10 11:22:18.069931+08	0	0	\N	2022-05-10 11:22:18.070268+08	\N	\N	2	2022-05-08
4716	-205	服饰美容	0	鞋子	2022-05-10 11:22:34.941832+08	0	0	\N	2022-05-10 11:22:34.942222+08	\N	\N	2	2022-05-08
4717	-182	服饰美容	0	鞋子	2022-05-10 11:22:45.662259+08	0	0	\N	2022-05-10 11:22:45.662638+08	\N	\N	2	2022-05-08
4718	-158	服饰美容	0	鞋子	2022-05-10 11:22:56.920078+08	0	0	\N	2022-05-10 11:22:56.920404+08	\N	\N	2	2022-05-08
4719	-30	饮食	0	寿司	2022-05-10 11:23:09.204335+08	0	0	\N	2022-05-10 11:23:09.204649+08	\N	\N	2	2022-05-08
4720	-32	小孩生活用品	0	口罩	2022-05-10 11:23:23.451096+08	0	0	\N	2022-05-10 11:23:23.451418+08	\N	\N	2	2022-05-10
4721	-26	小孩文具	0	玩具	2022-05-10 11:23:37.207953+08	0	0	\N	2022-05-10 11:23:37.208284+08	\N	\N	2	2022-05-10
4722	-26	小孩文具	0	文具	2022-05-10 11:23:49.02561+08	0	0	\N	2022-05-10 11:23:49.025964+08	\N	\N	2	2022-05-10
4723	-34	饮食	0	鸡蛋盒	2022-05-10 11:23:59.815387+08	0	0	\N	2022-05-10 11:23:59.815703+08	\N	\N	2	2022-05-10
4724	-24	饮食	0	辣螺	2022-05-10 11:24:40.541909+08	0	0	\N	2022-05-10 11:24:40.542278+08	\N	\N	2	2022-05-09
4725	-398	服饰美容	0	水乳	2022-05-10 11:24:56.791211+08	0	0	\N	2022-05-10 11:24:56.791562+08	\N	\N	2	2022-05-10
\.


--
-- Data for Name: iaer_redenvelope; Type: TABLE DATA; Schema: public; Owner: ben
--

COPY public.iaer_redenvelope (id, money, money_type, money_from, remark, created, user_id) FROM stdin;
74	1000	0	五姐	过年红包	2019-01-25 07:21:21.487438+08	4
75	500	0	六姐	新年红包	2019-01-26 00:36:41.11265+08	4
76	500	0	奶奶	新年红包	2019-02-05 09:06:36.753478+08	4
77	500	0	建华哥哥	新年红包	2019-02-05 09:06:49.789244+08	4
78	1000	0	江陆嬷嬷	新年红包	2019-02-05 18:51:01.154147+08	4
79	500	0	二伯伯	新年红包	2019-02-05 18:51:49.150897+08	4
80	800	0	舅舅	新年红包	2019-02-05 18:52:11.377241+08	4
81	600	0	外婆	新年红包	2019-02-05 18:52:29.019126+08	4
82	1200	0	丈母娘	新年红包	2019-02-10 08:45:48.015676+08	4
84	200	0	咸祥嬷嬷	新年红包	2019-02-10 08:46:58.643864+08	4
85	200	0	塘溪舅舅	新年红包	2019-02-10 08:47:21.09625+08	4
86	5000	0	爸爸	新年红包	2019-02-11 10:45:43.13215+08	4
87	5000	0	妈妈	新年红包	2019-02-11 10:45:55.330394+08	4
88	500	0	建辉哥	新年红包	2019-02-13 09:47:50.78305+08	4
89	1000	0	丈母娘	两岁生日红包	2019-06-09 21:22:46.629047+08	4
58	300	0	咸祥嬷嬷	新年红包	2018-02-18 18:16:59.123331+08	4
1	880	0	磊艳姐	出生红包	2017-06-18 20:23:48.382078+08	4
2	188	0	小强	出生红包	2017-06-18 20:24:04.21992+08	4
3	1000	0	宁波嬷嬷	出生红包	2017-06-18 20:24:32.295148+08	4
4	800	0	咸祥嬷嬷	出生红包	2017-06-18 20:27:53.33798+08	4
5	600	0	咸祥哥哥	出生红包	2017-06-18 20:28:40.339832+08	4
6	2000	0	大姐姐	出生红包	2017-06-18 20:29:12.58767+08	4
7	10000	0	丈母娘	出生红包	2017-06-18 20:29:42.928428+08	4
8	1500	0	丈母娘	催生红包	2017-06-18 20:30:00.026331+08	4
9	1200	0	江陆嬷嬷	出生红包	2017-06-18 20:30:46.200995+08	4
10	800	0	江陆大哥哥	出生红包	2017-06-18 20:31:04.54314+08	4
11	800	0	江陆小哥哥	出生红包	2017-06-18 20:31:22.459012+08	4
12	600	0	大伯伯	出生红包	2017-06-18 20:31:43.151531+08	4
13	1000	0	二伯伯	出生红包	2017-06-18 20:32:04.609331+08	4
14	1000	0	三姐姐	出生红包	2017-06-18 20:32:27.740332+08	4
15	600	0	舅舅	出生红包	2017-06-18 20:32:39.499006+08	4
16	1200	0	外婆	出生红包	2017-06-18 20:32:55.949876+08	4
17	1600	0	阿姨	出生红包	2017-06-18 20:33:08.480811+08	4
18	1600	0	管江阿姨	出生红包	2017-06-19 15:48:12.146769+08	4
19	1000	0	上海嬷嬷	出生红包	2017-06-19 15:56:08.231509+08	4
20	13000	0	妈妈	出生红包	2017-06-19 15:56:24.576739+08	4
21	1200	0	奶奶	出生红包	2017-06-20 09:23:52.182672+08	4
22	1200	0	沙村嬷嬷	出生红包	2017-06-21 08:08:29.253738+08	4
23	1200	0	沙村大阿姆	出生红包	2017-06-21 08:08:55.263453+08	4
24	1200	0	沙村小阿姆	出生红包	2017-06-21 08:09:14.296094+08	4
25	5600	0	红霞	出生红包	2017-06-22 13:57:16.857961+08	4
26	3600	0	五姐	出生红包	2017-06-22 13:58:18.451322+08	4
27	1200	0	六姐	出生红包	2017-06-22 13:58:51.728138+08	4
28	1600	0	二姐	出生红包	2017-06-22 13:59:31.027873+08	4
29	1000	0	建华哥哥	出生红包	2017-06-25 09:46:07.657558+08	4
30	600	0	小龙	出生红包	2017-07-01 19:09:59.361237+08	4
31	1200	0	塘溪舅舅	出生红包	2017-07-01 19:10:21.219857+08	4
32	1000	0	建辉哥	出生红包	2017-07-09 16:10:01.194495+08	4
33	300	0	沙村小阿姆	见面红包	2017-08-05 09:34:24.315802+08	4
34	2800	0	丈母娘	见面红包	2017-08-05 09:34:45.029717+08	4
35	1600	0	奶奶	见面红包	2017-08-05 09:35:04.622308+08	4
36	2000	0	老婆老板	出生红包	2017-08-05 09:38:17.605805+08	4
37	508	0	外婆	见面红包	2017-10-19 21:17:47.148152+08	4
38	300	0	沙村嬷嬷	见面红包	2017-10-19 21:18:07.891939+08	4
39	660	0	五姐	满月红包	2017-10-19 21:18:55.11675+08	4
40	800	0	二姐姐	新年红包	2018-02-09 18:50:23.14149+08	4
41	600	0	宁波嬷嬷	新年红包	2018-02-09 18:50:49.837051+08	4
42	1000	0	五姐	过年红包	2018-02-11 18:12:06.021698+08	4
43	800	0	六姐	新年红包	2018-02-13 22:23:40.739161+08	4
44	500	0	奶奶	新年红包	2018-02-15 13:45:20.683989+08	4
45	600	0	建华哥	新年红包	2018-02-15 18:53:50.311889+08	4
46	600	0	外婆	新年红包	2018-02-16 19:30:41.023052+08	4
47	800	0	舅舅	新年红包	2018-02-16 19:30:51.972515+08	4
48	1000	0	江陆嬷嬷	新年红包	2018-02-16 19:31:07.942173+08	4
49	500	0	二伯伯	新年红包	2018-02-16 19:31:20.766115+08	4
50	10000	0	妈妈	新年红包	2018-02-16 19:35:07.004468+08	4
51	500	0	沙村大阿姆	新年红包	2018-02-18 17:09:41.916614+08	4
52	300	0	沙村小阿姆	新年红包	2018-02-18 17:09:56.393998+08	4
53	800	0	阿姨	新年红包	2018-02-18 17:17:46.756471+08	4
54	800	0	舅舅	新年红包	2018-02-18 17:17:58.245673+08	4
55	600	0	外婆	新年红包	2018-02-18 17:18:08.994977+08	4
56	300	0	沙村嬷嬷	新年红包	2018-02-18 18:16:12.372293+08	4
57	300	0	塘溪舅舅	新年红包	2018-02-18 18:16:32.901781+08	4
59	200	0	塘溪阿姨	过年红包	2018-02-27 10:26:13.506074+08	4
60	600	0	建辉哥	过年红包	2018-02-27 10:26:31.816098+08	4
61	600	0	大姐姐	新年红包	2018-03-08 21:26:07.828657+08	4
62	600	0	上海哥哥	见面红包	2018-04-14 18:52:54.355358+08	4
63	600	0	上海嬷嬷	见面红包	2018-04-14 18:53:07.463848+08	4
64	600	0	上海伯伯	见面红包	2018-04-14 18:53:23.962255+08	4
65	1600	0	丈母娘	生日红包	2018-06-23 10:52:26.944656+08	4
66	600	0	江陆嬷嬷	生日红包	2018-06-23 10:52:48.676356+08	4
193	2800	0	妈妈	两岁生日红包	2019-10-11 15:28:31.520067+08	4
198	500	0	奶奶	新年红包	2020-02-06 13:21:38.758357+08	4
199	1500	0	丈母娘	新年红包	2020-02-06 13:21:59.332853+08	4
200	5000	0	爸爸	新年红包	2020-02-06 13:22:15.348705+08	4
201	1000	0	江陆嬷嬷	新年红包	2020-02-06 13:23:40.749268+08	4
203	300	0	二伯伯	新年红包	2020-02-06 13:24:15.306837+08	4
204	500	0	大伯伯	新年红包	2020-02-06 13:24:42.090263+08	4
205	600	0	外婆	新年红包	2020-02-06 13:25:03.379446+08	4
206	800	0	舅舅	新年红包	2020-02-06 13:25:20.946572+08	4
208	600	0	阿姨	新年红包	2020-03-08 17:46:18.860733+08	4
209	600	0	江陆嬷嬷	幼儿园上学红包	2020-08-01 12:28:17.322998+08	4
210	1200	0	丈母娘	生日红包	2020-08-01 12:28:45.912205+08	4
211	500	0	大大伯伯	幼儿园开学红包	2020-08-05 20:42:52.718041+08	4
212	600	0	奶奶	幼儿园开学红包	2020-08-10 13:19:35.384896+08	4
213	800	0	丈母娘	幼儿园红包	2020-08-30 19:37:36.859846+08	4
214	500	0	江陆嬷嬷	嘟嘟住院	2020-09-28 11:50:51.192511+08	4
215	500	0	丈母娘	嘟嘟住院	2020-09-30 08:36:44.307634+08	4
216	600	0	阿姨	嘟嘟住院	2020-09-30 08:36:55.844737+08	4
217	600	0	家昇	嘟嘟住院	2020-09-30 08:38:58.696076+08	4
218	2000	0	五姐姐	新年红包	2021-02-10 16:51:04.867959+08	4
219	2600	0	爸爸	新年红包	2021-02-10 23:20:49.669329+08	4
220	2600	0	妈妈	新年红包	2021-02-10 23:21:01.679981+08	4
221	500	0	建华哥哥	新年红包	2021-02-10 23:21:16.680461+08	4
222	1000	0	江陆嬷嬷	新年红包	2021-02-12 10:42:38.067657+08	4
223	500	0	大妈妈	新年红包	2021-02-12 10:42:53.114166+08	4
224	300	0	二妈妈	新年红包	2021-02-12 10:43:09.78229+08	4
225	660	0	外婆	新年红包	2021-02-12 20:27:01.4036+08	4
226	800	0	舅舅	新年红包	2021-02-12 20:27:18.858176+08	4
227	500	0	宁波嬷嬷	新年红包	2021-02-13 21:33:48.329813+08	4
228	600	0	大姐姐	新年红包	2021-02-13 21:34:10.150401+08	4
229	600	0	小雨	新年红包	2021-02-13 21:34:40.737965+08	4
230	600	0	二姐姐	新年红包	2021-02-13 21:34:52.943679+08	4
231	600	0	小波	新年红包	2021-02-13 21:35:17.485531+08	4
232	600	0	四姐姐	新年红包	2021-02-13 21:35:28.685946+08	4
233	1200	0	红霞	新年红包	2021-02-13 21:35:49.359314+08	4
234	1600	0	丈母娘	新年红包	2021-02-13 21:38:16.576565+08	4
235	300	0	奶奶	新年红包	2021-02-14 15:39:04.555604+08	4
236	1000	0	建辉哥	新年红包	2021-02-16 19:39:05.881183+08	4
237	800	0	阿姨	新年红包	2021-02-16 19:39:15.711826+08	4
238	600	0	家昇	新年红包	2021-02-16 19:39:44.421901+08	4
239	600	0	建辉	新年红包	2022-01-30 10:45:38.253299+08	4
240	500	0	建华	新年红包	2022-01-30 10:45:49.771215+08	4
241	800	0	爸爸木具厂嬷嬷	新年红包	2022-02-01 09:12:51.106304+08	4
242	2600	0	爷爷	新年红包	2022-02-01 20:36:11.060065+08	4
243	2600	0	奶奶	新年红包	2022-02-01 20:36:25.756154+08	4
244	1000	0	江陆嬷嬷	新年红包	2022-02-01 20:36:44.571318+08	4
245	500	0	大爸爸	500	2022-02-01 20:36:55.066708+08	4
246	500	0	二爸爸	新年红包	2022-02-01 20:37:16.321171+08	4
247	1000	0	舅舅	新年红包	2022-02-01 20:37:30.54036+08	4
248	800	0	外婆	新年红包	2022-02-01 20:37:40.004015+08	4
249	600	0	佳昇	新年红包	2022-02-01 20:38:17.794401+08	4
250	1600	0	丈母娘	新年红包	2022-02-04 22:35:09.370256+08	4
251	300	0	奶奶	新年红包	2022-02-04 22:35:22.373449+08	4
252	600	0	宁波嬷嬷	新年红包	2022-02-06 20:35:22.951247+08	4
253	500	0	阿姨	新年红包	2022-02-06 20:35:40.514572+08	4
255	300	0	六姐姐	新年红包	2022-02-15 18:51:58.364212+08	4
\.


--
-- Data for Name: iaer_setting; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.iaer_setting (id, home_show_current, home_show_this_month, home_show_this_year, created, modified, user_id, monthly_fund, yearly_fund) FROM stdin;
2	t	t	t	2018-12-21	2022-05-10	2	5000	80000
8	f	f	f	2020-10-15	2020-10-16	11	0	0
1	t	t	t	2018-12-20	2022-04-28	1	4000	60000
\.


--
-- Data for Name: iaer_test; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.iaer_test (id, test) FROM stdin;
\.


--
-- Data for Name: iaer_user; Type: TABLE DATA; Schema: public; Owner: ben
--

COPY public.iaer_user (id, is_master_user, phone, gender, profile, user_type, region, locale, whats_up, zone, birthday, hobbies, highlighted, created, modified, is_email_activate, is_phone_activate, auth_user_id, fund_id) FROM stdin;
1	t	\N	2	\N	0	\N	\N	\N	\N	\N			\N	2018-11-14 14:24:03.170677+08	f	f	1	1
2	f	\N	2	\N	0	\N	\N	\N	\N	\N			\N	2018-11-21 16:23:40.702175+08	f	f	2	1
4	f	\N	2	\N	0	\N	\N	\N	\N	\N			\N	2018-11-21 16:23:55.212553+08	f	f	3	1
11	f	\N	2	\N	0	\N	\N	\N	\N	\N	\N	\N	2020-10-15 13:23:18.305193+08	2020-10-16 10:39:58.227614+08	f	f	21	\N
\.


--
-- Data for Name: iaer_user_slave_user; Type: TABLE DATA; Schema: public; Owner: ben
--

COPY public.iaer_user_slave_user (id, from_user_id, to_user_id) FROM stdin;
1	1	2
2	2	1
\.


--
-- Data for Name: iaer_verify; Type: TABLE DATA; Schema: public; Owner: ben
--

COPY public.iaer_verify (id, email_verify_code, phone_verify_code, created, user_id) FROM stdin;
1	785921	\N	2020-10-16 09:53:08.80884+08	1
2	841501	\N	2020-10-16 10:39:12.194672+08	11
\.


--
-- Data for Name: photo_gallery; Type: TABLE DATA; Schema: public; Owner: ben
--

COPY public.photo_gallery (id, title, date_format, description) FROM stdin;
\.


--
-- Data for Name: photo_photo; Type: TABLE DATA; Schema: public; Owner: ben
--

COPY public.photo_photo (id, exif_image_width, exif_image_height, exif_make, exif_model, exif_lens_make, exif_lens_model, exif_version, exif_subject_location, exif_datetime, exif_datetime_original, exif_datetime_digitized, name, labels, sub_dir, duration, sha1sum, category, version, description, pub_date, modify_date, user_id, size) FROM stdin;
\.


--
-- Data for Name: photo_photo_galleries; Type: TABLE DATA; Schema: public; Owner: ben
--

COPY public.photo_photo_galleries (id, photo_id, gallery_id) FROM stdin;
\.


--
-- Data for Name: photo_user; Type: TABLE DATA; Schema: public; Owner: ben
--

COPY public.photo_user (id, phone, gender, profile, user_type, region, locale, whats_up, zone, birthday, hobbies, highlighted, created, modified, is_email_activate, is_phone_activate, auth_user_id, date_format) FROM stdin;
\.


--
-- Data for Name: tools_commonexchange; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.tools_commonexchange (id, transaction_unit, f_buy_price, m_buy_price, f_sell_price, m_sell_price, bank_conversion_price, is_common, created, modified, from_currency_id, to_currency_id) FROM stdin;
1	100	697.740000000000009	692.059999999999945	700.690000000000055	700.690000000000055	700.690000000000055	t	2020-07-21 14:13:23.372785+08	2020-07-21 14:13:23.372951+08	2	1
2	100	77.7099999999999937	75.3100000000000023	78.7099999999999937	78.7099999999999937	78.3299999999999983	t	2020-07-21 14:13:23.397211+08	2020-07-21 14:13:23.397341+08	59	1
3	100	9.76999999999999957	9.16999999999999993	10.2200000000000006	10.2200000000000006	9.84999999999999964	t	2020-07-21 14:13:23.426526+08	2020-07-21 14:13:23.426732+08	48	1
4	100	458.019999999999982	443.889999999999986	467.579999999999984	467.579999999999984	461.240000000000009	t	2020-07-21 14:13:23.448203+08	2020-07-21 14:13:23.448341+08	74	1
5	100	0.581400000000000028	0.560899999999999954	0.60750000000000004	0.60750000000000004	0.585999999999999965	t	2020-07-21 14:13:23.465491+08	2020-07-21 14:13:23.465648+08	6	1
6	100	6.49049999999999994	6.28889999999999993	6.5484	6.5484	6.53829999999999956	t	2020-07-21 14:13:23.482902+08	2020-07-21 14:13:23.483034+08	3	1
7	100	90	89.2900000000000063	90.3599999999999994	90.3599999999999994	90.3599999999999994	t	2020-07-21 14:13:23.503825+08	2020-07-21 14:13:23.503947+08	7	1
8	100	883.970000000000027	856.5	894.419999999999959	894.419999999999959	890.480000000000018	t	2020-07-21 14:13:23.542293+08	2020-07-21 14:13:23.542529+08	5	1
9	100	797.509999999999991	772.730000000000018	805.970000000000027	805.970000000000027	803.389999999999986	t	2020-07-21 14:13:23.557579+08	2020-07-21 14:13:23.557687+08	4	1
10	100	741.850000000000023	718.960000000000036	750.269999999999982	750.269999999999982	747.07000000000005	t	2020-07-21 14:13:23.597895+08	2020-07-21 14:13:23.598007+08	60	1
11	100	515.809999999999945	499.529999999999973	521.909999999999968	521.909999999999968	519.620000000000005	t	2020-07-21 14:13:23.619489+08	2020-07-21 14:13:23.6196+08	9	1
12	100	490.589999999999975	475.339999999999975	496.379999999999995	496.379999999999995	494.189999999999998	t	2020-07-21 14:13:23.684041+08	2020-07-21 14:13:23.684287+08	8	1
\.


--
-- Data for Name: tools_currency; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.tools_currency (id, code, name, sequence, created, modified) FROM stdin;
1	CNY	人民币	1	2020-07-21 14:11:48.725184+08	2020-07-21 14:11:48.725325+08
2	USD	美元	2	2020-07-21 14:11:48.742122+08	2020-07-21 14:11:48.742291+08
3	JPY	日元	3	2020-07-21 14:11:48.759979+08	2020-07-21 14:11:48.760133+08
4	EUR	欧元	4	2020-07-21 14:11:48.810378+08	2020-07-21 14:11:48.810594+08
5	GBP	英镑	5	2020-07-21 14:11:48.83184+08	2020-07-21 14:11:48.832031+08
6	KRW	韩元	6	2020-07-21 14:11:48.846696+08	2020-07-21 14:11:48.846823+08
7	HKD	港币	7	2020-07-21 14:11:48.861382+08	2020-07-21 14:11:48.861555+08
8	AUD	澳大利亚元	8	2020-07-21 14:11:48.909649+08	2020-07-21 14:11:48.909849+08
9	CAD	加拿大元	9	2020-07-21 14:11:48.930617+08	2020-07-21 14:11:48.930767+08
10	DZD	阿尔及利亚第纳尔	10	2020-07-21 14:11:48.951497+08	2020-07-21 14:11:48.951627+08
11	ARS	阿根廷比索	11	2020-07-21 14:11:48.968084+08	2020-07-21 14:11:48.968227+08
12	IEP	爱尔兰镑	12	2020-07-21 14:11:49.01391+08	2020-07-21 14:11:49.014012+08
13	EGP	埃及镑	13	2020-07-21 14:11:49.033156+08	2020-07-21 14:11:49.033307+08
14	AED	阿联酋迪拉姆	14	2020-07-21 14:11:49.052568+08	2020-07-21 14:11:49.052667+08
15	OMR	阿曼里亚尔	15	2020-07-21 14:11:49.067717+08	2020-07-21 14:11:49.067838+08
16	ATS	奥地利先令	16	2020-07-21 14:11:49.084836+08	2020-07-21 14:11:49.08506+08
17	MOP	澳门元	17	2020-07-21 14:11:49.111844+08	2020-07-21 14:11:49.111991+08
18	BMD	百慕大元	18	2020-07-21 14:11:49.14111+08	2020-07-21 14:11:49.141254+08
19	PKR	巴基斯坦卢比	19	2020-07-21 14:11:49.195562+08	2020-07-21 14:11:49.195717+08
20	PYG	巴拉圭瓜拉尼	20	2020-07-21 14:11:49.214148+08	2020-07-21 14:11:49.214339+08
21	BHD	巴林第纳尔	21	2020-07-21 14:11:49.230551+08	2020-07-21 14:11:49.230697+08
22	PAB	巴拿马巴尔博亚	22	2020-07-21 14:11:49.25824+08	2020-07-21 14:11:49.25844+08
23	BGN	保加利亚列弗	23	2020-07-21 14:11:49.290877+08	2020-07-21 14:11:49.291048+08
24	BRL	巴西雷亚尔	24	2020-07-21 14:11:49.310265+08	2020-07-21 14:11:49.310411+08
25	BEF	比利时法郎	25	2020-07-21 14:11:49.340277+08	2020-07-21 14:11:49.340399+08
26	ISK	冰岛克朗	26	2020-07-21 14:11:49.358027+08	2020-07-21 14:11:49.358158+08
27	BWP	博茨瓦纳普拉	27	2020-07-21 14:11:49.386968+08	2020-07-21 14:11:49.387161+08
28	PLN	波兰兹罗提	28	2020-07-21 14:11:49.40625+08	2020-07-21 14:11:49.406365+08
29	BOB	玻利维亚诺	29	2020-07-21 14:11:49.503471+08	2020-07-21 14:11:49.503618+08
30	DKK	丹麦克朗	30	2020-07-21 14:11:49.527744+08	2020-07-21 14:11:49.527879+08
31	PHP	菲律宾比索	31	2020-07-21 14:11:49.549668+08	2020-07-21 14:11:49.549867+08
32	FIM	芬兰马克	32	2020-07-21 14:11:49.572819+08	2020-07-21 14:11:49.572985+08
33	COP	哥伦比亚比索	33	2020-07-21 14:11:49.601597+08	2020-07-21 14:11:49.60177+08
34	CUP	古巴比索	34	2020-07-21 14:11:49.617024+08	2020-07-21 14:11:49.617161+08
35	KZT	哈萨克坚戈	35	2020-07-21 14:11:49.631671+08	2020-07-21 14:11:49.631786+08
36	GHC	加纳塞地	36	2020-07-21 14:11:49.643418+08	2020-07-21 14:11:49.643535+08
37	CZK	捷克克朗	37	2020-07-21 14:11:49.68056+08	2020-07-21 14:11:49.680775+08
38	ZWD	津巴布韦元	38	2020-07-21 14:11:49.697149+08	2020-07-21 14:11:49.697286+08
39	QAR	卡塔尔里亚尔	39	2020-07-21 14:11:49.715535+08	2020-07-21 14:11:49.7157+08
40	HRK	克罗地亚库纳	40	2020-07-21 14:11:49.732709+08	2020-07-21 14:11:49.732882+08
41	KES	肯尼亚先令	41	2020-07-21 14:11:49.744896+08	2020-07-21 14:11:49.745058+08
42	KWD	科威特第纳尔	42	2020-07-21 14:11:49.760989+08	2020-07-21 14:11:49.761158+08
43	LAK	老挝基普	43	2020-07-21 14:11:49.777964+08	2020-07-21 14:11:49.778085+08
44	LVL	拉脱维亚拉图	44	2020-07-21 14:11:49.795764+08	2020-07-21 14:11:49.795922+08
45	LBP	黎巴嫩镑	45	2020-07-21 14:11:49.814543+08	2020-07-21 14:11:49.814672+08
46	MYR	林吉特	46	2020-07-21 14:11:49.827189+08	2020-07-21 14:11:49.827305+08
47	LTL	立陶宛立特	47	2020-07-21 14:11:49.846993+08	2020-07-21 14:11:49.847116+08
48	RUB	卢布	48	2020-07-21 14:11:49.861109+08	2020-07-21 14:11:49.86122+08
49	RON	罗马尼亚新列伊	49	2020-07-21 14:11:49.873684+08	2020-07-21 14:11:49.87382+08
50	MUR	毛里求斯卢比	50	2020-07-21 14:11:49.885729+08	2020-07-21 14:11:49.885853+08
51	MNT	蒙古图格里克	51	2020-07-21 14:11:49.897896+08	2020-07-21 14:11:49.897998+08
52	BDT	孟加拉塔卡	52	2020-07-21 14:11:49.910714+08	2020-07-21 14:11:49.910837+08
53	BUK	缅甸缅元	53	2020-07-21 14:11:49.924558+08	2020-07-21 14:11:49.924696+08
54	PEN	秘鲁新索尔	54	2020-07-21 14:11:49.939708+08	2020-07-21 14:11:49.939846+08
55	MAD	摩洛哥迪拉姆	55	2020-07-21 14:11:49.955195+08	2020-07-21 14:11:49.955326+08
56	MXN	墨西哥元	56	2020-07-21 14:11:49.975478+08	2020-07-21 14:11:49.975602+08
57	ZAR	南非兰特	57	2020-07-21 14:11:49.990042+08	2020-07-21 14:11:49.990144+08
58	NOK	挪威克朗	58	2020-07-21 14:11:50.00506+08	2020-07-21 14:11:50.005249+08
59	SEK	瑞典克朗	59	2020-07-21 14:11:50.019513+08	2020-07-21 14:11:50.019636+08
60	CHF	瑞士法郎	60	2020-07-21 14:11:50.035042+08	2020-07-21 14:11:50.03517+08
61	SAR	沙特里亚尔	61	2020-07-21 14:11:50.050198+08	2020-07-21 14:11:50.050301+08
62	LKR	斯里兰卡卢比	62	2020-07-21 14:11:50.071457+08	2020-07-21 14:11:50.071563+08
63	SOS	索马里先令	63	2020-07-21 14:11:50.084126+08	2020-07-21 14:11:50.084231+08
64	THB	泰国铢	64	2020-07-21 14:11:50.097505+08	2020-07-21 14:11:50.097612+08
65	TZS	坦桑尼亚先令	65	2020-07-21 14:11:50.12618+08	2020-07-21 14:11:50.126345+08
66	TRY	新土耳其里拉	66	2020-07-21 14:11:50.143006+08	2020-07-21 14:11:50.143152+08
67	TND	突尼斯第纳尔	67	2020-07-21 14:11:50.160007+08	2020-07-21 14:11:50.160136+08
68	GTQ	危地马拉格查尔	68	2020-07-21 14:11:50.176609+08	2020-07-21 14:11:50.17676+08
69	VEB	委内瑞拉玻利瓦尔	69	2020-07-21 14:11:50.190228+08	2020-07-21 14:11:50.19034+08
70	UYU	乌拉圭新比索	70	2020-07-21 14:11:50.202728+08	2020-07-21 14:11:50.202829+08
71	GRD	希腊德拉克马	71	2020-07-21 14:11:50.219459+08	2020-07-21 14:11:50.219593+08
72	SGD	新加坡元	72	2020-07-21 14:11:50.242682+08	2020-07-21 14:11:50.242859+08
73	TWD	新台币	73	2020-07-21 14:11:50.257474+08	2020-07-21 14:11:50.257612+08
74	NZD	新西兰元	74	2020-07-21 14:11:50.270853+08	2020-07-21 14:11:50.270944+08
75	HUF	匈牙利福林	75	2020-07-21 14:11:50.283051+08	2020-07-21 14:11:50.283143+08
76	JMD	牙买加元	76	2020-07-21 14:11:50.297067+08	2020-07-21 14:11:50.297182+08
77	INR	印度卢比	77	2020-07-21 14:11:50.309218+08	2020-07-21 14:11:50.30932+08
78	IDR	印尼盾	78	2020-07-21 14:11:50.324041+08	2020-07-21 14:11:50.324145+08
79	ILS	以色列谢克尔	79	2020-07-21 14:11:50.346808+08	2020-07-21 14:11:50.346918+08
80	JOD	约旦第纳尔	80	2020-07-21 14:11:50.36141+08	2020-07-21 14:11:50.361536+08
81	VND	越南盾	81	2020-07-21 14:11:50.373269+08	2020-07-21 14:11:50.373374+08
82	CLP	智利比索	82	2020-07-21 14:11:50.389431+08	2020-07-21 14:11:50.389538+08
83	BYR	白俄罗斯卢布	83	2020-07-21 14:11:50.408433+08	2020-07-21 14:11:50.408576+08
\.


--
-- Data for Name: tools_exchangerate; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.tools_exchangerate (id, exchange, result, update_time, created, modified, from_currency_id, to_currency_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ben
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ben
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ben
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 66, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ben
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ben
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 21, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ben
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 48, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ben
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 3477, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ben
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 22, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ben
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 40, true);


--
-- Name: iaer_about_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.iaer_about_id_seq', 8, true);


--
-- Name: iaer_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ben
--

SELECT pg_catalog.setval('public.iaer_category_id_seq', 25, true);


--
-- Name: iaer_fund_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ben
--

SELECT pg_catalog.setval('public.iaer_fund_id_seq', 4, true);


--
-- Name: iaer_iaer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ben
--

SELECT pg_catalog.setval('public.iaer_iaer_id_seq', 4725, true);


--
-- Name: iaer_redenvelope_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ben
--

SELECT pg_catalog.setval('public.iaer_redenvelope_id_seq', 255, true);


--
-- Name: iaer_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.iaer_setting_id_seq', 8, true);


--
-- Name: iaer_test_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.iaer_test_id_seq', 1, false);


--
-- Name: iaer_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ben
--

SELECT pg_catalog.setval('public.iaer_user_id_seq', 11, true);


--
-- Name: iaer_user_slave_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ben
--

SELECT pg_catalog.setval('public.iaer_user_slave_user_id_seq', 2, true);


--
-- Name: iaer_verify_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ben
--

SELECT pg_catalog.setval('public.iaer_verify_id_seq', 2, true);


--
-- Name: photo_gallery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ben
--

SELECT pg_catalog.setval('public.photo_gallery_id_seq', 1, false);


--
-- Name: photo_photo_galleries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ben
--

SELECT pg_catalog.setval('public.photo_photo_galleries_id_seq', 1, false);


--
-- Name: photo_photo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ben
--

SELECT pg_catalog.setval('public.photo_photo_id_seq', 1, false);


--
-- Name: photo_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ben
--

SELECT pg_catalog.setval('public.photo_user_id_seq', 1, false);


--
-- Name: tools_commonexchange_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.tools_commonexchange_id_seq', 12, true);


--
-- Name: tools_currency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.tools_currency_id_seq', 83, true);


--
-- Name: tools_exchangerate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.tools_exchangerate_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: iaer_about iaer_about_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.iaer_about
    ADD CONSTRAINT iaer_about_pkey PRIMARY KEY (id);


--
-- Name: iaer_category iaer_category_pkey; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.iaer_category
    ADD CONSTRAINT iaer_category_pkey PRIMARY KEY (id);


--
-- Name: iaer_fund iaer_fund_pkey; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.iaer_fund
    ADD CONSTRAINT iaer_fund_pkey PRIMARY KEY (id);


--
-- Name: iaer_iaer iaer_iaer_pkey; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.iaer_iaer
    ADD CONSTRAINT iaer_iaer_pkey PRIMARY KEY (id);


--
-- Name: iaer_redenvelope iaer_redenvelope_pkey; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.iaer_redenvelope
    ADD CONSTRAINT iaer_redenvelope_pkey PRIMARY KEY (id);


--
-- Name: iaer_setting iaer_setting_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.iaer_setting
    ADD CONSTRAINT iaer_setting_pkey PRIMARY KEY (id);


--
-- Name: iaer_test iaer_test_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.iaer_test
    ADD CONSTRAINT iaer_test_pkey PRIMARY KEY (id);


--
-- Name: iaer_user iaer_user_auth_user_id_key; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.iaer_user
    ADD CONSTRAINT iaer_user_auth_user_id_key UNIQUE (auth_user_id);


--
-- Name: iaer_user iaer_user_pkey; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.iaer_user
    ADD CONSTRAINT iaer_user_pkey PRIMARY KEY (id);


--
-- Name: iaer_user_slave_user iaer_user_slave_user_from_user_id_to_user_id_95cb6a3f_uniq; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.iaer_user_slave_user
    ADD CONSTRAINT iaer_user_slave_user_from_user_id_to_user_id_95cb6a3f_uniq UNIQUE (from_user_id, to_user_id);


--
-- Name: iaer_user_slave_user iaer_user_slave_user_pkey; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.iaer_user_slave_user
    ADD CONSTRAINT iaer_user_slave_user_pkey PRIMARY KEY (id);


--
-- Name: iaer_verify iaer_verify_pkey; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.iaer_verify
    ADD CONSTRAINT iaer_verify_pkey PRIMARY KEY (id);


--
-- Name: photo_gallery photo_gallery_pkey; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.photo_gallery
    ADD CONSTRAINT photo_gallery_pkey PRIMARY KEY (id);


--
-- Name: photo_gallery photo_gallery_title_key; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.photo_gallery
    ADD CONSTRAINT photo_gallery_title_key UNIQUE (title);


--
-- Name: photo_photo_galleries photo_photo_galleries_photo_id_gallery_id_cc4ff3c9_uniq; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.photo_photo_galleries
    ADD CONSTRAINT photo_photo_galleries_photo_id_gallery_id_cc4ff3c9_uniq UNIQUE (photo_id, gallery_id);


--
-- Name: photo_photo_galleries photo_photo_galleries_pkey; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.photo_photo_galleries
    ADD CONSTRAINT photo_photo_galleries_pkey PRIMARY KEY (id);


--
-- Name: photo_photo photo_photo_pkey; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.photo_photo
    ADD CONSTRAINT photo_photo_pkey PRIMARY KEY (id);


--
-- Name: photo_user photo_user_auth_user_id_key; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.photo_user
    ADD CONSTRAINT photo_user_auth_user_id_key UNIQUE (auth_user_id);


--
-- Name: photo_user photo_user_pkey; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.photo_user
    ADD CONSTRAINT photo_user_pkey PRIMARY KEY (id);


--
-- Name: tools_commonexchange tools_commonexchange_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.tools_commonexchange
    ADD CONSTRAINT tools_commonexchange_pkey PRIMARY KEY (id);


--
-- Name: tools_currency tools_currency_code_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.tools_currency
    ADD CONSTRAINT tools_currency_code_key UNIQUE (code);


--
-- Name: tools_currency tools_currency_name_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.tools_currency
    ADD CONSTRAINT tools_currency_name_key UNIQUE (name);


--
-- Name: tools_currency tools_currency_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.tools_currency
    ADD CONSTRAINT tools_currency_pkey PRIMARY KEY (id);


--
-- Name: tools_exchangerate tools_exchangerate_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.tools_exchangerate
    ADD CONSTRAINT tools_exchangerate_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: ben
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: ben
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: ben
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: ben
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: ben
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: ben
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: ben
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: ben
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: ben
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: ben
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: ben
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: ben
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: ben
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: ben
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: iaer_iaer_user_id_34b16ab7; Type: INDEX; Schema: public; Owner: ben
--

CREATE INDEX iaer_iaer_user_id_34b16ab7 ON public.iaer_iaer USING btree (user_id);


--
-- Name: iaer_redenvelope_user_id_b82cd003; Type: INDEX; Schema: public; Owner: ben
--

CREATE INDEX iaer_redenvelope_user_id_b82cd003 ON public.iaer_redenvelope USING btree (user_id);


--
-- Name: iaer_setting_user_id_834c05b8; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX iaer_setting_user_id_834c05b8 ON public.iaer_setting USING btree (user_id);


--
-- Name: iaer_user_fund_id_01436f37; Type: INDEX; Schema: public; Owner: ben
--

CREATE INDEX iaer_user_fund_id_01436f37 ON public.iaer_user USING btree (fund_id);


--
-- Name: iaer_user_slave_user_from_user_id_3c8b4f58; Type: INDEX; Schema: public; Owner: ben
--

CREATE INDEX iaer_user_slave_user_from_user_id_3c8b4f58 ON public.iaer_user_slave_user USING btree (from_user_id);


--
-- Name: iaer_user_slave_user_to_user_id_2d7de6ec; Type: INDEX; Schema: public; Owner: ben
--

CREATE INDEX iaer_user_slave_user_to_user_id_2d7de6ec ON public.iaer_user_slave_user USING btree (to_user_id);


--
-- Name: iaer_verify_user_id_32584bb1; Type: INDEX; Schema: public; Owner: ben
--

CREATE INDEX iaer_verify_user_id_32584bb1 ON public.iaer_verify USING btree (user_id);


--
-- Name: photo_gallery_title_465b621f_like; Type: INDEX; Schema: public; Owner: ben
--

CREATE INDEX photo_gallery_title_465b621f_like ON public.photo_gallery USING btree (title varchar_pattern_ops);


--
-- Name: photo_photo_galleries_gallery_id_f4d7d2ac; Type: INDEX; Schema: public; Owner: ben
--

CREATE INDEX photo_photo_galleries_gallery_id_f4d7d2ac ON public.photo_photo_galleries USING btree (gallery_id);


--
-- Name: photo_photo_galleries_photo_id_9007e15a; Type: INDEX; Schema: public; Owner: ben
--

CREATE INDEX photo_photo_galleries_photo_id_9007e15a ON public.photo_photo_galleries USING btree (photo_id);


--
-- Name: photo_photo_user_id_b6d9e71a; Type: INDEX; Schema: public; Owner: ben
--

CREATE INDEX photo_photo_user_id_b6d9e71a ON public.photo_photo USING btree (user_id);


--
-- Name: tools_commonexchange_from_currency_id_90bfde09; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX tools_commonexchange_from_currency_id_90bfde09 ON public.tools_commonexchange USING btree (from_currency_id);


--
-- Name: tools_commonexchange_to_currency_id_6289bbe4; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX tools_commonexchange_to_currency_id_6289bbe4 ON public.tools_commonexchange USING btree (to_currency_id);


--
-- Name: tools_currency_code_2699f5c2_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX tools_currency_code_2699f5c2_like ON public.tools_currency USING btree (code varchar_pattern_ops);


--
-- Name: tools_currency_name_0704a7b5_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX tools_currency_name_0704a7b5_like ON public.tools_currency USING btree (name varchar_pattern_ops);


--
-- Name: tools_exchangerate_from_currency_id_42edab89; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX tools_exchangerate_from_currency_id_42edab89 ON public.tools_exchangerate USING btree (from_currency_id);


--
-- Name: tools_exchangerate_to_currency_id_3788fa25; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX tools_exchangerate_to_currency_id_3788fa25 ON public.tools_exchangerate USING btree (to_currency_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: iaer_iaer iaer_iaer_user_id_34b16ab7_fk_iaer_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.iaer_iaer
    ADD CONSTRAINT iaer_iaer_user_id_34b16ab7_fk_iaer_user_id FOREIGN KEY (user_id) REFERENCES public.iaer_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: iaer_redenvelope iaer_redenvelope_user_id_b82cd003_fk_iaer_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.iaer_redenvelope
    ADD CONSTRAINT iaer_redenvelope_user_id_b82cd003_fk_iaer_user_id FOREIGN KEY (user_id) REFERENCES public.iaer_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: iaer_setting iaer_setting_user_id_834c05b8_fk_iaer_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.iaer_setting
    ADD CONSTRAINT iaer_setting_user_id_834c05b8_fk_iaer_user_id FOREIGN KEY (user_id) REFERENCES public.iaer_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: iaer_user iaer_user_auth_user_id_6f2857f7_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.iaer_user
    ADD CONSTRAINT iaer_user_auth_user_id_6f2857f7_fk_auth_user_id FOREIGN KEY (auth_user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: iaer_user iaer_user_fund_id_01436f37_fk_iaer_fund_id; Type: FK CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.iaer_user
    ADD CONSTRAINT iaer_user_fund_id_01436f37_fk_iaer_fund_id FOREIGN KEY (fund_id) REFERENCES public.iaer_fund(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: iaer_user_slave_user iaer_user_slave_user_from_user_id_3c8b4f58_fk_iaer_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.iaer_user_slave_user
    ADD CONSTRAINT iaer_user_slave_user_from_user_id_3c8b4f58_fk_iaer_user_id FOREIGN KEY (from_user_id) REFERENCES public.iaer_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: iaer_user_slave_user iaer_user_slave_user_to_user_id_2d7de6ec_fk_iaer_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.iaer_user_slave_user
    ADD CONSTRAINT iaer_user_slave_user_to_user_id_2d7de6ec_fk_iaer_user_id FOREIGN KEY (to_user_id) REFERENCES public.iaer_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: iaer_verify iaer_verify_user_id_32584bb1_fk_iaer_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.iaer_verify
    ADD CONSTRAINT iaer_verify_user_id_32584bb1_fk_iaer_user_id FOREIGN KEY (user_id) REFERENCES public.iaer_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: photo_photo_galleries photo_photo_galleries_gallery_id_f4d7d2ac_fk_photo_gallery_id; Type: FK CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.photo_photo_galleries
    ADD CONSTRAINT photo_photo_galleries_gallery_id_f4d7d2ac_fk_photo_gallery_id FOREIGN KEY (gallery_id) REFERENCES public.photo_gallery(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: photo_photo_galleries photo_photo_galleries_photo_id_9007e15a_fk_photo_photo_id; Type: FK CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.photo_photo_galleries
    ADD CONSTRAINT photo_photo_galleries_photo_id_9007e15a_fk_photo_photo_id FOREIGN KEY (photo_id) REFERENCES public.photo_photo(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: photo_photo photo_photo_user_id_b6d9e71a_fk_photo_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.photo_photo
    ADD CONSTRAINT photo_photo_user_id_b6d9e71a_fk_photo_user_id FOREIGN KEY (user_id) REFERENCES public.photo_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: photo_user photo_user_auth_user_id_37b66bb2_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY public.photo_user
    ADD CONSTRAINT photo_user_auth_user_id_37b66bb2_fk_auth_user_id FOREIGN KEY (auth_user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tools_commonexchange tools_commonexchange_from_currency_id_90bfde09_fk_tools_cur; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.tools_commonexchange
    ADD CONSTRAINT tools_commonexchange_from_currency_id_90bfde09_fk_tools_cur FOREIGN KEY (from_currency_id) REFERENCES public.tools_currency(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tools_commonexchange tools_commonexchange_to_currency_id_6289bbe4_fk_tools_cur; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.tools_commonexchange
    ADD CONSTRAINT tools_commonexchange_to_currency_id_6289bbe4_fk_tools_cur FOREIGN KEY (to_currency_id) REFERENCES public.tools_currency(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tools_exchangerate tools_exchangerate_from_currency_id_42edab89_fk_tools_cur; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.tools_exchangerate
    ADD CONSTRAINT tools_exchangerate_from_currency_id_42edab89_fk_tools_cur FOREIGN KEY (from_currency_id) REFERENCES public.tools_currency(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tools_exchangerate tools_exchangerate_to_currency_id_3788fa25_fk_tools_currency_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.tools_exchangerate
    ADD CONSTRAINT tools_exchangerate_to_currency_id_3788fa25_fk_tools_currency_id FOREIGN KEY (to_currency_id) REFERENCES public.tools_currency(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

