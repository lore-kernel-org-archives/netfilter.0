From: =?iso-8859-1?Q?=D6rjan?= Persson <"o.p+S.P.A.M."@fobie.net>
Subject: Re: DNAT onto the same external network
Date: Tue, 9 Dec 2003 17:44:00 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031209164400.GA11252@fobie.net>
References: <20031209021907.GA24265@fobie.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20031209021907.GA24265@fobie.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hello again,

In the case that this mail reaches the mailing list I would just like to
answer my own question. I had misunderstood the SNAT command, and to get
this correct you/me need to change the IP's in the SNAT command. (This
since this rule is for the reply FROM the source host which has been
routed to with the DNAT command)

>
> ## Destination NAT Onto the Same Network
> iptables -t nat -A POSTROUTING -d 111.222.333.13 -s 0.0.0.0/0 \
>         -p tcp --dport 2525 -j SNAT --to 111.222.333.16

In this case this would've been -d 111.222.333.16 and --to ...13.

Cheers,
=D6rjan

=D6rjan Persson (o.p+S.P.A.M.@fobie.net) wrote:
> Hello,
>=20
> I'm trying to redirect all SMTP-connections to one external host to
> another external host. Both these exists on the same subnet which, if
> I've understood it correctly, equals to trouble. ;)
>=20
> So, reading through the NAT HOWTO and lots of questions to this list
> I've tried most of things but unfortunate it doesn't work.
>=20
> For testing purposes I use port 2525 on first host before taking the
> mail-service on that host down permanent.
>=20
> This is todays situation; trying to redirect ...13:2525 to ...16:25.
>                 [ net ]
>             =B4           `
>     111.222.333.13   111.222.333.16
>     These are external IP's, there's no internal network.
>=20
> I'm currently using Debian Woody (iptables v1.2.6a) with a freshly
> compiled kernel 2.4.18 with NAT support.
>=20
> The rules I think is the onces that *should* work is these:
>=20
> ## Change destination addresses of mail traffic to 111.222.333.16, port 2=
5.
> iptables -t nat -A PREROUTING -p tcp --dport 2525 -i eth0 \
> 	-j DNAT --to 111.222.333.16:25
>=20
> ## Destination NAT Onto the Same Network
> iptables -t nat -A POSTROUTING -d 111.222.333.13 -s 0.0.0.0/0 \
>         -p tcp --dport 2525 -j SNAT --to 111.222.333.16
>=20
> These are also the only rules that currently exists on the machine. If I
> then use these and connect from the subnet 111.222.333.0/24 the SNAT
> packet counter increases, connecting from another subnet increases the
> DNAT counter.
>=20
> Tracing these with tcpdump shows this output:
> [ 111.222.333.13 / mail1.myhostname.com ]
> 03:04:43.451436 externalhost.com.35736 > mail1.myhostname.com.333.222.111=
.in-addr.arpa.2525: S 684181285:684181285(0) win 5840 <mss 1460,sackOK,time=
stamp 961920999 0,nop,wscale 0> (DF) [tos 0x60]
> 03:04:43.451538 externalhost.com.35736 > mail2.myhostname.com.smtp: S 684=
181285:684181285(0) win 5840 <mss 1460,sackOK,timestamp 961920999 0,nop,wsc=
ale 0> (DF) [tos 0x60]
> [...]
>=20
> [ 111.222.333.16 / mail2.myhostname.com ]
> 04:44:46.087439 externalhost.com.35735 > mail2.myhostname.com.smtp: S 654=
494669:654494669(0) win 5840 <mss 1460,sackOK,timestamp 961920329 0,nop,wsc=
ale 0> (DF) [tos 0x60]
> 04:44:46.087480 mail2.myhostname.com.smtp > externalhost.com.35735: S 234=
5893112:2345893112(0) ack 654494670 win 5792 <mss 1460,sackOK,timestamp 124=
930458 961920329,nop,wscale 0> (DF)
> 04:44:46.087705 externalhost.com.35735 > mail2.myhostname.com.smtp: R 654=
494670:654494670(0) win 32120 [tos 0x60]
> 04:44:46.087923 111.222.333.1 > mail2.myhostname.com: icmp: redirect myex=
ternalhost.com to host 111.222.333.18
> [...]
>=20
> I don't know why it says icmp: redirect to a host with .18, that's not a
> host I know of. Anyway, this is what my iptables -L -v -n -t nat says:
> Chain PREROUTING (policy ACCEPT 17228 packets, 677K bytes)
>  pkts bytes target     prot opt in     out     source               desti=
nation
>     3   180 DNAT       tcp  --  eth0   *       0.0.0.0/0            0.0.0=
.0/0          tcp dpt:2525 to:111.222.333.16:25
>=20
> Chain POSTROUTING (policy ACCEPT 2106 packets, 132K bytes)
>  pkts bytes target     prot opt in     out     source               desti=
nation
>     1    60 SNAT       tcp  --  *      *       0.0.0.0/0            111.2=
22.333.13       tcp dpt:2525 to:111.222.333.16
>=20
> Chain OUTPUT (policy ACCEPT 2081 packets, 131K bytes)
>  pkts bytes target     prot opt in     out     source               desti=
nation
>=20
> Any ideas, what so ever, will be glady recieved!
>=20
> Thanks in advance,
> =D6rjan

