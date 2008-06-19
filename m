From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: too many INVALID packets
Date: Thu, 19 Jun 2008 12:45:41 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0806191244430.11904@blackhole.kfki.hu>
References: <200806181415.00808.vladislav.kurz@webstep.net>
 <Pine.LNX.4.64.0806181446100.10175@blackhole.kfki.hu>
 <200806191231.56317.vladislav.kurz@webstep.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200806191231.56317.vladislav.kurz@webstep.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vladislav Kurz <vladislav.kurz@webstep.net>
Cc: netfilter@vger.kernel.org

On Thu, 19 Jun 2008, Vladislav Kurz wrote:

> > Yes, the main difference (from conntrack point of view) is that TCP window
> > tracking was added to netfilter in 2.6. However if I recall correctly,
> > 2.6.18 has got some TCP window tracking related bugs. So you should
> > upgrade your kernel.
> 
> Is there any site where can I find more info on this issue?

The TCP window tracking code is based on the article 'Real Stateful TCP 
Packet Filtering in IP Filter' by Guido van Rooij. You can find it at 
http://www.nluug.nl/events/sane2000/papers.html.

The functions evolved a lot and there are a handful modification compared 
to the algorithm written in the article, but it's undocumented (not 
counting the comments in the source).

> > ip_conntrack_log_invalid logs the "magic", which can help to identify
> > possible problems in TCP connection tracking: ignored packets or packets
> > dropped by conntrack itself. All else is flagges as NEW, ESTABLISHED,
> > RELATED or INVALID.
> 
> So does that mean that some packets are dropped before they enter iptables?

You mean mangle, nat and filter tables by 'iptables, isn't it?
(All packets are seen in the raw table, then comes conntrack.)

> Which ones?

SYN/ACK packets sent as reply to SYN packets which was ignored as invalid.
(Thus we can delete the stale conntrack entry and force the client to 
resend the initial SYN.)
 
> > The conntrack match offers more internal flags (like SNAT, DNAT) above
> > the state match.
> 
> Ok, thats documented,what I wanted to know is if the four states NEW, RELATED, 
> ESTABLISHED and INVALID are equal in -m conntrack and -m state.

They are identical.
 
> > Back to the INVALID packets: enable ip_conntrack_tcp_be_liberal:
> >
> > # echo 1 > /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_be_liberal
> >
> > If the INVALID packets disappear, it can indicate the TCP window tracking
> > bug and then you should use a newer kernel release (or run with
> > ip_conntrack_tcp_be_liberal enabled).
> 
> Yep, I had this enabled on those servers. Now I turned it off on one of them 
> and get more logs of this type: 
> 
> ip_ct_tcp: SEQ is under the lower bound (already ACKed data retransmitted) IN= 
> OUT= SRC=192.168.1.10 DST=192.168.2.122 LEN=40 TOS=0x00 PREC=0x00 TTL=64 
> ID=44558 DF PROTO=TCP SPT=3128 DPT=2140 SEQ=2998644047 ACK=4173779699 
> WINDOW=62780 RES=0x00 ACK FIN URGP=0 UID=13
> 
> ip_ct_tcp: ACK is under the lower bound (possible overly delayed ACK) IN= OUT= 
> SRC=192.168.2.122 DST=192.168.1.10 LEN=40 TOS=0x
> 00 PREC=0x00 TTL=128 ID=46970 DF PROTO=TCP SPT=2140 DPT=3128 SEQ=4173779699 
> ACK=2998644048 WINDOW=64313 RES=0x00 ACK URGP=0

These packets are marked as INVALID as they are out of window ones.
 
> INVALID: IN=eth0 OUT= MAC=00:1a:64:6d:96:3f:00:13:d3:ed:6e:c7:08:00 
> SRC=192.168.2.122 DST=192.168.1.10 LEN=40 TOS=0x00 PREC=0x00
>  TTL=128 ID=46970 DF PROTO=TCP SPT=2140 DPT=3128 WINDOW=64313 RES=0x00 ACK 
> URGP=0
> 
> Last line is logged by iptables. What I wonder is that there is corresponding 
> log from iptables to "ACK is under the lower bound" but not to "SEQ is under 
> the lower bound". 

That is strange. If you log INVALID packets, then you should get the 
correspondig log lines. 

> I get also quite a few "ACK/SEQ is over the upper bound" bith with 
> corresponding log from iptables. Does that mean that packets with "SEQ 
> under the lower bound" are ESTABLISHED ? Thinking more about it, they 
> should - ACK might be lost, so retransmitting already ACKed data is ok.

If they were not INVALID, then would be ESTABLISHED.
 
> Where can I find which ip_ct_tcp log entries get flagged as INVALID and which 
> as other states? 

I don't quite understand what do you mean here. All packets logged with 
"ip_ct_tcp: text" are flagged as INVALID.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
