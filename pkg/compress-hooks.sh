
post_install() {
	(cd {{install_dir}} && find -size +500 -type f ! -name "*.gz" ! -name "*.br" ! -name "*.jpg" ! -name "*.png"  ! -name "*.webp" -print0|xargs -0 -r brotli -f)
}

pre_upgrade() {
	(cd {{install_dir}} && find -type f -name "*.br" -o -name "*.gz" -print0|xargs -0 -r rm)
}

post_upgrade() {
	(cd {{install_dir}} && find -size +500 -type f ! -name "*.gz" ! -name "*.br" ! -name "*.jpg" ! -name "*.png"  ! -name "*.webp" -print0|xargs -0 -r brotli -f)
}

pre_remove() {
	(cd {{install_dir}} && find -type f -name "*.br" -o -name "*.gz" -print0|xargs -0 -r rm)
}
