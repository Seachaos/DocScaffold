/#{
	"category" : "File Header",
	"name" : "category"
}#/
## Category
category 是用於選單分類的值  
*此屬性在同個post檔案中有繼承效果*

/#{
	"name" : "order"
}#/
## Order
order 可以決定選單的排序
越小的越前面

/#{
	"name" : "file_name"
}#/
## File Name
file name為強制指定產出的靜態檔名稱

/#{
	"name" : "name"
}#/
## Name
name為該File Header的名稱，主要是選單上的程現

/#{
	"name" : "escape_html",
	"escape_html" : true
}#/
## Escape Html
escape_html為是否Escape HTML語法  
範例為：

		/＃{
			"name" : "escape_html",
			"escape_html" : true
		}＃/

如果為true，html語法將會被Markdown處理器轉換成直接顯示  
*此屬性在同個post檔案中有繼承效果*


