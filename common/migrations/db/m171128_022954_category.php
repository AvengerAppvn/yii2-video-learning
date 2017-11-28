<?php

use yii\db\Migration;

/**
 * Class m171128_022954_category
 */
class m171128_022954_category extends Migration
{

    public function safeUp()
    {
        $tableOptions = null;
        if ($this->db->driverName === 'mysql') {
            $tableOptions = 'CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE=InnoDB';
        }

        $this->createTable('{{%category}}', [
            'id' => $this->primaryKey(),
            'slug' => $this->string(1024)->notNull(),
            'name' => $this->string(512)->notNull(),
            'parent_id' => $this->integer(),
            'type' => $this->integer(),
            'thumbnail_base_url' => $this->string(1024),
            'thumbnail_path' => $this->string(1024),
            'created_by' => $this->integer(),
            'updated_by' => $this->integer(),
            'created_at' => $this->integer(),
            'updated_at' => $this->integer(),
        ], $tableOptions);

    }

    public function safeDown()
    {
        $this->dropTable('{{%category}}');
    }
}
