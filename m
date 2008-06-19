From: Vladislav Kurz <vladislav.kurz@webstep.net>
Subject: Re: too many INVALID packets
Date: Thu, 19 Jun 2008 13:46:14 +0200
Message-ID: <200806191346.14950.vladislav.kurz@webstep.net>
References: <200806181415.00808.vladislav.kurz@webstep.net> <200806191231.56317.vladislav.kurz@webstep.net> <Pine.LNX.4.64.0806191244430.11904@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0806191244430.11904@blackhole.kfki.hu>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>

On Thursday 19 of June 2008, Jozsef Kadlecsik wrote:
> On Thu, 19 Jun 2008, Vladislav Kurz wrote:
> > > Back to the INVALID packets: enable ip_conntrack_tcp_be_liberal:
> > >
> > > # echo 1 > /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_be_liberal
> > >
> > > If the INVALID packets disappear, it can indicate the TCP window
> > > tracking bug and then you should use a newer kernel release (or run
> > > with ip_conntrack_tcp_be_liberal enabled).
> >
> > Yep, I had this enabled on those servers. Now I turned it off on one of
> > them and get more logs of this type:
> >
> > ip_ct_tcp: SEQ is under the lower bound (already ACKed data
> > retransmitted) IN= OUT= SRC=192.168.1.10 DST=192.168.2.122 LEN=40
> > TOS=0x00 PREC=0x00 TTL=64 ID=44558 DF PROTO=TCP SPT=3128 DPT=2140
> > SEQ=2998644047 ACK=4173779699 WINDOW=62780 RES=0x00 ACK FIN URGP=0 UID=13
> >
> > ip_ct_tcp: ACK is under the lower bound (possible overly delayed ACK) IN=
> > OUT= SRC=192.168.2.122 DST=192.168.1.10 LEN=40 TOS=0x
> > 00 PREC=0x00 TTL=128 ID=46970 DF PROTO=TCP SPT=2140 DPT=3128
> > SEQ=4173779699 ACK=2998644048 WINDOW=64313 RES=0x00 ACK URGP=0
>
> These packets are marked as INVALID as they are out of window ones.
>
> > INVALID: IN=eth0 OUT= MAC=00:1a:64:6d:96:3f:00:13:d3:ed:6e:c7:08:00
> > SRC=192.168.2.122 DST=192.168.1.10 LEN=40 TOS=0x00 PREC=0x00
> >  TTL=128 ID=46970 DF PROTO=TCP SPT=2140 DPT=3128 WINDOW=64313 RES=0x00
> > ACK URGP=0
> >
> > Last line is logged by iptables. What I wonder is that there is
> > corresponding log from iptables to "ACK is under the lower bound" but not
> > to "SEQ is under the lower bound".
>
> That is strange. If you log INVALID packets, then you should get the
> correspondig log lines.

Well, my bad in this case, I forgot to log INVALID in OUTPUT chain. 
But anyway I see lots of "ip_ct_tcp: invalid packet ignored" without 
corresponding log from iptables. And vice-versa, iptables log much more 
invalid TCP packets then ip_ct_tcp does.

> > I get also quite a few "ACK/SEQ is over the upper bound" bith with
> > corresponding log from iptables. Does that mean that packets with "SEQ
> > under the lower bound" are ESTABLISHED ? Thinking more about it, they
> > should - ACK might be lost, so retransmitting already ACKed data is ok.
>
> If they were not INVALID, then would be ESTABLISHED.
>
> > Where can I find which ip_ct_tcp log entries get flagged as INVALID and
> > which as other states?
>
> I don't quite understand what do you mean here. All packets logged with
> "ip_ct_tcp: text" are flagged as INVALID.

If all are flagged as invalid then they would be logged by iptables but not 
all of them are, and vice versa quite a lot is logged as INVALID but not with 
ip_ct_tcp: text.

-- 
S pozdravem
        Vladislav Kurz

=== WebStep, s.r.o. (Ltd.) ========= a step to the Web ===
address: Mezirka 1, 602 00 Brno, CZ, tel: +420 548 214 711
=== www.webstep.net ======= vladislav.kurz@webstep.net ===

