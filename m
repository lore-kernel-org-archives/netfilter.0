From: Eric Leblond <eric@inl.fr>
Subject: Re: how to match connection tracker's flows?
Date: Thu, 04 Nov 2004 10:26:28 +0100
Message-ID: <1099560388.4320.6.camel@porky>
References: <20041103181718.GA16850@oasis.frogfoot.net>
	<1099508868.24863.8.camel@porky>
	<20041104084658.GA14605@oasis.frogfoot.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-lUeu639ZSxybLssyOPMn"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041104084658.GA14605@oasis.frogfoot.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
To: Abraham van der Merwe <abz@frogfoot.net>
Cc: netfilter@lists.netfilter.org


--=-lUeu639ZSxybLssyOPMn
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2004-11-04 at 10:46 +0200, Abraham van der Merwe wrote:
> Hi Eric                                          >@2004.11.03_21:07:48_+0=
200
>=20

> Ok, sorry I didn't paste the real commands. It is actually:
>=20
> # rules to send all traffic to user-defined chain
> iptables -t mangle -N TRACK
> iptables -t mangle -A POSTROUTING -j TRACK
>=20
> # a rule to see how much ftp traffic is matched
> iptables -t mangle -A POSTROUTING -m mark --mark 2
>=20
> # rules to track ftp
> iptables -t mangle -A TRACK -p tcp -j CONNMARK --restore-mark
> iptables -t mangle -A TRACK -p tcp -m mark ! --mark 0 -j RETURN
> iptables -t mangle -A TRACK -p tcp --dport 21 -j MARK --set-mark 2
> iptables -t mangle -A TRACK -j CONNMARK --save-mark
>=20
> In other words, it returns from a user-defined chain and the mark is in t=
he
> top level chain and will always be matched.

ok

> With above, it doesn't match all the ftp traffic. It definitely matches
> some, but I think it is just the port 21 traffic, not the port 20 (ftp-da=
ta)
> stuff which should be picked up by the connection tracking.

I just slightly modify my configuration to check if traffic to port 20
was matched. This is the case. Here's my configuration :

# We restore mark at entry
iptables -A PREROUTING -t mangle -m mark --mark 0x0 -j CONNMARK --restore-m=
ark
# We mark new connection
# FORWARD traffic
iptables -A FORWARD -t mangle -m mark --mark 0x0 -p tcp -m state --state NE=
W -m multiport --dport 6346,4662,4661 -j MARK --set-mark 5
iptables -A FORWARD -t mangle -m mark --mark 0x0 -p tcp -m state --state NE=
W -m multiport --dport 80 -j MARK --set-mark 4
iptables -A FORWARD -t mangle -m mark --mark 0x0  -p tcp -m state --state N=
EW -m multiport --dport 21 -j MARK --set-mark 3
iptables -A FORWARD -t mangle -m mark --mark 0x0  -p tcp  -m multiport --dp=
ort 20
iptables -A FORWARD -t mangle -m mark --mark 0x3  -p tcp  -m multiport --dp=
ort 20
...
SIMILAR line in OUTPUT INPUT
...
# We save the mark
iptables -A POSTROUTING -t mangle -m mark ! --mark 0x0  -j CONNMARK --save-=
mark


I look at stats with "iptables -L -t mangle -nv" after a little bit of
ftp in passive mode :

Chain FORWARD (policy ACCEPT 21M packets, 13G bytes)
 pkts bytes target     prot opt in     out     source               destina=
tion        =20
   53  2960 MARK       tcp  --  *      *       0.0.0.0/0            0.0.0.0=
/0           MARK match 0x0 state NEW multiport dports 6346,4662,4661 MARK =
set 0x5=20
    0     0 MARK       tcp  --  *      *       0.0.0.0/0            0.0.0.0=
/0           MARK match 0x0 state NEW multiport dports 80 MARK set 0x4=20
    1    60 MARK       tcp  --  *      *       0.0.0.0/0            0.0.0.0=
/0           MARK match 0x0 state NEW multiport dports 21 MARK set 0x3=20
    0     0            tcp  --  *      *       0.0.0.0/0            0.0.0.0=
/0           MARK match 0x0 multiport dports 20=20
    3   164            tcp  --  *      *       0.0.0.0/0            0.0.0.0=
/0           MARK match 0x3 multiport dports 20=20

So passive ftp on port 20 has the mark that was given on port 21.

About my system :
kernel 2.6.8=20
lsmod extract :
ip_nat_ftp              4080  0=20
iptable_nat            19884  2 ip_nat_ftp
ip_tables              15488  10 ipt_MARK,ipt_mark,iptable_mangle,ipt_multi=
port,ipt_state,ipt_REJECT,ipt_ULOG,iptable_filter,ipt_CONNMARK,iptable_nat
ip_conntrack_ftp       71088  1 ip_nat_ftp
ip_conntrack           28296  5 ipt_state,ipt_CONNMARK,ip_nat_ftp,iptable_n=
at,ip_conntrack_ftp

BR,
--=20
Eric Leblond <eric@regit.org>
NuFW, Now User Filtering Works : http://www.nufw.org

--=-lUeu639ZSxybLssyOPMn
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBBifXDnxA7CdMWjzIRAgW5AJwOyKmmeagEpzNg4mXl1gqPfwN6wQCfZ5yq
01tf0zLbxATHKZGj/BdR+9Q=
=KT62
-----END PGP SIGNATURE-----

--=-lUeu639ZSxybLssyOPMn--


