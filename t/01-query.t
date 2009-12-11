use strict;
use Test::More;

use lib 't/lib';

use Data::SearchEngine::Query;

my $query = Data::SearchEngine::Query->new(
    page => 1,
    count => 12,
    query => 'a product'
);

cmp_ok($query->query, 'eq', $query->original_query, 'original query default');

my $query2 = Data::SearchEngine::Query->new(
    page => 1,
    count => 12,
    query => 'a product'
);

cmp_ok($query->digest, 'eq', $query2->digest, 'digests match');

my $query3 = Data::SearchEngine::Query->new(
    page => 1,
    count => 12,
    original_query => 'product',
    query => 'a product'
);

cmp_ok($query3->original_query, 'ne', $query3->query, 'original_query ne query');

done_testing;
