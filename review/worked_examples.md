# Lec 6–7 配套例题与自测

本文件包含 18 道带解答例题和 8 道自测题。标注“课件题”的题干取自指定课件，解答重新组织；“改编题”和“补充题”为围绕课件知识点编写。页码为 PDF 页码。建议先遮住解答独立完成，再比较中间步骤。

约定：$\lambda$ 为空串，栈串左端为栈顶；PDA 默认终态接受且必须读完输入，未列出的转移均不存在。转移表中 `输入 λ` 表示不消耗输入，`替换 λ` 表示弹出栈顶。

## 例题 1：完整替换与部分替换

**来源：**Lec 6 pp. 3–7，改编。**目标：**区分“展开一个候选式”与“删除原规则”。

给定 $S\to aBc, B\to b\mid dD, D\to d$，消去 $S$ 规则中的 $B$。

**解：**必须同时代入 $B$ 的两个候选式：

$$S\to abc\mid adDc.$$

再展开 $D$，得到 $S\to abc\mid addc$。若只加了 $S\to abc$ 就删掉 $S\to aBc$，会漏掉 `addc`。检查原文法和结果都恰好生成这两个串。

## 例题 2：间接可空与全部删除组合

**来源：**Lec 6 p. 13 Example 6.5，课件题。

$$S\to ABaC,\quad A\to BC,\quad B\to b\mid\lambda,
\quad C\to D\mid\lambda,\quad D\to d.$$

消除空产生式。

**解：**第一轮得到 $\{B,C\}$，第二轮由 $A\to BC$ 得到 $A$；$S$ 的规则含终结符 $a$，所以 $S$ 不可空。最终可空集合为 $\{A,B,C\}$。

在 $S\to ABaC$ 中有三个可空位置，得到八个不同的非空右侧：

$$S\to ABaC\mid BaC\mid AaC\mid ABa\mid aC\mid Ba\mid Aa\mid a.$$

$A\to BC$ 可生成 $BC,B,C,\lambda$，只保留前三个。因此结果为

$$A\to BC\mid B\mid C,\quad B\to b,\quad C\to D,\quad D\to d,$$

再加上上述 $S$ 规则。这里仍有单位产生式；题目只要求消空，若继续化简，应在下一步消单位。

**易错补充：**若规则是 $S\to AA$ 且 $A$ 可空，两个位置必须分别考虑；候选式为 $AA,A,\lambda$，其中两个单独删除的结果合并成一个 $A$。

## 例题 3：带环的单位闭包

**来源：**Lec 6 pp. 20–21 Example 6.6，课件题。

$$S\to Aa\mid B,\quad B\to A\mid bb,\quad A\to a\mid bc\mid B.$$

**解：**单位边为 $S\to B,B\to A,A\to B$，因此

$$U(S)=\{S,A,B\},\quad U(A)=U(B)=\{A,B\}.$$

非单位规则为 $S\to Aa,B\to bb,A\to a\mid bc$。按闭包复制，得到

$$S\to Aa\mid a\mid bc\mid bb,$$
$$A\to a\mid bc\mid bb,\qquad B\to a\mid bc\mid bb.$$

若还要求无无用变量，$B$ 已不可达，可再删除；但“消单位”的结果本身已经正确。

## 例题 4：先生成、后可达

**来源：**Lec 6 pp. 26–30 Example 6.3，课件题。

$$S\to aS\mid A\mid C,\quad A\to a,\quad B\to aa,\quad C\to aCb.$$

**解：**最初可生成终结符串的是 $A,B$；由于 $S\to A$，加入 $S$。$C$ 没有终止规则，不能生成纯终结符串，删除 $C$ 及 $S\to C$。

在剩余文法中，从 $S$ 只能到达 $S,A$，故删除 $B$。最终：

$$S\to aS\mid A,\qquad A\to a.$$

它生成 $a^+$。若继续消单位，可写成等价的 $S\to aS\mid a$。

## 例题 5：CNF 的终结符替换与二叉化

**来源：**Lec 6 pp. 36–40 Example 6.8，课件题。

$$S\to ABa,\qquad A\to aab,\qquad B\to Ac.$$

**解：**引入 $T_a\to a,T_b\to b,T_c\to c$，得到 $S\to ABT_a,A\to T_aT_aT_b,B\to AT_c$。前两条仍有三个变量，再二叉化：

$$S\to AX_1,\quad X_1\to BT_a,$$
$$A\to T_aX_2,\quad X_2\to T_aT_b,\quad B\to AT_c,$$
$$T_a\to a,\quad T_b\to b,\quad T_c\to c.$$

所有规则均符合 CNF。原文法唯一生成 `aabaabca`：$A$ 生成 `aab`，$B$ 生成 `aabc`，最后再接 `a`。新文法保留同样的串及符号顺序。

## 例题 6：完成 Lec 6 第 63 页 CNF 小测

**来源：**Lec 6 pp. 63–64，课件题。

$$S\to AB\mid aB,\qquad A\to abb\mid\lambda,\qquad B\to bbA.$$

**第一步，消空。**只有 $A$ 可空：

$$S\to AB\mid B\mid aB,\quad A\to abb,\quad B\to bbA\mid bb.$$

**第二步，消单位。**将 $B$ 的非单位规则复制给 $S$：

$$S\to AB\mid aB\mid bbA\mid bb.$$

**第三步，转换 CNF。**设 $T_a\to a,T_b\to b,C\to T_bT_b,D\to T_aT_b$。则一个完整答案为

$$S\to AB\mid T_aB\mid CA\mid T_bT_b,$$
$$A\to DT_b,\qquad B\to CA\mid T_bT_b,$$
$$C\to T_bT_b,\quad D\to T_aT_b,\quad T_a\to a,\quad T_b\to b.$$

**语义检查：**原语言恰为

$$\{bb,\ bbabb,\ abbbb,\ abbbbabb,\ abb,\ abbabb\}.$$

例如 $S\Rightarrow AB\Rightarrow B\Rightarrow bb$ 在新文法中由 $S\Rightarrow T_bT_b\Rightarrow bb$ 实现；空串不在原语言中，结果也不应生成空串。

## 例题 7：两种简单 GNF 转换

**来源：**Lec 6 pp. 49–50 Examples 6.9–6.10，课件题。

**题 A：**$S\to AB,A\to aA\mid bB\mid b,B\to b$。

将 $S$ 开头的 $A$ 展开：

$$S\to aAB\mid bBB\mid bB.$$

$A,B$ 的规则已经是 GNF，原样保留。

**题 B：**$S\to abSb\mid aa$。

引入 $T_a\to a,T_b\to b$，得到

$$S\to aT_bST_b\mid aT_a,\qquad T_a\to a,\qquad T_b\to b.$$

不能把第一个 $a$ 也换成变量，否则规则又以变量开头。生成 `aa` 的 GNF 推导为 $S\Rightarrow aT_a\Rightarrow aa$，恰好两步。

## 例题 8：完整 CYK 表与一次拒绝判定

**来源：**Lec 6 pp. 57–62，课件题及补充。

$$S\to AB,\qquad A\to BB\mid a,\qquad B\to AB\mid b.$$

判断 `aabbb` 是否属于该语言。

**解：**终结符反查为 $a\mapsto\{A\},b\mapsto\{B\}$；二元反查为 $AB\mapsto\{S,B\},BB\mapsto\{A\}$。

表格按子串长度排列；每一行从左到右对应起点 $1,2,\ldots$。

| 长度 | 起点 1 | 起点 2 | 起点 3 | 起点 4 | 起点 5 |
|---|---|---|---|---|---|
| 1 | $\{A\}$ | $\{A\}$ | $\{B\}$ | $\{B\}$ | $\{B\}$ |
| 2 | $\varnothing$ | $\{S,B\}$ | $\{A\}$ | $\{A\}$ | — |
| 3 | $\{S,B\}$ | $\{A\}$ | $\{S,B\}$ | — | — |
| 4 | $\{A\}$ | $\{S,B\}$ | — | — | — |
| 5 | $\{S,B\}$ | — | — | — | — |

例如子串 `abb`：切为 `a|bb` 得到 $AA$，无对应规则；切为 `ab|b`，左边含 $B$、右边含 $B$，由 $A\to BB$ 加入 $A$。所以该格是 $\{A\}$。

最顶格含 $S$，故接受。一个推导见证为

$$S\Rightarrow AB\Rightarrow aB\Rightarrow aAB
\Rightarrow aaB\Rightarrow aaAB\Rightarrow aaBBB
\Rightarrow aabBB\Rightarrow aabbB\Rightarrow aabbb.$$

**补充：**`aabb` 的顶格是 $\{A\}$，虽然非空，但没有 $S$，故拒绝。

## 例题 9：正确执行一条 NPDA 转移

**来源：**Lec 7 p. 21 Example 7.1，改编。

设 $\delta(q_1,a,b)=\{(q_2,cd),(q_3,\lambda)\}$，当前 ID 为 $(q_1,ab,bz)$。下一步有哪些可能？

**解：**两条分支分别为

$$(q_1,ab,bz)\vdash(q_2,b,cdz),$$
$$(q_1,ab,bz)\vdash(q_3,b,z).$$

两者都消费第一个 `a`。第一条新栈顶是 `c`；第二条只弹出 `b`，不是清空整个栈。若原栈顶是 `a`，这条转移根本不能使用。

## 例题 10：构造接受 $a^nb^n$ 的 DPDA

**来源：**Lec 7 pp. 22–46、153，按标准转移形式重写。$n\ge0$。

取状态 $q_0,q_a,q_b,f$，$F=\{q_0,f\}$，初始栈为 $z$。

| 当前状态 | 输入 | 栈顶 | 下一状态 | 替换串 |
|---|---|---|---|---|
| $q_0$ | $a$ | $z$ | $q_a$ | $Az$ |
| $q_a$ | $a$ | $A$ | $q_a$ | $AA$ |
| $q_a$ | $b$ | $A$ | $q_b$ | $\lambda$ |
| $q_b$ | $b$ | $A$ | $q_b$ | $\lambda$ |
| $q_b$ | $\lambda$ | $z$ | $f$ | $z$ |

`aabb` 的运行：

$$(q_0,aabb,z)\vdash(q_a,abb,Az)\vdash(q_a,bb,AAz)$$
$$\vdash(q_b,b,Az)\vdash(q_b,\lambda,z)\vdash(f,\lambda,z).$$

空串在初态直接接受。`aab` 结束时栈为 $Az$，停在非终态 $q_b$；`abb` 在栈回到底部后仍有输入，不能接受；`abab` 在 $q_b$ 无读 `a` 的规则。唯一 $\lambda$ 转移对应 $(q_b,z)$，同一组合没有读输入边，故为 DPDA。

## 例题 11：任意顺序下 $a,b$ 数量相等

**来源：**Lec 7 pp. 47–56，改编。语言为 $\{w\in\{a,b\}^*:n_a(w)=n_b(w)\}$。

工作状态 $q$、终态 $f$，$F=\{f\}$。在 $q$ 上定义：

| 输入 | 栈顶 | 替换串 |
|---|---|---|
| $a$ | $z$ | $Az$ |
| $a$ | $A$ | $AA$ |
| $a$ | $B$ | $\lambda$ |
| $b$ | $z$ | $Bz$ |
| $b$ | $B$ | $BB$ |
| $b$ | $A$ | $\lambda$ |

再加 $\delta(q,\lambda,z)=\{(f,z)\}$，$f$ 无出边。读 `abba` 时栈依次为

$$z\to Az\to z\to Bz\to z.$$

最后走到 $f$ 接受。由于同一 $(q,z)$ 有读输入边与 $\lambda$ 边，这个具体构造是 NPDA，不能称为 DPDA；也不能因此推断语言不是 DCFL。提前走到 $f$ 且输入未读完的分支失败，不影响另一分支接受。

## 例题 12：无分隔符与有分隔符的回文

**来源：**Lec 7 pp. 57–77 与 p. 91 第一题。

对 $L_1=\{ww^R:w\in\{a,b\}^*\}$，使用压栈态 $p$、匹配态 $r$、终态 $f$。对 $X\in\{a,b,z\}$：

$$\delta(p,a,X)\ni(p,aX),\quad\delta(p,b,X)\ni(p,bX),$$
$$\delta(p,\lambda,X)\ni(r,X).$$

另有

$$\delta(r,a,a)=\{(r,\lambda)\},\quad\delta(r,b,b)=\{(r,\lambda)\},$$
$$\delta(r,\lambda,z)=\{(f,z)\}.$$

`abba` 的接受路径：

$$(p,abba,z)\vdash(p,bba,az)\vdash(p,ba,baz)$$
$$\vdash(r,ba,baz)\vdash(r,a,az)\vdash(r,\lambda,z)\vdash(f,\lambda,z).$$

对 $L_2=\{wcw^R:w\in\{a,b\}^*\}$，把 $p$ 到 $r$ 的全部 $\lambda$ 边改为读 `c`、保留栈顶的边。此时机器是 DPDA，因为分隔符唯一决定切换时机。

边界：$L_1$ 接受空串；$L_2$ 接受 `c`，不接受空串。`abcba` 属于 $L_2$；`abca` 因匹配失败被拒绝；第二个 `c` 在匹配阶段没有对应规则。

## 例题 13：$a^nb^mc^{n+m}$ 的完整构造

**来源：**Lec 7 p. 91 第二题，$n,m\ge0$。

使用初态 $q_0$、$a$ 阶段 $p$、$b$ 阶段 $q$、$c$ 阶段 $r$、终态 $f$，$F=\{q_0,f\}$。

| 当前状态 | 输入 | 栈顶 | 下一状态 | 替换串 |
|---|---|---|---|---|
| $q_0$ | $a$ | $z$ | $p$ | $Xz$ |
| $q_0$ | $b$ | $z$ | $q$ | $Xz$ |
| $p$ | $a$ | $X$ | $p$ | $XX$ |
| $p$ | $b$ | $X$ | $q$ | $XX$ |
| $q$ | $b$ | $X$ | $q$ | $XX$ |
| $p$ | $c$ | $X$ | $r$ | $\lambda$ |
| $q$ | $c$ | $X$ | $r$ | $\lambda$ |
| $r$ | $c$ | $X$ | $r$ | $\lambda$ |
| $r$ | $\lambda$ | $z$ | $f$ | $z$ |

读 `abbccc` 的栈依次为 $z,Xz,XXz,XXXz,XXz,Xz,z$。状态限制保证不能在 $b$ 之后读 $a$，也不能在 $c$ 之后读 $a$ 或 $b$。

接受：空串、`ac`、`bc`、`abbccc`。拒绝：`c`、`abccc`、`bacc`。这台机器也满足 DPDA 两项条件。

## 例题 14：CFG 转 NPDA 的两条路线

**来源：**Lec 7 pp. 101、103–117，课件题。

**A. 通用方法。**给定 $S\to aSTb\mid b,T\to Ta\mid\lambda$。

初始化把 $z$ 换成 $Sz$。工作态 $q$ 上有四条变量展开规则：

$$\delta(q,\lambda,S)=\{(q,aSTb),(q,b)\},$$
$$\delta(q,\lambda,T)=\{(q,Ta),(q,\lambda)\}.$$

终结符匹配规则为 $\delta(q,a,a)=\{(q,\lambda)\}$ 和 $\delta(q,b,b)=\{(q,\lambda)\}$。只剩 $z$ 时进入无出边终态 $f$。

输入 `abab` 的工作态运行如下，每行都写剩余输入与栈：

| 步骤 | 剩余输入 | 栈 | 使用的操作 |
|---|---|---|---|
| 初始化后 | `abab` | $Sz$ | 压入开始变量 |
| 1 | `abab` | $aSTbz$ | $S\to aSTb$ |
| 2 | `bab` | $STbz$ | 匹配 $a$ |
| 3 | `bab` | $bTbz$ | $S\to b$ |
| 4 | `ab` | $Tbz$ | 匹配 $b$ |
| 5 | `ab` | $Tabz$ | $T\to Ta$ |
| 6 | `ab` | $abz$ | $T\to\lambda$ |
| 7 | `b` | $bz$ | 匹配 $a$ |
| 8 | 空串 | $z$ | 匹配 $b$ |

最后进入 $f$。对应最左推导为 $S\Rightarrow aSTb\Rightarrow abTb\Rightarrow abTab\Rightarrow abab$。

**B. GNF 方法。**给定 $S\to aSbb\mid a$，先变为

$$S\to aSA\mid a,\quad A\to bB,\quad B\to b.$$

工作态的读输入转移为

$$\delta(q,a,S)=\{(q,SA),(q,\lambda)\},$$
$$\delta(q,b,A)=\{(q,B)\},\qquad\delta(q,b,B)=\{(q,\lambda)\}.$$

初始化与结束规则同上。语言为 $\{a^{k+1}b^{2k}:k\ge0\}$，例如接受 `a`、`aabb`。这里 $S\to aSA$ 对应替换串 $SA$，不能反写成 $AS$。

## 例题 15：从 NPDA 转 CFG 并清理变量

**来源：**Lec 7 pp. 141–144 Example 7.8，课件题并补全化简。

原机器有

$$\delta(q_0,a,z)=\{(q_0,Az)\},\quad
\delta(q_0,a,A)=\{(q_0,A)\},$$
$$\delta(q_0,b,A)=\{(q_1,\lambda)\},\quad
\delta(q_1,\lambda,z)=\{(q_2,\lambda)\},$$

其中 $q_2$ 是唯一终态。第一步读 `a` 压入 $A$，以后每个 `a` 不改变计数，最后一个 `b` 弹出 $A$，所以预期语言是 $a^+b$。

把“不改变 $A$”的转移拆为

$$\delta(q_0,a,A)=\{(q_3,\lambda)\},\quad
\delta(q_3,\lambda,z)=\{(q_0,Az)\}.$$

这里能特定地检查 $z$，是因为本例运行时 $A$ 下方始终是 $z$；这不是任意 PDA 的通用拆分规则。

按三元组构造，弹栈边给出

$$[q_0Aq_3]\to a,\quad[q_0Aq_1]\to b,\quad[q_1zq_2]\to\lambda.$$

压入两个符号的边给出对所有 $s,t\in Q$ 的规则

$$[q_0zt]\to a[q_0As][szt],$$
$$[q_3zt]\to [q_0As][szt].$$

开始变量 $S=[q_0zq_2]$。清理无用变量后，设

$$J=[q_0Aq_3],\quad K=[q_0Aq_1],\quad
E=[q_1zq_2],\quad H=[q_3zq_2].$$

保留的规则为

$$S\to aKE\mid aJH,\quad H\to KE\mid JH,$$
$$J\to a,\quad K\to b,\quad E\to\lambda.$$

代入可得 $S\to ab\mid aaH,H\to b\mid aH$。进一步可用更简洁的等价文法

$$S\to aH,\qquad H\to aH\mid b.$$

所以语言确为 $a^+b$；接受 `ab`、`aaab`，拒绝空串、`b`、`abb`。

## 例题 16：判断 DPDA，不能只数同标签的边

**来源：**Lec 7 pp. 149–152，改编。每组只含所列转移。

1. $\delta(q,a,A)=\{(p,A)\},\delta(q,b,A)=\{(r,A)\}$。
2. $\delta(q,a,A)=\{(p,A)\},\delta(q,\lambda,A)=\{(r,A)\}$。
3. $\delta(q,\lambda,A)=\{(p,A)\},\delta(q,a,B)=\{(r,B)\}$。
4. $\delta(q,a,A)=\{(p,A),(r,\lambda)\}$。

**解：**第 1、3 组满足确定性；第 2、4 组不满足。

第 1 组由下一个输入区分；第 3 组由栈顶区分。第 2 组在同一 $(q,A)$ 下可选择读 `a` 或不读；第 4 组同一个完整条件有两个结果。判定时务必检查两项定义。

## 例题 17：第 174 页的严格大小比较

**来源：**Lec 7 p. 174，两道课件题。以下均取 $n,m\ge0$。

### A. $L_>=\{a^nb^m:n>m\}$

用特殊符号 $Y$ 保留第一个 `a`，其余 `a` 各压一个 $A$；只允许 `b` 弹 $A$，不能弹 $Y$。

初态 $q_0$，终态集合 $F=\{q_1,q_2\}$：

| 当前状态 | 输入 | 栈顶 | 下一状态 | 替换串 |
|---|---|---|---|---|
| $q_0$ | $a$ | $z$ | $q_1$ | $Yz$ |
| $q_1$ | $a$ | $Y$ | $q_1$ | $AY$ |
| $q_1$ | $a$ | $A$ | $q_1$ | $AA$ |
| $q_1$ | $b$ | $A$ | $q_2$ | $\lambda$ |
| $q_2$ | $b$ | $A$ | $q_2$ | $\lambda$ |

读了 $n\ge1$ 个 `a` 后，栈为 $A^{n-1}Yz$，因此最多能读 $n-1$ 个 `b`。`a`、`aaab`、`aaabb` 接受；空串、`ab`、`aabb`、`ba` 拒绝。没有 $\lambda$ 边，且每个条件只有一个结果，故是 DPDA。

**与课件写法比较：**课件第二条把 $Y$ 替换为 $A$，本答案替换为 $AY$。课件版本读完 $n\ge2$ 个 `a` 后的栈为 $A^{n-1}z$，也恰好允许至多 $n-1$ 个 `b`；$n=1$ 时则由栈顶 $Y$ 阻止读取任何 `b`。因此两者识别同一语言，本答案只是保留标记以简化不变式的表述。注意终态接受允许栈中还留有符号，不能仅凭某个版本最终栈不同就判为错误。

### B. $L_<=\{a^nb^m:n<m\}$

先计数并抵消；只有看到第一个多出来的 `b` 才进入终态。初态 $q_0$，$F=\{q_2\}$：

| 当前状态 | 输入 | 栈顶 | 下一状态 | 替换串 |
|---|---|---|---|---|
| $q_0$ | $a$ | $z$ | $q_0$ | $Az$ |
| $q_0$ | $a$ | $A$ | $q_0$ | $AA$ |
| $q_0$ | $b$ | $A$ | $q_1$ | $\lambda$ |
| $q_1$ | $b$ | $A$ | $q_1$ | $\lambda$ |
| $q_0$ | $b$ | $z$ | $q_2$ | $z$ |
| $q_1$ | $b$ | $z$ | $q_2$ | $z$ |
| $q_2$ | $b$ | $z$ | $q_2$ | $z$ |

`b`、`abb`、`aabbb` 接受；空串、`aab`、`aabb`、`baba` 拒绝。两个比较语言都排除 $n=m$，尤其都不含空串。

## 例题 18：计数条件之外还要限制顺序

**来源：**Lec 7 pp. 80–90，补全构造。语言为

$$L=\{a^nb^m:n,m\ge0,\ n\ge m-1\}.$$

即 $m\le n+1$：每个 `a` 可抵消一个 `b`，额外允许一个 `b`。使用 $q_0$、读 `a` 的 $p$、读 `b` 的 $q$、额外 `b` 后的 $f$，四个状态均为终态。

| 当前状态 | 输入 | 栈顶 | 下一状态 | 替换串 |
|---|---|---|---|---|
| $q_0$ | $a$ | $z$ | $p$ | $Az$ |
| $q_0$ | $b$ | $z$ | $f$ | $z$ |
| $p$ | $a$ | $A$ | $p$ | $AA$ |
| $p$ | $b$ | $A$ | $q$ | $\lambda$ |
| $q$ | $b$ | $A$ | $q$ | $\lambda$ |
| $q$ | $b$ | $z$ | $f$ | $z$ |

$f$ 无出边。四态都设为终态，是因为 `a` 尚未完全抵消时也允许结束；仍然必须读完输入。

接受空串、`b`、`aab`、`aabbb`；拒绝 `bb`、`abbb`、`aba`。特别地，单状态计数器可能误收 `aba`，这里由阶段状态排除了该串。

## 自测：先做题，再核对答案

建议用 35–45 分钟完成。复习优先级是学习建议，不是考试范围或分值预测。

1. $S\to AB,A\to a\mid\lambda,B\to b\mid\lambda$。求可空集合；给出保留空串的 CNF。
2. 判断 $A\to aBC,B\to b,C\to c$ 是 CNF、GNF，还是都不是。
3. $S\to AB,A\to a,B\to b$。分别判断 `ab`、`aa`、空串能否通过 CYK 接受。
4. 已读完输入，处于终态，栈还剩 $AAz$。按本讲定义是否接受？若还有一个输入符号未读呢？
5. 使用例题 10 的机器，写出 `aaabb` 读完输入后的状态与栈，并判断接受性。
6. 第 91 页 $wcw^R$ 小测中，`c`、`acca`、`bacab`、`baca` 哪些接受？
7. 若 $(r,BC)\in\delta(p,a,A)$，写出三元组变量规则，并解释两个右侧变量共享的状态下标。
8. 有人构造 $a^nb^n$ 的 NPDA 时使用了“猜测切换阶段”的 $\lambda$ 边，因而声称该语言不是 DCFL。指出逻辑错误并给出反证据。

## 自测答案

1. 可空集合为 $\{A,B,S\}$。用新开始变量 $S_0$：$S_0\to AB\mid a\mid b\mid\lambda,A\to a,B\to b$，这是允许开始变量空产生式的扩展 CNF；$S_0$ 不出现在右侧。
2. 是 GNF，不是 CNF：$A\to aBC$ 是一个终结符后接两个变量，却不符合 CNF 的两种形状。
3. `ab` 的顶格有 $S$，接受；`aa` 顶格为空，拒绝；空串需单独判定，此文法不能生成空串，所以拒绝。
4. 第一种接受。第二种不能仅凭当前终态判定接受，必须有后续路径读完剩余输入并停在终态。
5. 停在 $q_b$，栈为 $Az$；$q_b$ 非终态，且无法用栈顶 $z$ 的结束规则，所以拒绝。
6. 接受 `c` 和 `bacab`；`acca` 有两个分隔符，`baca` 的后半段不等于 `ba` 的逆序，拒绝。
7. 对所有 $s,t\in Q$，$[pAt]\to a[rBs][sCt]$。先清掉 $B$ 后抵达 $s$，然后从同一个 $s$ 开始清掉 $C$。
8. 一台机器非确定，不代表不存在其他确定机器。例题 10 已给出该语言的 DPDA，直接否定结论。
