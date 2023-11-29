#!/bin/sh

TARGET_DIR=node_modules

if [ ! -d "$TARGET_DIR" ]; then
	echo "$TARGET_DIR" does not exist
	exit 1
fi

PATTERNS="
	__tests__
	.babel*
	.circle*
	.documentup*
	.ds_store
	.editorconfig
	.git*
	.idea
	.lint*
	.npm*
	.nyc*
	.prettier*
	.tern*
	.yo-*
	*.coffee
	*.env*
	*.flow*
	*.jst
	*.markdown
	*.md
	*.mkd
	*.swp
	*.tgz
	*appveyor*
	*config.yml
	*coveralls*
	*eslint*
	*example*
	*htmllint*
	*jshint*
	*readme*
	*rollup*
	*stylelint*
	*travis*
	*tsconfig*
	*tslint*
	*vscode*
	*wallaby*
	*yarn*
	authors
	changelog
	changes
	circle.yml
	component.json
	contributors
	coverage
	doc
	docs
	grunt*
	gulp*
	images
	jenkins*
	jest*
	karma*
	licence
	licence.*
	makefile
	powered-test
	prettier.*
	test
	test.*
	tests
	website
"

PROD_PATTERNS="
	*.map
	*.ts
	types
"

if [ "$1" = "-p" ]; then
	PATTERNS="$PATTERNS $PROD_PATTERNS"
fi

echo "$TARGET size before: $(du -sh "$TARGET_DIR" | awk '{print $1}')"

for pattern in $PATTERNS; do
	find "$TARGET_DIR" -iname "$pattern" -exec rm -rf {} +
done

echo "$TARGET size after:  $(du -sh "$TARGET_DIR" | awk '{print $1}')"