# AVADO-DNP-Mysterium-Server test
Mysterium server

## Prerequisites
 
 - A WiFi or VPN connection to your AVADO box 
 - IPFS client installed (optional)

## Installation

AVADO uses the AVADO SDK to build packages.

`npm i -g https://github.com/AvadoDServer/AVADOSDK.git`

## Testing locally

you can modify the Dockerfile in the `build` folder and test it locally using `docker-compose build` and `docker-compose up` until it works as expected.

## Building

`avadosdk build` will build the package and upload to your AVADO box's IPFS server.

it will output the IPFS hash that you can use in your package

` Manifest hash : /ipfs/<ipfs hash>`

## Installing and testing 

Go to your avado DappStore page at http://my.avado/#/installer

enter the above hash in the input field and press enter.

You will see the package detail screen - where you can install the package on your box and test it out.

## Publishing

You can distribute the IPFS hash of your package to other AVADO users without requiring anyone's permission - or if you want to have your package added to the DappStore - contact the AVADO team in the Telegram chat.

## update flow & tagging your repo

This is a suggested flow to upgrade your package when you want to release a new version:

```
avadosdk increase patch
avadosdk build --provider http://80.208.229.228:5001
git add dappnode_package.json docker-compose.yml releases.json
git commit -m "new release"
git push
npx release-it
```












