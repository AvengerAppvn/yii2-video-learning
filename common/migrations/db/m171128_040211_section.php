<?php

use yii\db\Migration;

/**
 * Class m171128_040211_section
 */
class m171128_040211_section extends Migration
{
    public function safeUp()
    {
        $tableOptions = null;
        if ($this->db->driverName === 'mysql') {
            $tableOptions = 'CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE=InnoDB';
        }

        $this->createTable('{{%section}}', [
            'id' => $this->primaryKey(),
            'slug' => $this->string(1024)->notNull(),
            'title' => $this->string(512)->notNull(),
            'intro' => $this->string(500)->notNull(),
            'course_id' => $this->integer()->notNull(),
            'chapter_id' => $this->integer(),
            'created_by' => $this->integer(),
            'updated_by' => $this->integer(),
            'created_at' => $this->integer(),
            'updated_at' => $this->integer(),
        ], $tableOptions);

    }

    public function safeDown()
    {
        $this->dropTable('{{%section}}');
    }
}
