#!/bin/bash
aws acm request-certificate \
--domain-name <your-domain-example-www.mydomain.com> \
--validation-method DNS \
--idempotency-token 1234 \
--options CertificateTransparencyLoggingPreference=DISABLED