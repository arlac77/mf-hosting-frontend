
post_install() {
	(cd {{installdir}} && find -type f ! -name "*.gz" ! -name "*.png" -print0|xargs -0 gzip -k -9)
}

pre_upgrade() {
	(cd {{installdir}} && find -type f -name "*.gz" -print0|xargs -0 rm)
}

post_upgrade() {
	(cd {{installdir}} && find -type f ! -name "*.gz" -print0|xargs -0 gzip -k -9)
}

pre_remove() {
	(cd {{installdir}} && find -type f -name "*.gz" -print0|xargs -0 rm)
}
