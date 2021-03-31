#!/usr/bin/perl

use 5.26.1;
use warnings;


#These lines set up the scalar values used later in the
#complex data structure.
my $name = 'Cameron';
my $student_id = '10252871';

#This block sets up the pizza toppings array.
my @pizza_toppings = ("mushrooms",
    "tomatoes",
    "feta cheese",
    "chicken",
    "stuffed crust"
);

#This block of code sets up the movies array.
my @movies = (
    {
        "title" => "The Shawshank Redemption",
        "genre" => "drama",
    },
    {
        "title" => "The Bourne Identity",
        "genre" => "action",
    },
    {
        "title" => "Airplane!",
        "genre" => "comedy",
    },
);

#The next block of code sets up the complex data structure
#by making a reference, $cam_hash, to an anonymous hash.

my $cam_hash = {
    "name"              => $name,
    "student_id"        => $student_id,
    "pizza_toppings"    => \@pizza_toppings,
    "movies"            => \@movies,
};

#The next two lines modify the pizza toppings array
#by adding "green peppers" as the 6th topping.
my $pizza_adjustment = "green peppers";
$cam_hash->{"pizza_toppings"}->[5] = $pizza_adjustment;



#This section of code begins the printing. The anonymous array's "name"
#entry and student ID are printed.
print "Hi Joe, my name is ", $cam_hash->{"name"}, " and my student ID is ";
say $cam_hash->{"student_id"}, ".";



#Now we get into the real meat and potatoes. This section uses a while loop
#to print the pizza toppings. Some If logic is used to provide proper grammer.
print "My ideal pizza has ";
my $topping_count = 0;
while ($topping_count < 6){
    print ($cam_hash->{"pizza_toppings"}->[$topping_count]);
    if ($topping_count < 4){
        print ", ";
    }
    if ($topping_count == 4){
        print " and ";
    }
    if ($topping_count == 5){
        print ".";
    }
    $topping_count = ($topping_count+1);
    
};    


#Another while loop is used to print the movie genres. Similar If logic is applied
#to make it read like a sentance.
print "\nI like to watch ";
my $genre_count = 0;
while ($genre_count < 3){
    print ($cam_hash->{"movies"}->[$genre_count]->{"genre"});
    if ($genre_count == 0){
    print ", ";
    }
    if ($genre_count == 1){
    print " and ";
    }
    if ($genre_count == 2){
    print " movies. ";
    }
$genre_count = ($genre_count+1);
}

#Finally, the movie titles are printed using a loop almost identical to the
#genre loop. 
print "\nSome of my favourites are ";    
my $title_count = 0;
while ($title_count < 3){
    print ($cam_hash->{"movies"}->[$title_count]->{"title"});
    if ($title_count == 0){
    print ", ";
    }
    if ($title_count == 1){
    print " and ";
    }
    if ($title_count == 2){
    print "!";
    }
$title_count = ($title_count+1);    
}