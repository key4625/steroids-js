# Steroids.js

A JavaScript library to be used with [AppGyver Steroids](http://appgyver.com/steroids) and [Steroids npm](//github.com/AppGyver/steroids). Steroids.js requires AppGyver Scanner application (available in Apple App Store and Google Play Store) or custom Scanner build from AppGyver Build Service.

## Development:

Setup Steroids project "testApp":

    1) npm install
    2) npm install -g grunt-cli
    3) grunt
    4) cd testApp && npm install

NOTE!
  You may need to manually run "grunt" before reloading Steroids in testApp!


## Testing

### Running the Automated Testsuite

There is a Jasmine test project in specsApp/ that has steroids.js symlinked from dist/

    1) Setup dependencies defined above under "Development"
    2) cd testSpecApp
    3) steroids connect

### Running the Manual Testsuite

There is a Steroids project for manual testing under testApp/ that has steroids.js symlinked from dist/

    1) Setup dependencies defined above under "Development"
    2) cd testApp
    3) steroids connect

## Bower distribution

Due to Bower limitations (cannot exclude certain files from a repository), the Bower distribution of Steroids.js resides in a different GitHub repository (https://github.com/steroidsjs/steroids-js) and is included as a submodule. Thus, to update the Bower distribution, you need GitHub access to the steroidsjs organization too.

## Publishing:

Remember to up the version number in `package.json`.

    ./bump-plz.sh

    grunt
    git submodule init # not needed if already done
    git submodule update  # ensure bower/

    cd bower && git co master && cd ..

    VERSION=$(coffee sync-bower.coffee) && echo "VERSION=$VERSION" # this sets (and then echoes) $VERSION to match current version, for use in below scripts

    cp dist/steroids.js bower/steroids.js
    cd bower && git co master && git commit -am "$VERSION" && git tag "v$VERSION" && git push && git push --tags && cd ..
    git add bower && git commit -m "Updated submodule to $VERSION" && git push && git push --tags

    npm publish ./

## License

Steroids.js is released under the [MIT License](http://www.opensource.org/licenses/MIT).
