#!/bin/bash

npx marked -o body.html index.md

sed '/\$BODY\$/{
    r body.html
    d
}' template.html  > index.html

