<?php

use yii\db\Migration;

/**
 * Class m171128_045051_cart
 */
class m171128_045051_cart extends Migration
{
    public function safeUp()
    {
        $tableOptions = null;
        if ($this->db->driverName === 'mysql') {
            $tableOptions = 'CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE=InnoDB';
        }

        $this->createTable('{{%cart}}', [
            'id' => $this->primaryKey(),
            'user_id' => $this->integer()->notNull(),
            'course_id' => $this->integer()->notNull(),
            'price' => $this->float(),
            'time' => $this->time(),
            'date_buy'=>$this->date(),

        ], $tableOptions);

    }

    public function safeDown()
    {
        $this->dropTable('{{%cart}}');
    }
}
