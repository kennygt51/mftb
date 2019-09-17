# README

本アプリは「まねふぉ執筆」で出版した「Money Forward TechBook」における「ゼロから始めるAmazon ECS完全ガイド」で利用するサンプルアプリです。
以下の手順でDockerイメージを作成してください。

## git cloneする

```
git clone https://github.com/kennygt51/mftb.git
```

## docker buildする

```
docker build -t mftb .
```

## docker runする

```
docker run -it -p 3000:3000 -d mftb
```

