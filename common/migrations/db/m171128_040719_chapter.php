<?php

use yii\db\Migration;

/**
 * Class m171128_040719_chapter
 */
class m171128_040719_chapter extends Migration
{
    public function safeUp()
    {
        $tableOptions = null;
        if ($this->db->driverName === 'mysql') {
            $tableOptions = 'CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE=InnoDB';
        }

        $this->createTable('{{%chapter}}', [
            'id' => $this->primaryKey(),
            'slug' => $this->string(1024)->notNull(),
            'title' => $this->string(512)->notNull(),
            'course_id' => $this->integer()->notNull(),
            'section_id' => $this->integer()->notNull(),
            'description' => $this->text()->notNull(),
            'intro' => $this->string(500)->notNull(),
            'video_base_url' => $this->string(1024),
            'video_path' => $this->string(1024),
            'time' => $this->time(),
            'created_by' => $this->integer(),
            'updated_by' => $this->integer(),
            'created_at' => $this->integer(),
            'updated_at' => $this->integer(),
        ], $tableOptions);

    }

    public function safeDown()
    {
        $this->dropTable('{{%chapter}}');
    }
}
