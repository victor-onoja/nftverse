# nftverse

A flutter Dapp.

## Features (done)

- Connect to Metamask

## Features (still in dev)
- NFT marketplace (buy/list/cancel)
- Mint an NFT
- DAO

## Codebase and how it works 
This codebase is a flutter codebase. The lib folder consists of the main.dart file. The main.dart file consists of the main function leading to the splash screen widget. The lib folder also has 2 folders:
- constants
- features

The constants folder contains code that is shared through multiple app features. It includes styling files.

The data folder contains model classes and string constants.

The features folder is subdivided into four folders; each representing a specific feature and containing custom widgets,screens,models used only in that feature.

The app assets are located in the images folder

The app contracts are located in the contracts folder

## Design description
The Dapp was a desinged for mobile (android/ios). The homepage which is the marketplace contains a drawer for navigating to other features pages. The UI design is simple and minimalistic, 100% my ideas.  

- Inspiration: figma community
- Sources: canva, pexels, pixaby

## Libraries
- Url launcher: To open metamask wallet
- Flutter svg: To load SVG format files
- web3dart: For connecting to the ethereum blockchain
- walletconnect_dart: For connecting to metamask wallet

## Challenges
- My major challenge was time; building the dapp while preparing for exams and also carrying out my final year project all in two weeks was quite the ride but I was able to overcome by effective time management. 
- Building a flutter dapp, connnecting to wallects, integrating the smart contract, i didn't understand how to do half of what was required. But with extensive research, the help of flutter official docs, stack overflow and a sprinkle of trial and error. I believe i have overcomed this challenge.
