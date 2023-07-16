
post_install() {
	(cd {{install.dir}} && find -type f ! -name "*.br" ! -name "*.jpg" ! -name "*.png" -print0|xargs -0 -r brotli)
}

pre_upgrade() {
	(cd {{install.dir}} && find -type f -name "*.br" -print0|xargs -0 -r rm)
}

post_upgrade() {
	(cd {{install.dir}} && find -type f ! -name "*.br" ! -name "*.jpg" ! -name "*.png" -print0|xargs -0 -r brotli)
}

pre_remove() {
	(cd {{install.dir}} && find -type f -name "*.br" -print0|xargs -0 -r rm)
}
