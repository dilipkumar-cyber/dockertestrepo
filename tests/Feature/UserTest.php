<?php

use App\Models\User;

it('can create a user', function () {
    User::factory()->create([
        'name' => 'Alice',
        'email' => 'alice@example.com',
    ]);

    // Use $this to access the method  hrrddfg
    $this->assertDatabaseHas('users', [
        'email' => 'alice@example.com',
    ]);
});