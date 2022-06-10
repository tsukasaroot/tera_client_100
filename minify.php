<?php
ini_set('memory_limit', -1);

function getDirContents($path) {
    $rii = new RecursiveIteratorIterator(new RecursiveDirectoryIterator($path));

    foreach ($rii as $file)
        if (!$file->isDir() && strstr($file, 'xml')) {
	        $fd = $file->getPathname();
	        $indentedXml = file_get_contents($fd);
			$dom = new DOMDocument("1.0");
			// Preserve redundant spaces (`true` by default)
			$dom->preserveWhiteSpace = false;
			// Disable automatic document indentation
			$dom->formatOutput = false;
			$dom->loadXML($indentedXml, LIBXML_PARSEHUGE);
			$minifiedXml = $dom->saveXML();
			file_put_contents($fd, $minifiedXml);
        }
}
echo "\nStarting minification\n";
getDirContents($argv[1]);
echo "\nMinification done for {$argv[1]}\n";