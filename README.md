Reproduces webpack dev require.context bug webpack/webpack#995


Steps to repro:
  1. Clone repo: `git clone https://github.com/Whoaa512/webpack-repro.git`
  2. Install: `npm install`
  3. Run the build: `./node_modules/.bin/gulp`
  4. Take note of chunks included in `app.bundle.js` ([Should be 7](https://www.dropbox.com/s/7anu0068i8y4pi1/Screenshot%202015-05-02%2020.15.25.png?dl=0))
  5. In separate terminal tab create new file: `npm run newfile`
  6. Notice that webpack rebuilds, but the chunk count does not increase and the new file is not in the bundle. [The hash is also the same](https://www.dropbox.com/s/f786wepgh7lyuh9/Screenshot%202015-05-02%2020.16.46.png?dl=0)
  7. Kill the `./node_modules/.bin/gulp` and run it again
  8. Now the new file(`bar.coffee`) has been included in the bundle. [And the hash is changed](https://www.dropbox.com/s/sntkum4j404zjoo/Screenshot%202015-05-02%2020.18.54.png?dl=0)
