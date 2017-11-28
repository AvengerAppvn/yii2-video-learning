<?php

use yii\db\Migration;

/**
 * Class m171128_035523_course
 */
class m171128_035523_course extends Migration
{

    public function safeUp()
    {
        $tableOptions = null;
        if ($this->db->driverName === 'mysql') {
            $tableOptions = 'CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE=InnoDB';
        }

        $this->createTable('{{%course}}', [
            'id' => $this->primaryKey(),
            'slug' => $this->string(1024)->notNull(),
            'title' => $this->string(512)->notNull(),
            'category_id' => $this->integer()->notNull(),
            'author' => $this->integer()->notNull(),
            'requirement' => $this->text()->notNull(),
            'description' => $this->text()->notNull(),
            'intro' => $this->string(500)->notNull(),
            'section_id' => $this->integer(),
            'chapter_id' => $this->integer(),
            'thumbnail_base_url' => $this->string(1024),
            'thumbnail_path' => $this->string(1024),
            'rating' => $this->float(),
            'price' => $this->float(),
            'created_by' => $this->integer(),
            'updated_by' => $this->integer(),
            'created_at' => $this->integer(),
            'updated_at' => $this->integer(),
        ], $tableOptions);

    }

    public function safeDown()
    {
        $this->dropTable('{{%course}}');
    }
}
