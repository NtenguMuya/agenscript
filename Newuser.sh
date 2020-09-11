#!/bin/bash

for  USERNAME in  u203 u204 u205 u206 u207 u208 u209 u210 u2011 u21;

do

echo "creating user ${USERNAME}"

useradd $USERNAME

sleep 4

done
