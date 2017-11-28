<?php

use yii\db\Migration;

/**
 * Class m171128_042548_review
 */
class m171128_042548_review extends Migration
{
    public function safeUp()
    {
        $tableOptions = null;
        if ($this->db->driverName === 'mysql') {
            $tableOptions = 'CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE=InnoDB';
        }

        $this->createTable('{{%review}}', [
            'id' => $this->primaryKey(),
            'slug' => $this->string(1024)->notNull(),
            'course_id' => $this->integer()->notNull(),
            'user_id' => $this->integer()->notNull(),
            'comment' => $this->text()->notNull(),
            'rating' => $this->integer()->notNull(),
            'created_by' => $this->integer(),
            'updated_by' => $this->integer(),
            'created_at' => $this->integer(),
            'updated_at' => $this->integer(),
        ], $tableOptions);

    }

    public function safeDown()
    {
        $this->dropTable('{{%review}}');
    }
}
