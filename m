From: Valts Silaputnins <support@proxyswitcher.com>
Subject: Re: iptables + local server via udp + conntracking + 2 uplinks =
 wrong source address for replies
Date: Mon, 09 Jul 2012 12:50:55 +0300
Message-ID: <4FFAA97F.6090404@gmail.com>
References: <4FF05213.3020204@gmail.com> <1341782140.2557.10.camel@andylaptop>
Reply-To: ValtsS@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1341782140.2557.10.camel@andylaptop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Beverley <andy@andybev.com>
Cc: netfilter@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


Thanks for the reply Andrew,

Andrew Beverley said the following on 7/9/2012 00:15:
> On Sun, 2012-07-01 at 16:35 +0300, Valts Silaputnins wrote:
> <snip>
>> However the source address was still wrong. Ok so I tried to fix that by
>> adding SNAT to POSTROUTING chain. Only to realize that for some reason
>> those packets don't hit it (checked by -j TRACE...).
> 
> What are your rules for this? As long as the packets are actually
> hitting that chain then I don't see why they wouldn't be sent to the
> SNAT target.


POSTROUTING nat table is pretty basic:

Chain POSTROUTING (policy ACCEPT 2503 packets, 131K bytes)
 pkts bytes target     prot opt in     out     source
destination
    6   450 SNAT       all  --  any    wan0    anywhere
anywhere             to:46.109.116.xx
    6   544 SNAT       all  --  any    wan1    anywhere
anywhere             to:46.109.237.xx


according to TRACE they would hit mangle table of POSTROUTING but not NAT:

//TRACE udp sport=3784
TRACE: raw:OUTPUT:policy:2 IN= OUT=wan1 SRC=46.109.237.xx
DST=213.175.115.xx LEN=228 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=UDP
SPT=3784 DPT=57341 LEN=208 UID=1001 GID=99

//CONNMARK restore
TRACE: mangle:OUTPUT:rule:1 IN= OUT=wan1 SRC=46.109.237.xx
DST=213.175.115.xx LEN=228 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=UDP
SPT=3784 DPT=57341 LEN=208 UID=1001 GID=99

//ACCEPT if mark !=0
TRACE: mangle:OUTPUT:rule:2 IN= OUT=wan1 SRC=46.109.237.xx
DST=213.175.115.xx LEN=228 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=UDP
SPT=3784 DPT=57341 LEN=208 UID=1001 GID=99 MARK=0x1

//ACCEPT
TRACE: filter:OUTPUT:policy:1 IN= OUT=wan1 SRC=46.109.237.xx
DST=213.175.115.xx LEN=228 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=UDP
SPT=3784 DPT=57341 LEN=208 UID=1001 GID=99 MARK=0x1

//policy ACCEPT, table is empty
TRACE: mangle:POSTROUTING:policy:1 IN= OUT=wan0 SRC=46.109.237.xx
DST=213.175.115.xx LEN=228 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=UDP
SPT=3784 DPT=57341 LEN=208 UID=1001 GID=99 MARK=0x1

And that's it, TRACE doesn't show it reaching the nat table of POSTROUTING.

What I see from trace is that packet was going to go out via WAN1, had
it's mark restored, routing matched it to go via WAN0 but it didn't
reach SNAT according to TRACE.

> I don't see why it should be a problem, but you have to use SNAT in the
> POSTROUTING chain not OUTPUT. From the man page:
> 
>  SNAT   This  target  is only valid in the nat table, in the POSTROUTING
> chain.
> 

I wasn't precise. Of course I can't SNAT in OUTPUT chain nat table.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (MingW32)

iEYEARECAAYFAk/6qX8ACgkQ7nq3gp3q9WPaOQCgvoWvqtrInors/VarPClOre0U
7lEAoPuQsEmfCgbJatRbUywap1aIGOw/
=BG4q
-----END PGP SIGNATURE-----
