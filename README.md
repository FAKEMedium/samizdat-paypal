# Samizdat-Plugin-PayPal

PayPal payments — an **operator** payment module for [Samizdat](https://fakenews.com).
Used by Samizdat-Plugin-Invoice (helper-guarded) to take payment on invoices.
Extracted from the monorepo with history.

## Layout

    lib/Samizdat/Plugin/PayPal.pm        routes + the `paypal` helper
    lib/Samizdat/Controller/PayPal.pm    request handlers (incl. webhook/callback)
    lib/Samizdat/Model/PayPal.pm         payment API client
    lib/Samizdat/resources/templates/paypal/    views
    lib/Samizdat/resources/settings/paypal/     JSON-Schema config (operator; writeOnly secrets)
    lib/Samizdat/resources/locale/paypal/       translations
    lib/Samizdat/resources/migrations/pg/   the `paypal` schema (fresh-snapshot migration)

## Dependencies

- **Samizdat** (core) — Cache, settings resolver, the migration loader. Not on CPAN; PERL5LIB or install.
- Mojolicious, Hash::Merge.

## Install

    perl Makefile.PL && make && make test    # core on PERL5LIB
    make install

Enable via `extraplugins: [PayPal]` and configure `manager.paypal` (API keys/secrets;
certs are deployment secrets, never shipped here).
