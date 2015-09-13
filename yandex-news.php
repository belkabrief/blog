<head>
	<meta charset="utf-8"/>
</head>
<?php	
	$username = 'root';
	$password = '';
	try{
		$connection = new PDO(
			'mysql:host=localhost;dbname=yandex-news;charset=utf8',
			$username,
			$password
		);
		
		$res = file_get_contents('http://news.yandex.ru/travels.rss');
		$xml_object = new SimpleXMLElement($res);
	
		foreach ($xml_object->channel->item as $rs){
			$tdate = date("Y-m-d H:i:s", strtotime($rs->pubDate));
			echo $rs->title . "--" . $rs->pubDate . "--" . $tdate . "<br/>";
			if (!news_is_in_base($connection, $tdate)){
				echo "Новость ещё не добавлялась<br/>";
				add_news($connection, $rs, $tdate);
			} else {
				echo "Новость уже была добавлена ранее<br/>";
			}
		} 

	} catch (Exception $e){
		die($e->getMessage());
	}
	
	//проверка наличия новости в базе
	function news_is_in_base($connection, $tdate){
		$stmt_check = $connection->prepare("SELECT * FROM `news` WHERE `pubDate` = :pdate");
		$stmt_check->bindParam(':pdate', $tdate, PDO::PARAM_STR, 100);
		$stmt_check->execute();
		return $stmt_check->fetch();
	}
	
	//добавление раздела в базу
	function add_news($connection, $rs, $tdate){
		echo "____" . $tdate . "<br/>";
		
		$statement = $connection->prepare("INSERT INTO `news`(`title`, `link` ,`description`,`pubDate`) VALUES (:title, :lnk, :descr, :pubdate)");
		$statement->bindParam(':title', $rs->title, PDO::PARAM_STR, 100);
		$statement->bindParam(':lnk', $rs->link, PDO::PARAM_STR, 200);
		$statement->bindParam(':descr', $rs->description, PDO::PARAM_STR, 400);
		$statement->bindParam(':pubdate', $tdate, PDO::PARAM_STR, 20);
		$statement->execute();
		
		echo "Новость успешно добавлена.<br/>";
	}
	
?>