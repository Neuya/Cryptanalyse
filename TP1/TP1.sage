def myPgcd(a,b):
    print(xgcd(a,b))
#xgcd renvoie un triplet (d,u,v)
#avec d = pgcd(a,b)
# a*u + b*v = 1

#liste des carres entre 0 et 20
def squareList():
    L=[]
    for i in range(20):
        if is_prime(i):
            L.append(i^2)
    return L

#Ordre de 25 modulo 1000003
#Boucle :

def boucleOrdre():
    i = 2
    bool = true
    while(i<1000002):
        if(mod(1000003,25^i)==1):
            return i
        i = i+1
    return 1000002

#Creation anneau:

def ordreSansBoucle():
    ZZ = IntegerRing();
    Z1 = ZZ.quo(1000003);
    n = Z1(25)
    return n.multiplicative_order()

#Entiers inférieurs à 1000 qui sont égaux à la somme de leurs diviseurs stricts:

def divisorList():
    L=[]
    for i in range(1,1000):
        if( i == sum(divisors(i)[:-1])):
            L.append(i)
    return L

#vandermonde
#Partie 1 :

def matVander1(a1,a2,a3,a4):
    #MS = MatrixSpace(QQ,4)
    #M = Matrix();
    L = []
    for i in range(4):
        L.append(vector([a1^i,a2^i,a3^i,a4^i]))
    M = matrix(L)
    return M

#Partie 2:

def multiplySelf(List,L2):
    Lret = []
    for i in range(len(List)):
        Lret.append(List[i]*L2[i])
    return Lret

def matVander2(List):
    interList = []
    taille = len(List)
    L = copy(List)
    interList.append([1]*taille)
    for i in range(1,taille):
        interList.append(vector(QQ,L))
        L = multiplySelf(L,List)
    M = matrix(interList)
    return M

def matVander22(List):
    taille = len(List)
    M = []
    for i in range(taille):
        for j in range(taille):
            M[j].append(List[i]**i)
    return M

#formule = produit des (ai-aj)
def detVander(L):
    det = 1

    for i in range(len(L)):
        for j in range(i+1,len(L)):
            det = det*(L[j]-L[i])
    return det

def detVander(L):
    det = 1
    varList = []
    varList.append(var('a1'))
    varList.append(var('a2'))
    varList.append(var('a3'))
    varList.append(var('a4'))
    S = var('S')
    for i in range(len(L)):
        for j in range(i+1,len(L)):
            det = det*(L[j]-L[i])
            S=S.mul(varList[j-1]-varList[i-1])
    return (det,S)

#version expression symbolique
def detVander2(a1,a2,a3,a4):
    a1 = var('a1')
    a2 = var('a2')
    a3 = var('a3')
    a4 = var('a4')
    M = matVander1(a1,a2,a3,a4)
    return M.det().factor()

def anneau():
    Z25Z = IntegerModRing(25)
    print("Caractéristique Z/25Z : ")
    print(Z25Z.characteristic())
    L = Z25Z.list_of_elements_of_multiplicative_group()
    print(L)
    #pas un corps
    Z13 = IntegerModRing(13)
    print(Z13.characteristic())
    print(Z13.list_of_elements_of_multiplicative_group())
    #corps

def question7():
    F8.<a> = GF(16)
    print(F8.dual_basis())
    print(F8.list())
    L = F8.list()
    for x in L:
    	for y in L:
    		if(x!=y):
    			if((x+y)^2!=x^2+y^2):
    				print(x," & ",y)
    				print("!=")
    print("All equals")
    squareList=[]
    for x in L:
    	if (x^2==x):
    		squareList.append(x)
    print("Liste x^2 = x : ")
    print(squareList)


def question8():
	F8.<a> = GF(8)
	PR.<X> = PolynomialRing(GF(2))
	P = PR(F8.modulus())
	V=F8.vector_space(map=false)
	print("Polynome utilisé : ",P)
	print("Irreductible? : ",P.is_irreducible())
	print("Racines : ",P.roots(ring=F8))
	print(F8([1,0,1]) + F8([0,1,1]))
	print(V(F8([1,0,1]) + F8([0,1,1])))
	print(F8([0,0,1])^(-1))

def question9():
	F8.<a> = GF(8)
	PR.<X> = PolynomialRing(GF(2))
	P = PR(F8.modulus())
	print(F8.list())	
	V=F8.vector_space(map=false)
	for el in F8:
		print(el,"Poly min :",el.minimal_polynomial())
	for el in F8:
		if el:
			print(el," Ordre: ",el.multiplicative_order())
	b = a+1
	tableB = [b^i for i in range(8)]
	for i in range(8):
		print("a^",i,"=",a^i,"= b^",tableB.index(a^i))

def question10():
	F16.<a> = GF(16)
	print(F16.list())
	PR.<X> = PolynomialRing(GF(2))
	P = PR(F16.modulus())
	print("Poly utilisé : ",P)
	compt=0
	nonPrim = []
	for i in F16:
		if i :
			if(i.multiplicative_order()!=15):
				print(i," non primitif")
				nonPrim.append(i)
			else:
				compt+=1
	print("Nombre d'elts primitifs :",compt)
	deg4nonPrim = nonPrim[0].minimal_polynomial()
	print("Polynome minimal du premier élement non primitif ",nonPrim[0]," : ",deg4nonPrim)
	
	print("partie2:")
	print("-------------")

	F256.<a> = GF(2^8)
	countF16 = 0
	for el in F256:
		if el == el^16:
			countF16+=1
	print("Nb elements F16:",countF16)
	print([el for el in F256 if el^16==el])


	print("partie3:")
	print("--------------")
	countF16 = 0
	F2100.<a>=GF(2^100)
	for el in F2100:
		if el == el^16:
			countF16+=1
	print("Nb elements F16 dans F2^100:",countF16)
	print([el for el in F2100 if el^16==el])

