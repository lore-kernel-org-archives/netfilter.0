From: Martin Vassilev <mv-lists@net-surf.net>
Subject: Re: Problem with transparent proxing if catching traffic on
	=?iso-8859-1?q?vlan=A0interface?=
Date: Fri, 13 May 2005 16:28:07 +0300
Message-ID: <200505131628.07118.mv-lists@net-surf.net>
References: <200505121650.j4CGovrs010826@mont.net-surf.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200505121650.j4CGovrs010826@mont.net-surf.net>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Thursday 12 May 2005 19:50, netfilter-request@lists.netfilter.org wrote:
> On Thu, May 12, 2005 at 02:52:38PM +0300, Martin Vassilev wrote:
> > Hello , first of all sorry for poor english.
> >
> > Have some trouble with transparent proxing=A0=A0=A0=A0
> >
> > Configuration is simple:
> >
> > ------------ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0---=
=2D------
> >
> > |CLIENT| ---- eth/vlans ---- | GATE|
> >
> > ------------ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0---=
=2D------
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0transparent proxy
> >
> >
> > ------------------test1---------------------
> > GATE:/#iptables =A0-t nat -I PREROUTING -p TCP -s `CLIENT` =A0\
> > --destination-port 80 -i vlan8 -j REDIRECT --to-ports 3128
> >
> > CLIENT:/# telnet www.netfilter.org 80
> > Trying 213.95.27.115...
> > telnet: connect to address 213.95.27.115: Connection refused
> > (thats the problem ;))
> >
> > GATE:/# tcpdump =A0-n -i vlan8 -f "net `CLIENT`"
> > tcpdump: listening on vlan8
> > 11:43:28.336226 `CLIENT`.38842 > 213.95.27.115.80: S
> > 1057989664:1057989664(0) win 5840 <mss 1412,sackOK,timestamp 1881955228
> > 0,nop,wscale 2> (DF) [tos 0x10]
> >
> > GATE:/# iptables -t nat -n -L -v
> > Chain PREROUTING (policy ACCEPT 32M packets, 1991M bytes)
> > =A0pkts bytes target =A0 =A0 prot opt in =A0 =A0 out =A0 =A0 source =A0=
 =A0 =A0 =A0 =A0 =A0 =A0
> > destination
> > =A0 =A0 1 =A0 =A060 REDIRECT =A0 tcp =A0-- =A0vlan8 =A0* =A0 =A0 =A0 `C=
LIENT` =A0 =A0 =A00.0.0.0/0 =A0
> > =A0 =A0 =A0 =A0 tcp dpt:80 redir ports 3128
> >
> > nothing appear in squid=B4s access.log
> >
> >
> > ----------------test2------------------------
> > After some rerouting to reach the gate through eth0
> >
> > GATE:/#iptables =A0-t nat -I PREROUTING -p TCP -s `CLIENT` =A0\
> > --destination-port 80 -i eth0 -j REDIRECT --to-ports 3128
> >
> > and all works fine.
> > ---------------------------------------------
> >
> > Is there any differents for netfilter if catching traffic on eth or vlan
> > interface ?
>
> does vlan8 have an IP address? =A0REDIRECT rewrites the packet's dst IP to
> be the IP of the interface the packet was received on, i'd imagine it
> would get confused if the interface didn't have an IP address.
>
> alternatively, you may have some funky routing going on--i wouldn't be
> surprised if you tcpdumped the other interfaces and saw the SYN/ACK from
> the first example going out an interface other than vlan8--does:
>
> =A0 ip route get $CLIENT_IP
>
> show that the packet is routed via dev vlan8?
>
> just some things to consider.
>
> -j
Thanks for repply Jason.
Binding squid on 0.0.0.0:3128 instead of $GATE_IP:3128 fix the problem.
Not work on $VLAN8_IP:3128 ?

=2D-=20
Best Regards,
Martin Vassilev
NetSurf.net Ltd.


