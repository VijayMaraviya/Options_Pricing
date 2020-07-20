% helper functions to obtain paths for bionomial lattice

function [] = walk(node, route ,priceLattice, steps)
    global pricePaths
    if node(2) == steps + 1 %leaf node is reached
        route(end+1) = price(node, priceLattice);
        pricePaths = [pricePaths; route];
    else
        route(end+1) = price(node, priceLattice);
        walk( up(node), route, priceLattice, steps)
        walk( down(node), route, priceLattice, steps)
    end
end

function up_node = up(node)
    node(1) = node(1);
    node(2) = node(2)+1;
    up_node = node;
end 

function down_node = down(node)
    node(1) = node(1)+1;
    node(2) = node(2)+1;
    down_node = node;
end 

function p = price(node, priceLattice)
    p = priceLattice(node(1), node(2));
end

