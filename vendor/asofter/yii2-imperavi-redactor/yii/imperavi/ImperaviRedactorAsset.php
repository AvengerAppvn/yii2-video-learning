<?php
/**
 * @link http://www.yiiframework.com/
 * @copyright Copyright (c) 2008 Yii Software LLC
 * @license http://www.yiiframework.com/license/
 */

namespace yii\imperavi;
use Yii;
use yii\web\AssetBundle;

/**
 * @author Alexander Yaremchuk <alwex10@gmail.com>
 * @since 2.0.1
 */
class ImperaviRedactorAsset extends AssetBundle
{
    public $sourcePath = '@yii/imperavi/assets';
    public $js = [
        'redactor.js'
    ];
    public $css = [
        'redactor.css'
    ];
    public $depends = [
        'yii\web\JqueryAsset'
    ];

}

