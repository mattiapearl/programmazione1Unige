function [vettoreFix] = fixVect(vect, A,B)
    fixB = vect >B;
    fixA = vect <A;

    vect(fixA) = A;
    vect(fixB) = B;

    vettoreFix = vect;
end