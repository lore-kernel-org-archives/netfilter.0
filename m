From: "Joshua Perry" <josh@6bit.com>
Subject: RE: GRE Packet in IPSec not Inbound?
Date: Fri, 5 Jan 2007 01:42:20 -0700
Message-ID: <00ed01c730a5$69b846d0$3d28d470$@com>
References: <00ea01c73096$671bc7d0$35535770$@com>
	<17305.1167984636@laika.gnusto.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <17305.1167984636@laika.gnusto.com>
Content-Language: en-us
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

Huh?  I'm I reading the config wrong?  There are no ipsec packets that hit
the vpn1_in chain only the actual data packets get to vpn1_in after ESP and
GRE are stripped.  When the raw data packet makes its run through netfilter
it never hits the rule that you mentioned, right?

I have it working, the caveat is that Shorewall by default adds that "-m
policy --dir in --pol none" to the inbound rules and only the original ESP
packet and the bare data packet match that rule and jump to their respective
zone chains. When I remove that policy everything works great, I'm just
wondering if the asymmetric handling of the policy is a netfilter bug, or if
I should ask the Shorewall guys to look at changing that default policy.

Here is a sample flow of a ping going from one host to the other without
that policy in vlan4_in but it is on vpn1_in:

--------These are the ESP packets--------
Jan  4 17:12:45 slc-gw-01 *m:PREROUTING:1:tcpre:IN=vlan4 OUT=
MAC=00:15:c5:f5:99:be:00:b0:c2:89:af:68:08:00 SRC=67.42.31.242
DST=166.70.106.148 LEN=152 TOS=0x00 PREC=0x00 TTL=240 ID=0 DF PROTO=ESP
SPI=0xb09809f

Jan  4 17:12:45 slc-gw-01 *f:INPUT:7:vlan4_in:IN=vlan4 OUT=
MAC=00:15:c5:f5:99:be:00:b0:c2:89:af:68:08:00 SRC=67.42.31.242
DST=166.70.106.148 LEN=152 TOS=0x00 PREC=0x00 TTL=240 ID=0 DF PROTO=ESP
SPI=0xb09809f

Jan  4 17:12:45 slc-gw-01 *f:vlan4_in:3:inet2fw:IN=vlan4 OUT=
MAC=00:15:c5:f5:99:be:00:b0:c2:89:af:68:08:00 SRC=67.42.31.242
DST=166.70.106.148 LEN=152 TOS=0x00 PREC=0x00 TTL=240 ID=0 DF PROTO=ESP
SPI=0xb09809f

Jan  4 17:12:45 slc-gw-01 *f:inet2fw:1:ACCEPT:IN=vlan4 OUT=
MAC=00:15:c5:f5:99:be:00:b0:c2:89:af:68:08:00 SRC=67.42.31.242
DST=166.70.106.148 LEN=152 TOS=0x00 PREC=0x00 TTL=240 ID=0 DF PROTO=ESP
SPI=0xb09809f


--------Then they get stripped down to the GRE--------
Jan  4 17:12:45 slc-gw-01 *m:PREROUTING:1:tcpre:IN=vlan4 OUT=
MAC=00:15:c5:f5:99:be:00:b0:c2:89:af:68:08:00 SRC=67.42.31.242
DST=166.70.106.148 LEN=112 TOS=0x00 PREC=0x00 TTL=240 ID=0 DF PROTO=47

Jan  4 17:12:45 slc-gw-01 *f:INPUT:7:vlan4_in:IN=vlan4 OUT=
MAC=00:15:c5:f5:99:be:00:b0:c2:89:af:68:08:00 SRC=67.42.31.242
DST=166.70.106.148 LEN=112 TOS=0x00 PREC=0x00 TTL=240 ID=0 DF PROTO=47

Jan  4 17:12:45 slc-gw-01 *f:vlan4_in:5:inet2fw:IN=vlan4 OUT=
MAC=00:15:c5:f5:99:be:00:b0:c2:89:af:68:08:00 SRC=67.42.31.242
DST=166.70.106.148 LEN=112 TOS=0x00 PREC=0x00 TTL=240 ID=0 DF PROTO=47

Jan  4 17:12:45 slc-gw-01 *f:inet2fw:1:ACCEPT:IN=vlan4 OUT=
MAC=00:15:c5:f5:99:be:00:b0:c2:89:af:68:08:00 SRC=67.42.31.242
DST=166.70.106.148 LEN=112 TOS=0x00 PREC=0x00 TTL=240 ID=0 DF PROTO=47


--------Then they run through netfilter as the raw data packets--------
Jan  4 17:12:45 slc-gw-01 *m:PREROUTING:1:tcpre:IN=vpn1 OUT=
MAC=45:00:00:70:00:00:40:00:f0:2f:16:68:43:2a:1f:f2:a6:46:6a:94:20:00:08:00:
ff:ff:ff:ff:45:00:00:54:00:00:40:00:40:01:71:f4:c0:a8 SRC=192.168.254.5
DST=10.0.0.7 LEN=84 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=ICMP TYPE=8
CODE=0 ID=3112 SEQ=8

Jan  4 17:12:45 slc-gw-01 *f:INPUT:5:vpn1_in:IN=vpn1 OUT=
MAC=45:00:00:70:00:00:40:00:f0:2f:16:68:43:2a:1f:f2:a6:46:6a:94:20:00:08:00:
ff:ff:ff:ff:45:00:00:54:00:00:40:00:40:01:71:f4:c0:a8 SRC=192.168.254.5
DST=10.0.0.7 LEN=84 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=ICMP TYPE=8
CODE=0 ID=3112 SEQ=8

Jan  4 17:12:45 slc-gw-01 *f:vpn1_in:1:dynamic:IN=vpn1 OUT=
MAC=45:00:00:70:00:00:40:00:f0:2f:16:68:43:2a:1f:f2:a6:46:6a:94:20:00:08:00:
ff:ff:ff:ff:45:00:00:54:00:00:40:00:40:01:71:f4:c0:a8 SRC=192.168.254.5
DST=10.0.0.7 LEN=84 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=ICMP TYPE=8
CODE=0 ID=3112 SEQ=8

Jan  4 17:12:45 slc-gw-01 *f:vpn1_in:3:all2all:IN=vpn1 OUT=
MAC=45:00:00:70:00:00:40:00:f0:2f:16:68:43:2a:1f:f2:a6:46:6a:94:20:00:08:00:
ff:ff:ff:ff:45:00:00:54:00:00:40:00:40:01:71:f4:c0:a8 SRC=192.168.254.5
DST=10.0.0.7 LEN=84 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=ICMP TYPE=8
CODE=0 ID=3112 SEQ=8


Here is the same ping but with that policy still on vlan4_in:

--------These are the ESP packets--------
Jan  4 13:32:05 slc-gw-01 *m:PREROUTING:1:tcpre:IN=vlan4 OUT=
MAC=00:15:c5:f5:99:be:00:b0:c2:89:af:68:08:00 SRC=67.42.31.242
DST=166.70.106.148 LEN=152 TOS=0x00 PREC=0x00 TTL=240 ID=0 DF PROTO=ESP
SPI=0x1849b2

Jan  4 13:32:05 slc-gw-01 *f:INPUT:7:vlan4_in:IN=vlan4 OUT=
MAC=00:15:c5:f5:99:be:00:b0:c2:89:af:68:08:00 SRC=67.42.31.242
DST=166.70.106.148 LEN=152 TOS=0x00 PREC=0x00 TTL=240 ID=0 DF PROTO=ESP
SPI=0x1849b2

Jan  4 13:32:05 slc-gw-01 *f:vlan4_in:3:inet2fw:IN=vlan4 OUT=
MAC=00:15:c5:f5:99:be:00:b0:c2:89:af:68:08:00 SRC=67.42.31.242
DST=166.70.106.148 LEN=152 TOS=0x00 PREC=0x00 TTL=240 ID=0 DF PROTO=ESP
SPI=0x1849b2

Jan  4 13:32:05 slc-gw-01 *f:inet2fw:1:ACCEPT:IN=vlan4 OUT=
MAC=00:15:c5:f5:99:be:00:b0:c2:89:af:68:08:00 SRC=67.42.31.242
DST=166.70.106.148 LEN=152 TOS=0x00 PREC=0x00 TTL=240 ID=0 DF PROTO=ESP
SPI=0x1849b2


--------Then they get stripped down to the GRE--------
Jan  4 13:32:05 slc-gw-01 *m:PREROUTING:1:tcpre:IN=vlan4 OUT=
MAC=00:15:c5:f5:99:be:00:b0:c2:89:af:68:08:00 SRC=67.42.31.242
DST=166.70.106.148 LEN=112 TOS=0x00 PREC=0x00 TTL=240 ID=0 DF PROTO=47

Jan  4 13:32:05 slc-gw-01 *f:INPUT:7:vlan4_in:IN=vlan4 OUT=
MAC=00:15:c5:f5:99:be:00:b0:c2:89:af:68:08:00 SRC=67.42.31.242
DST=166.70.106.148 LEN=112 TOS=0x00 PREC=0x00 TTL=240 ID=0 DF PROTO=47

Jan  4 13:32:05 slc-gw-01 *f:INPUT:9:Reject:IN=vlan4 OUT=
MAC=00:15:c5:f5:99:be:00:b0:c2:89:af:68:08:00 SRC=67.42.31.242
DST=166.70.106.148 LEN=112 TOS=0x00 PREC=0x00 TTL=240 ID=0 DF PROTO=47

Jan  4 13:32:05 slc-gw-01 *f:Reject:3:dropBcast:IN=vlan4 OUT=
MAC=00:15:c5:f5:99:be:00:b0:c2:89:af:68:08:00 SRC=67.42.31.242
DST=166.70.106.148 LEN=112 TOS=0x00 PREC=0x00 TTL=240 ID=0 DF PROTO=47

Jan  4 13:32:05 slc-gw-01 *f:Reject:9:dropInvalid:IN=vlan4 OUT=
MAC=00:15:c5:f5:99:be:00:b0:c2:89:af:68:08:00 SRC=67.42.31.242
DST=166.70.106.148 LEN=112 TOS=0x00 PREC=0x00 TTL=240 ID=0 DF PROTO=47

Jan  4 13:32:05 slc-gw-01 *f:INPUT:11:LOG --log-pref:IN=vlan4 OUT=
MAC=00:15:c5:f5:99:be:00:b0:c2:89:af:68:08:00 SRC=67.42.31.242
DST=166.70.106.148 LEN=112 TOS=0x00 PREC=0x00 TTL=240 ID=0 DF PROTO=47

Jan  4 13:32:05 slc-gw-01 *f:INPUT:13:reject:IN=vlan4 OUT=
MAC=00:15:c5:f5:99:be:00:b0:c2:89:af:68:08:00 SRC=67.42.31.242
DST=166.70.106.148 LEN=112 TOS=0x00 PREC=0x00 TTL=240 ID=0 DF PROTO=47

Jan  4 13:32:05 slc-gw-01 *f:reject:19:REJECT --rejec:IN=vlan4 OUT=
MAC=00:15:c5:f5:99:be:00:b0:c2:89:af:68:08:00 SRC=67.42.31.242
DST=166.70.106.148 LEN=112 TOS=0x00 PREC=0x00 TTL=240 ID=0 DF PROTO=47


You can see that the ESP got accepted because of the rule you mentioned, but
the policy match filter keeps the GRE packets from getting ACCEPTED (they
don't even make it into the inet2fw chain because of it).

In the inet2fw chain right below the rule you mentioned is this rule:

1   112 ACCEPT     47   --  *      *       67.42.31.242

This is the rule in that is supposed to ACCEPT GRE (protocol 47) but again
it never makes it there because this policy match "dir in" keeps the GRE out
of that chain but not the ESP or the raw data packet (out of its own evl2fw
chain).

Josh

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Ted Phelps
Sent: Friday, January 05, 2007 1:11 AM
To: netfilter@lists.netfilter.org
Subject: Re: GRE Packet in IPSec not Inbound? 


"Joshua Perry" writes:
> Ok so the problem I have is that in the interface chain for the interface
> that is connected to the internet Shorewall puts a policy match filter
"--m
> policy --dir in --pol none" When the ESP packets come in it matches that
> policy because it is inbound.  The GRE packet that gets excised from the
ESP
> begins again at INPUT but that packet does not match that rule for some
> reason.  At first I wasn't sure if this was by design or not so I manually
> put in a jump rule without the policy match which worked good.

The IPsec packet matches the vpn1_in policy because it matches this rule:

    1   152 ACCEPT     esp  --  *      *       67.42.31.242    0.0.0.0/0

It's not surprisng that the packet no longer matches this once the ESP
wrapper is stripped away.  If you want to accept the packet because it
matched this rule when it first came in (which I assume is what you
want) then you need to mark it as having arrived on a secure interface.

Have a look at the LARTC HOWTO:

    http://tldp.org/HOWTO/Adv-Routing-HOWTO/lartc.netfilter.html

Cheers,
-Ted


-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Ted Phelps
Sent: Friday, January 05, 2007 1:11 AM
To: netfilter@lists.netfilter.org
Subject: Re: GRE Packet in IPSec not Inbound? 


"Joshua Perry" writes:
> Ok so the problem I have is that in the interface chain for the interface
> that is connected to the internet Shorewall puts a policy match filter
"--m
> policy --dir in --pol none" When the ESP packets come in it matches that
> policy because it is inbound.  The GRE packet that gets excised from the
ESP
> begins again at INPUT but that packet does not match that rule for some
> reason.  At first I wasn't sure if this was by design or not so I manually
> put in a jump rule without the policy match which worked good.

The IPsec packet matches the vpn1_in policy because it matches this rule:

    1   152 ACCEPT     esp  --  *      *       67.42.31.242    0.0.0.0/0

It's not surprisng that the packet no longer matches this once the ESP
wrapper is stripped away.  If you want to accept the packet because it
matched this rule when it first came in (which I assume is what you
want) then you need to mark it as having arrived on a secure interface.

Have a look at the LARTC HOWTO:

    http://tldp.org/HOWTO/Adv-Routing-HOWTO/lartc.netfilter.html

Cheers,
-Ted



