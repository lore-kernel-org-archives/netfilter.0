From: Joel Newkirk <netfilter@newkirk.us>
Subject: Packet chain traversals
Date: Sun, 27 Oct 2002 13:03:57 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210271303.57379.netfilter@newkirk.us>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I've been working on a chain traversal diagram (primarily for my own reas=
ons,=20
but if anybody likes it they are welcome to use it non-commercially) and =
have=20
a few questions.

First, the current form of the diagram is (temporarily) at=20
http://newkirk.no-ip.org:83/Traversal-sm.png
and the basic rule is that a packet cannot cross a black line.  The choic=
es of=20
colors are meaningless, except to differentiate chains.

I know that the 'latest' form of netfilter has mangle AND filter chains f=
or=20
forward and input, and mangle, nat, and filter chains for output.  (Yeah,=
 the=20
diagram would be even more confusingly complicated with that detailed :^)

Can someone offer some examples of uses for mangle-forward, mangle-input,=
=20
mangle-output, and nat-output?  I can't see much use for them, but my use=
 of=20
iptables has been fairly simple so far, and most of my comprehension is b=
ased=20
on the previous version of the tutorial. (and absorbing the gobs of=20
information embedded in messages here :^)

Also, I wanted to ask for clarification on a point in the latest=20
iptables-tutorial "Traversing of tables and chains" section:  At one poin=
t it=20
seems that packets pass through mangle-forward THEN filter-forward, (diag=
ram)=20
yet elsewhere it seems to be the reverse. (table 1)  Which is correct?

Thanks for any input, examples, diagram criticism (artistic or logical) e=
tc. =20
If your response seems to you to be useless to the list in general then=20
please just send it to me directly.

j

--=20
"The problem with the French is that they don't have a word for entrepren=
eur."=20
--George W. Bush

