#let first-indent-spacing = 1.8em
#let indent = h(first-indent-spacing)
#set page(margin: 1.75in)
#set par(leading: 0.55em, spacing: 0.55em, first-line-indent: first-indent-spacing, justify: true)
#set text(size: 11pt, font: "New Computer Modern")
#show math.equation.where(block: true): set block(spacing: 1.2em)
#show heading: set block(above: 1.4em, below: 1em)
#show ref: it => {
  let eq = math.equation
  let el = it.element
  if el != none and el.func() == eq {
    numbering(
      el.numbering,
      ..counter(eq).at(el.location())
    )
  } else {
    it
  }
}

#let algebraicset = $cal(A)$
#let integers = $bb(Z)$
#let irrationals = $bb(I)$
#let naturals = $bb(N)$
#let qed = [#h(1fr) $qed$]
#let rationals = $bb(Q)$
#let reals = $bb(R)$
#let closure(X) = $overline(#X)$
#let bvec(v) = $bold(upright(#v))$

== Chapter 2
=== Exercise 2.1
#quote(block: true)[Prove that the empty set is a subset of every set.]

Let $A$ be any set, $emptyset$ be the empty set and assume the opposite. Then there exists at least one element $x in emptyset$ such that $x in.not A$. But the empty set does not contain any elements and no such $x$ can therefore be found. This is a contradiction and hence $emptyset subset A$ must be true.

#qed

=== Exercise 2.2
#quote(block: true)[Prove that the set of all algebraic numbers is countable.]

Let $alpha = (a_0, dots, a_n) in B_(n+1)$ be an n+1-tuple of integers. Example 2.5 shows that the set of all integers $integers$ is countable. Using Theorem 2.13 with $A = integers$ shows that the set of n+1-tuples $B_(n+1)$ is countable.

For particular choice of integers $a_0, dots, a_n$ we may construct an equation of the form

$ a_n z^n + dots.c + a_1 z + a_0 = 0. $

This polynomial has at most $n$ solutions. Let $E_alpha$ be the set of all complex numbers $z$ that is a solution to that polynomial. Hence $E_alpha$ is a finite subset of $algebraicset$ with at most $n$ elements. If $S_n$ is a set such that

$ S_n = union.big_(alpha in B_(n+1)) E_alpha $

then it is the union of a countable collection of finite sets. It follows from Theorem 2.12 that $S_n$ is at most countable. Since the union of a countable collection of at most countable sets is at most countable (follows from Theorem 2.12 again); the union

$ S = union.big_(n=1)^(infinity) S_n, $

is at most countable.

We shall show that $algebraicset subset S$. For any $z in algebraicset$ there exist integers $a_0, dots, a_k$ such that   $a_k z^k + dots.h.c + a_1 z + a_0 = 0$. For these integers there is a k+1-tuple $alpha = (a_0, dots, a_k)$ which is associated with exactly one set $E_alpha$. Hence there exists at least one $alpha$ for which $z in E_alpha$ and therefore it follows that $algebraicset subset S$. This means that $algebraicset$ is at most countable since it is a subset of $S$.

Lastly we need to show that $algebraicset$ is infinite. The set of rational numbers $rationals$ is countable by the corollary to Theorem 2.13. For any $q in rationals$ there are integers $m, n$ such that $q = n/m$. Now choose $a_1 = m$ and $a_0 = -n$, then

$ a_1 q + a_0 = m n/m - n = 0, $

which means that $q$ is algebraic. Since $q$ is arbitrary it follows that $rationals subset algebraicset$. This shows that $algebraicset$ has an infinite subset and must therefore itself be infinite. $algebraicset$ is an infinite set that is at most countable, and therefore it is countable as desired.

#qed

=== Exercise 2.3
#quote(block: true)[Prove that there are real numbers which are not algebraic.]

Suppose not. Let $algebraicset$ be the set of all algebraic numbers. Since we assume the opposite any real number is algebraic and it follows that $reals subset algebraicset$.

From Exercise 2.2 we know that $algebraicset$ is countable. By Theorem 2.8 this would entail that $reals$ is countable, since it is an infinite subset of a countable set. But this is a contradiction since Theorem 2.43 shows that $reals$ is uncountable. Hence our assumption is false and there exists real numbers $x in reals$ such that $x in.not algebraicset$.

#qed

=== Exercise 2.4
#quote(block: true)[Is the set of all irrational real numbers countable?]

Denote the set of irrational numbers by $irrationals$. According to Theorem 2.13 $rationals$ is countable. Now suppose $irrationals$ is countable. We already know that

$ reals = rationals union irrationals, $

which means that $reals$ is countable by Theorem 2.12. But this is a contradiction since by Theorem 2.43 the set of real numbers $reals$ is uncountable. If $irrationals$ is assumed to be finite, then that still would make $reals$ countable. Hence, $irrationals$ must be uncountable.

#qed

=== Exercise 2.5
#quote(block: true)[Construct a bounded set of real numbers with exactly three limit points.]

Let $k$ be a natural number and consider the set $E_k$ of numbers $k + 1/n$ where $n = 1, 2, 3, dots$ . Clearly $E_k subset (k, k+1]$ and is therefore bounded.

We need to show that $E_k$ does not contain any limit points. For any natural numbers $n, m$ we have that

$ d( k + 1/n, k+ 1/m) = abs(k + 1/n - (k + 1/m)) = abs(1/n - 1/m) = d(1/n, 1/m). $

For a fixed $n$ we want to show that

$ d(1/n, 1/m) gt.eq d(1/n, 1/(n+1)), $

holds with any natural number $m eq.not n$.

If $m gt.eq n+1$, then

$ d(1/n, 1/m) = abs(1/n - 1/m) gt.eq abs(1/n - 1/(n+1)) = d(1/n, 1/(n+1)). $ \

If $m lt.eq n - 1$, then

$
    d(1/n, 1/m)
        &= abs(1/n - 1/m) = 1/m - 1/n gt.eq 1/(n-1) - 1/n \
        &=  1/(n(n-1)) > 1/(n(n+1)) =1/n - 1/(n+1) \
        &= abs(1/n - 1/(n+1)) = d(1/n, 1/(n+1)),
$

which gives us the result. Hence any neighborhood $N_r (k + 1/n)$ with radius $0 < r < abs(1/n - 1/(n+1)) = 1/(n(n+1))$ will contain no other points of $E_k$ except $k + 1/n$. This means that $k + 1/n$ cannot be a limit point of $E_k$.

We now show that $k in.not E_k$ is a limit point of $E_k$. For any radius $r > 0$ we can find a natural number $N$ such that $1/N < r$ by using the Archemdian property of $reals$ (Thm. 1.20)

$ d (k, k + 1/N) = abs(k - ( k + 1/N )) = 1/N < r, $

which means that $k+1/N in N_r (k)$.

The desire is to construct a set that is bounded with exactly three
limit points. We accomplish this by choosing the set $E$ such that

$ E = E_1 union E_2 union E_3. $

Specifically, the limit points to $E$ are $1, 2, 3$ and $E_1, E_2, E_3$ are all bounded which makes $E$ bounded as well.

#qed

=== Exercise 2.6
#quote(block: true)[Prove that $E'$ is closed. Prove that $E$ and $overline(E)$ have the same limit points. Do $E$ and $E'$ always have the same limit points?
]

We first prove that $E'$ is closed. If $x$ is a limit point of $E'$ then for any neighborhood $N_r (x)$ with radius $r > 0$ there exists a $y in E'$ such that $y in N_r (x)$. It follows then that the distance is $d(x, y) = h$ for some real number $ 0 < h < r$. Since $y in E'$ we know that $y$ is a limit point of $E$. Hence, we can find a $z in E$ such that $z in N_(r-h) (y)$. We have that

$ d(x, z) lt.eq d(x, y) + d(y, z) < h + r - h = r, $

which means that $z in N_r (x)$ so that $x in E'$.

Next we show that $overline(E)$ and $E$ have the same limit points. If $x$ is a limit point of $overline(E)$, then since $overline(E) = E' union E$, it must be the case that $x$ is a limit point of $E'$ or $E$. Assuming $x$ is a limit point of $E$ leaves us with nothing to prove. So we suppose that $x$ is a limit point of $E'$ alone. We already have established that $E'$ is closed, and therefore $x in E'$. This directly implies that $x$ is a limit point of $E$ because the members of $E'$ are all limit points of $E$.

Conversely, let $y$ be a limit point of $E$. Since $E subset overline(E)$, it follows that $y$ is a limit point of $overline(E)$.

Lastly, we show that $E$ and $E'$ do not always have the same limit points. Let $E = { 1, 1/2, 1/3, 1/4, dots }$ and note that $0$ is the only limit point of $E$. This means that $E' = { 0 }$. We know by Corollary to Theorem 2.20 that $E'$ has no limit points. This shows the result by example.

#qed

=== Exercise 2.7
#quote(block: true)[
    Let $A_1, A_2, A_3,dots$ be subsets of a metric space.
    #enum(
        numbering: "(a)",
        enum.item[If $B_n = union_(i=1)^n A_i$, prove that $overline(B)_n = union_(i=1)^n overline(A)_i$.],
        enum.item[If $B = union_(i=1)^infinity A_i$, prove that $overline(B) supset union_(i=1)^infinity overline(A)_i$. Show, by an example, that this inclusion can be proper. ]
    )
]

(a) We first need to show that for any sets $A$ and $B$ it is true that $(A union B)' = A' union B'$. If $x in (A union B)'$, then for every neighborhood $N_r (x)$ with a radius $r > 0$ there exists at least one point $p in N_r (x)$ such that $p in A union B$. Thus, $p in A$ or $p in B$ which implies that $x in A'$ or $x in B'$ so that $x in A' union B'$.

Suppose now that $x in A' union B'$, then for any neighborhood $N_r (x)$ with a radius $r > 0$ there is a point $p in N_r (x)$ such that $p in A$ or $p in B$. This means that $p in A union B$ and it follows that $x in (A union B)'$.

We now turn to the question at hand. This will be a proof by induction. The base case for $n=1$ is clearly true. Assume the statement holds for $n$, then

$
    overline(B)_(n+1)
    =& overline( union.big_(i=1)^(n+1) A_i )
    = overline( union.big_(i = 1)^(n) A_i union A_(n+1) )
    = overline( B_n union A_(n+1) ) \
    =& B_n union A_(n+1) union ( B_n union A_(n+1) )' \
    =& B_n union B'_n union A_(n+1) union A'_(n+1) \
    =& overline(B)_n union overline(A)_(n+1)
    = union.big_(i=1)^(n) overline(A)_i union overline(A)_(n+1) \
    =& union.big_(i=1)^(n+1) overline(A)_i,
$

where we have used the induction hypothesis in the penultimate equality. \ \
(b) If $x in union.big_(i=1)^infinity overline(A)_i$, then there is an $n in naturals$ such that $x in overline(A)_n$. We have that

$
    overline(B) =
    overline(union.big_(i=1)^infinity A_i) supset
    overline(union.big_(i=1)^n A_i) =
    union.big_(i=1)^n overline(A)_i supset
    overline(A)_n,
$

where we used the result in (a) to get the second equality. This implies that $x in overline(B)$. Since $x$ is arbitrary it follows that $ overline(B) supset union.big_(i=1)^infinity overline(A)_i$ as desired.

We shall conclude by showing that this subset can indeed be proper. Let $A_i = {1, 1/2, 1/3, dots, 1/i}$ and note that there exists no $k in naturals$ such that $0 in A_k$. Thus $0 in.not union.big_(i=1)^infinity A_i$. Furthermore, each set $A_i$ has no limit points which is why $overline(A)_i = A_i$, and therefore $union.big_(i=1)^infinity overline(A)_i = union.big_(i=1)^infinity A_i$. It follows then that $0 in.not union.big_(i=1)^infinity overline(A_i)$. Now let's consider $overline(B)$

$
    overline(B) &=
    overline(union.big_(i=1)^infinity A_i) =
    overline( { 1, 1/2, 1/3, dots } ) =
    { 0, 1, 1/2, 1/3, dots },
$

which implies that $0 in overline(B)$. Since $0 in.not union.big_(i=1)^infinity
overline(A_i)$ we've shown that the inclusion can be proper.

#qed

=== Exercise 2.8
#quote(block: true)[Is every point of every open set $E subset reals^2$ a limit point of $E$? Answer the same question for closed sets in $reals^2$.]

We first show that every point in every open set $E subset reals^2$ is a limit point of $E$. Suppose not. Then there exists an open set $E subset reals^2$ with a point $x in E$ that is not a limit point of $E$. It follows that there exists an $r > 0$ such that the neighborhood $N_r (x)$ contains no point of $E$ except $x$.

Since $E$ is an open set, $x$ must be an interior point. Hence, there is a neighborhood with radius $s > 0$ such that $N_s (x) subset E$. Neighborhoods in $reals^2$ are non-empty interiors of circles, which means that $N_r$ is circle centered at $x$.

Consider the cases for $r$ and $s$:

+ If $r > s$ then $N_s$ is a circle inscribed in a larger circle $N_r$. This implies $N_s subset N_r$. Consequently, there exists points $y in N_s subset N_r subset E$ where $y eq.not x$. However, this contradicts our assumption that $N_r (x)$ contains no points of $E$ other than $x$.

+ If $r lt.eq s$, then $N_r$ is inscribed in $N_s$. Given that $N_s$​ is non-empty circle such that $N_s subset E$, it follows that $N_s$ contains points of $E$ arbitrarily close to its center point $x$. In particular, for any distance $0 < d < r$, there are points $y in E$ where $y eq.not x$ such that $y in N_s$. Since $N_r subset N_s$, these $y$ must be a point of $N_r$ because $d < r$. This contradicts our assumption that $x$ is not a limit point of $E$.


Since none of the relations $r < s$, $r = s$ and $r > s$ can be true, such an $r$ cannot exists. We've reached a contradiction and the assumption is wrong. Hence, each point of $E$ is a limit point of $E$.

Now we show that the case does not hold true in general for closed sets. Consider the set of all natural numbers $naturals subset reals^2$. This set is closed, yet every point in this set is not a limit point of it.

#qed

=== Exercise 2.9
#let interior(E) = $#E^circle.small$
#quote(block: true)[
    Let $interior(E)$ be the set of all interior points of $E$.
     #enum(
        numbering: "(a)",
         enum.item[Prove that $interior(E)$ is always open.],
         enum.item[Prove that $E$ is open if and only if $interior(E) = E$.],
         enum.item[If $G subset E$ and $G$ is open, prove that $G subset interior(E)$.],
         enum.item[Prove that the complement of $interior(E)$ is the closure of the complement of $E$.],
         enum.item[Do $E$ and $overline(E)$ always have the same interiors?],
         enum.item[Do $E$ and $interior(E)$ always have the same closures?],
    )
]

(a) If $p in interior(E)$ then $p$ is an interior point of $E$. This means that there exists some neighborhood $N(p)$ with $r > 0$ such that $N(p) subset E$. By Theorem 2.19 $N(p)$ is an open set, implying that every point in $N(p)$ is an interior point. Hence, $N(p) subset interior(E)$ and it follows $interior(E)$ is an open set. \ \



(b) If $E$ is open then for every point $x in E$ we can find a neighborhood $N(x)$ with $r > 0$ such that $N subset E$. This implies that every point $x in E$ is an interior point of $E$ and it is therefore true that $x in interior(E)$. This shows that $E subset interior(E)$. Since by construction $interior(E) subset E$ we have that $interior(E) = E$.

Conversely, if $interior(E) = E$ then it follows from (a) that $E$ is open. \ \



(c) If $G$ is open, then for every point $p in G$ we can find a neighborhood $N(p)$ with $r > 0$ such that $N(p) subset G$. Since $G subset E$, we have that $N(p) subset E$, which shows that $p$ is an interior point of $E$. Hence, $p in interior(E)$. Therefore, $G subset interior(E)$ since $p$ was arbitrary chosen from $G$. \ \



(d) Let $x$ be any point in $(interior(E))^c$. First we show that $(interior(E))^c subset overline(E^c)$. Suppose that $x in.not E$. Then

$ x in E^c subset E^c union E^c' = overline(E^c). $

Now let $x in E$. Since $x$ is in the complement of $interior(E)$, we know that $x$ is not an interior point of $E$. Therefore, for every neighborhood $N(x)$ with radius $r > 0$, we have that $N(x) subset.not E$. This means that $N(x)$ always has points in $E^c$, which makes $x$ a limit point of $E^c$. Thus, $x in E^c' subset overline(E^c)$. This shows that $(interior(E))^c subset overline(E^c)$.

Conversely, let $p in overline(E^c) = E^c union E^c'$ . Then it is clear that either $p in E^c$ or $p in E^c'$. Assume $p in E^c$. Then we know that $p$ is not an interior point to $E$, so $p in.not interior(E)$, which implies that $p in (interior(E))^c$. If $p in E^c'$, then it is a limit point of $E^c$, and therefore every neighborhood $N(p)$ with radius $r > 0$ have points (other than $p$) from $E^c$. Hence, there is no neighborhood such that $N(p) subset E$ which means that $p$ cannot be an interior point of $E$. Therefore, $p in (interior(E))^c$, and we have now shown that $overline(E^c) subset (interior(E))^c$. \ \



(e) Let $E = (0, 1) union (1, 2)$ be a set consisting of line segments in $reals$. Since $E$ is open we have that $interior(E) = E$ by (b). The set of limit points $E'$ is the closed interval $[0, 2]$, so the closure is $overline(E) = E union E' = [0, 2]$. From here we can see that $interior((overline(E))) = (0, 2)$, which shows that $ interior(E) eq.not interior((overline(E)))$. Therefore, $E$ and $overline(E)$ do not always have the same interiors. \ \



(f) Consider the set $E = {1/n | n = 1, 2, 3, dots}$ as subset of $reals$. Since $0$ is the only limit point of $E$, we have that its closure is $overline(E) = E union {0}$. However, none of the points in $E$ are interior points, and therefore $interior(E) = emptyset$. This means that $overline(interior(E)) = emptyset$ so that $overline(E) eq.not overline(interior(E))$. We have shown that $E$ and $interior(E)$ do not always have the same closures.


#qed

=== Exercise 2.10
#quote(block: true)[Let $X$ be an infinite set. For $p in X$ and $q in X$, define
    $ d(p,q) = cases(
    1 quad quad "(if" p eq.not q")",
    0 quad quad "(if" p eq q")".
    ) $
    Prove that this is a metric. Which subsets of the resulting metric space are open? Which are closed? Which are compact?
]

We begin by showing that $d$ is a metric. Conditions 2.15 (a) and (b) are clearly satisfied. We show (c) also is true. Suppose $p eq.not q$ so that $d(p,q) = 1$. For any $r in X$ we have two cases, either $r$ equals one of $p$, $q$ or neither.

Suppose WLOG that $r = p$. Then we have that $d(p,r) = 0$ and $d(r,q) = 1$. It follows that

$
    underbrace(d(p,q), = 1) lt.eq
    underbrace(d(p, r), =0) +
    underbrace(d(r, q), = 1) =
    1.
$

Now let $r eq.not p eq.not q$ be true. Then $d(p,r) = d(r,q) = 1$, and we can show that

$
    underbrace(d(p, q), =1) <
    underbrace(d(p, r), =1) +
    underbrace(d(r, q), =1) =
    2.
$

Lastly, if $p = q$ then $d(p, q) = 0$ and any point $r in X$ will satisfy (c) since the distance function is non-negative. This shows that $X$ is a metric with distance function $d$.

We shall now show that any subset $E subset X$ is open. Let $p$ be any point in $E$ and consider the neighborhood $N_r (p)$ with radius $r = 1$. Given the metric, this neighborhood contains only $p$ itself so that $N_r (p) subset E$. Hence, every point in $E$ is an interior point and $E$ is open.

We now show that every subset in $X$ is closed. Let $E$ be any subset of $X$. Since every subset of $X$ is open, the complement $E^c$ is also open. By Thm. 2.33 $E$ is closed.

Lastly, we show that only finite sets of $X$ are compact (by Definition 2.32). Suppose not, then we have a compact set $K subset X$ that is infinite. For every $p in K$ let $G_p$ be the open neighborhood around $p$ with radius $r = 1$. Since every $p in K$ is associated with an open set $G_p$, the collection ${G_p}$ is an open cover of $K$. Because $K$ is compact, there exists a finite number of indices such that

$ K subset G_(p_1) union dots.c union G_(p_m). $

Every subset $G_(p_n)$ is an open neighborhood around $p_n$ with radius $1$. From before we know that these sets only contain a single point, namely $p_n$. But that is absurd, since it would make $K$ finite.

#qed

=== Exercise 2.11
#quote(block: true)[
    For $x in reals$ and $y in reals$, define

$
    d_1(x, y)& = (x - y)^2, \
    d_2(x, y)& = sqrt(abs(x-y)), \
    d_3(x, y)& = abs(x^2 - y^2), \
    d_4(x, y)& = (x - 2y), \
    d_5(x, y)& = abs(x - y) / (1 + abs(x - y)).
$

    Determine, for each of these, whether it is a metric or not.
]

$d_1$ Condition 2.15 (c) is not satisfied, which therefore is not a metric. We give an example,

               $ d_1(10, 0) > d_1(10, 4) + d_1(4, 0). $ \

$d_2$ Both 2.15 (a) and (b) are clearly true. We show that (c) is also satisfied. Assume not, then there exists points $x$, $y$ and $r$ such that $ d_2(x, y) > d_2(x, r) + d_2(r, y), $ which in this particular case is

        $ sqrt(abs(x-y)) > sqrt(abs(x-r)) + sqrt(abs(r-y)). $

If $0 < q < p$ then $q^2 < p^2$ for any $p, q in reals$ so that

$
    abs(x - y) &= sqrt(abs(x - y))^2 > (sqrt(abs(x-r)) + sqrt(abs(r-y)))^2 \
        &= abs(x - r) + 2 sqrt(abs(x-r) abs(r-y)) + abs(r - y) \
        &gt.eq abs(x - r) + abs(r - y),
$

where the last inequality comes from the fact that $sqrt(abs(x-r) abs(r-y)) gt.eq 0$. The above shows that $d(p,q) = abs(p - q)$ cannot be a metric. But that is a contradiction, since Theorem 1.37 shows that $abs(p-q)$ satisfies 2.15 (c). Hence, $d_2$​ is a metric. \ \

$d_3$ Condition 2.15 (a) is not satisfied. We show an example $
    d_3(2, -2) &= abs(2^2 - (-2)^2) = 4 - 4 = 0.
$ We have found $x eq.not y$ such that $d_3(x, y) = 0$. This shows that $d_3(x, y)$ is not a metric. \ \

$d_4$ We show that $d_4$ is not a metric since condition (a) of Definition 2.15 is not satisfied. If $x eq.not 0$ then

               $ d_4(x, x) = |x - 2x| = |x| > 0. $ \

#let distfive(x, y) = $abs(#x)/(1 + abs(#y))$
#let distfivenoabs(x, y) = $#x/(1 + #y)$
$d_5$ Conditions in (a), (b) are clearly satisfied so we focus on (c). Throughout this exercise WLOG assume $x lt.eq y$. Suppose $x lt.eq r lt.eq y$, we have that

$
    d_5(x, y) &= distfive(x-y, x-y) = distfive(x-r + r-y, x-y) \
        &lt.eq distfive(x-r, x-y) + distfive(r-y, x-y) \
        &lt.eq distfive(x-r, x-r) + distfive(r-y, r-y) \
        &lt.eq d_5(x, r) + d_5(r, y),
$

where we used Theorem 1.37 in the first inequality. Since $x lt.eq r lt.eq y$ we know that $abs(x-r) lt.eq abs(x-y)$ and $abs(r-y) lt.eq abs(x-y)$, both of which we used to get the second inequality.

Now assume $x lt.eq y < r$. First we show that for any $epsilon > 0$

#math.equation(block: true, numbering: "(1)")[
    $ distfive(w, w) < distfivenoabs(abs(w)+epsilon, abs(w)+epsilon), $
] <intermediate>

holds. The statement is clearly true for $w=0$. If $|w| > 0$, then

$
    distfive(w, w) = distfivenoabs(1, 1/abs(w))
    < distfivenoabs(1, 1/(abs(w) + epsilon))
    = distfivenoabs(abs(w)+epsilon, abs(w)+epsilon),
$

which shows that @intermediate is true.

Since $x lt.eq y < r$, we have that $abs(x-y) < abs(x-r)$. This means we can use @intermediate to get the first inequality below,

$
    d_5(x, y) &= distfive(x-y, x-y) < distfive(x-r, x-r) \
        &lt.eq distfive(x-r, x-r) + distfive(r-y, r-y) \
        &= d_5(x, r) + d_5(r, y).
$

The last inequality is due to the last term being non-negative. Similar argument can be made for $r < x lt.eq y$ because $abs(x-y) < abs(r-y)$ which allows us to use @intermediate again. This shows that $d_5(x,y)$ is a metric.

#qed

=== Exercise 2.12
#quote(block: true)[
    Let $K subset reals$ consist of 0 and the numbers $1 slash n$, for $n = 1, 2, 3, dots$ . Prove that $K$ is compact directly from the definition (without using the Heine-Borel theorem).
]

Let ${G_alpha}$ be any open cover of $K$. Then we know that there is an index $alpha_0$ such that $0 in G_(alpha_0)$. Since $G_(alpha_0)$ is an open set, we know that there exists a neighborhood $N_r (0)$ with radius $r > 0$ where $N_r subset G_(alpha_0)$.

If $r gt.eq 1$, then $G_(alpha_0)$ covers $K$ and there is nothing to prove. Assume therefore that $r < 1$. By Archimedean property of $reals$ we can find positive integers $p$ such that $r gt.eq 1 slash p$. Let $m$ be the smallest integer such that $r gt 1 slash m$. It follows that if $q$ is an integer where $q > m$, then $r > 1 slash q$ so that $1 slash q in N_r (0)$. This shows that there are at most $m-1$ points in $E$ that are not in $N_r$,

$ 1/(m-1), 1/(m-2), dots, 1/2, 1. $ \

Let $G_(alpha_k)$ denote an open set in the collection ${G_alpha}$ such that $1 slash k in G_(alpha_k)$ $(k = 1, 2, 3, dots)$. Because ${G_alpha}$ is an open cover of $K$, each of the above $m-1$ points can be associated this way to at least one index (not necessarily distinct) in the collection. Therefore

$ K subset G_(alpha_0) union G_(alpha_1) union dots.c union G_(alpha_(m-1)). $

We have shown that any open cover of $K$ has a finite sub-cover which implies that $K$ is compact as desired.

#qed

=== Exercise 2.13
#quote(block: true)[Construct a compact set of real numbers whose limit points form a countable set.]

Let $n$ be a natural number and construct a sequence ${x_k}$ as follows. Define $x_1$ as the midpoint between $1/(n+1)$ and $1/n$

$ x_1 = (1/(n+1) + 1/n) / 2. $

Having chosen $x_1, dots, x_(k-1)$ (for $k= 2, 3, 4, dots$), define $x_k$ as the midpoint between $x_(k-1)$ and $1/n$

$ x_k = (x_(k-1) + 1/n) / 2. $

Let $E_n$ be the set of all numbers generated by the sequence ${x_k}$, along with the point $1/n$. For example, if $n=1$ we have

$ E_1 = { 1, 3/4, 7/8, 15/16, 31/32, dots}. $

Since the sequence ${x_k}$ is constructed by repeatedly taking midpoints between the previous term and $1/n$​, the sequence will approach the value $1/n$​, making it a limit point of $E_n$.

We can show that any other point $y in reals$ such that $y eq.not 1 / n$ cannot be a limit point of $E_n$. Since $E_n$ is a countable set of values that approach $1/n$, there is a number $x_k eq.not y$ in $E_n$ that minimises $d(y, x_k)$. Then the neighborhood with $0 < r < d(y, x_k)$ will have no point of $E_n$ (other than possibly $y$). Hence, $1/n$ is the only limit point so that $ E'_n = {1 / n}$.

The collection of sets ${E_n}$ is disjoint since $E_n subset (1/(n+1), 1/n]$. Let $S$ be the union of this collection along with the point $0$,

$ S = {0} union union.big_(n=1)^infinity E_n subset [0, 1]. $

Since $S$ is a union of disjoint sets, the limit points of $S$ is given by

$ S' = {0} union union.big_(n=1)^infinity E' = {0, 1, 1/2, 1/3, dots}, $

which is countable. Furthermore, because $E' subset E$ and $0 in S$ we see that $S' subset S$ so that $S$ is closed. Since $S$ is a subset of the compact interval $[0, 1]$, by Theorem 2.35 $S$ is compact.

As desired, we have constructed a compact set $S$ of real numbers whose limit points $S'$ form a countable set.

#qed


=== Exercise 2.14
#quote(block: true)[Give an example of an open cover of the segment $(0, 1)$ which has no finite sub-cover.]

Let $G_n$ be the open set on the form $(1 slash n, 1)$ for any natural number $n$. The collection ${G_n}$ is an open cover of $(0, 1)$

$ union.big_(n=1)^infinity G_n = union.big_(n=1)^infinity (1 slash n, 1) = (0, 1). $

Choose finitely many indices $n_1, n_2, dots, n_m$ and let $p$ be the largest index among them. If $x$ is the midpoint between $0$ and $1/p$, then $x in.not G_p$. Since $G_(n_k) subset G_p$ ($k=1, 2, dots, m$) we see that

$ x in.not G_(n_1) union G_(n_2) union dots.c union G_(n_m), $

yet clearly $x in (0, 1)$. This shows that the union constructed with indices $n_k$ ($k=1, 2, dots, m)$ cannot be a sub-cover of $(0, 1)$. The choice of indices were arbitrary, therefore there does not exist a finite sub-cover of $(0, 1)$ using the open cover ${G_n}$.

#qed


=== Exercise 2.15
#quote(block:true)[Show that Theorem 2.36 and its Corollary become false (in $reals$, for example) if the word "compact" is replaced by "closed" or by "bounded."]

We first show that "compact" cannot be replaced by closed. Consider the set of natural numbers starting from the positive integer $n$ and beyond

$ E_n = {n, n+1, n+2, dots}. $

Each set in the collection ${E_n}$ is closed relative to $reals$ and is unbounded. Since we have that $E_n supset E_(n+1)$ ($n = 1, 2, 3, dots$) any intersection of a finite sub-collection of ${E_n}$ is non-empty. However, the countable intersection

$ E = sect.big_(n=1)^infinity E_n, $

is empty. To see this, note that for any natural number $m$ we have that $m in.not E_n$ whenever $m < n$. Hence, there exists no natural number $m$ which belongs to all sets in the collection ${E_n}$ and it follows that the intersection is empty.


Now we show that the word "compact" cannot be replaced by "bounded." Let $A_n$ be the set that consists of numbers

$ A_n = { 1/n , 1/(n+1), 1/(n+2), dots }. $

This set is bounded by $1$ and is not closed since it does not contain its limit point $0$. We also have that $A_n supset A_(n+1)$ for $n=1, 2, 3, dots$ and hence any intersection of a finite sub-collection will be non-empty. The countable intersection

$ A = sect.big_(n=1)^infinity A_n, $

is, however, empty. This can be proven with similar argument as for why the intersection $E$ is empty. We have shown that the word "compact" cannot be replaced by "bounded."

#qed


=== Exercise 2.16
#quote(block: true)[Regard $rationals$, the set of all rational numbers, as a metric space, with $d(p,q) = |p - q|$. Let $E$ be the set of all $p in rationals$ such that $2 < p^2 < 3$. Show that $E$ is closed and bounded in $rationals$, but that $E$ is not compact. Is $E$ open in $rationals$?]

We begin with showing that $E$ is bounded. If $2 < p^2 < 3$ then $1 < abs(p) < 2$, and indeed we see that $E$ is bounded.

To show that $E$ is closed, consider any rational number $q in.not E$. If $q^2 < 2$ then for any $p in E$

$
    abs(q^2-2) &< abs(p^2 - q^2) = abs((p+q)(p-q)) \
        &lt.eq abs(p+q) abs(p-q) lt.eq (abs(p) + abs(q)) abs(p-q) \
        &lt 4 abs(p-q),
$

which shows that $ 0 < abs(q^2 - 2) / 4 lt abs(p-q)$. Hence, any neighborhood with radius $abs(q^2 - 2) / 4$ would contain no point of $E$. If $q^2 > 3$ then

$
    abs(q^2 - 3) &< abs(q^2 - p^2) = abs((q+p)(q-p)) \
        &lt.eq (abs(p) + abs(q)) abs(p-q) \
        &lt 2abs(q) abs(p-q).
$

Similarly, it follows that any neighborhood around $q$ with radius $abs(q^2 - 3) / (2 abs(q))$ contains no point of $E$. This shows that any $q in.not E$ cannot be a limit point of $E$ and hence $E$ must be closed.

To prove that $E$ is not compact in $rationals$, it suffices by Theorem 2.33 to show that $E$ is not compact in $reals$. First, note that $E$ is not closed in $reals$ because it does not contain all of its limit points. In particular, $sqrt(2)$ is an irrational number that is a limit point of $E$ but not a member of the set. Therefore, by Heine-Borel's theorem (Theorem 2.41) $E$ cannot be compact in $reals$.

Lastly, we answer the question if $E$ is open in $rationals$. Consider the open intervals $A = (-sqrt(3), -sqrt(2))$ and $B = (sqrt(2), sqrt(3))$ in $reals$. Put $G = A union B$ and note that by Theorem 2.24 $G$ is open in $reals$. Since $E = rationals sect G$, it follows by Theorem 2.30 that $E$ is open in $rationals$.

#qed

=== Exercise 2.17
#quote(block: true)[Let $E$ be the set of all $x in [0, 1]$ whose decimal expansion contains only the digits $4$ and $7$. Is $E$ countable? Is $E$ dense in $[0, 1]$? Is $E$ compact? Is $E$ perfect?]

That $E$ is not countable can be shown using Cantor's diagonal process. Simply exchange $0$, $1$ with $4$, $7$ respectively in Theorem 2.14 and its proof. Alternatively, if we can show that $E$ is perfect then by Theorem 2.43 $E$ is uncountable.

$E$ is not dense in $[0, 1]$ since $0$ is neither a limit point of $E$, nor a point of $E$.

Since $E subset [0, 1]$ we know it is a subset of a compact set by Theorem 2.40. According to Theorem 2.35, it suffices to show that $E$ is closed to prove that $E$ is compact. Suppose $x in.not E$ and write the decimal expansion of $x$ using the notation from Section 1.22,

$ x_0 dot x_1 x_2 x_3 dots $

Recall that $x_0$ is the largest integer such that $x_0 lt.eq x$. We will show that for any $p in E$ the distance $d = abs(x - p)$ cannot be less than $2 dot.c 1 / 10^(n+1)$.

Since $x in.not E$ there exists a first integer $n$ such that $x_n$ is neither $4$, nor $7$. Let $p$ be a point of $E$ that has the same decimal expansion as $x$ up to $n$

$ p = 0 dot p_1 p_2 p_3 dots, $

so that $p_k = x_k$ for $k = 1, 2, dots, n - 1$ and $abs(x_n - p_n) gt.eq 1$. It is clear that any other choice of decimals up to $n$ for $p$ would make the distance to $x$ larger. Note that $x_0 = 0$ for otherwise $d gt.eq 0.222 dots$ which is larger than $2 dot.c 1 / 10^(n+1)$.

No matter how we choose the rest of the decimals $p_i$, where $i > n$, the distance $d = abs(x - p)$ cannot be less than $2 dot.c 1 / 10^(n+1)$. For if $abs(x_n - p_n) = 1$ and we borrow from it when calculating $d$, then we see that

$ abs(min(x_(n+1), p_(n+1)) + 10 - max(x_(n+1), p_(n+1))) gt.eq 3. $

If we would need to borrow from decimal n+1:th place at some later point during our calculations of $d$, then the n+1:th decimal place of $d$ would be $2$. Since we can borrow at most once from any decimal place when calculating $d$, we have that

$ d = abs(x - q) gt.eq 2 dot.c 1 / 10^(n+1) $

for any $q in E$. Therefore, any neighborhood $N(x)$ with radius $r = 1 / 10^(n+1) < d$ would contain no point of $E$. Hence, $E$ must be closed and it follows by Theorem 2.35 that $E$ is compact.

Now we prove that $E$ is perfect. Since we already have shown that $E$ is closed, we need only to show that no point of $E$ is isolated. For any $q in E$ let $N(q)$ be some neighborhood around $q$ with radius $r >0$. Choose any integer $k > 0$ such that $3 dot.c 10^(-k) < r$. Suppose $p$ is a number with the exact same decimal expansion as $q$ except at decimal place $k$, for which we choose either $4$, or $7$ such that $p_k eq.not q_k$. Clearly, $p in E$ and we have that

$ abs(p - q) & = abs(p_k - q_k) dot.c 10^(-k) = 3 dot.c 10^(-k) < r. $

Thus, $q$ is a limit point of $E$ and we have shown that $E$ is perfect.

#qed


=== Exercise 2.18
#quote(block: true)[Is there a nonempty perfect set in $reals$ which contains no rational number?]

Let $E$ be the set from Exercise 2.17. This set is a nonempty perfect set in $reals$ that contains rational numbers. We want to find a number $y$ such that for every $x in E$ the sum $x + y$ is irrational. Then the set of irrational numbers given by

$ P = { x + y | x in E} $

is perfect. This is due to the fact that the relationships between any points in $E$ are preserved after having moved them all by the same amount $y$.


We construct a number $y= 0 dot y_1 y_2y_3 dots $ using only the digits $0$ and $1$. Here we use the notation defined in Section 1.22. The decimals are chosen to be $1$s that are spaced by $0$s. Specifically, starting with one space of $0$ between the first and second $1$, then two $0$s between the second and third $1$, and so on. Below we write the first few digits of the infinite decimal expansion for this number

   $ y = 0.101001000100001000001000000100000001000000001000 dots $

Intuitively, this number is irrational since it is a non-terminating decimal number that does not contain any repetitions.

We can prove this more formally. Suppose that $y$ is rational. Since $y$ has infinite decimals it must be a repeating decimal. Let $i$ be the first index of the decimal where repetition starts and let $rho$ be the length of the period. Hence, for any natural number $k gt.eq i$ it must be true that $x_k = x_(k+m rho)$ for any positive multiple integer $m$ of $rho$, otherwise the decimals would not be repeating.

Since $1$ is in the decimal expansion of $y$, we know that there exists some natural number $j gt.eq n$ such that $x_j = 1$. We have that

                 $ x_j = x_(j+rho) = x_(j + 2rho) = 1. $

This means that the spacing between $1$ is constant $rho$, which contradicts the assumption about $y$ and hence $y$ is irrational.

Now that we have shown that our $y$ is irrational, we need only to prove that for any $x in E$ the number $z = x + y$ is also irrational. Since both $x$ and $y$ are irrational, and cannot be added in such a way to get a terminating decimal expansion, we see that the decimals of $z$ are infinite.

There are two cases we need to verify, whether $x$ is rational or not. If we assume that $x$ is rational, then by Exercise $1.1$ the sum $x + y$ is irrational. Assume therefore that $x$ is irrational.

Suppose, to get a contradiction, that the sum $z = x + y$ is rational.  Since $z$ is rational with an infinite decimal expansion, it follows that $z$ has a repeating decimal. Let $sigma$ be the length of the repetition and $z_i$ the first decimal where the repetition starts.

Take any natural number $k gt.eq i$ such that $y_k = 1$. Since the number of zeros between the $1$s in $y$ are increasing, we know that we can find a natural number $b$ such that $y_(k + b sigma) = 0$. Now we use the fact that $z$ repeats after the $i$-th place

         $ z_k = x_k + y_k = x_(k + b sigma) + y_(k + b sigma). $

Plugging in the values for $y_k$ and $y_(k + b sigma)$ we get the following expression that must be satisfied

#math.equation(block: true, numbering: "(1)")[
    $ x_k + 1 = x_(k + b sigma). $
] <2.17-rel>

Since $x in E$ we know that each decimal of $x$ is either $4$ or $7$. However, the relation @2.17-rel cannot be satisfied using any combination of these two digits, and therefore $z$ cannot be a repeating decimal. This contradicts our assumption about $z$ and the sum $z = x + y$ is thus irrational for every $x in E$.

We have shown that $P$ is a nonempty set of irrational numbers that is perfect as desired.

#qed

=== Exercise 2.19
#quote(block: true)[
     #enum(
        numbering: "(a)",
         enum.item[If $A$ and $B$ are disjoint closed sets in some metric space $X$, prove that they are separated.],
         enum.item[Prove the same for disjoint open sets.],
         enum.item[Fix $p in X$, $delta > 0$, define $A$ to be the set of all $q in X$ for which $d(p, q) < delta$, define $B$ similarly, with $>$ in place of $<$. Prove that $A$ and $B$ are separated.],
         enum.item[Prove that every connected metric space with at least two points is uncountable. _Hint_: Use (c).],
     )
]

(a) If $A$ and $B$ both are closed, then by Theorem 2.27 we have that $overline(A) = A$ and $overline(B) = B$. Therefore

$ A sect overline(B) = overline(A) sect B = A sect B = emptyset, $

since $A$ and $B$ are disjoint. \ \
(b) We prove that the set $A sect overline(B)$ is empty. If $p in B'$, then for every radius $r > 0$ the neighborhood $N_r (p)$ contains points from $B$. Hence, $N(p) subset.not A$ and $p$ is not an interior point of $A$. Because $A$ is open, by definition 2.18 (f) every point of $A$ is an interior point. It follows that $p in.not A$ and therefore $A sect B' = emptyset$. Since $A$ and $B$ are disjoint we have that $A sect overline(B) = emptyset$. With the same argument we can establish that $overline(A) sect B = emptyset$. This show that $A$ and $B$ are separated. \ \
(c) By definition 2.18 (a) and Theorem 2.19 $A$ is open. Now consider the complement of $B$. This set $B^c$ contains all numbers $q$ such that $d(p, q) lt.eq delta$. But this is exactly the closure of $A$, that is $B^c = overline(A)$. The complement to $B$ is therefore closed and by Theorem 2.23 $B$ is open.

The sets $A$ and $B$ are disjoint. For otherwise there exists some point $q in A sect B$ such that $d(p, q) < delta$ and $d(p, q) > delta$, which is absurd.

We have shown that $A$ and $B$ are disjoint open sets, hence they are separated using the result in (b). \ \
(d) We prove the contrapositive. Let $X$ be at most countable and arrange the elements in a sequence ${q_n}$.  If $X$ has less than two points, then $X$ is connected since at least one of the sets $A$ or $B$ will be empty. Hence, assume $X$ has two or more points.

Fix any $p in X$ and enumerate all distances from this point.

#figure(
    table(
        stroke: none,
        columns: 1,
        $d(p, q_1) = d_1$,
        $d(p, q_2) = d_2$,
        $dots.v$,
    )
)

Using Cantor's diagonal process we can construct a real number $delta > 0$ such that $d(p, q_n) eq.not delta$ for all $n in naturals$. We do so in the following manner. Let the $n$-th decimal of $delta$ be the $n$-th decimal of $d_n$ that we increment by $1$ if $d_n$'s $n$-th decimal is less than $9$, otherwise we decrement by $1$. Lastly, we set the integer part of $delta$ to $1$.

This procedure will create a non-negative real number $delta > 0$ that is different to distance $d_k$ in the $k$-th decimal. Hence, there are no points $q in X$ such that $d(p, q) = delta$. Due to this we can write $X$ in terms of the sets $A = {q in X | d(p, q) < delta}$ and $B = {q in X | d(p, q) > delta}$,

$ X = A union B. $

By the result in (c) we have that $A$ and $B$ are separated. It follows therefore that $X$ is not connected.

#qed

=== Exercise 2.20

#quote(block: true)[Are closures and interiors of connected sets always connected? (Look at subsets of $reals^2$.)]

We prove that closures of connected sets are always connected. Let $E$ be a connected subset of a metric space $X$. If $E$ is closed, then by Theorem 2.27 we have that $closure(E) = E$ and it follows that $closure(E)$ is connected. Assume therefore that $E$ is not closed.

Suppose, for the sake of getting a contradiction, the opposite. Then there exists non-empty separated sets $A$ and $B$ such that $closure(E) = A union B$. Since $E$ is connected, one of the intersections $E sect A$ or $E sect B$ must be empty. For otherwise either $A sect closure(B)$ or $closure(A) sect B$ would be non-empty, because each of these sets would contain parts of the connected set $E$. And this would contradict the fact that $closure(E)$ is not connected. Without loss of generalization assume that $E subset A$.

Now consider the non-empty set $B$. Since $E subset A$ and is disjoint with $B$, there exists at least one point $p$ such that $p in E' sect B$. Because $E' subset closure(A)$ this would mean that $p in closure(A) sect B$ so that this intersection is non-empty. But this is a contradiction since we assume that $closure(E)$ is not connected. Hence, closures of connected sets are always connected.

We now turn our attention to interiors of connected sets and show by example that they are not always connected. Let $A = {(x, y) in R^2 | x > 0}$ and $B = {(x, y) in R^2 | x < 0}$. These are disjoint open sets and are separated by Exercise 19 (b).

If $E = A union B union {bold(0)}$, then $E$ is connected. To see this, note that any partition of $E$ into two subsets $F$ and $G$ would contain points from $A$. The only way to make sure the intersections $F sect closure(G)$ and $closure(F) sect G$ are non-empty would be to ensure that $A sect F$ or $A sect G$ is empty. This is because $A$ is connected (the same applies for $B$). Therefore, assume without loss of generalization that $A subset F$ and $B subset G$.

Finally, because $bold(0)$ is a limit point to both $A$ and $B$, no matter where we put this point in $F$ or $G$, we see that exactly one of the intersections $F sect closure(G)$ or $closure(F) sect G$ would be non-empty. And so, $E$ is connected.

Now consider the interior of $E$. The point $bold(0)$ is not an interior point of $E$ and so $interior(E) = A union B$. As we know from before $A$ and $B$ are separated. Therefore, interiors of connected sets are not always connected.

#qed

=== Exercise 2.21

#quote(block: true)[
    Let $A$ and $B$ be separated subsets of some $reals^k$, suppose $bvec(a) in A$ and $bvec(b) in B$, and define

    $ bvec(p)(t) = (1-t) bvec(a) + t bvec(b) $

    for $t in reals$. Put $A_0 = bvec(p)^(-1)(A)$, $B_0 = bvec(p)^(-1)(B)$. [Thus $t in A_0$ if and only if $bvec(p)(t) in A$.]

    #quote(block: true)[
        #enum(
            numbering: "(a)",
            enum.item[Prove that $A_0$ and $B_0$ are separated subsets of $reals$.],
            enum.item[Prove that there exists $t_0 in (0,1)$ such that $bvec(p)(t_0) in.not A union B$.],
            enum.item[Prove that every convex subset of $reals^k$ is connected.]

        )
    ]
]

#enum(
    numbering: "(a)",
    enum.item[Assume the opposite, then at least one of the intersections $A_0 sect closure(B_0)$ or $closure(A_0) sect B_0$ is nonempty. Assume that exists a point $t in A_0 sect closure(B_0)$. Since $t in A_0$ it follows that $bvec(p)(t) in A$. Hence, $bvec(p)(t) in.not B$ because $A$ and $B$ are separated, and we can conclude that $t in.not B_0$. It must be therefore true that $t$ is a limit point of $B_0$, that is $t in A_0 sect B'_0$.

        Let $N$ be a neighborhood around $bvec(p)(t)$ with radius $r > 0$. Since $t$ is a limit point of $B_0$, we can find a point $t' in B_0$ such that the distance $d(t, t') < r / abs(bvec(a) - bvec(b))$. As for the points $bvec(p)(t')$ and $bvec(p)(t)$, the distance between them is

        $
            abs(bvec(p)(t') - bvec(p)(t)) &= abs((1-t') bvec(a) + t' bvec(b) - (1-t) bvec(a) - t bvec(b)) \
                &= abs((t-t') bvec(a) - (t-t') bvec(b)) \
                &lt.eq abs(t' - t) dot.c abs(bvec(a) - bvec(b)) \
                &< r / abs(bvec(a) - bvec(b)) dot.c abs(bvec(a) - bvec(b)) \
                &< r,
        $

        which implies that $bvec(p)(t)$ is a limit point of $B$. This means that $bvec(p)(t) in A sect closure(B)$. And similarly, it can be shown that $bvec(p)(t) in closure(A) sect B$ if $ t in closure(A_0) sect B_0$ is nonempty. But this is a contradiction since $A$ and $B$ are separated. \ \ ],

    enum.item[
        Suppose not, then $bvec(p)(t) in A union B$ whenever $t in (0, 1)$. Since $A_0$ and $B_0$ are separated, the interval $(0, 1)$ belongs to either $A_0$ or $B_0$ exclusively. For otherwise, $(0, 1)$ would be a connected set that is also a union of two nonempty separated sets $(0,1) sect A_0$ and $(0,1) sect B_0$, which is absurd.

        If we assume that the intersection $(0, 1) sect A_0$ is empty, then $(0, 1) subset B_0$. Since $0 in A_0$ and is a limit point of $(0, 1)$, we would get that $closure(A_0) sect B_0 eq.not emptyset$. But this is a contradiction since $A_0$ and $B_0$ are separated.

        If we assume that the intersection $(0, 1) sect B_0$ is empty, then similarly $A_0 sect closure(B_0) eq.not emptyset$ since $1 in B_0$ would be a limit point of $A_0$.

        We have exhausted all possibilities and have seen that they lead to contradiction. Hence, our initial assumption must be wrong and therefore there must exist a $t_0 in (0, 1)$ such that $bvec(p)(t_0) in.not A union B$. \ \ ],

    enum.item[Assume the opposite, and let $E$ be a convex subset of $reals^k$. Then there exists two nonempty separated sets $A$ and $B$ such that $E = A union B$. Take any two points $bvec(a) in A$ and $bvec(b) in B$, then put

        $ bvec(p)(t) = (1-t) bvec(a) + t bvec(b). $

        By the result in (b) we know that there is a number $t_0 in (0, 1)$ such that $bvec(p)(t_0) in.not A union B$, which means that $bvec(p)(t_0) in.not E$. But this is a contradiction since $E$ is supposed to be convex and no such $t_0$ should exist (see Definition 2.17). #qed
    ],
)

=== Exercise 2.22

#quote(block: true)[A metric space is called _separable_ if it contains a countable dense subset. Show that $reals^k$ is separable. _Hint:_ Consider the set of points which have only rational coordinates.]

From Theorem 1.20 (b), we know that $rationals$ is dense in $reals$ and that every point of $reals$ is a limit point of $rationals$. We shall show that the set of points which have only rational coordinates $rationals^k$ is a countable dense subset of $reals^k$.

That $rationals^k$ is countable follows from Theorem 2.13, simply put $A = rationals$ and $B_k$ will be the set of all points with rational coordinates with $k$-dimensions.

It remains to show that any point of $reals^k$ is a limit point of $rationals^k$. Fix $bvec(x) in reals^k$ and let $N$ be a neighborhood around $bvec(x)$ with some chosen radius $r > 0$. Since $rationals$ is dense in $reals$, for every coordinate $x_i in reals$ we can choose rational number $p_i in rationals$ such that the $abs(p_i - x_i) < r / sqrt(k)$. Having done so for $1 lt.eq i lt.eq k$, we can construct the rational number

$ bvec(p) = (p_1, p_2, dots, p_k) in rationals^k. $

Consider now its distance to $bvec(x)$

$ abs(bvec(p) - bvec(x))
    &= sqrt(sum_(i=0)^k (p_i - x_i)^2)
    &lt.eq sqrt(sum_(i=0)^k abs(p_i - x_i)^2)
    & lt sqrt(k dot.c r^2/ k)
    &= r,
$

which means that $bvec(p) in N$, and therefore $bvec(x)$ is a limit point of $rationals^k$. Since the choice of $bvec(x)$ was arbitrary, it follows that every point of $reals^k$ is a limit point of $rationals^k$. This proves that $rationals^k$ is a countable dense subset of $reals^k$, and it follows by definition that $reals^k$ is separable.

#qed

=== Exercise 2.23

#quote(block: true)[A collection ${V_alpha}$ of open subsets of $X$ is said to be a _base_ for $X$ if the following is true: For every $x in X$ and every open set $G subset X$ such that $x in G$, we have $x in V_alpha subset G$ for some $alpha$. In other words, every open set in $X$ is the union of a sub-collection of ${V_alpha}$.

    Prove that every separable metric space has a _countable_ base. _Hint:_ Take all neighborhoods with rational radius and center in some countable dense subset of $X$.]

Since $X$ is separable, it contains a countable dense subset $E$. For every $p in E$ let $W_p$ consists of all neighborhoods with non-negative rational radius $h > 0$

$
    W_p = {N_h (p) | h in rationals, h > 0 }.
$

Each member of $W_p$ is associated with exactly one non-negative rational radius. This means that $W_p$ is countable. By the Corollary to Theorem 2.12 the union

$
    V = union.big_(p in E) W_p
$

is also countable. Hence, the members of $V$ can be arranged in a sequence ${V_alpha}$ where each $alpha$ is a member of some countable set.

It remains to be shown that the collection of open sets ${V_alpha}$ is a base. Let $x$ be any point of $X$ and $G$ be any open subset of $X$ such that $x in G$. Since $x$ is an interior point of $G$, we know that there exists a radius $r > 0$ such that the neighborhood $N_r (x) subset G$.

$E$ is dense in $X$ and therefore we can find a point $p in E$ such that the distance $d(p, x) = delta < r / 2$. Since $rationals$ is dense in $reals$, there exists a $h in rationals$ such that $delta < h < r / 2$ by Theorem 1.20.

For this $p$ and rational radius $h$ there exists a neighborhood $V_alpha$ in the collection. Because the distance $d(x, p) = delta < h$ we have that $x in V_alpha$. In fact, for any point $y in V_alpha$ we have that

$
    d(y, x) & lt.eq d(y, p) + d(p, x) lt h + delta < 2 dot.c r / 2 = r,
$

which implies $y in N_r (x)$ and therefore $V_alpha subset N_r (x)$. Since the choice of $x$ and $G$ were arbitrary it follows that the collection ${V_alpha}$ is a countable base of $X$.

#qed

=== Exercise 2.24

#quote(block: true)[
    Let $X$ be a metric space in which every infinite subset has a limit point. Prove that $X$ is separable. _Hint:_ Fix $delta > 0$, and pick $x_1 in X$. Having chosen $x_1, dots, x_j in X$, choose $x_(j+1) in X$, if possible, so that $d(x_i, x_(j+1)) gt.eq delta$ for $i = 1, dots, j$. Show that this process must stop after a finite number of steps, and that $X$ can therefore be covered by finitely many neighborhoods of radius $delta$. Take $delta = 1/n$ ($n=1, 2, 3, dots$), and consider the centers of the corresponding neighborhoods.
]

We begin by showing that the process in the hint must stop after a finite number of steps. Assume the opposite to get a contradiction. Then the process never stops and the set of the chosen points

$
    A = {x_1, x_2, x_3, dots}

$

is infinite. By construction of $A$ it is true that for any two points $x_n, x_m in A$ such that $m eq.not n$, the distance is $d(x_m, x_n) gt.eq delta$. This implies that no point of $A$ is a limit point of $A$.

Let $y$ be a point in the complement of $A$. If $y$ is such that $d(y, x_i) = r < delta / 2$ for some $x_i in A$, then for any natural number $j eq.not i$ we have that

$
    d(x_j, x_i) lt.eq d(x_j, y) + d(y, x_i) lt d(x_j, y) + delta slash 2
$

which after rearranging

$
    d(x_j, y) gt d(x_j, x_i) - delta slash 2 gt.eq delta - delta slash 2 = delta slash 2.
$

Hence, the neighborhood with center in $y$ and radius $h < r$ would contain no point of $A$.  But this is absurd, since that would make $A$ an infinite subset of $X$ that has no limit point.
