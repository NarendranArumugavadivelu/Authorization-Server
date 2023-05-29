package com.apress.auth.server.config;

import com.apress.auth.server.config.keys.KeyManager;
import com.nimbusds.jose.jwk.JWKSet;
import com.nimbusds.jose.jwk.source.JWKSource;
import com.nimbusds.jose.proc.SecurityContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.OAuth2AuthorizationServerConfiguration;
import org.springframework.security.oauth2.server.authorization.client.JdbcRegisteredClientRepository;
import org.springframework.security.oauth2.server.authorization.client.RegisteredClientRepository;
import org.springframework.security.oauth2.server.authorization.config.ProviderSettings;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class AuthServerConfig {

    @Autowired
    public KeyManager keyManager;

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Bean(name = "securityFilterChainAs")
    @Order(Ordered.HIGHEST_PRECEDENCE)
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        OAuth2AuthorizationServerConfiguration.applyDefaultSecurity(http);
        return http.formLogin().and().build();
    }

    /*@Bean
    public RegisteredClientRepository registeredClientRepositoryWithAuthCodeInMemory() {
        RegisteredClient registeredClient = RegisteredClient.withId(UUID.randomUUID().toString())
                .clientId("client")
                .clientSecret("$2a$12$lYcMhVLqs8qVuuJkzLXwf.9Sns7NrDxJXB83.W0RWC6jy8Sq.tNU2")
                .authorizationGrantType(AuthorizationGrantType.AUTHORIZATION_CODE)
                .clientAuthenticationMethod(ClientAuthenticationMethod.CLIENT_SECRET_BASIC)
                .scope(OidcScopes.OPENID)
                .redirectUri("http://www.google.com")
                .build();
        return new InMemoryRegisteredClientRepository(registeredClient);
    }*/

    @Bean
    public RegisteredClientRepository registeredClientRepositoryWithAuthCodeJDBC() {
        return new JdbcRegisteredClientRepository(jdbcTemplate);
    }

    /*@Bean
    public RegisteredClientRepository registeredClientRepositoryWithClientCredentialsInMemory() {
        RegisteredClient registeredClient = RegisteredClient.withId(UUID.randomUUID().toString())
                .clientId("client")
                .clientSecret("$2a$12$lYcMhVLqs8qVuuJkzLXwf.9Sns7NrDxJXB83.W0RWC6jy8Sq.tNU2")
                .authorizationGrantType(AuthorizationGrantType.CLIENT_CREDENTIALS)
                .clientAuthenticationMethod(ClientAuthenticationMethod.CLIENT_SECRET_POST)
                .build();
        return new InMemoryRegisteredClientRepository(registeredClient);
    }*/

    @Bean
    public ProviderSettings providerSettings() {
        return ProviderSettings.builder().build();
    }

    @Bean
    public JWKSource<SecurityContext> jwkSource() {
        JWKSet jwkSet = new JWKSet(keyManager.rsaKey());
        return (j, sc) -> j.select(jwkSet);
    }
}
