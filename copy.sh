#!/bin/bash

rsync  -rtv --exclude=StrSheet_* EUR/unpack/* datasheets_test
echo "All system client datasheets have been copied over in the folder datasheets"
