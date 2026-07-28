## 1.1.0

- Added optional rotating diagnostic file logs in the Home Assistant shared folder.
- Added MQTT connection, subscription, and command execution diagnostics.
- Redacted sensitive values from diagnostic log files.
- States subscription and synchronization after MQTT reconnect
- Added support for a configured MQTT TLS CA certificate and an optional certificate validation bypass.
- Fixed issue with incorrect devices availability reporting

## 1.0.6

- Fixed state subscription issues and component mappings
- Update dependencies

## 1.0.5

- Support for the "WindSpeed" state in sensors (WSZF-BiDi)

## 1.0.4

- Added DOCS.md with integration manual
- Added quick start quide to repository README 

## 1.0.3

- Added an option to set the logging level of the add-on (default set to warn)