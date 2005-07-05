From: =?ISO-8859-1?Q?Llu=EDs_Batlle?= <viriketo@gmail.com>
Subject: Wrong behaviour in policy routing
Date: Tue, 5 Jul 2005 17:16:23 +0200
Message-ID: <45219fb005070508163261595c@mail.gmail.com>
References: <45219fb005070508021de1a7c2@mail.gmail.com>
Reply-To: =?ISO-8859-1?Q?Llu=EDs_Batlle?= <viriketo@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45219fb005070508021de1a7c2@mail.gmail.com>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi!

I get this strange behaviour... I don't know how some packets get into
wrong rules.

My rules are those:
0:      from all lookup local
50:     from all lookup main
201:    from 192.168.17.0/28 lookup 201
202:    from 192.168.16.0/28 lookup 202
222:    from all lookup 222
32766:  from all lookup main
32767:  from all lookup default

Table main has:
192.168.17.0/28 dev eth2  proto kernel  scope link  src 192.168.17.1
192.168.16.0/28 dev eth1  proto kernel  scope link  src 192.168.16.1
192.168.0.0/20 dev eth0  proto kernel  scope link  src 192.168.1.2

Table 201:
default via 192.168.17.2 dev eth2  proto static  src 192.168.17.1
prohibit default  proto static  metric 1

Table 202:
default via 192.168.16.2 dev eth1  proto static  src 192.168.16.1
prohibit default  proto static  metric 1

The problem:
Even though, some packets with source address 192.168.16.1 get out
through the interface eth2, and some with src address 192.168.17.1 get
out through the interface eth1. Only some.

It happens only with packets of nat connections maintained by the
connection tracker (Already established/related). Afaik, the source
address for SNAT is set in the PREROUTING chain of the "nat" table.
That is, _BEFORE_ taking the routing decision. Isn't it?

So, the only rules I have in my iptables are:
iptables -t nat -I POSTROUTING -o eth1 -s 192.168.0.0/20 -j SNAT --to
192.168.16.1
iptables -t nat -I POSTROUTING -o eth2 -s 192.168.0.0/20 -j SNAT --to
192.168.17.1

... which set up the IP for packets which start a new connection to an
internet host. Those rules, as they are of the nat/POSTROUTING chain,
can match only when the state is NEW (i.e. for tcp connections). And
my problems appear when  the connections are already set.

Here I show tcpdump output for a ssh connection from internal
192.168.4.9 to external 93.Red-80-32-214.pooles.rima-tde.net:
listening on eth2, link-type EN10MB (Ethernet), capture size 96 bytes
16:55:45.928819 IP 192.168.16.1.33919 >
93.Red-80-32-214.pooles.rima-tde.net.ssh: P 3748099314:3748099362(48)
ack 3121813679 win 10800 <nop,nop,timestamp 193384850 1060965160>

I cannot understand, how can a packet from 16.1 go through eth2, with
that routing policy.

In fact the problem appears only in 'long' connections with low data
flow (ssh, ftp), specially after the password login. With http
connections from browsers, everything's fine. Strange.

I don't know when _exactly_ the routing decisions are made. afaik,
it's somewhere between the nat/PREROUTING and nat/POSTROUTING. But it
seems the route rule applied for the conntrack'ed packets is wrong.

Thanks in advance...

-Lluis

