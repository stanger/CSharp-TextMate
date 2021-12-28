#!/bin/bash

OUTPUT=./dist
BUNDLE_PATH="$OUTPUT/csharp.tmbundle"

if [ -e $BUNDLE_PATH ] ; then
	rm -r $BUNDLE_PATH
fi

pushd csharp-TmLanguage

git pull
#TODO should a build be run here?

popd

pushd csharp-tmbundle
git pull
popd

mkdir -p $BUNDLE_PATH/Commands
mkdir -p $BUNDLE_PATH/Preferences
mkdir -p $BUNDLE_PATH/Snippets
mkdir -p $BUNDLE_PATH/Syntaxes

cp csharp-tmbundle/Commands/*tmCommand $BUNDLE_PATH/Commands
cp csharp-tmbundle/Preferences/*tmPreferences $BUNDLE_PATH/Preferences
cp csharp-tmbundle/Snippets/*tmSnippet $BUNDLE_PATH/Snippets
cp csharp-tmLanguage/grammars/*tmLanguage $BUNDLE_PATH/Syntaxes
cp src/* $BUNDLE_PATH

pushd $OUTPUT

zip -r CSharp.tmbundle.zip CSharp.tmbundle

popd