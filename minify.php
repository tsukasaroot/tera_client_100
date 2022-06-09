<?php
ini_set('memory_limit', -1);
/** @var string $indentedXml */

$indentedXml = file_get_contents('ResourceSummary-00000.xml');

$dom = new DOMDocument("1.0");

// Preserve redundant spaces (`true` by default)
$dom->preserveWhiteSpace = false;

// Disable automatic document indentation
$dom->formatOutput = false;

$dom->loadXML($indentedXml);

/** @var string $minifiedXml  */
$minifiedXml = $dom->saveXML();
file_put_contents('new.xml', $minifiedXml);
