
post_install() {
	(cd {{install.dir}} && find -type f ! -name "*.gz" ! -name "*.br" ! -name "*.jpg" ! -name "*.png" -print0|xargs -0 -r brotli -f)
}

pre_upgrade() {
	(cd {{install.dir}} && find -type f -name "*.br" -o -name "*.gz" -print0|xargs -0 -r rm)
}

post_upgrade() {
	(cd {{install.dir}} && find -type f ! -name "*.gz" ! -name "*.br" ! -name "*.jpg" ! -name "*.png" -print0|xargs -0 -r brotli -f)
}

pre_remove() {
	(cd {{install.dir}} && find -type f -name "*.br" -o -name "*.gz" -print0|xargs -0 -r rm)
}
