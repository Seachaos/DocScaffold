/#{
	"name" : "Post Content Detail"
}#/
## POST內文設定的參數

POST中可以使用特定的記號(／#)，類似程式語言中的註解，但其使用JSON格式來處理參數  
這種記號可以用來產生子文件或是命名，例如

		／#{
			"name" : "API Document"
		}#／

(上述範例中的斜線為了做語法Escape使用全形，實際請用半形)  
為了方便表示此方式，下稱為 File Header  


## API寫法

API 可以寫在同一個markdown文件中，只要使用 File Header 分格  
例如 *file_header.md*

		／#{
			"category" : "API",
			"name" : "Object.getString"
		}#／
		## Object.getString
		describe...

		／#{
			"name" : "Object.getInteger"
		}#／
		## Object.getInteger
		describe...



(上述範例中的斜線為了做語法Escape使用全形，實際請用半形)  
詳請可以下載SourceCode來參考

## 繼承效果
為了方便撰寫文件，有的File Header在同個Post File中會有繼承效果  
例如

		.
		├── file_header.md
		├── index.md
		└── post_detail.md

file_header.md 一開始就有設定 category，整個Post File的內容將會在同一個Category中，後續的File Header只要設定name即可





