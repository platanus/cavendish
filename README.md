# Cavendish

[![Gem Version](https://badge.fury.io/rb/cavendish.svg)](https://badge.fury.io/rb/cavendish)
[![CircleCI](https://circleci.com/gh/platanus/cavendish.svg?style=shield)](https://app.circleci.com/pipelines/github/platanus/cavendish)

React Native + Expo project generator for Platanus

## Installation

```bash
$ gem install cavendish
```

Or add to your Gemfile:

```ruby
gem "cavendish"
```

```bash
bundle install
```

## Usage

> Cavendish uses Yarn under the hood, so make sure that you've installed in your system before running the generator.

Use the `cavendish create` command to create a new project:

    $ cavendish create <project-name>

This command will generate a full React Native + Expo project with:

- ESLint
- Testing with Jest and `@testing-library/react-native`
- A base `@react-navigation` config for navigation and screens
- A base `tailwind-rn` for managing styles
- A base configuration of Expo Application Services (EAS)
- CI configuration for CircleCI
- An initialized Git repository

The generator uses the `expo-cli` to generate a typescript blank managed workflow project. *Bare workflow* projects are not supported for now.

## Testing

To run the specs you need to execute, **in the root path of the gem**, the following command:

```bash
bundle exec guard
```

You need to put **all your tests** in the `/my_gem/spec/` directory.

## Publishing

On master/main branch...

1. Change `VERSION` in `lib/cavendish/version.rb`.
2. Change `Unreleased` title to current version in `CHANGELOG.md`.
3. Run `bundle install`.
4. Commit new release. For example: `Releasing v0.1.0`.
5. Create tag. For example: `git tag v0.1.0`.
6. Push tag. For example: `git push origin v0.1.0`.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Credits

Thank you [contributors](https://github.com/platanus/cavendish/graphs/contributors)!

<img src="http://platan.us/gravatar_with_text.png" alt="Platanus" width="250"/>

Cavendish is maintained by [platanus](http://platan.us).

## License

Cavendish is © 2021 platanus, spa. It is free software and may be redistributed under the terms specified in the LICENSE file.
