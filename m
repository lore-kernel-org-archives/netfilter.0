From: Marek Habersack <grendel@caudium.net>
Subject: Tux and netfilter
Date: Sun, 6 Jul 2003 23:14:03 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030706211403.GA9350@thanes.org>
Reply-To: grendel@caudium.net
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xHFwDpU9dbj6ez1V"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org


--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

  One of the servers at our colo is under a heavy attack consisting of
massive synfloods followed by the connections to port 80 issuing bogus HTTP
requestss like

  ET xxx.yyy.zzz.vvv HTTP/X.Y
  Host: /search.php
  Referer: http://google.com/

  ^^^^^^^^^note the referer, an impossible one.

Where xx etc is an IP number, there are numerous other variations of the
requests. The number of packets amounts to around 200M in the course of
around 5h (latest data). I have tuned the kernel so that it survives the
number of packets, but still netstat shows around 20k sockets in FIN2_WAIT
state (most of them), the machine load is ~3. So far so good. I've put tux
in front of apache (which is running vBulletin :>) to stop apache from
bogging down the machine and that helped a bit. I've modified tux so that it
zaps HTTP/1.0 and bogus Referer connections immediately, that also helped a
bit but it wasn't enough. So I resorted to using the TARPIT target and the
string matcher with iptables. The rules used are:

  33M 6284M TARPIT tcp  --  *      *       0.0.0.0/0 0.0.0.0/0          tcp=
 dpt:80 STRING match HTTP/1.0^M=20
  31M 6505M TARPIT tcp  --  *      *       0.0.0.0/0 0.0.0.0/0          tcp=
 dpt:80 STRING match ET 66.28.=20
 573K  119M mightbevalid  tcp  --  *      *       0.0.0.0/0 0.0.0.0/0      =
    tcp dpt:80 STRING match HTTP/1.1^M=20
  928  185K TARPIT tcp  --  *      *       0.0.0.0/0 0.0.0.0/0          tcp=
 dpt:80 STRING match Referer: http://google.com/^M=20
    0     0 TARPIT tcp  --  *      *       0.0.0.0/0 0.0.0.0/0          tcp=
 dpt:80 STRING match Referer: http://www.google.com/^M=20
    0     0 TARPIT tcp  --  *      *       0.0.0.0/0 0.0.0.0/0          tcp=
 dpt:80 STRING match Referer: http://www.google.com^M=20
    0     0 TARPIT tcp  --  *      *       0.0.0.0/0 0.0.0.0/0          tcp=
 dpt:80 STRING match Referer: http://google.com^M=20
  70M 2879M ACCEPT tcp  --  *      *       0.0.0.0/0 0.0.0.0/0          tcp=
 flags:!0x16/0x02=20
Chain mightbevalid (1 references)
 pkts bytes target     prot opt in     out     source
destination        =20
23245 4892K ACCEPT     tcp  --  *      *       0.0.0.0/0 0.0.0.0/0         =
 STRING match .php=20
    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0 0.0.0.0/0         =
 STRING match GET /index.html HTTP/1.1=20
 386K   78M ACCEPT     tcp  --  *      *       0.0.0.0/0 0.0.0.0/0         =
 STRING match GET / HTTP/1.1^M=20
 164K   36M TARPIT     tcp  --  *      *       0.0.0.0/0 0.0.0.0/0         =
=20


The counter values are the real ones. I would use the iplimit matcher, but I
don't want to use connection tracking since that would hose the machine
pretty quick. All of the above actions have the effect that the machine is
reachable, interaction is good, but tux is practically clogged (it's
configured to accept 50k connections, keep alives are at 1000 since setting
them to 0 makes tux close any connection immediately, no logging etc,). Apa=
che sits
on port 81 and when accessed directly it works fine, that's good enough, but
I'd like to do more. And here I come to the real question I want to ask to
the list. Is it possible and if yes, then how, to redirect the offending
packets from within tux to the TARPIT chain? It seems a bit backwards to me
and I'm not quite sure whether it's possible at all, but maybe?
I'm not asking for ready code, just some helping hand and some advice=20
where to start.

If any of the above sounds chaotic and unclear, don't hesitate to ask me...
:)

TIA,

marek

p.s. The machine is PIII/800Mhz with 0.5GB of RAM, kernel 2.4.21-aa1rc8,
syncookies are on and here are the relevant sysctl values I'm using (I know,
some of them have dangerous values, but it works pretty well atm):

net/ipv4/icmp_echo_ignore_broadcasts=3D1
fs/file-max=3D70000
fs/dir-notify-enable=3D0
net/ipv4/tcp_keepalive_time=3D30
net/core/rmem_max=3D262143
net/core/rmem_default=3D262143
net/core/wmem_max=3D262143
net/core/wmem_default=3D262143
net/ipv4/tcp_sack=3D0
net/ipv4/tcp_timestamps=3D0
net/ipv4/tcp_syncookies=3D1
net/ipv4/icmp_echo_ignore_all =3D1
net/ipv4/icmp_ignore_bogus_error_responses =3D 1
net/ipv4/tcp_syn_retries =3D 1
net/ipv4/tcp_synack_retries =3D 1
net/ipv4/tcp_keepalive_probes =3D 1
net/ipv4/tcp_keepalive_intvl =3D 10
net/ipv4/tcp_max_syn_backlog =3D 64
net/ipv4/tcp_low_latency =3D 1
net/ipv4/tcp_abort_on_overflow =3D 1
net/ipv4/ipfrag_time =3D 30
net/ipv4/tcp_fin_timeout =3D 10
net/ipv4/tcp_max_orphans =3D 2048
net/ipv4/tcp_tw_reuse =3D 1

--xHFwDpU9dbj6ez1V
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/CJEbq3909GIf5uoRAuh9AJ0YItdkD7QmzJdx5073PL9a3k1bkwCeMBgr
70SnP5rEBhLvmTBptpSF2q0=
=9kKO
-----END PGP SIGNATURE-----

--xHFwDpU9dbj6ez1V--

