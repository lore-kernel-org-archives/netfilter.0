From: Jason Opperisano <opie@817west.com>
Subject: Re: Problem with transparent proxing if catching traffic on vlan
	interface
Date: Thu, 12 May 2005 08:47:17 -0400
Message-ID: <20050512124717.GA16575@bender.817west.com>
References: <200505121452.39043.mv-lists@net-surf.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200505121452.39043.mv-lists@net-surf.net>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Thu, May 12, 2005 at 02:52:38PM +0300, Martin Vassilev wrote:
> Hello , first of all sorry for poor english.
>=20
> Have some trouble with transparent proxing=09
>=20
> Configuration is simple:
>=20
> ------------                            ----------
> |CLIENT| ---- eth/vlans ---- | GATE|
> ------------                            ----------
> 					transparent proxy
>=20
>=20
> ------------------test1---------------------
> GATE:/#iptables  -t nat -I PREROUTING -p TCP -s `CLIENT`  \
> --destination-port 80 -i vlan8 -j REDIRECT --to-ports 3128=20
>=20
> CLIENT:/# telnet www.netfilter.org 80
> Trying 213.95.27.115...
> telnet: connect to address 213.95.27.115: Connection refused=20
> (thats the problem ;))
>=20
> GATE:/# tcpdump  -n -i vlan8 -f "net `CLIENT`"
> tcpdump: listening on vlan8
> 11:43:28.336226 `CLIENT`.38842 > 213.95.27.115.80: S 1057989664:1057989=
664(0)=20
> win 5840 <mss 1412,sackOK,timestamp 1881955228 0,nop,wscale 2> (DF) [to=
s=20
> 0x10]
>=20
> GATE:/# iptables -t nat -n -L -v
> Chain PREROUTING (policy ACCEPT 32M packets, 1991M bytes)
>  pkts bytes target     prot opt in     out     source              =20
> destination
>     1    60 REDIRECT   tcp  --  vlan8  *       `CLIENT`      0.0.0.0/0 =
        =20
> tcp dpt:80 redir ports 3128
>=20
> nothing appear in squid=B4s access.log
>=20
>=20
> ----------------test2------------------------
> After some rerouting to reach the gate through eth0
>=20
> GATE:/#iptables  -t nat -I PREROUTING -p TCP -s `CLIENT`  \
> --destination-port 80 -i eth0 -j REDIRECT --to-ports 3128=20
>=20
> and all works fine.
> ---------------------------------------------
>=20
> Is there any differents for netfilter if catching traffic on eth or vla=
n=20
> interface ?

does vlan8 have an IP address?  REDIRECT rewrites the packet's dst IP to
be the IP of the interface the packet was received on, i'd imagine it
would get confused if the interface didn't have an IP address.

alternatively, you may have some funky routing going on--i wouldn't be
surprised if you tcpdumped the other interfaces and saw the SYN/ACK from
the first example going out an interface other than vlan8--does:

  ip route get $CLIENT_IP

show that the packet is routed via dev vlan8?

just some things to consider.

-j

--
"Joe Swanson: You can't just come over here and annex my pool!
 Peter: Oh yeah? Well, according to paragraph 7, sentence 3, word 8 of
 the Geneva Convention..."the". So, tough luck, Swanson."
        --Family Guy

