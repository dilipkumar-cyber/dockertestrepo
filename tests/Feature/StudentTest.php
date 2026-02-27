<?php

it('can see all students', function () {
    \App\Models\Student::factory(5)->create();

    $response = $this->get('/students');

    $response->assertStatus(200)
             ->assertJsonCount(5); // expecting 5 students
});