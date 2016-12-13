# 博客和新闻SEO优化
## 每个页面要有独一无二的title, 善用Meta description
现有的博客页面都是统一title和meta, 之后要根据发布内容定制化:
```
    <title>才云科技</title>
    <meta name="keywords" content="才云 才云科技 caicloud cluster docker">
    <meta name="description" content="才云Caicloud成员来自Google，Amazon, 从事集群管理、Docker、和云产品的研发，多年磨一剑. 为企业提供无缝Docker体验和大规模生产级别的智能化Docker平台运维.">
```
以"『才云』首席大数据科学家郑泽宇专访——TensorFlow 在 Kubernetes 上的实践"为例:
```
 <title>『才云』首席大数据科学家郑泽宇专访——TensorFlow 在 Kubernetes 上的实践</title>
<meta name="keywords" content=才云 郑泽宇 tensorflow kubernetes " />
<meta name="description" content="才云参加了 2016QCon 上海站。才云首席大数据科学家郑泽宇接受了来自 QCon 的专访。以通俗易懂的言语解释了深度学习、TensorFlow 等概念，并简单描述了 TensorFlow 是如何在 Kubernetes 上运行的。" />
```
keywords这个meta tag可以不用了, 百度和谷歌的官方文档里都没提到了. 只要description. 直接拿娜娜的摘要即可.

吸引眼球的Title
　　用户在百度网页搜索中搜索到你的网页时，title会做为最重要的内容显示在摘要中，一个主题明确的title可以帮助用户更方便地从搜索结果中判断你网页上内容是否符合他需求。

推荐做法：
　　• 标题要主题明确，包含这个网页中最重要的内容
　　• 文章页title中不要加入过多的额外描述，会分散用户注意力
　　 • 如果你的品牌知名度高，品牌词最好能够展现出来；


【不唯一的description】
        作为搜索结果摘要的重要选择目标之一，一定不要采用默认形式，用适当的语言对页面进行进一步描述，对title的进一步补充，能够使用户更进一步理解你页面的内容与其需求是否匹配，让你的目标用户更快找到你点击你。
　　 • 对title的进一步补充，准确描述页面内容，但不堆砌关键词，否则可能被认为有作弊嫌疑；
　　 • 每个页面要有不同的description，尽量不适用默认一样的；
　　　•长度合理，不过长不过短

## 图片名称突出, 要加alt
以泽宇帅照为例: https://dn-caicloudui.qbox.me/articleImg/1478248802001update20161024.jpg, 现在的alt都统一成"封面图片"了.
<img data-src=" https://dn-caicloudui.qbox.me/articleImg/1478248802001update20161024.jpg" alt="才云前google资深tensorflow专家接受采访">
这里娜娜要给每张图片想好标题, 之后我或者前端发布新闻的时候加到alt里, 标题都强调google, kubernetes, docker, tensorflow这些关键字. 万一客户搜索kubernetes+tensorflow图片的时候看到泽宇照片觉得小伙不错, 点进来一看, 嘿 才云的.
其实最好data-src那里也改成有意义的图片名称, 如"tensorflow-kubernetes-data-scientist.jpg", 不过我们用cdn估计没办法.

```
Not so good:

<img src="puppy.jpg" alt=""/>
Better:

<img src="puppy.jpg" alt="puppy"/>
Best:

<img src="puppy.jpg" alt="Dalmatian puppy playing fetch">
To be avoided

<img src="puppy.jpg" alt="puppy dog baby
dog pup pups puppies doggies pups litter puppies dog retriever
 labrador wolfhound setter pointer puppy jack russell terrier
puppies dog food cheap dogfood puppy food"/>
```

## url要和文章内容相关
现有文章url: https://caicloud.io/article_detail/581c4a033673538314000012
Google文档: "If your URL contains relevant words, this provides
users and search engines with more information about the page
than an ID or oddly named parameter would."
所以可以改成 https://caicloud.io/article_detail/tensorflow-k8s-zeyu-qcon.html???

## 提交sitemap到百度和谷歌
方便搜索引擎指南更好的爬取网站内容

## 增加外链
在dockone等平台发文章的时候增加咱们官网的链接, 如 http://dockone.io/article/1777 这篇可以在文末加上官网链接 https://caicloud.io/article_detail/581c4a033673538314000012. 这些链接最好还有描述(Anchor Text), 如
<a href="http://www.brandonsbaseballcards.com/articles/ten-rarest-baseball-
cards.htm">Top Ten Rarest Baseball Cards</a>

http://www.google.com/webmasters/docs/search-engine-optimization-starter-guide.pdf
