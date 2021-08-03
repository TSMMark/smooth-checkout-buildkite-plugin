# Smooth Checkout
All the things you need during a Buildkite checkout :butter: :kite:

## Repository-less builds
```yml
steps:
  - command: echo "Skips checking out Git project in checkout" 
    plugins:
      - hasura/smooth-checkout#v1.0.0:
          skip_checkout: true
```
