--------------------------------USERS-------------------------------------------
insert into users (user_id, username, password, first_name, last_name, admin) values(1, 'mickey', '$2a$10$kSqU.ek5pDRMMK21tHJlceS1xOc9Kna4F0DD2ZwQH/LAzH0ML0p6.', 'Mickey', 'Mouse', false);
insert into users (user_id, username, password, first_name, last_name, admin) values(2, 'minnie', '$2a$10$MnHcLn.XdLx.iMntXsmdgeO1B4wAW1E5GOy/VrLUmr4aAzabXnGFq', 'Minnie', 'Mouse', false);
insert into users (user_id, username, password, first_name, last_name, admin) values(3, 'donald', '$2a$10$0UCBI04PCXiK0pF/9kI7.uAXiHNQeeHdkv9NhA1/xgmRpfd4qxRMG', 'Donald', 'Duck', false);
insert into users (user_id, username, password, first_name, last_name, admin) values(4, 'daisy', '$2a$10$aNoR88g5b5TzSKb7mQ1nQOkyEwfHVQOxHY0HX7irI8qWINvLDWRyS', 'Daisy', 'Duck', false);
insert into users (user_id, username, password, first_name, last_name, admin) values(5, 'clarabelle', '$2a$10$cuTJd2ayEwXfsPdoF5/hde6gzsPx/gEiv8LZsjPN9VPoN5XVR8cKW', 'Clarabelle', 'Cow', false);
insert into users (user_id, username, password, first_name, last_name, admin) values(6, 'admin', '$2a$10$JQOfG5Tqnf97SbGcKsalz.XpDQbXi1APOf2SHPVW27bWNioi9nI8y', 'Super', 'Admin', true);

-------------------------- CRETE OAUTH2 REGISTERED CLIENT------------------------------
CREATE TABLE oauth2_registered_client (id varchar(100) NOT NULL, client_id varchar(100) NOT NULL, client_id_issued_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL, client_secret varchar(200) DEFAULT NULL, client_secret_expires_at timestamp DEFAULT NULL, client_name varchar(200) NOT NULL, client_authentication_methods varchar(1000) NOT NULL, authorization_grant_types varchar(1000) NOT NULL, redirect_uris varchar(1000) DEFAULT NULL, scopes varchar(1000) NOT NULL, client_settings varchar(2000) NOT NULL, token_settings varchar(2000) NOT NULL, PRIMARY KEY (id));

--------------------------REGISTERED OAUTH CLIENTS--------------------------------------
INSERT INTO oauth2_registered_client (id, client_id, client_id_issued_at, client_secret, client_authentication_methods, authorization_grant_types, redirect_uris, scopes, client_name, client_settings, token_settings) values ('529382d1-94d1-4da2-ae6c-efbb35bee695', 'client', TIMESTAMP '2023-05-27 20:30:15', '$2a$12$lYcMhVLqs8qVuuJkzLXwf.9Sns7NrDxJXB83.W0RWC6jy8Sq.tNU2', 'client_secret_basic', 'authorization_code', 'http://www.google.com', 'openid', '529382d1-94d1-4da2-ae6c-efbb35bee695', '{"@class":"java.util.Collections$UnmodifiableMap","settings.client.require-proof-key":false,"settings.client.require-authorization-consent":false}', '{"@class":"java.util.Collections$UnmodifiableMap","settings.token.reuse-refresh-tokens":true,"settings.token.id-token-signature-algorithm":["org.springframework.security.oauth2.jose.jws.SignatureAlgorithm","RS256"],"settings.token.access-token-time-to-live":["java.time.Duration",300.000000000],"settings.token.access-token-format":{"@class":"org.springframework.security.oauth2.core.OAuth2TokenFormat","value":"self-contained"},"settings.token.refresh-token-time-to-live":["java.time.Duration",3600.000000000]}');








