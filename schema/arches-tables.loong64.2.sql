SET statement_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- Name: "loong64"; Type: SCHEMA; Schema: -; Owner: wbadm
--

DROP SCHEMA IF EXISTS "loong64";
CREATE SCHEMA "loong64";
ALTER SCHEMA "loong64" OWNER TO wbadm2;

GRANT "wb_loong64" TO wbadm2 WITH ADMIN OPTION;

GRANT UPDATE ON TABLE public.locks TO "wb_loong64";

--
-- Name: "loong64_public"; Type: SCHEMA; Schema: -; Owner: wbadm
--

DROP SCHEMA IF EXISTS "loong64_public";
CREATE SCHEMA "loong64_public";
ALTER SCHEMA "loong64_public" OWNER TO wbadm2;

--
-- Name: "loong64".packages; Type: VIEW; Schema: "loong64"; Owner: wbadm
--

DROP VIEW  IF EXISTS "loong64".packages;
CREATE VIEW "loong64".packages AS
    SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all FROM public.packages packages WHERE ((packages.architecture)::text = 'loong64'::text);
ALTER TABLE "loong64".packages OWNER TO wbadm2;

--
-- Name: "loong64".pkg_history; Type: VIEW; Schema: "loong64"; Owner: wbadm
--

DROP VIEW IF EXISTS "loong64".pkg_history;
CREATE VIEW "loong64".pkg_history AS
    SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space, pkg_history.builder FROM public.pkg_history WHERE ((pkg_history.architecture)::text = 'loong64'::text);
ALTER TABLE "loong64".pkg_history OWNER TO wbadm2;

--
-- Name: "loong64".transactions; Type: VIEW; Schema: "loong64"; Owner: wbadm
--

DROP VIEW IF EXISTS "loong64".transactions;
CREATE VIEW "loong64".transactions AS
    SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM public.transactions WHERE ((transactions.architecture)::text = 'loong64'::text);
ALTER TABLE "loong64".transactions OWNER TO wbadm2;

--
-- Name: "loong64".users; Type: VIEW; Schema: "loong64"; Owner: wbadm
--

DROP VIEW IF EXISTS "loong64".users;
CREATE VIEW "loong64".users AS
    SELECT users.username, users.distribution, users.last_seen FROM public.users WHERE ((users.architecture)::text = 'loong64'::text);
ALTER TABLE "loong64".users OWNER TO wbadm2;

--
-- Name: "loong64_public".packages; Type: VIEW; Schema: "loong64_public"; Owner: wbadm
--

DROP VIEW IF EXISTS "loong64_public".packages;
CREATE VIEW "loong64_public".packages AS
    SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all FROM (public.packages NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((packages.architecture)::text = 'loong64'::text));
ALTER TABLE "loong64_public".packages OWNER TO wbadm2;

--
-- Name: "loong64_public".pkg_history; Type: VIEW; Schema: "loong64_public"; Owner: wbadm
--

DROP VIEW IF EXISTS "loong64_public".pkg_history;
CREATE VIEW "loong64_public".pkg_history AS
    SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space, pkg_history.builder FROM (public.pkg_history NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((pkg_history.architecture)::text = 'loong64'::text));
ALTER TABLE "loong64_public".pkg_history OWNER TO wbadm2;

--
-- Name: "loong64_public".transactions; Type: VIEW; Schema: "loong64_public"; Owner: wbadm
--

DROP VIEW IF EXISTS "loong64_public".transactions;
CREATE VIEW "loong64_public".transactions AS
    SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM (public.transactions NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((transactions.architecture)::text = 'loong64'::text));
ALTER TABLE "loong64_public".transactions OWNER TO wbadm2;

--
-- Name: "loong64_public".users; Type: VIEW; Schema: "loong64_public"; Owner: wbadm
--

DROP VIEW IF EXISTS "loong64_public".users;
CREATE VIEW "loong64_public".users AS
    SELECT users.username, users.distribution, users.last_seen FROM (public.users NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((users.architecture)::text = 'loong64'::text));
ALTER TABLE "loong64_public".users OWNER TO wbadm2;

SET search_path = "loong64", pg_catalog;

--
-- Name: packages_delete; Type: RULE; Schema: "loong64"; Owner: wbadm
--

CREATE RULE packages_delete AS ON DELETE TO packages DO INSTEAD DELETE FROM public.packages p WHERE ((((p.architecture)::text = 'loong64'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text));

--
-- Name: packages_insert; Type: RULE; Schema: "loong64"; Owner: wbadm
--

CREATE RULE packages_insert AS ON INSERT TO packages DO INSTEAD INSERT INTO public.packages (architecture, package, distribution, version, state, section, priority, installed_version, previous_state, state_change, notes, builder, failed, old_failed, binary_nmu_version, binary_nmu_changelog, failed_category, permbuildpri, buildpri, depends, rel, bd_problem, extra_depends, extra_conflicts, build_arch_all) VALUES ('loong64'::character varying, new.package, new.distribution, new.version, new.state, new.section, new.priority, new.installed_version, new.previous_state, new.state_change, new.notes, new.builder, new.failed, new.old_failed, new.binary_nmu_version, new.binary_nmu_changelog, new.failed_category, new.permbuildpri, new.buildpri, new.depends, new.rel, new.bd_problem, new.extra_depends, new.extra_conflicts, new.build_arch_all);


--
-- Name: packages_update; Type: RULE; Schema: "loong64"; Owner: wbadm
--

CREATE RULE packages_update AS ON UPDATE TO packages DO INSTEAD UPDATE public.packages p SET version = new.version, state = new.state, section = new.section, priority = new.priority, installed_version = new.installed_version, previous_state = new.previous_state, state_change = new.state_change, notes = new.notes, builder = new.builder, failed = new.failed, old_failed = new.old_failed, binary_nmu_version = new.binary_nmu_version, binary_nmu_changelog = new.binary_nmu_changelog, failed_category = new.failed_category, permbuildpri = new.permbuildpri, buildpri = new.buildpri, depends = new.depends, rel = new.rel, bd_problem = new.bd_problem, extra_depends = new.extra_depends, extra_conflicts = new.extra_conflicts, build_arch_all = new.build_arch_all WHERE ((((p.architecture)::text = 'loong64'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text));


--
-- Name: pkg_history_delete; Type: RULE; Schema: "loong64"; Owner: wbadm
--

CREATE RULE pkg_history_delete AS ON DELETE TO pkg_history DO INSTEAD DELETE FROM public.pkg_history p WHERE ((((((p.architecture)::text = 'loong64'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));


--
-- Name: pkg_history_insert; Type: RULE; Schema: "loong64"; Owner: wbadm
--

CREATE RULE pkg_history_insert AS ON INSERT TO pkg_history DO INSTEAD INSERT INTO public.pkg_history (architecture, package, distribution, version, "timestamp", result, build_time, disk_space, builder) VALUES ('loong64'::character varying, new.package, new.distribution, new.version, new."timestamp", new.result, new.build_time, new.disk_space, new.builder);


--
-- Name: pkg_history_update; Type: RULE; Schema: "loong64"; Owner: wbadm
--

CREATE RULE pkg_history_update AS ON UPDATE TO pkg_history DO INSTEAD UPDATE public.pkg_history p SET result = new.result, build_time = new.build_time, disk_space = new.disk_space, builder = new.builder WHERE ((((((p.architecture)::text = 'loong64'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));


--
-- Name: transactions_insert; Type: RULE; Schema: "loong64"; Owner: wbadm
--

CREATE RULE transactions_insert AS ON INSERT TO transactions DO INSTEAD INSERT INTO public.transactions (architecture, package, distribution, version, action, prevstate, state, real_user, set_user, "time") VALUES ('loong64'::character varying, new.package, new.distribution, new.version, new.action, new.prevstate, new.state, new.real_user, new.set_user, new."time");


--
-- Name: users_delete; Type: RULE; Schema: "loong64"; Owner: wbadm
--

CREATE RULE users_delete AS ON DELETE TO users DO INSTEAD DELETE FROM public.users u WHERE ((((u.architecture)::text = 'loong64'::text) AND ((u.distribution)::text = (old.distribution)::text)) AND ((u.username)::text = (old.username)::text));


--
-- Name: users_insert; Type: RULE; Schema: "loong64"; Owner: wbadm
--

CREATE RULE users_insert AS ON INSERT TO users DO INSTEAD INSERT INTO public.users (architecture, username, distribution, last_seen) VALUES ('loong64'::character varying, new.username, new.distribution, new.last_seen);


--
-- Name: users_update; Type: RULE; Schema: "loong64"; Owner: wbadm
--

CREATE RULE users_update AS ON UPDATE TO users DO INSTEAD UPDATE public.users u SET last_seen = new.last_seen WHERE ((((u.architecture)::text = 'loong64'::text) AND ((u.distribution)::text = (old.distribution)::text)) AND ((u.username)::text = (old.username)::text));

SET search_path = public, pg_catalog;

--
-- Name: "loong64"; Type: ACL; Schema: -; Owner: wbadm
--

REVOKE ALL ON SCHEMA "loong64" FROM PUBLIC;
REVOKE ALL ON SCHEMA "loong64" FROM wbadm2;
GRANT ALL ON SCHEMA "loong64" TO wbadm2;


--
-- Name: "loong64_public"; Type: ACL; Schema: -; Owner: wbadm
--

REVOKE ALL ON SCHEMA "loong64_public" FROM PUBLIC;
REVOKE ALL ON SCHEMA "loong64_public" FROM wbadm;
GRANT ALL ON SCHEMA "loong64_public" TO wbadm;
GRANT USAGE ON SCHEMA "loong64_public" TO "wb_loong64";
GRANT USAGE ON SCHEMA "loong64_public" TO PUBLIC;


--
-- Name: "loong64".packages; Type: ACL; Schema: "loong64"; Owner: wbadm
--

REVOKE ALL ON TABLE "loong64".packages FROM PUBLIC;
REVOKE ALL ON TABLE "loong64".packages FROM wbadm;
GRANT ALL ON TABLE "loong64".packages TO wbadm;
GRANT SELECT ON TABLE "loong64".packages TO wb_security;
GRANT SELECT,INSERT,UPDATE ON TABLE "loong64".packages TO wb_all;


--
-- Name: "loong64".pkg_history; Type: ACL; Schema: "loong64"; Owner: wbadm
--

REVOKE ALL ON TABLE "loong64".pkg_history FROM PUBLIC;
REVOKE ALL ON TABLE "loong64".pkg_history FROM wbadm;
GRANT ALL ON TABLE "loong64".pkg_history TO wbadm;
GRANT SELECT ON TABLE "loong64".pkg_history TO wb_security;
GRANT SELECT,INSERT,UPDATE ON TABLE "loong64".pkg_history TO wb_all;


--
-- Name: "loong64".transactions; Type: ACL; Schema: "loong64"; Owner: wbadm
--

REVOKE ALL ON TABLE "loong64".transactions FROM PUBLIC;
REVOKE ALL ON TABLE "loong64".transactions FROM wbadm;
GRANT ALL ON TABLE "loong64".transactions TO wbadm;
GRANT SELECT ON TABLE "loong64".transactions TO wb_security;
GRANT SELECT,INSERT ON TABLE "loong64".transactions TO wb_all;


--
-- Name: "loong64".users; Type: ACL; Schema: "loong64"; Owner: wbadm
--

REVOKE ALL ON TABLE "loong64".users FROM PUBLIC;
REVOKE ALL ON TABLE "loong64".users FROM wbadm;
GRANT ALL ON TABLE "loong64".users TO wbadm;
GRANT SELECT ON TABLE "loong64".users TO wb_security;
GRANT SELECT,INSERT,UPDATE ON TABLE "loong64".users TO wb_all;


--
-- Name: "loong64_public".packages; Type: ACL; Schema: "loong64_public"; Owner: wbadm
--

REVOKE ALL ON TABLE "loong64_public".packages FROM PUBLIC;
REVOKE ALL ON TABLE "loong64_public".packages FROM wbadm;
GRANT ALL ON TABLE "loong64_public".packages TO wbadm;
GRANT SELECT ON TABLE "loong64_public".packages TO PUBLIC;


--
-- Name: "loong64_public".pkg_history; Type: ACL; Schema: "loong64_public"; Owner: wbadm
--

REVOKE ALL ON TABLE "loong64_public".pkg_history FROM PUBLIC;
REVOKE ALL ON TABLE "loong64_public".pkg_history FROM wbadm;
GRANT ALL ON TABLE "loong64_public".pkg_history TO wbadm;
GRANT SELECT ON TABLE "loong64_public".pkg_history TO PUBLIC;


--
-- Name: "loong64_public".transactions; Type: ACL; Schema: "loong64_public"; Owner: wbadm
--

REVOKE ALL ON TABLE "loong64_public".transactions FROM PUBLIC;
REVOKE ALL ON TABLE "loong64_public".transactions FROM wbadm;
GRANT ALL ON TABLE "loong64_public".transactions TO wbadm;
GRANT SELECT ON TABLE "loong64_public".transactions TO PUBLIC;


--
-- Name: "loong64_public".users; Type: ACL; Schema: "loong64_public"; Owner: wbadm
--

REVOKE ALL ON TABLE "loong64_public".users FROM PUBLIC;
REVOKE ALL ON TABLE "loong64_public".users FROM wbadm;
GRANT ALL ON TABLE "loong64_public".users TO wbadm;
GRANT SELECT ON TABLE "loong64_public".users TO PUBLIC;
