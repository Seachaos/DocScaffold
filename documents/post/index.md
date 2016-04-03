/#{
	"name" : "HOME",
	"file_name" : "index.html",
	"order" : -1
}#/
## Welcome use DocScaffold

這是一個簡單用來產生API文件的Ruby程式，以Markdown語法為主  
This program is easy for generate API document, it's using Markdown.

範例檔案：  
Example File：  

		.
		├── docscaffold -> ../bin/docscaffold
		├── output
		├── post
		│   ├── how_to_use.md
		│   └── index.md
		└── template
		    ├── images
		    │   ├── body-bg.jpg
		    │   ├── download-button.png
		    │   ├── github-button.png
		    │   ├── header-bg.jpg
		    │   ├── highlight-bg.jpg
		    │   └── sidebar-bg.jpg
		    ├── index.html
		    └── style
		        ├── css
		        ├── github-light.css
		        ├── print.css
		        └── stylesheet.css

Post資料夾為文章內容, template 為樣版檔案  
Post folder is your content, template folder put template file  

執行：  
Use command：  


		./docscaffold


就會產生html檔案於 output 資料夾，這些靜態檔案即可發佈  
It generate html files in output folder, can be published
