/* Il s'agit des procédures et services proposés durant le cours théoriques et les TP pour utiliser Sybase en temps que serveur web. */
/* Ces scripts sont un choix d'implémentation d'une structure spécifique, utilisable avec Sybase. */

/* Ces scripts ont été écrit par Mr Christian Lambeau. */

--------------- Procédures / fonctions de base -------------------------------------------------------------------

CREATE FUNCTION "DBA"."getPath"()
// renvoie le chemin (path) de la racine du site (où est située la base de données)
returns long varchar
deterministic
BEGIN
 declare dbPath long varchar; // chemin de la db
 declare dbName long varchar; // nom de la db
 --
 set dbPath = (select db_property ('file'));        -- path + nom de la db
 set dbName = (select db_property('name')) + '.db'; -- nom de la db
 set dbPath = left(dbPath, length(dbPath)-length(dbName)); -- path seul
 --
 return dbPath; // renvoyer path
END;

--

-- drop procedure http_getPage;
CREATE PROCEDURE "DBA"."http_getPage"(in url char(255))
// renvoie le contenu de la page html dont le nom (SANS extension) est le paramètre url
BEGIN
--
    call sa_set_http_header('Content-Type', 'text/html; charset=utf-8'); // header http
    Call sa_set_http_header('Access-Control-Allow-Origin', '*'); // pas nécessaire si appels depuis le serveur - dangereux en production
	select xp_read_file(dba.getPath() || url || '.html'); // renvoyer page
-- 
END;
COMMENT ON PROCEDURE "DBA"."http_getPage" IS 'fournisseur de fichier .html (racine du site)';

--

CREATE PROCEDURE "DBA"."http_getJS"(in url char(255))
// renvoie le contenu du script js dont le nom (+ extension) est le paramètre url
BEGIN
-- 
  call sa_set_http_header('Content-Type', 'application/javascript'); // header http
    Call sa_set_http_header('Access-Control-Allow-Origin', '*'); // pas nécessaire si appels depuis le serveur - dangereux en production
	select xp_read_file(dba.getPath() || 'js\' || url);                // renvoyer fichier javascript
--
END;
COMMENT ON PROCEDURE "DBA"."http_getJS" IS 'fournisseur de fichier .js (sous répertoire JS du site)';

--

CREATE PROCEDURE "DBA"."http_getCSS"(in url char(255))
// renvoie le contenu de la feuille de style dont le nom (+ extension) est le paramètre url
BEGIN
-- 
  call sa_set_http_header('Content-Type', 'text/css'); // header http
    Call sa_set_http_header('Access-Control-Allow-Origin', '*'); // pas nécessaire si appels depuis le serveur - dangereux en production
	select xp_read_file(dba.getPath() || 'CSS\' || url); // renvoyer fichier css
--
END;
COMMENT ON PROCEDURE "DBA"."http_getCSS" IS 'fournisseur de fichier .css (sous-répertoire CSS du site)';

--

CREATE PROCEDURE "DBA"."http_getIMG"(in url char(255))
// renvoie le contenu de l image/graphique dont le nom (+ extension) est le paramètre url
BEGIN
--
  call sa_set_http_header('Content-Type', 'image/png'); // header http
    Call sa_set_http_header('Access-Control-Allow-Origin', '*'); // pas nécessaire si appels depuis le serveur - dangereux en production
	select xp_read_file(dba.getPath() || 'IMG\' || url);  // renvoyer image
--
END;
COMMENT ON PROCEDURE "DBA"."http_getIMG" IS 'fournisseur de fichier graphique (sous-répertoire IMG du site)';

--------------- webservices de base -------------------------------------------------------------------

CREATE SERVICE "page" TYPE 'RAW' AUTHORIZATION OFF USER "DBA" URL ON METHODS 'GET' AS call dba.http_getPage(:url);

CREATE SERVICE "js" TYPE 'RAW' AUTHORIZATION OFF USER "DBA" URL ON METHODS 'GET' AS call dba.http_getJS(:url);

CREATE SERVICE "css" TYPE 'RAW' AUTHORIZATION OFF USER "DBA" URL ON METHODS 'GET' AS call dba.http_getCSS(:url);
COMMENT ON SERVICE "css" IS 'service fournisseur de css';

CREATE SERVICE "img" TYPE 'RAW' AUTHORIZATION OFF USER "DBA" URL ON METHODS 'GET' AS call dba.http_getIMG(:url);
