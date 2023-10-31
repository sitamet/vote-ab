# vote-ab

An A/B poll to be used in html slides. 

## Customize configuration

See [Vite Configuration Reference](https://vitejs.dev/config/).

## Project Setup

```sh
npm install
```

### Compile and Hot-Reload for Development

```sh
npm run dev

# if your server is not the default one declared in .env modify the environment var =>
VITE_VOTE_AB_SERVER="https://vote-ab-server-6001005ca061.herokuapp.com" npm run dev

```

### Compile and Minify for Production

```sh
VITE_VOTE_AB_SERVER="https://vote-ab-server-6001005ca061.herokuapp.com" npm run build
```

### Lint with [ESLint](https://eslint.org/)

```sh
npm run lint
```


## CI/CD with Github and Heroku

- There is a static.json telling Heroku how to serve dist folder content after Vite built stage.
- Add to your Github Secrets: VITE_VOTE_AB_SERVER, HEROKU_API_KEY, HEROKU_APP_NAME, and HEROKU_EMAIL
- Configure the .github/workflows/deploy.yml

```sh
git push origin master
```


## How to run it:

