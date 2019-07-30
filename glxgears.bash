#!/bin/bash
xvfb-run glxgears > GPU.test &
sleep 51
pkill -x glxgears
sed -i '$ d' GPU.test 
