
post_install() {
	(cd {{install.dir}} && find -type f ! -name "*.gz" ! -name "*.png" -print0|xargs -0 -r zopfli)
}

pre_upgrade() {
	(cd {{install.dir}} && find -type f -name "*.gz" -print0|xargs -0 -r rm)
}

post_upgrade() {
	(cd {{install.dir}} && find -type f ! -name "*.gz" ! -name "*.png" -print0|xargs -0 -r zopfli)
}

pre_remove() {
	(cd {{install.dir}} && find -type f -name "*.gz" -print0|xargs -0 -r rm)
}
