# Skeleton

## Requirements

- NPM is required -> [https://www.npmjs.org/](https://www.npmjs.org/)

## Getting started:

1. download / clone into a folder on your local machine
2. cd into 'skeleton/' 
3. run (bower components will be automatically installed):

		npm install
		
4. to start the server just run:

		npm start
		
	or:
	
		npm run watch
		
5. by default the server runs on port **5000** and you can call [http://localhost:5000](http://localhost:5000) in your browser
6. need / like another port? start the server by running this command: 	

		PORT=<PORTNUMBER> npm run watch

## Notes

The live reload server is listening on the user given port+**1** or by default on port 5001. **Skeleton** creates a dedicated output folder called "**dest/**" and all the compiled stuff will be copied into this folder. The application URL points to this folder.

##### Example:

If your server was started by the command:

		PORT=3333 npm run watch
		
the live reload server is listening on port ***3334***.