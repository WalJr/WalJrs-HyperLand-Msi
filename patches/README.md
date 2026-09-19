# patches

## noctalia-disc-spin.patch

Noctalia'nın medya OSD'sindeki disc simgesinin sürekli dönmesini sağlar (çalan CD gibi).
Noctalia **v5.1.0** kaynağına uygulanır.

```sh
git clone --depth 1 --branch v5.1.0 https://github.com/noctalia-dev/noctalia
cd noctalia
git apply /path/to/patches/noctalia-disc-spin.patch
meson setup build --prefix="$HOME/.local" --buildtype=release
ninja -C build && ninja -C build install
```

Derlenen binary `~/.local/bin/noctalia` olarak kurulur ve sistem paketindeki sürümün önüne geçer.
