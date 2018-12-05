# KDD Cup 2013 - Author-Paper Identification Challenge
これはKaggleの[KDD Cup 2013 - Author-Paper Identification Challenge (Track 1)](https://www.kaggle.com/c/kdd-cup-2013-author-paper-identification-challenge/)にチャレンジする環境を提供するリポジトリです，

## 初期設定
### git
`git --version`を入力して，インストールされているバージョンが表示されたら問題ありません．

```
$ git --version
git version 2.14.0
```

### Docker
[Dockerの公式サイト](https://www.docker.com/get-started)からダウンロードし，インストールしてください．
`docker --version`を入力して，インストールされているバージョンが表示されたら問題ありません．

```
$ docker --version
Docker version 18.09.0, build 4d60db4
```

### Kaggleのアカウント作成
データセットはコンペティションの規約に同意してからダウンロードするので，まず[Kaggle](https://www.kaggle.com/)のアカウントを作成してください．

## 環境構築手順
### 1.リポジトリをCloneする.
```
$ git clone https://github.com/PiroHiroPiro/author_paper_identification_challenge.git
```
### 2.KDD Cup 2013のページからデータセットをダウンロードする．
[KDD Cup 2013のデータのページ](https://www.kaggle.com/c/kdd-cup-2013-author-paper-identification-challenge/data)のから必要なデータをダウンロードする．この時モーダルが表示され，規約に同意するか聞かれるので`I Understand and Accept`をクリックしてください．
※予めログインが必要です．

### 3.ダウンロードされたデータをクローンしてきたリポジトリの中のdataディレクトリに移動させてください．

### 4.DockerfileからDockerイメージを作成する．
```
$ docker build -t kdd_2013 ./author_paper_identification_challenge
Sending build context to Docker daemon    891MB
Step 1/10 : FROM python:3.6
 ---> 1ec4d11819ad
Step 2/10 : ENV PYTHONUNBUFFERED=1
 ---> Running in c329ac171020
Removing intermediate container c329ac171020
 ---> 221b18916b47
Step 3/10 : WORKDIR /usr/src/work
 ---> Running in a2e78e1fb7d6
Removing intermediate container a2e78e1fb7d6
 ---> 0360225bdf50
Step 4/10 : COPY Pipfile Pipfile.lock ./
 ---> efe893a647f9
Step 5/10 : RUN pip install pipenv  && pipenv install --system
 ---> Running in a5de53ab5696
Collecting pipenv
  Downloading https://files.pythonhosted.org/packages/13/b4/3ffa55f77161cff9a5220f162670f7c5eb00df52e00939e203f601b0f579/pipenv-2018.11.26-py3-none-any.whl (5.2MB)
Collecting virtualenv (from pipenv)
  Downloading https://files.pythonhosted.org/packages/7c/17/9b7b6cddfd255388b58c61e25b091047f6814183e1d63741c8df8dcd65a2/virtualenv-16.1.0-py2.py3-none-any.whl (1.9MB)
Requirement already satisfied: setuptools>=36.2.1 in /usr/local/lib/python3.6/site-packages (from pipenv) (40.6.2)
Collecting virtualenv-clone>=0.2.5 (from pipenv)
  Downloading https://files.pythonhosted.org/packages/16/9d/6419a4f0fe4350db7fdc01e9d22e949779b6f2d2650e4884aa8aededc5ae/virtualenv_clone-0.4.0-py2.py3-none-any.whl
Collecting certifi (from pipenv)
  Downloading https://files.pythonhosted.org/packages/9f/e0/accfc1b56b57e9750eba272e24c4dddeac86852c2bebd1236674d7887e8a/certifi-2018.11.29-py2.py3-none-any.whl (154kB)
Requirement already satisfied: pip>=9.0.1 in /usr/local/lib/python3.6/site-packages (from pipenv) (18.1)
Installing collected packages: virtualenv, virtualenv-clone, certifi, pipenv
Successfully installed certifi-2018.11.29 pipenv-2018.11.26 virtualenv-16.1.0 virtualenv-clone-0.4.0
Installing dependencies from Pipfile.lock (5144eb)…
Ignoring appnope: markers 'sys_platform == "darwin"' don't match your environment
Removing intermediate container a5de53ab5696
 ---> 0a47533afea0
Step 6/10 : RUN mkdir data
 ---> Running in 3be52847b544
Removing intermediate container 3be52847b544
 ---> 023e01cac8ac
Step 7/10 : COPY ./data ./data
 ---> 5baa1440ed11
Step 8/10 : RUN mkdir confirmation
 ---> Running in 9edb048c763f
Removing intermediate container 9edb048c763f
 ---> 92602c60444c
Step 9/10 : COPY ./confirmation ./confirmation
 ---> df961fdc40c9
Step 10/10 : CMD ["pipenv", "run", "jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--allow-root"]
 ---> Running in 694738a3173e
Removing intermediate container 694738a3173e
 ---> 73646d129358
Successfully built 73646d129358
Successfully tagged kdd_2013:latest
```

### 5.DockerイメージからDockerコンテナを起動させ，続いてjupyter notebookを起動させる．
```
$ docker run -it --name kdd_2013 -p 8888:8888 kdd_2013
Creating a virtualenv for this project…
Pipfile: /usr/src/work/Pipfile
Using /usr/local/bin/python (3.6.7) to create virtualenv…
⠋ Creating virtual environment...Already using interpreter /usr/local/bin/python
Using base prefix '/usr/local'
New python executable in /root/.local/share/virtualenvs/work-ShcGkFHx/bin/python
Installing setuptools, pip, wheel...
done.

✔ Successfully created virtual environment!
Virtualenv location: /root/.local/share/virtualenvs/work-ShcGkFHx
[I 03:21:23.943 NotebookApp] Writing notebook server cookie secret to /root/.local/share/jupyter/runtime/notebook_cookie_secret
[I 03:21:24.586 NotebookApp] Serving notebooks from local directory: /usr/src/work
[I 03:21:24.586 NotebookApp] The Jupyter Notebook is running at:
[I 03:21:24.586 NotebookApp] http://(CONTAINER_ID or 127.0.0.1):8888/?token=TOKEN
[I 03:21:24.586 NotebookApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
[W 03:21:24.588 NotebookApp] No web browser found: could not locate runnable browser.
[C 03:21:24.588 NotebookApp]

    Copy/paste this URL into your browser when you connect for the first time,
    to login with a token:
        http://(CONTAINER_ID or 127.0.0.1):8888/?token=TOKEN
```

### 6.コンソールの最後の行に書かれているURL(http://127.0.0.1:8888/?token=TOKEN)を開く．

## (2回目以降)Jupyter Notebookの起動
```
$ docker start -a kdd_2013
[I 04:51:21.273 NotebookApp] Serving notebooks from local directory: /usr/src/work
[I 04:51:21.273 NotebookApp] The Jupyter Notebook is running at:
[I 04:51:21.273 NotebookApp] http://(CONTAINER_ID or 127.0.0.1):8888/?token=TOKEN
[I 04:51:21.273 NotebookApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
[W 04:51:21.275 NotebookApp] No web browser found: could not locate runnable browser.
[C 04:51:21.276 NotebookApp]

    Copy/paste this URL into your browser when you connect for the first time,
    to login with a token:
        http://(CONTAINER_ID or 127.0.0.1):8888/?token=TOKEN
```
