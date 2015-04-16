from pyswip.prolog import Prolog

def do_lecture_stuff (prolog):
    prolog.consult ("src/lecture")
    result = prolog.query ("density(C, D).")
    for entry in result:
        print (entry)

def do_pedigree_stuff (prolog):
    prolog.consult ("src/db")
    prolog.consult ("src/pedigree")
    ancestor = "'Karla Kolumna'"
    for result in prolog.query ("descendent(D, %s)." % ancestor):
        print (result)

def main ():
    do_pedigree_stuff (Prolog ())

if __name__ == "__main__":
    main ()