From: Frans Luteijn <f.a.g.luteijn@knoware.nl>
Subject: Re: nat problem
Date: Thu, 15 Jul 2004 01:30:33 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40F5C218.E57FEC60@knoware.nl>
References: <40F448B2.AF1E21@knoware.nl> <200407132353.57143.Antony@Soft-Solutions.co.uk> <40F48611.67902349@knoware.nl> <200407140953.50466.Antony@Soft-Solutions.co.uk>
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

> On Wednesday 14 July 2004 2:02 am, Frans Luteijn wrote:
>
> > Antony Stone schreef:
> > >
> > > No, I don't think so.   Broadcast packets are not supposed to cross
> > > routers (they will enter the router as a machine on the local subnet, but
> > > they will not be routed anywhere else, because they already come from the
> > > subnet they are addressed to)
> >
> > I have been doing some testing:I have a machine, which broadcasts to
> > 192.168.1.255 prot.: udp sport/dport: 138/138
> > I typed in:
> >
> > iptables -t nat -A PREROUTING -i eth0 -d 192.168.1.255 -p udp --sport 138
> > -j LOG iptables -t nat -A PREROUTING -i eth0 -d 192.168.1.255 -p udp
> > --sport 138 -j DNAT 192.168.2.255
> >
> > Then I saw in my log:
> > Jul 14 02:34:16 firewall kernel: IN=eth0 OUT=
> > MAC=ff:ff:ff:ff:ff:ff:00:50:04:0e:d9:00:08:00 SRC=192.168.1.3
> > DST=192.168.1.255 LEN=240 TOS=0x00 PREC=0x00 TTL=32 ID=60162 PROTO=UDP
> > SPT=138 DPT=138 LEN=220
> >
> > and I saw trafic on my other network.
> > When I type:
> >
> > cat /proc/net/ip_conntrack
> >
> > I see:
> > udp      17 17 src=192.168.1.3 dst=192.168.1.255 sport=138 dport=138
> > [UNREPLIED] src=192.168.2.255 dst=192.168.1.3 sport=138 dport=138 use=1
> >
> > This means to me, that those packets are forwarded. So why can't I forward
> > the other packets (192.168.1.255, prot.: udp, sport/dport: 1025/2071)?
>
> What happens if you try the same test as above, but with the port numbers you
> are interested in?   Do the connection tracking table and the log file
> suggest that packets are being forwarded?   If you can get it to "work" on
> port 138, I don't see why it shouldn't "work" on port 2071.
>

Nothing happens, no logging or anything else:iptables -t nat -A PREROUTING -i eth0
-d 192.168.1.255 -p udp --sport 1025 -j LOG
iptables -t nat -A PREROUTING -i eth0 -d 192.168.1.255 -p udp --sport 1025 -j DNAT
--to 192.168.2.255

When I type:
cat /proc/net/ip_conntrack
I see:
udp      17 25 src=192.168.1.1 dst=192.168.1.255 sport=1025 dport=2071 [UNREPLIED]
src=192.168.1.255 dst=192.168.1.1 sport=2071 dport=1025 use=1

After typing:
iptables -t nat -I PREROUTING 2 -i eth0 -d 192.168.1.255 -p udp --sport 2071 -j
LOG
iptables -t nat -I PREROUTING 3 -i eth0 -d 192.168.1.255 -p udp --dport 1025 -j
LOG
iptables -t nat -I PREROUTING 4 -i eth0 -d 192.168.1.255 -p udp --dport 2071 -j
LOG
nothing happens either.

But after typing:
iptables -t filter -A INPUT -i eth0 -d 192.168.1.255 -p udp --sport 1025 -j LOG
I see the packets coming in:
Jul 15 00:59:11 firewall kernel: IN=eth0 OUT=
MAC=ff:ff:ff:ff:ff:ff:08:00:4e:a6:f5:74:08:00 SRC=192.168.1.1 DST=192.168.1.255
LEN=116 TOS=0x00 PREC=0x00 TTL=64 ID=31435 PROTO=UDP SPT=1025 DPT=2071 LEN=96
Jul 15 00:59:21 firewall kernel: IN=eth0 OUT=
MAC=ff:ff:ff:ff:ff:ff:08:00:4e:a6:f5:74:08:00 SRC=192.168.1.1 DST=192.168.1.255
LEN=116 TOS=0x00 PREC=0x00 TTL=64 ID=31436 PROTO=UDP SPT=1025 DPT=2071 LEN=96
Jul 15 00:59:31 firewall kernel: IN=eth0 OUT=
MAC=ff:ff:ff:ff:ff:ff:08:00:4e:a6:f5:74:08:00 SRC=192.168.1.1 DST=192.168.1.255
LEN=116 TOS=0x00 PREC=0x00 TTL=64 ID=31437 PROTO=UDP SPT=1025 DPT=2071 LEN=96

So what is wrong here? I think, it is a bug, because it doesn't work as expected.

> BTW: I put "work" in quotes there because although you see the packets going
> through the firewall, does the actual NetBios service allow you to browse
> Windows shares on machines on the other subnet?   My expectation is not,
> because there have been many questions on this list previously about share
> browsing across routers (Windows does network browsing using broadcast
> packets), the solution to which has always been a PDC on the source network,
> with knowledge of the second subnet.
>

That was not my intention. This was only an example to show you, it is possible to
forward broadcastpackets to another network.

> Regards,
>
> Antony.
>
> --
> I think, therefore I am.
> I'm pink, therefore I'm Spam.
> I drink, therefore I think I am.
>
>                                                      Please reply to the list;
>                                                            please don't CC me.

--
Frans Luteijn
PGP PblKey fprnt=C4 87 CE AF BC B6 98 C1  EF 42 A1 9A E2 C0 42 5B
GPG PblKey fprnt=ED20 0F25 C233 DC59 3FFA  170E D0BF 15F5 0BA6 1355




