# KDD Cup 2013 - Author-Paper Identification Challenge

This is a repository that provides a Docker environment that challenges Kaggle's [KDD Cup 2013 - Author-Paper Identification Challenge (Track 1)](https://www.kaggle.com/c/kdd-cup-2013-author-paper-identification-challenge/).


## Requirement

- [Docker](https://www.docker.com/)

## Usage

Run Jupyter notebook:

```console
$ $ docker run -it --name kdd_2013 -p 8888:8888 kdd_2013
```

Go to `http://localhost:8888` and you'll see the notebooks.

## Install

Clone repository:

```console
$ git clone https://github.com/PiroHiroPiro/author_paper_identification_challenge.git
$ cd author_paper_identification_challenge
```

Download dataset from [KDD Cup 2013](https://www.kaggle.com/c/kdd-cup-2013-author-paper-identification-challenge/data):

Set dataset to `source/data`

```console
$ cp -r [Download Dir]/* source/data/
```

Build image:

```console
$ docker build -t kdd_2013 ./author_paper_identification_challenge
```

## Licence

This software is released under the MIT License, see [LICENSE](https://github.com/PiroHiroPiro/author_paper_identification_challenge/blob/master/LICENSE).

## Author

[Hiroyuki Nishizawa](https://github.com/PiroHiroPiro)
