```
vi ~~/Library/Rime/installation.yaml

    installation_id: "jysperm"

cd ~/Library/Rime/sync
ln -s /Users/jysperm/jysperm/environments/rime jysperm

cd ~/Library/Rime
ln -s sync/jysperm/default.custom.yaml default.custom.yaml
ln -s sync/jysperm/luna_pinyin_simp.custom.yaml luna_pinyin_simp.custom.yaml
ln -s sync/jysperm/squirrel.custom.yaml squirrel.custom.yaml
ln -s sync/jysperm/user.yaml user.yaml
```
