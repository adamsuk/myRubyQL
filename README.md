# myRubyQL

An initial repo to build out basic GraphQL functionality in Ruby on Rails!

I've been a big fan of Apollo for a while now so I've been following [this tutorial](https://www.apollographql.com/blog/community/backend/using-graphql-with-ruby-on-rails/) which adds Taylor Swift queries and mutations to a rails endpoint.

Following on from that I wanted to wrap GraphQL around some of my existing RESTful API endpoints. With the intention of securing them up a little more (even though they're all on free tiers) and expanding out to other APIs (e.g. Github, PSN, Spotify) to have a single GraphQL service for ME!

## Environment Variables

There are some conditional Queries and Mutations based on available environment variables. These are typically token based but some are URLs too to obfuscate accessible endpoints.

This service utilises `dotenv-rails` for dev and test so just pop the ones you want in `/.env` otherwise set them in your preferred hosting provider.

__`PODCAST_URL`__ - URL for the hosted instance of [this](https://github.com/adamsuk/podcast-express-api) RESTful RSS-based podcast collator

__`CURRENCY_API_KEY`__ - an API key for [Fixer](https://fixer.io/quickstart) currency converter

## TODO

- Link to my latest activities on Github using [their API](https://docs.github.com/en/rest/guides/getting-started-with-the-rest-api)
- Link up to recent plays using [Spotifys API](https://developer.spotify.com/documentation/web-api/)
- Trickier but having a link to gameplay on my PSN account would be cool. Might need to spin up a separate REST API using [this community driven npm package](https://github.com/achievements-app/psn-api) 😬
## Sandbox

I've never been much of a lover of GraphiQL interface, so I use the [Apollo sandbox](https://studio.apollographql.com/sandbox/explorer/?) whenever I need to do a little digging. Just add the localhost URL to the top and BAM it'll load it in.

## Notes

The docs and guides [here](https://graphql-ruby.org/guides) have been a constant stream of help
