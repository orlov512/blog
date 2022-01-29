-- SQL Manager Lite for PostgreSQL 6.3.1.54838
-- ---------------------------------------
-- Хост         : localhost
-- База данных  : blog
-- Версия       : PostgreSQL 14.1, compiled by Visual C++ build 1914, 64-bit



SET check_function_bodies = false;
--
-- Structure for table category (OID = 16396) : 
--
SET search_path = public, pg_catalog;
CREATE TABLE public.category (
    id integer NOT NULL,
    name varchar(20) NOT NULL,
    url varchar(20) NOT NULL,
    articles integer DEFAULT 0 NOT NULL
)
WITH (oids = false);
ALTER TABLE ONLY public.category ALTER COLUMN id SET STATISTICS 0;
ALTER TABLE ONLY public.category ALTER COLUMN name SET STATISTICS 0;
ALTER TABLE ONLY public.category ALTER COLUMN url SET STATISTICS 0;
ALTER TABLE ONLY public.category ALTER COLUMN articles SET STATISTICS 0;
--
-- Structure for table article (OID = 16404) : 
--
CREATE TABLE public.article (
    id bigint NOT NULL,
    title varchar(255) NOT NULL,
    url varchar(255) NOT NULL,
    logo varchar(255) NOT NULL,
    "desc" varchar(255) NOT NULL,
    content text NOT NULL,
    id_category integer NOT NULL,
    created timestamp(0) without time zone DEFAULT now() NOT NULL,
    views bigint DEFAULT 0 NOT NULL,
    comments integer DEFAULT 0 NOT NULL
)
WITH (oids = false);
ALTER TABLE ONLY public.article ALTER COLUMN id SET STATISTICS 0;
ALTER TABLE ONLY public.article ALTER COLUMN title SET STATISTICS 0;
ALTER TABLE ONLY public.article ALTER COLUMN url SET STATISTICS 0;
ALTER TABLE ONLY public.article ALTER COLUMN logo SET STATISTICS 0;
ALTER TABLE ONLY public.article ALTER COLUMN "desc" SET STATISTICS 0;
ALTER TABLE ONLY public.article ALTER COLUMN content SET STATISTICS 0;
ALTER TABLE ONLY public.article ALTER COLUMN id_category SET STATISTICS 0;
ALTER TABLE ONLY public.article ALTER COLUMN created SET STATISTICS 0;
ALTER TABLE ONLY public.article ALTER COLUMN views SET STATISTICS 0;
--
-- Structure for table account (OID = 16414) : 
--
CREATE TABLE public.account (
    id bigint NOT NULL,
    email varchar(100) NOT NULL,
    name varchar(30) NOT NULL,
    avatar varchar(255),
    created timestamp(0) without time zone DEFAULT now() NOT NULL
)
WITH (oids = false);
ALTER TABLE ONLY public.account ALTER COLUMN email SET STATISTICS 0;
--
-- Structure for table comment (OID = 16422) : 
--
CREATE TABLE public.comment (
    id bigint NOT NULL,
    id_account bigint NOT NULL,
    id_article bigint NOT NULL,
    content text NOT NULL,
    created timestamp(0) without time zone DEFAULT now() NOT NULL
)
WITH (oids = false);
ALTER TABLE ONLY public.comment ALTER COLUMN id SET STATISTICS 0;
--
-- Definition for sequence account_sec (OID = 16430) : 
--
CREATE SEQUENCE public.account_sec
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Definition for sequence comment_sec (OID = 16431) : 
--
CREATE SEQUENCE public.comment_sec
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Definition for index comment_idx (OID = 16447) : 
--
CREATE INDEX comment_idx ON public.comment USING btree (id_article);
--
-- Definition for index article_idx (OID = 16448) : 
--
CREATE INDEX article_idx ON public.article USING btree (id_category);
--
-- Definition for index comment_idx1 (OID = 16449) : 
--
CREATE INDEX comment_idx1 ON public.comment USING btree (id_account);
--
-- Definition for index category_pkey (OID = 16400) : 
--
ALTER TABLE ONLY category
    ADD CONSTRAINT category_pkey
    PRIMARY KEY (id);
--
-- Definition for index category_url_key (OID = 16402) : 
--
ALTER TABLE ONLY category
    ADD CONSTRAINT category_url_key
    UNIQUE (url);
--
-- Definition for index article_pkey (OID = 16412) : 
--
ALTER TABLE ONLY article
    ADD CONSTRAINT article_pkey
    PRIMARY KEY (id);
--
-- Definition for index account_pkey (OID = 16418) : 
--
ALTER TABLE ONLY account
    ADD CONSTRAINT account_pkey
    PRIMARY KEY (id);
--
-- Definition for index account_email_key (OID = 16420) : 
--
ALTER TABLE ONLY account
    ADD CONSTRAINT account_email_key
    UNIQUE (email);
--
-- Definition for index comment_pkey (OID = 16428) : 
--
ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_pkey
    PRIMARY KEY (id);
--
-- Definition for index article_fk (OID = 16432) : 
--
ALTER TABLE ONLY article
    ADD CONSTRAINT article_fk
    FOREIGN KEY (id_category) REFERENCES category(id) ON UPDATE CASCADE ON DELETE RESTRICT;
--
-- Definition for index comment_fk (OID = 16437) : 
--
ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_fk
    FOREIGN KEY (id_account) REFERENCES account(id) ON UPDATE CASCADE ON DELETE RESTRICT;
--
-- Definition for index comment_fk1 (OID = 16442) : 
--
ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_fk1
    FOREIGN KEY (id_article) REFERENCES article(id) ON UPDATE CASCADE ON DELETE RESTRICT;
--
-- Data for sequence public.account_sec (OID = 16430)
--
SELECT pg_catalog.setval('account_sec', 1, false);
--
-- Data for sequence public.comment_sec (OID = 16431)
--
SELECT pg_catalog.setval('comment_sec', 1, false);
--
-- Comments
--
COMMENT ON SCHEMA public IS 'standard public schema';
