From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: Dropped packets logged which should be accepted by Conntrack
Date: Tue, 15 Nov 2011 07:57:41 -0500
Message-ID: <1321361861.2936.68.camel@denise.theartistscloset.com>
References: <1321326448.2936.43.camel@denise.theartistscloset.com>
	 <4EC23515.8020808@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4EC23515.8020808@freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?ISO-8859-1?Q?G=E1sp=E1r?= Lajos <swifty@freemail.hu>
Cc: netfilter@vger.kernel.org

On Tue, 2011-11-15 at 10:47 +0100, G=C3=A1sp=C3=A1r Lajos wrote:
> Hi John,
>=20
> 2011-11-15 04:07 keltez=C3=A9ssel, John A. Sullivan III =C3=ADrta:
> > Hello, all.  I find myself perplexed by what I often see in our log=
s.
> > At the end of our FORWARD chain, we log drops for no matches:
> >
> > [root@fw01 log]# iptables -v -n -L FORWARD
> > Chain FORWARD (policy DROP 528K packets, 85M bytes)
> >   pkts bytes target     prot opt in     out     source
> > destination
> >    16M  925M TCPMSS     tcp  --  *      *       0.0.0.0/0
> > 0.0.0.0/0           tcp flags:0x06/0x02 TCPMSS clamp to PMTU
> > 2284M 1690G ACCEPT     all  --  *      *       0.0.0.0/0
> > 0.0.0.0/0           state RELATED,ESTABLISHED
> > 7890K  594M VPN_ALLOW  all  --  *      *       0.0.0.0/0
> > 0.0.0.0/0           MARK match 0xcccc/0xcccc
> >    27M 2609M UPEPIN_DENY  all  --  *      *       0.0.0.0/0
> > 0.0.0.0/0
> >    27M 2609M UPEPIN     all  --  *      *       0.0.0.0/0
> > 0.0.0.0/0
> >   528K   85M LOG        all  --  *      *       0.0.0.0/0
> > 0.0.0.0/0           LOG flags 0 level 4 prefix `No Match: '
> >
>=20
> > The above shows SMTP, LDAP, and memcached replies which should have=
 been
> > accepted.  Why would I see this?
>=20
> I do not know what kind of rules do you have between the=20
> "RELATED,ESTABLISHED" and the "LOG/DROP" rules, but I do not see any=20
> "conntrak NEW" rule there...
> And as far as I can tell, your UPEPIN_DENY chain does not get any hit=
=2E..=20
> (If that chain ment to deny any unwanted traffic.)
>=20
> To answer your question:
> You see those logs becaus the packets are:
>   - not "RELATED" or "ESTABLISHED",
>   - not filtered in the VPN_ALLOW chain, (not marked with 0xcccc)
>   - not droped in the UPEPIN_DENY chain,
>   - not accepter the UPEPIN chain...
>=20
> These packets can be:
>   a, "NEW'",
>   b, "INVALID",
>   c, "UNTRACKED",
>   and none of them are "ACCEPT"-ed... :D
>=20
> Swifty
Thank you, Gaspar.  This is actually a fairly complicated rule set with
probably tens of thousands of rules nested in those groups based upon
the concept of firepiping rather than firewalling - the next stage of
the ISCS project (http://iscs.sourceforge.net - sorry - haven't updated
that site in years).=20

Thus there are NEW -j ACCEPT rules in the path and these the original
packets to these replies match them, e.g., sending 25 /tcp to the mail
server or 389 /tcp to the LDAP server.  Note the large drop in matches
between UPEPEIN and LOG.  That's why I'm both perplexed and concerned t=
o
see so many RELATED,ESTABLISH packets in my dropped log.

=46or example:
No Match: IN=3Dbond4 OUT=3Dbond3 SRC=3D172.x.y.34 DST=3D94.76.241.48 LE=
N=3D107
TOS=3D0x00 PREC=3D0x00 TTL=3D63 ID=3D57617 DF PROTO=3DTCP SPT=3D25 DPT=3D=
37117

[root@fw01 log]# iptables -v -n -L UPEPIN
Chain UPEPIN (2 references)
 pkts bytes target     prot opt in     out     source               des=
tination
  28M 2707M ProtectionFilterSource  all  --  *      *       0.0.0.0/0  =
          0.0.0.0/0
8600K  555M ProtectionFilterTCP  tcp  --  *      *       0.0.0.0/0     =
       0.0.0.0/0
6904K  527M ProtectionFilterICMP  icmp --  *      *       0.0.0.0/0    =
        0.0.0.0/0
  28M 2707M ACCESS_GROUPS  all  --  *      *       0.0.0.0/0           =
 0.0.0.0/0

Chain ACCESS_GROUPS (2 references)
 pkts bytes target     prot opt in     out     source               des=
tination
  28M 2707M c1         all  --  *      *       0.0.0.0/0            0.0=
=2E0.0/0           source IP range 0.0.0.0-255.255.255.255

Chain c1 (1 references)
 pkts bytes target     prot opt in     out     source               des=
tination
  28M 2707M c5         all  --  *      *       0.0.0.0/0            0.0=
=2E0.0/0

[root@fw01 log]# iptables -v -n -L c5
Chain c5 (2 references)
 pkts bytes target     prot opt in     out     source               des=
tination

66833 3692K ACCEPT     tcp  --  *      *       0.0.0.0/0            172=
=2Ex.y.34         tcp dpt:25

and in the static configuration file:
-I c5 1 -d 172.x.y.34 -p 6 --dport 25 -j ACCEPT

And it works although I suspect there is a performance impact because o=
f
the intermittent dropped packets.  Any ideas what could cause this? Or
am I misinterpreting what I am seeing.  Thanks - John

