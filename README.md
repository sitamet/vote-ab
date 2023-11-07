# vote-ab

This is a Vue SPA, the frontend of an A/B poll to be used in html slides.


## How does it work:

This frontend Vote A/B pool uses websockets (socket.io lib) to comunicate with a backend server vote-ab-server https://github.com/sitamet/vote-ab-server

The vote-ab clients comunicate with the server, sending votes. 
The speaker can expose the results live, by placing the vote-ab results in a floating iframe.

### How to vote:
1. run the backend vote-ab-server.
2. expose vote-ab SPA with your web server. 

3. in you slide, place a live results iframe pointing to the results page and passing as param the `page` name:

```html
<iframe src="https://vote-ab.com/results?page=slide1"></iframe>
```


## How to run it:

Vote-ab is a static SPA you can build and expose with your prefered web server. In this repo you'll find the Dockerfile used to deploy to heroku.


### CI/CD with Github and Heroku

You can deploy it in Github with the current `.github/workflows/deploy.yml`

- There is a static.json telling Heroku how to serve dist folder content after Vite built stage.
- Add to your Github Secrets: VITE_VOTE_AB_SERVER, HEROKU_API_KEY, HEROKU_APP_NAME, and HEROKU_EMAIL
- Configure the .github/workflows/deploy.yml

```sh
git push origin master
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


