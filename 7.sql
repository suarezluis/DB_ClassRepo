SELECT b.title,
        p.contact,
        p.phone
FROM books b,
    publisher p
WHERE b.pubid = p.pubid;


SELECT b.title,
        p.contact,
        p.phone
FROM books b JOIN publisher p
USING(pubid);


SELECT c.firstname ,c.lastname, o.order#, o.shipdate 
FROM customers c, orders o
WHERE c.customer# = o.customer# and o.shipdate is null;

