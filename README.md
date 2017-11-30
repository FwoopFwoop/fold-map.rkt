# fold-map.rkt
A short racket file which adds the functions foldmapr and foldmapl. 

## Usage
These functions achieve the same result as the code
'''
(foldr func_1 base (map func_2 lst)
(foldl func_1 base (map func_2 lst)
'''
but with only iterating once over the list. 

With fold-map.rkt, you get that nice perfomance boost when you use
'''
(foldmapr func_1 base func_2 lst)
(foldmapl func_1 base func_2 lst)
'''

## Planned Features
I plan to add support for multiple lists as arguments
