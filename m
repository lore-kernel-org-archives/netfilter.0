From: Frans Luteijn <f.a.g.luteijn@knoware.nl>
Subject: Re: nat problem
Date: Wed, 14 Jul 2004 03:02:10 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40F48611.67902349@knoware.nl>
References: <40F448B2.AF1E21@knoware.nl> <200407132206.08404.Antony@Soft-Solutions.co.uk> <40F4607B.60B1E512@knoware.nl> <200407132353.57143.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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



Antony Stone schreef:

> On Tuesday 13 July 2004 11:21 pm, Frans Luteijn wrote:
>
> > Antony Stone schreef:
> > > On Tuesday 13 July 2004 9:40 pm, Frans Luteijn wrote:
> > > > I have a little problem, which might be a bug. I have an 3COM
> > > > ISDN-router. It broadcasts every 10 seconds its connectionstatus to the
> > > > internal net. Now I want to forward those broadcasts to another
> > > > network.
> > >
> > > > What do you mean by "broadcasts"?   What protocol is being used?   What
> > > > address are the packets sent to?
> >
> > These are real broadcasts to 192.168.1.255. The protocol is UDP, the source
> > port is 1025 and the destination port is 2071.Isn't it weird, that at the
> > nat-table, when I add a rule for logging, I can't see the above meant
> > packets, but at the filter- and the mangle-table those packets are logged?
>
> No, I don't think so.   Broadcast packets are not supposed to cross routers
> (they will enter the router as a machine on the local subnet, but they will
> not be routed anywhere else, because they already come from the subnet they
> are addressed to)
>

I have been doing some testing:I have a machine, which broadcasts to 192.168.1.255
prot.: udp sport/dport: 138/138
I typed in:

iptables -t nat -A PREROUTING -i eth0 -d 192.168.1.255 -p udp --sport 138 -j LOG
iptables -t nat -A PREROUTING -i eth0 -d 192.168.1.255 -p udp --sport 138 -j DNAT
192.168.2.255

Then I saw in my log:
Jul 14 02:34:16 firewall kernel: IN=eth0 OUT=
MAC=ff:ff:ff:ff:ff:ff:00:50:04:0e:d9:00:08:00 SRC=192.168.1.3 DST=192.168.1.255
LEN=240 TOS=0x00 PREC=0x00 TTL=32 ID=60162 PROTO=UDP SPT=138 DPT=138 LEN=220

and I saw trafic on my other network.
When I type:

cat /proc/net/ip_conntrack

I see:
udp      17 17 src=192.168.1.3 dst=192.168.1.255 sport=138 dport=138 [UNREPLIED]
src=192.168.2.255 dst=192.168.1.3 sport=138 dport=138 use=1

This means to me, that those packets are forwarded. So why can't I forward the
other packets (192.168.1.255, prot.: udp, sport/dport: 1025/2071)?

> > At a company I worked for, DHCP broadcasts were sent from one network to
> > another, so it should be possible.
>
> I would suggest that the network you refer to had a DHCP relay server on it.
>
> > > > > Now I want to forward those broadcasts to another network.
> > > >
> > > > If, by broadcasts, you mean packets addressed to the "broadcast
> > > > address" of your subnet, it can't be done - you cannot route broadcast
> > > > packets across a router (that's why people use bridges).   The only way
> > > > it could be done is to have a machine which understands the protocol,
> > > > and is connected to both networks, picking up the broadcast packets on
> > > > one subnet, and then creating new broadcast packets to send to the
> > > > other network (and, of course, dealign sensibly with the replies).
> >
> > This is exactly what I mean. I want to forward the broadcastpackets from
> > 192.168.1.255 to 192.168.2.255. I don't want to use a bridge here. I want
> > those networks separated, so I can share the connection to others without
> > concerning they can see my private network.
>
> In that case put a DHCP relay server on the subnet on which the broadcasts are
> being generated, and configure it to forward the packets to the DHCP server
> on the other subnet.
>
> You cannot use netfilter to do this, simply because broadcast packets don't
> cross routers.   That is why DHCP relays exist.
>
> Regards,
>
> Antony.
>
> --
> How I want a drink, alcoholic of course, after the heavy chapters involving
> quantum mechanics.
>
>  - 3.14159265358979
>
>                                                      Please reply to the list;
>                                                            please don't CC me.



--
Frans Luteijn
PGP PblKey fprnt=C4 87 CE AF BC B6 98 C1  EF 42 A1 9A E2 C0 42 5B



