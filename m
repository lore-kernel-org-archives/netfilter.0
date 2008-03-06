From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: RV: optimizations for large rule sets
Date: Thu, 06 Mar 2008 15:49:38 -0600
Message-ID: <47D066F2.4040008@riverviewtech.net>
References: <384944.49147.qm@web26503.mail.ukl.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <384944.49147.qm@web26503.mail.ukl.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 3/6/2008 10:06 AM, Alberto D=EDez wrote:
> I want per flow (orig addr, dst addr, orig port, dst port, proto)=20
> filtering thats why i don=B4t think i can use ipsets (or can i?) I al=
so=20
> would like to have the nice iptables features like  mangle table and=20
> counters ..

Ok...

> I dont really understand what the conntrack does, or if it can=20
> somehow helpme (where is the nice documentation about this??)

I can't tell you exactly what it does but conntrack is used in=20
maintaining state of connections.  So if you want to use the state matc=
h=20
you will need conntrack.

> What is the netfilter preferred way to have a large set of rules and=20
> still do packet filtering?  are HiPAC, iptables with classifiers or=20
> any other solution actual?

I don't know what, or if there is, the netfilter preferred way is.=20
However I think the best thing you can do is to intelligently write you=
r=20
rules.  Quite a few people just use a long list of rules that is=20
processed linearly until a match is found.  I think you will have bette=
r=20
luck with fewer rules that make one decision and then jump to a=20
sub-chain where there are a few more rules to make another decision and=
=20
then repeat the process.  I.e. if you are wanting to have a set of rule=
s=20
for a bunch of different clients, don't do this:

-d a.b.c.1 -p TCP --dport 22 -j ACCEPT
-d a.b.c.1 -p TCP --dport 25 -j ACCEPT
-d a.b.c.1 -p TCP --dport 80 -j ACCEPT
-d a.b.c.1 -p TCP --dport 110 -j ACCEPT
-d a.b.c.2 -p TCP --dport 22 -j ACCEPT
-d a.b.c.2 -p TCP --dport 25 -j ACCEPT
-d a.b.c.2 -p TCP --dport 80 -j ACCEPT
-d a.b.c.2 -p TCP --dport 110 -j ACCEPT
-d a.b.c.3 -p TCP --dport 22 -j ACCEPT
-d a.b.c.3 -p TCP --dport 25 -j ACCEPT
-d a.b.c.3 -p TCP --dport 80 -j ACCEPT
-d a.b.c.3 -p TCP --dport 110 -j ACCEPT

Packets for POP3 traffic to a.b.c.3 will have to traverse a lot of rule=
s=20
that it will never match before it gets to the one that it will.=20
Instead write your rules like this.

-d a.b.c.1 -j IP_a.b.c.1
-d a.b.c.2 -j IP_a.b.c.2
-d a.b.c.3 -j IP_a.b.c.3

-A IP_a.b.c.1 -p TCP -j IP_a.b.c.1_TCP
-A IP_a.b.c.1 -p UDP -j IP_a.b.c.1_UDP
-A IP_a.b.c.1 -p ICMP -j IP_a.b.c.1_ICMP

-A IP_a.b.c.2 -p TCP -j IP_a.b.c.2_TCP
-A IP_a.b.c.2 -p UDP -j IP_a.b.c.2_UDP
-A IP_a.b.c.2 -p ICMP -j IP_a.b.c.2_ICMP

-A IP_a.b.c.3 -p TCP -j IP_a.b.c.3_TCP
-A IP_a.b.c.3 -p UDP -j IP_a.b.c.3_UDP
-A IP_a.b.c.3 -p ICMP -j IP_a.b.c.3_ICMP

-A IP_a.b.c.1_TCP -p TCP --dport 22 -j ACCEPT
-A IP_a.b.c.1_TCP -p TCP --dport 25 -j ACCEPT
-A IP_a.b.c.1_TCP -p TCP --dport 80 -j ACCEPT
-A IP_a.b.c.1_TCP -p TCP --dport 110 -j ACCEPT

-A IP_a.b.c.2_TCP -p TCP --dport 22 -j ACCEPT
-A IP_a.b.c.2_TCP -p TCP --dport 25 -j ACCEPT
-A IP_a.b.c.2_TCP -p TCP --dport 80 -j ACCEPT
-A IP_a.b.c.2_TCP -p TCP --dport 110 -j ACCEPT

-A IP_a.b.c.3_TCP -p TCP --dport 22 -j ACCEPT
-A IP_a.b.c.3_TCP -p TCP --dport 25 -j ACCEPT
-A IP_a.b.c.3_TCP -p TCP --dport 80 -j ACCEPT
-A IP_a.b.c.3_TCP -p TCP --dport 110 -j ACCEPT

=46or the same POP3 traffic to a.b.c.3 the packets now traverse 3 rules=
=20
and jump and traverse 1 rule and then jump and then traverse 4 rules.=20
As such, rules set up like this will require processing fewer rules (8)=
=20
verses the other linear method with more rules(12).

This may be more complex on the surface, however most of this is=20
repetition.  You can also have just about any rule set per stage per=20
destination you want.  If you have a lot of destinations like you are=20
alluding to, you can even make your earlier decisions based on=20
destination IP and netmask to group a bunch of IPs in one jump and then=
=20
subdivide after the jump while having fewer rules overall that the=20
packets have to traverse.

Something else to keep in mind is that you don't want your rules to be=20
overly complex.  The only reason I'm checking protocol at the final=20
stage is that I have to to be able to check ports.  If it were not for=20
that requirement I would not do the protocol check because the previous=
=20
stage checked the protocol already and I know that the only way to get=20
to the particular sub-chain at any given stage is to have passed throug=
h=20
previous stages and rules.

> is there a howto,manual,some kind of documentation, all that I find=20
> about this are quite old (3 years?) material in the mailing list ...=20
> Is this problem already solved? what was the solution taken?

I'm sure there are other approaches.  However I've found that if you ar=
e=20
smarter about how you go about what you want to do you will have better=
=20
overall performance.  This same type of logic applies to IPTables and=20
HiPAC and many other things too.

> well if you could answer any of this questions i would be very=20
> thankful

Can we see an example of some of your rules (sanitized as need be) so=20
that we can see where they might be optimized as well as what and how=20
you are trying to filter.



Grant. . . .
