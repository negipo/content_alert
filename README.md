# Content Alert
Alert if web content exists with opening browser and growl notification.
Only works with OSX and requires growl.

# Usage

```
$ cp config/contents.yml.sample config/contents.yml
$ rake install # This will create Launch Agent config.

```

Then modify config/contents.yml like followings.

```yaml
---
- :name: 2014年発売MBP 256Gストレージ
  :uri: http://store.apple.com/jp/browse/home/specialdeals/mac/macbook_pro/13
  :css: td.specs
  :regexp: 13.3インチMacBook Pro.*2014年.*256G
  :launch_browser: true
```

Also you can stop alerting temporary to do as followings.

```
$ touch ~/.stop_content_alert # This stops alerting temporary.
```

# License
MIT
