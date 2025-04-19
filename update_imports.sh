#!/bin/bash

# Find all Dart files with the old import (without any trailing parts)
find lib -name "*.dart" -type f -exec grep -l "import 'package:flutter_gen/gen_l10n/app_localizations.dart';" {} \; | while read -r file; do
  # Replace the old import with the new one
  sed -i '' "s|import 'package:flutter_gen/gen_l10n/app_localizations.dart';|import 'package:absherthone/l10n/app_localizations.dart';|g" "$file"
  echo "Updated $file"
done

# Find all Dart files with the old import with show statements
find lib -name "*.dart" -type f -exec grep -l "import 'package:flutter_gen/gen_l10n/app_localizations.dart' show" {} \; | while read -r file; do
  # Replace the old import with the new one, preserving the show part
  sed -i '' "s|import 'package:flutter_gen/gen_l10n/app_localizations.dart' show|import 'package:absherthone/l10n/app_localizations.dart' show|g" "$file"
  echo "Updated show import in $file"
done

# Find all files with nullable operator after AppLocalizations.of(context)!
find lib -name "*.dart" -type f -exec grep -l "AppLocalizations.of(context)!" {} \; | while read -r file; do
  # Replace with non-nullable version
  sed -i '' "s|AppLocalizations.of(context)!|AppLocalizations.of(context)|g" "$file"
  echo "Updated nullable in $file"
done

echo "All imports updated!" 