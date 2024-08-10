#let first-indent-spacing = 1.8em
#let indent = h(first-indent-spacing)
#set page(margin: 1.75in)
#set par(leading: 0.55em, first-line-indent: first-indent-spacing, justify: true)
#set text(size: 11pt, font: "New Computer Modern")
#show raw: set text(font: "New Computer Modern Mono")
#show par: set block(spacing: 0.55em)
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

== Chapter 2
=== Exercise 1
#quote(block: true)[Prove that the empty set is a subset of every set.]

Let $A$ be any set, $emptyset$ be the empty set and assume the opposite. Then there exists at least one element $x in emptyset$ such that $x in.not A$. But the empty set does not contain any elements and no such $x$ can therefore be found. This is a contradiction and hence $emptyset subset A$ must be true.

#qed

=== Exercise 2
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

=== Exercise 3
#quote(block: true)[Prove that there are real numbers which are not algebraic.]

Suppose not. Let $algebraicset$ be the set of all algebraic numbers. Since we assume the opposite any real number is algebraic and it follows that $reals subset algebraicset$.

From Exercise 2.2 we know that $algebraicset$ is countable. By Theorem 2.8 this would entail that $reals$ is countable, since it is an infinite subset of a countable set. But this is a contradiction since Theorem 2.43 shows that $reals$ is uncountable. Hence our assumption is false and there exists real numbers $x in reals$ such that $x in.not algebraicset$.

#qed

=== Exercise 4
#quote(block: true)[Is the set of all irrational real numbers countable?]

Denote the set of irrational numbers by $irrationals$. According to Theorem 2.13 $rationals$ is countable. Now suppose $irrationals$ is countable. We already know that

$ reals = rationals union irrationals, $

which means that $reals$ is countable by Theorem 2.12. But this is a contradiction since by Theorem 2.43 the set of real numbers $reals$ is uncountable. If $irrationals$ is assumed to be finite, then that still would make $reals$ countable. Hence, $irrationals$ must be uncountable.

#qed

=== Exercise 5
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

=== Exercise 6
#quote(block: true)[Prove that $E'$ is closed. Prove that $E$ and $overline(E)$ have the same limit points. Do $E$ and $E'$ always have the same limit points?
]

We first prove that $E'$ is closed. If $x$ is a limit point of $E'$ then for any neighborhood $N_r (x)$ with radius $r > 0$ there exists a $y in E'$ such that $y in N_r (x)$. Since $y in E'$ we know that $y$ is a limit point of $E$. Hence, we can find a $z in E$ such that $z in N_(r-h) (y)$ with $0 < h < r$. We have that

$ d(z, x) lt.eq d(z, y) + d(y, x) < r - h + h = r, $

which means that $z in N_r (x)$ so that $x in E'$.

Next we show that $overline(E)$ and $E$ have the same limit points. If $x$ is a limit point of $overline(E)$, then since $overline(E) = E' union E$, it must be the case that $x$ is a limit point of $E'$ or $E$. Assuming $x$ is a limit point of $E$ leaves us with nothing to prove. So we suppose that $x$ is a limit point of $E'$ alone. We already have established that $E'$ is closed, and therefore $x in E'$. This in turn directly implies that $x$ is a limit point of $E$ because the members of $E'$ are all limit points of $E$.

Conversely, if $y$ is a limit point of $E$ then we know that $y in E'$. Since $overline(E) = E' union E$ it follows that $y in overline(E)$ and is a limit point of $overline(E)$.

Lastly, we show that $E$ and $E'$ do not always have the same limit points. Let $E = { 1/2, 1/3, 1/4, dots }$ and note $0$ is the only limit point of $E$. This means that $E' = { 0 }$. We know by Corollary to Thm. 2.20 that $E'$ has no limit points. This shows the result by example.

#qed

=== Exercise 7
#quote(block: true)[
    Let $A_1, A_2, A_3,dots$ be subsets of a metric space.
    #enum(
        numbering: "(a)",
        enum.item[If $B_n = union_(i=1)^n A_i$, prove that $overline(B)_n = union_(i=1)^n overline(A)_i$.],
        enum.item[If $B = union_(i=1)^infinity A_i$, prove that $overline(B) supset union_(i=1)^infinity overline(A)_i$.]
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

where we used the result in (a) to get the second equality. This implies that $x in overline(B)$. Since $x$ is arbitrary it follows that $union.big_(i=1)^infinity overline(A)_i subset overline(B)$ as desired.

We shall conclude by showing that this subset can indeed be proper. Let $A_i = {1/2, 1/3, dots, 1/i}$ and note that there exists no $k in naturals$ such that $0 in A_k$. Thus $0 in.not union.big_(i=1)^infinity A_i$. Furthermore, each set $A_i$ has no limit points which is why $overline(A)_i = A_i$, and therefore $union.big_(i=1)^infinity overline(A)_i = union.big_(i=1)^infinity A_i$. It follows then that $0 in.not union.big_(i=1)^infinity overline(A_i)$. Now let's consider $overline(B)$

$
    overline(B) &=
    overline(union.big_(i=1)^infinity A_i) =
    overline( { 1/2, 1/3, dots } ) =
    { 0, 1/2, 1/3, dots },
$

which implies that $0 in overline(B)$. Since $0 in.not union.big_(i=1)^infinity
overline(A_i)$ we've shown that the inclusion can be proper.

#qed

=== Exercise 8
#quote(block: true)[Is every point of every open set $E subset reals^2$ a limit point of $E$? Answer the same question for closed sets in $reals^2$.]

We first show that every point in every open set $E subset reals^2$ is a limit point of $E$. Suppose not. Then there exists an open set $E subset reals^2$ with a point $x in E$ that is not a limit point of $E$. It follows that there exists an $r > 0$ such that the neighborhood $N_r (x)$ contains no point of $E$ except $x$.

Since $E$ is an open set, $x$ must be an interior point. Hence, there is a neighborhood with radius $s > 0$ such that $N_s (x) subset E$. Neighborhoods in $reals^2$ are non-empty interiors of circles, which means that $N_r$ is circle centered at $x$.

Consider the cases for $r$ and $s$:

+ If $r > s$ then $N_s$ is a circle inscribed in a larger circle $N_r$. This implies $N_s subset N_r$. Consequently, there exists points $y in N_s subset N_r subset E$ where $y eq.not x$. However, this contradicts our assumption that $N_r (x)$ contains no points of $E$ other than $x$.

+ If $r lt.eq s$, then $N_r$ is inscribed in $N_s$. Given that $N_s$​ is non-empty circle such that $N_s subset E$, it follows that $N_s$ contains points of $E$ arbitrarily close to its center point $x$. In particular, for any distance $0 < d < r$, there are points $y in E$ where $y eq.not x$ such that $y in N_s$. Since $N_r subset N_s$, these $y$ must be a point of $N_r$ because $d < r$. This contradicts our assumption that $x$ is not a limit point of $E$.


Since none of the relations $r < s$, $r = s$ and $r > s$ can be true, such an $r$ cannot exists. We've reached a contradiction and the assumption is wrong. Hence, each point of $E$ is a limit point of $E$.

Now we show that the case does not hold true in general for closed sets. Consider the set of all natural numbers $naturals subset reals^2$. This set is closed, yet every point in this set is not a limit point of it.

#qed

=== Exercise 9
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

Conversely, if $interior(E) = E$ then all points in $E$ are interior points of $E$. This is true since $interior(E)$ is the set of all interior points of $E$. Thus, by definition 2.18 (f), $E$ is an open set. \ \



(c) If $G$ is open, then for every point $p in G$ we can find a neighborhood $N(p)$ with $r > 0$ such that $N(p) subset G$. Since $G subset E$, we have that $N(p) subset E$, which shows that $p$ is an interior point of $E$. Hence, $p in interior(E)$. Therefore, $G subset interior(E)$ since $p$ was arbitrary chosen from $G$. \ \



(d) Let $x$ be any point in $(interior(E))^c$. First we show that $(interior(E))^c subset overline(E^c)$. Suppose that $x in.not E$. Then

$ x in E^c subset E^c union E^c' = overline(E^c). $

Now let $x in E$. Since $x$ is in the complement of $interior(E)$, we know that $x$ is not an interior point of $E$. Therefore, for every neighborhood $N(x)$ with radius $r > 0$, we have that $N(x) subset.not E$. This means that $N(x)$ always has points in $E^c$, which makes $x$ a limit point of $E^c$. Thus, $x in E^c' subset overline(E^c)$. This shows that $(interior(E))^c subset overline(E^c)$.

Conversely, let $p in overline(E^c) = E^c union E^c'$ . Then it is clear that either $p in E^c$ or $p in E^c'$. Assume $p in E^c$. Then we know that $p$ is not an interior point to $E$, so $p in.not interior(E)$, which implies that $p in (interior(E))^c$. If $p in E^c'$, then it is a limit point of $E^c$, and therefore every neighborhood $N(p)$ with radius $r > 0$ have points (other than $p$) from $E^c$. Hence, there is no neighborhood such that $N(p) subset E$ which means that $p$ cannot be an interior point of $E$. Therefore, $p in (interior(E))^c$, and we have now shown that $overline(E^c) subset (interior(E))^c$. \ \



(e) Let $E = (0, 1) union (1, 2)$ be a set consisting of line segments in $reals$. Since $E$ is open we have that $interior(E) = E$ by (b). The set of limit points of $E$ are ${0, 1, 2}$, so the closure $overline(E)$ is the closed interval $[0, 2]$. From here we can see that $interior((overline(E))) = (0, 2)$, which shows that $ interior(E) eq.not interior((overline(E)))$. Therefore, $E$ and $overline(E)$ do not always have the same interiors. \ \



(f) Consider the set $E = {1/n | n = 1, 2, 3, dots}$ as subset of $reals$. Since $0$ is the only limit point of $E$, we have that its closure is $overline(E) = E union {0}$. However, none of the points in $E$ are interior points, and therefore $interior(E) = emptyset$. This means that $overline(interior(E)) = emptyset$. We have shown that $overline(E) eq.not overline(interior(E))$ as desired.

#qed

=== Exercise 10
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

=== Exercise 11
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
$d_5$) Conditions in (a), (b) are clearly satisfied so we focus on (c). Throughout this exercise WLOG assume $x lt.eq y$. Suppose $x lt.eq r lt.eq y$, we have that

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

=== Exercise 12
#quote(block: true)[
    Let $K subset reals$ consist of 0 and the numbers $1 slash n$, for $n = 1, 2, 3, dots$ . Prove that $K$ is compact directly from the definition (without using the Heine-Borel theorem).
]

Let ${G_alpha}$ be any open cover of $K$. Then we know that there is an index $alpha_0$ such that $0 in G_(alpha_0)$. Since $G_(alpha_0)$ is an open set, we know that there exists a neighborhood $N_r (0)$ with radius $r > 0$ where $N_r subset G_(alpha_0)$.

If $r gt.eq 1$, then $G_(alpha_0)$ covers $K$ and there is nothing to prove. Assume therefore that $r < 1$. By Archimedean property of $reals$ we can find positive integers $p$ such that $r gt.eq 1 slash p$. Let $m$ be the smallest integer such that $r gt 1 slash m$. It follows that if $q$ is an integer where $q > m$, then $r > 1 slash q$ so that $1 slash q in N_r (0)$. This shows that there are at most $m-1$ points in $E$ that are not in $N_r$,

$ 1/(m-1), 1/(m-2), dots, 1/2, 1. $ \

Let $G_(alpha_k)$ denote an open set in the collection ${G_alpha}$ such that $1 slash k in G_(alpha_k)$ $(k = 1, 2, 3, dots)$. Because ${G_alpha}$ is an open cover of $K$, each of the above $m-1$ points can be associated this way to at least one index (not necessarily distinct) in the collection. Therefore

$ K subset G_(alpha_0) union G_1 union dots.c union G_(alpha_(m-1)). $

We have shown that any open cover of $K$ has a finite sub-cover which implies that $K$ is compact as desired.

#qed

=== Exercise 13
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


=== Exercise 14
#quote(block: true)[Give an example of an open cover of the segment $(0, 1)$ which has no finite sub-cover.]

Let $G_n$ be the open set on the form $(1 slash n, 1)$ for any natural number $n$. The collection ${G_n}$ is an open cover of $(0, 1)$

$ union.big_(n=1)^infinity G_n = union.big_(n=1)^infinity (1 slash n, 1) = (0, 1). $

Choose finitely many indices $n_1, n_2, dots, n_m$ and let $p$ be the largest index among them. If $x$ is the midpoint between $0$ and $1/p$, then $x in.not G_p$. Since $G_(n_k) subset G_p$ ($k=1, 2, dots, m$) we see that

$ x in.not G_(n_1) union G_(n_2) union dots.c union G_(n_m), $

yet clearly $x in (0, 1)$. This shows that the union constructed with indices $n_k$ ($k=1, 2, dots, m)$ cannot be a sub-cover of $(0, 1)$. The choice of indices were arbitrary, therefore there does not exist a finite sub-cover of $(0, 1)$ using the open cover ${G_n}$.

#qed


=== Exercise 15
#quote(block:true)[Show that Theorem 2.36 and its Corollary become false (in $reals$, for example) if the word "compact" is replaced by "closed" or by "bounded."]

We first show that "compact" cannot be replaced by closed. Consider the set of natural numbers starting from the positive integer $n$ and beyond

$ E_n = {n, n+1, n+2, dots}. $

Each set in the collection ${E_n}$ is closed relative to $reals$ and is unbounded. Since we have that $E_n supset E_(n+1)$ ($n = 1, 2, 3, dots$) any finite sub-collection of ${E_n}$ is non-empty. However, the countable intersection

$ E = sect.big_(n=1)^infinity E_n, $

is empty. To see this, note that for any natural number $m$ we have that $m in.not E_n$ whenever $m < n$. Hence, there exists no natural number $m$ which belongs to all sets in the collection ${E_n}$ and it follows that the intersection is empty.


Now we show that the word "compact" cannot be replaced by "bounded." Let $A_n$ be the set that consists of numbers

$ A_n = { 1/n , 1/(n+1), 1/(n+2), dots }. $

This set is bounded by $1$ and is not closed since it does not contain its limit point $0$. We also have that $A_n supset A_(n+1)$ for $n=1, 2, 3, dots$ and hence any finite sub-collection will be non-empty. The countable intersection

$ A = sect.big_(n=1)^infinity A_n, $

is, however, empty. This can be proven with similar argument as for why the intersection $E$ is empty. We have shown that the word "compact" cannot be replaced by "bounded."

#qed


=== Exercise 16
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

=== Exercise 17
#quote(block: true)[Let $E$ be the set of all $x in [0, 1]$ whose decimal expansion contains only the digits $4$ and $7$. Is $E$ countable? Is $E$ dense in $[0, 1]$? Is $E$ compact? Is $E$ perfect?]

That $E$ is not countable can be shown using Cantor's diagonal process. Simply exchange $0$, $1$ with $4$, $7$ respectively in Theorem 2.14 and its proof. Alternatively, if we can show that $E$ is perfect then by Theorem 2.43 $E$ is uncountable.

$E$ is not dense in $[0, 1]$ since $0$ is neither a limit point of $E$, nor a point of $E$.

Since $E subset [0, 1]$ we know it is a subset of a compact set by Theorem 2.40. According to Theorem 2.35, it suffices to show that $E$ is closed to prove that $E$ is compact. Suppose $x in.not E$ and write the decimal expansion of $x$ using the notation from Section 1.22,

$ x_0 dot x_1x_2x_3 dots $

Recall that $x_0$ is the largest integer such that $x_0 lt.eq x$. Then there exists a first integer $n$ such that $x_n$ is neither $4$, nor $7$. Let $p$ be a point of $E$ that has the same decimal expansion as $x$ up to $n$,

$ p = 0.p_1 p_2 p_3 dots  $

Hence, $p_k = x_k$ for $k = 1, 2, dots, n - 1$ and $abs(x_n - p_n) gt.eq 1$. Now choose the rest of the decimals $p_i$ for $i gt.eq n$ so as to minimize the distance to $x$. We do so by choosing $p_i$ to be either $4$ or $7$, whichever is the closest to $x_i$.

Having done so, we claim that the distance

$ d = abs(x - p), $

cannot be less than $2 dot.c 1 / 10^(n+1)$. For if $abs(x_n - p_n) = 1$ and we borrow from it to complete the subtraction, then we see that $abs(x_(n+1) - p_(n+1)) gt.eq 3$. Which in turn if we borrow again from gives us that the decimal place of $d$ at $n+1$ would be greater than or equal to $2$, that is $d_(n+1) gt.eq 2$. Any neighborhood $N(x)$ with radius $r = 1 / 10^(n+1) < d$ would contain no point of $E$. Hence, $E$ must be closed and it follows by Theorem 2.35 that $E$ is compact.

Now we prove that $E$ is indeed perfect. Since we already have shown that $E$ is closed, we need only to show that no point of $E$ is isolated. For any $q in E$ let $N(q)$ be some neighborhood with radius $r >0$. Choose any integer $k > 0$ such that $10^(-k) < r$. Suppose $p$ is a number with the exact same decimal expansion as $q$ except at the decimal place $k+1$, for which we choose either $4$, or $7$ such that $p_(k+1) eq.not q_(k+1)$. Clearly, $p in E$ and we have that

$ abs(p - q) & = abs(p_(k+1) - q_(k+1)) dot.c 1 / 10^(k+1) \
    &= 3 dot.c 1 / 10^(k+1) = 3 / 10 dot.c 10^(-k) \ &< 3 / 10 dot.c r. $

Thus, $p$ is a limit point of $E$ and we have shown that $E$ is perfect.

#qed
