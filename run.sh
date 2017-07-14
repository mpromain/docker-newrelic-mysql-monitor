#!/bin/bash -e
cp -n config-template/newrelic.template.json config/newrelic.json
cp -n config-template/plugin.template.json config/plugin.json
cp -n config-template/* config/
java -Xmx128m -jar plugin.jar
