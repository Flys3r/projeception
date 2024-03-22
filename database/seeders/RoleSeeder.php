<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use \App\Models\Role;

class RoleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        /**
         * Create user role
         */
        Role::create([
            'name' => 'User'
        ]);

        /**
         * Create admin role
         */
        Role::create([
            'name' => 'Admin'
        ]);
    }
}
