#!/bin/bash

az login

az account set --subscription "0c7d6dba-4a1c-42c5-990a-0f6b78e67b91" --output none #Tecka Azure Subscription
#az account set --subscription "864132e7-fb8a-4e68-9380-5dcde90d738d" #Pay-As-You-Go

az account show --query "name"
