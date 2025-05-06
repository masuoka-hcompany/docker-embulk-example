# docker-embulk-example

Embulk の Docker 環境構築サンプル

## Embulk 実行手順

1. Docker 環境の起動

```
docker compose up -d
```

2. Docker コンテナに内に入る

```
docker compose exec docker-embulk-example bash
```

3. Embuik 実行コマンドを叩く

```
embulk run --enable-liquid /work/config/[対象ファイル]
```

## フォルダ内容

| フォルダ名 | 内容                                      |
| ---------- | ----------------------------------------- |
| config     | Embulk データ処理用設定ファイルの配置先。 |
| output     | Embulk で取得したファイルの配置先。       |
