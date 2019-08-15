Dockerfile to update Route53 DNS record with networks public IP. Useful to be
able to route a domain to one's home router.

Usage:
    docker run --rm --name route53 \
        -e AWS_ACCESS_KEY_ID="Your key id" \
        -e AWS_SECRET_ACCESS_KEY="Your secret key" \
        -e AWS_ROUTE53_ZONEID="Your zone's id" \
        -e DOMAIN="*.your.domain.com" \
        route53-update

    Optionally, specify the `DELAY` environment variable to change how often the
    script runs
