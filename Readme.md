# Action Blog

A hugo powered static site, built using Github Actions, served by Github Pages.

Basic idea:

* Git repo contains site content on `master` (and any other branch)
* GH Pages set to serve from `gh-pages` branch
* On push to master, GH Actions run which build the site and commit `public/` to `gh-pages` branch and force pushes it
* The site is then live

## TODO

- [ ] Everything.

- [ ] Some content
- [ ] A building site locally
- [ ] GH Action to build the hugo site correctly
- [ ] GH Action to overwrite the gh-pages branch with content of site
- [ ] ??? profit?


## License

    The MIT License (MIT)

    Copyright (c) 2019 Caius Durling

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
    THE SOFTWARE.
