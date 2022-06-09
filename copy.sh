#!/bin/bash

rsync  -rtv --exclude=StrSheet_* EUR/unpack/* datasheets
echo "All system client datasheets have been copied over in the folder datasheets"
