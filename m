From: Jason Opperisano <opie@817west.com>
Subject: Re: state: INVALID
Date: Mon, 22 Nov 2004 08:45:22 -0500
Message-ID: <1101131121.13662.17.camel@hubcap.ljm.dom>
References: <419E75B1.3030406@uni-paderborn.de>
	<1100990773.3501.9.camel@hubcap.ljm.dom>
	<419FD0BD.6000906@uni-paderborn.de>
	<1101061543.3501.18.camel@hubcap.ljm.dom>
	<41A11AD5.3080401@uni-paderborn.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41A11AD5.3080401@uni-paderborn.de>
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
Cc: bj-schmidt@uni-paderborn.de

On Sun, 2004-11-21 at 17:46, Bj=C3=B6rn Schmidt wrote:
> I changed the log rule(s) that creates "ILLEGAL_PACKET", now it creates
> "OUTPUT_INVALID", "INPUT_INVALID" and "FORWARD_INVALID". Here is one li=
ne
> from the log with the new rules (client):
>=20
> Nov 21 23:21:43 gigabyte OUTPUT_INVALID IN=3D OUT=3Deth0 MAC=3D SRC=3D1=
92.168.1.2=20
> DST=3D192.168.1.1 LEN=3D52 TOS=3D00 PREC=3D0x00 TTL=3D64 ID=3D23692 DF =
PROTO=3DTCP SPT=3D32807=20
> DPT=3D22 SEQ=3D798630945 ACK=3D685050669 WINDOW=3D1460 ACK URGP=3D0
>=20
> The state of this packet should be ESTABLISHED, but it _is_ INVALID.
> Perhaps there is a bug in ipsec or netfilter...

it almost seems like you have an asymmetric routing situation--what i
mean by that is that the SYN packet is reaching 192.168.1.2 without
going through the firewall and therefore the SYN-ACK is NEW, not
RELATED...

also--you keep mentioning IPsec.  first off--i never use conntrack to
match IPsec traffic.  second--you need to be aware that packets traverse
the filter chains twice in a 2.6 kernel--once encrypted, and once
decrypted.  for 2.6 IPsec rules, i use something like:

  # mark ipsec traffic
  iptables -t mangle -A PREROUTING -p 50 -s $PEER -j MARK --set-mark 1

  # allow IKE & ESP in
  iptables -A INPUT -p udp -s $PEER --sport 500 --dport 500 -j ACCEPT
  iptables -A INPUT -p 50 -s $PEER -j ACCEPT

  # allow decrypted packets
  iptables -A INPUT -m mark --mark 1 -j ACCEPT

  # allow IKE & ESP out
  iptables -A OUTPUT -p udp -d $PEER --sport 500 --dport 500 -j ACCEPT
  iptables -A OUTPUT -p 50 -d $PEER -j ACCEPT

  [ your sepcific rules follow here ]

>  > my guess is that your rules do not match your intentions.
>=20
> Impossible. I have this problem even with this _minimalistic_ ruleset:
>=20
> gigabyte:~# cat firewall.tmp
> #!/bin/sh
>=20
> iptables  -P INPUT DROP
> iptables  -P OUTPUT DROP
> iptables  -P FORWARD DROP
>=20
> iptables  -A INPUT   -m state --state ESTABLISHED,RELATED,NEW -j ACCEPT
> iptables  -A OUTPUT  -m state --state ESTABLISHED,RELATED,NEW -j ACCEPT
> iptables  -A FORWARD -m state --state ESTABLISHED,RELATED,NEW -j ACCEPT
>=20
> iptables -A INPUT -m state --state INVALID -j ULOG --ulog-prefix INPUT_=
INVALID
> iptables -A OUTPUT -m state --state INVALID -j ULOG --ulog-prefix OUTPU=
T_INVALID
> iptables -A FORWARD -m state --state INVALID -j ULOG --ulog-prefix FORW=
ARD_INVALID
>=20
> >>Besides I forgot to mention that i only get "false INVALID" states wi=
th
> >>activated IPsec (esp in transport mode, kernel 2.6). With IPsec _AND_=
 iptables
> >>it es NOT possible to establish a new tcp connection due to these "IN=
VALID
> >>state packets".
> >=20
> > uh huh...  post your rules:
> >=20
> > iptables -t mangle -vnxL
>=20
> gigabyte:~# iptables -t mangle -vnxL
> Chain PREROUTING (policy ACCEPT 0 packets, 0 bytes)
>      pkts      bytes target     prot opt in     out     source=20
> destination
>=20
> Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
>      pkts      bytes target     prot opt in     out     source=20
> destination
>=20
> Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
>      pkts      bytes target     prot opt in     out     source=20
> destination
>=20
> Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
>      pkts      bytes target     prot opt in     out     source=20
> destination
>=20
> Chain POSTROUTING (policy ACCEPT 0 packets, 0 bytes)
>      pkts      bytes target     prot opt in     out     source=20
> destination
>=20
>=20
> > iptables -t nat -vnxL
>=20
> gigabyte:~# iptables -t nat -vnxL
> Chain PREROUTING (policy ACCEPT 7 packets, 1515 bytes)
>      pkts      bytes target     prot opt in     out     source=20
> destination
>=20
> Chain POSTROUTING (policy ACCEPT 26 packets, 2637 bytes)
>      pkts      bytes target     prot opt in     out     source=20
> destination
>=20
> Chain OUTPUT (policy ACCEPT 26 packets, 2565 bytes)
>      pkts      bytes target     prot opt in     out     source=20
> destination
>=20
> > iptables -vnxL
>=20
> gigabyte:~# iptables -vnxL
> Chain INPUT (policy DROP 0 packets, 0 bytes)
>      pkts      bytes target     prot opt in     out     source=20
> destination
>      2460  2616788 ACCEPT     all  --  *      *       0.0.0.0/0=20
> 0.0.0.0/0           state NEW,RELATED,ESTABLISHED
>         0        0 ULOG       all  --  *      *       0.0.0.0/0=20
> 0.0.0.0/0           state INVALID ULOG copy_range 0 nlgroup 1 prefix=20
> `INPUT_INVALID' queue_threshold 1
>=20
> Chain FORWARD (policy DROP 0 packets, 0 bytes)
>      pkts      bytes target     prot opt in     out     source=20
> destination
>         0        0 ACCEPT     all  --  *      *       0.0.0.0/0=20
> 0.0.0.0/0           state NEW,RELATED,ESTABLISHED
>         0        0 ULOG       all  --  *      *       0.0.0.0/0=20
> 0.0.0.0/0           state INVALID ULOG copy_range 0 nlgroup 1 prefix=20
> `FORWARD_INVALID' queue_threshold 1
>=20
> Chain OUTPUT (policy DROP 38 packets, 2036 bytes)
>      pkts      bytes target     prot opt in     out     source=20
> destination
>      1938   959688 ACCEPT     all  --  *      *       0.0.0.0/0=20
> 0.0.0.0/0           state NEW,RELATED,ESTABLISHED
>        38     2036 ULOG       all  --  *      *       0.0.0.0/0=20
> 0.0.0.0/0           state INVALID ULOG copy_range 0 nlgroup 1 prefix=20
> `OUTPUT_INVALID' queue_threshold 1

the only packet counters that are incrementing are the OUTPUT chain
filters...  so for *some* reason--you have packets that are leaking
through that first rule...

> Hmmm, it is not possible to establish a ssh connection, but it IS
> possible to establish a telnet connection (but it needs ~148 seconds
> until the "skyron login:" appears).

sounds like a reverse name lookup issue.

can you provide a tcpdump (from 192.168.1.2) of a connection attempt?

-j

--
"Weaseling out of things is important to learn. It's what separates
 us from the animals...except the weasel."
	--The Simpsons


