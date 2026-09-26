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

## noctalia-tray-drawer-hover.patch

Tepsi (tray) ikonlarını tek bir ok simgesinde toplar (`[widget.tray] drawer = true` ile birlikte).
Fare simgenin üstüne gelince panel ~140 ms sonra açılır; fare ikondan veya panelden uzaklaşınca
~250 ms sonra kendiliğinden kapanır. Panel ister tıklamayla ister hover ile açılsın bu geçerli.
Bir tepsi ikonuna sağ tıklayıp açılan menü (ör. Steam → Exit Steam) açıkken panel kapanmaz;
menü kapanınca normal davranışa döner. Tıklama davranışı eskisi gibi aç/kapat olarak kalır.
Noctalia **v5.1.0** kaynağına uygulanır (diğer yamalarla birlikte uygulanabilir).

```sh
git clone --depth 1 --branch v5.1.0 https://github.com/noctalia-dev/noctalia
cd noctalia
git apply /path/to/patches/noctalia-disc-spin.patch
git apply /path/to/patches/noctalia-tray-drawer-hover.patch
meson setup build --prefix="$HOME/.local" --buildtype=release
ninja -C build && ninja -C build install
```

İlgili ayarlar `~/.config/noctalia/config.toml` içindeki `[widget.tray]` tablosunda:
`drawer`, `drawer_columns`, `drawer_item_size`, `detached_panel`.

## noctalia-active-window-app-name.patch

`active_window` widget'ına `show_app_name` seçeneği ekler. Açıkken barda uzun pencere başlığı
yerine uygulamanın masaüstü kaydındaki adı gösterilir (ör. "OC | Arka plan..." yerine "kitty",
"brave-browser" yerine "Brave"). Fare üzerine gelince tooltip yine tam pencere başlığını gösterir.
Noctalia **v5.1.0** kaynağına uygulanır; diğer yamalarla birlikte uygulanabilir.

```sh
git apply /path/to/patches/noctalia-active-window-app-name.patch
```

İlgili ayar `~/.config/noctalia/config.toml` içindeki `[widget.active_window]` tablosunda:
`show_app_name = true` (isteğe bağlı `max_length` ile genişlik sınırlanır).
