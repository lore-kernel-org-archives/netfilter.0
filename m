From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: sub interface filtering
Date: Thu, 3 Apr 2003 11:42:53 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200304031142.53049.netfilter@newkirk.us>
References: <000b01c2f947$feb84a80$8b01a8c0@win2k.com> <200304021556.00113.netfilter@newkirk.us> <001e01c2f9f8$9f53f380$8b01a8c0@win2k.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001e01c2f9f8$9f53f380$8b01a8c0@win2k.com>
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
To: Mike <mikeeo@msn.com>, netfilter@lists.netfilter.org

On Thursday 03 April 2003 10:49 am, Mike wrote:
> Joel,
>         I tried forwarding ALL connections  and then filtering by the
> forward chain but no luck. Once it reaches the PREROUTING chain and
> makes its descision does it pass anymore chains? Or is that it. I have

It still passes the filter table chains, either INPUT or FORWARD.

> always read you don't want to filter in the NAT table and PREROUTING

That's right.  In some circumstances traffic will bypass those chains. =20
(IE, you have an established connection that is being NATted, it's=20
traffic will usually not appear in NAT PREROUTING, just the first=20
packet)  Normally you should only have ACCEPT, DNAT, or REDIRECT targets=20
in that chain, and an ACCEPT policy.  (The MIRROR target would be valid=20
there as well, and any traffic MIRRORed would NOT appear in any=20
subsequent chains... MIRROR should only be used if you really understand=20
what it is doing, really need it, and are really careful with it)

> doesn't have a filter table just a NAT & MANGLE. Any ideas?

Two.  One is to try:
iptables -I FORWARD 1 -j LOG --log-prefix "FWDLOGALL:"
which will log every packet passing through FORWARD chain, with=20
"FWDLOGALL" prepended to each entry.  This will let you see precisely=20
what traffic is going through, and what it looks like (re IPs, ports,=20
etc).  It can also potentially generate a huge number of log entries, so=20
don't leave it in any longer than necessary!  You can of course do the=20
same thing with "-t nat -I PREROUTING 1" to see ALL traffic that is=20
presenting to the box, and narrow down either LOG rule by matching IPs,=20
ports, interface, etc.  (although "-i" will only match the physical=20
interface)

I've just tested here and it works. (actually I already knew it would,=20
but wanted to generate the log entries :^)  I set PREROUTING rules on my=20
gateway to LOG then DNAT all connections inbound on ppp0 to my desktop=20
machine, and LOG all traffic in FORWARD, then ssh'd back to myself from=20
a remote SSH session I had open.  The ssh connection was DNATted=20
properly and it was LOGged in FORWARD.  Then it was subsequently DROPped=20
since I only accept SSH connections in FORWARD that originate on my=20
desktop machine, and always LOG any DROPs in FORWARD.

Apr  3 11:43:32 janus kernel: DNATTEST:IN=3Dppp0 OUT=3D MAC=3D SRC=3D {el=
ided}=20
DST=3D141.150.211.149 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D53 ID=3D62380=
 DF=20
PROTO=3DTCP SPT=3D35792 DPT=3D22 WINDOW=3D5840 RES=3D0x00 SYN URGP=3D0

Apr  3 11:43:32 janus kernel: FWDLOG:IN=3Dppp0 OUT=3Deth1 SRC=3D {elided}=
=20
DST=3D192.168.0.1 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D52 ID=3D62380 DF =
PROTO=3DTCP=20
SPT=3D35792 DPT=3D22 WINDOW=3D5840 RES=3D0x00 SYN URGP=3D0

Apr  3 11:43:32 janus kernel: IPT:FORWARDdrop:IN=3Dppp0 OUT=3Deth1 SRC=3D=
=20
{elided} DST=3D192.168.0.1 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D52 ID=3D=
62380 DF=20
PROTO=3DTCP SPT=3D35792 DPT=3D22 WINDOW=3D5840 RES=3D0x00 SYN URGP=3D0


The other approach is to just DNAT the ports you need, and make sure you=20
DROP everything on INPUT.  Since your scenario here is multiple IPs on a=20
single interface, each forwarding to a different local machine, the=20
first approach makes more sense - if you need to open/close ports to a=20
given local machine later then everything is already set up, you just=20
filter in the FORWARD chain as usual.

j


> -Mike
> ----- Original Message -----
> From: "Joel Newkirk" <netfilter@newkirk.us>
> To: "Mike" <mikeeo@msn.com>; <netfilter@lists.netfilter.org>
> Sent: Wednesday, April 02, 2003 3:56 PM
> Subject: Re: sub interface filtering
>
> On Wednesday 02 April 2003 01:45 pm, Mike wrote:
> > Hi guys I have the following setup and rules. And I cant seem to get
> > the filtering to work.
> >
> > iptables -t nat -A PREROUTING -p tcp <routeable internetIP/28>
> > --dport 80 -j DNAT --to 192.168.1.197
> >
> > iptables -t nat -A PREROUTING -p tcp <routeable internetIP/28>
> > --dport 443 -j DNAT --to 192.168.1.197
> > iptables -t nat -A POSTROUTING -o eth2 -s 192.168.1.197 -j SNAT --to
> > <routeable internetIP/28
> >
> > but when I scan eth2:1 or eth2:2 from an outside machine I can see
> > ALL the local services (ssh, ptptp,dns etc..) Is connection not
> > passing the forwading chain?
>
> You are DNATting dport 80 and dport 443, but the remainder of the
> ports are not being DNATted, so they still target the firewall box.=20
> You'd need to DNAT all connections to the specified IP, then DROP all
> except ports 80 and 443 in FORWARD to avoid this.
>
> Of course, this also shows that you are letting lots of (all?!?) ports
> through the INPUT chain to the box itself from outside, which you
> should lock down as well...  A DROP policy on INPUT is called for,
> then ACCEPT required ports from eth2 for externally-accessed services
> (if any) and ACCEPT required (or all if desired) ports from the LAN
> machines.
>
> j


