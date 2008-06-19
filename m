From: Vladislav Kurz <vladislav.kurz@webstep.net>
Subject: Re: too many INVALID packets
Date: Thu, 19 Jun 2008 12:31:56 +0200
Message-ID: <200806191231.56317.vladislav.kurz@webstep.net>
References: <200806181415.00808.vladislav.kurz@webstep.net> <Pine.LNX.4.64.0806181446100.10175@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0806181446100.10175@blackhole.kfki.hu>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Wednesday 18 of June 2008, you wrote:
> Hello,

Thanks for quick reply.

> On Wed, 18 Jun 2008, Vladislav Kurz wrote:
> > I have a couple of questions about netfilter conntrack and INVALID
> > packets.
> >
> > I'm administrator of couple of servers, some of them still running 2.4
> > kernels, some running (upgraded or new install) to 2.6.18 (Debian
> > packaged kernels). On all of them I have firewall beginning with these
> > rules:
> >
> > iptables -t filter -A INPUT -m state --state ESTABLISHED,RELATED -j
> > ACCEPT iptables -t filter -A INPUT -m state --state INVALID -j DROP
> >
> > and the same in FORWARD chain.
> >
> > Machines with 2.4 kernel see almost no INVALID packets in the long run.
> > Machines with 2.6 kernel see hundreds of INVALID packets every day.
> > I suppose that the logic deciding what is INVALID has changed a lot a now
> > catches more stuff than before.
>
> Yes, the main difference (from conntrack point of view) is that TCP window
> tracking was added to netfilter in 2.6. However if I recall correctly,
> 2.6.18 has got some TCP window tracking related bugs. So you should
> upgrade your kernel.

Is there any site where can I find more info on this issue?

> > Now I see log entries like:
> >
> > ip_ct_tcp: invalid packet ignored IN= OUT= SRC=a.b.c.d DST=x.y.z.q LEN=48
> > TOS=0x00 PREC=0x00 TTL=118 ID=57462 DF PROTO=TCP SPT=2745 DPT=110
> > SEQ=1241333208 ACK=0 WINDOW=65535 RES=0x00 SYN URGP=0 OPT
> > (020405B401010402) (most of them have SYN flag)
> >
> > Interesting thing is that these log entries do not match those logged by
> > iptables -t filter -A INPUT -m state --state INVALID -j LOG
> >
> > Can someone tell why these two logs do not match, and what happens with
> > packets logged by (ip_ct_tcp) ip_conntrack_log_invalid?
>
> TCP conntrack tries very hard to keep track of the connections.
>
> The packets which are logged as 'invalid packet ignored' looks to
> conntrack as invalid, because it holds a connections and the packet does
> not fit into the stream. But at the same time it might be that conntrack
> holds a dead connection and the packet is a real, new,
> connection-initiating packet (SYN flag is on). So conntrack ignores the
> seemingly invalid packet, flags it as 'ESTABLISHED' (not 'INVALID') and
> lets it through. The reply packet will tell conntrack what should it do:
> delete the old dead connection or keep it as real.
>
> ip_conntrack_log_invalid logs the "magic", which can help to identify
> possible problems in TCP connection tracking: ignored packets or packets
> dropped by conntrack itself. All else is flagges as NEW, ESTABLISHED,
> RELATED or INVALID.

So does that mean that some packets are dropped before they enter iptables?
Which ones?

>
> > I noticed that iptables offers new match: -m conntrack --ctstate
> > which has also NEW, RELATED, ESTABLISHED and INVALID states. Are they
> > somehow different from those matched by -m state --state ?
>
> The conntrack match offers more internal flags (like SNAT, DNAT) above
> the state match.

Ok, thats documented,what I wanted to know is if the four states NEW, RELATED, 
ESTABLISHED and INVALID are equal in -m conntrack and -m state.

> > At last I would like to know if conntrack cares about TCP flags? Does it
> > check if NEW (and RELATED) TCP packets have SYN flag set and if not
> > treats them as INVALID? I tried this:
> >
> > iptables -t filter -A INPUT -m state --state NEW -p tcp ! --syn -j LOG
> >
> > and it catches quite a lot of packets, but still it seems that conntrack
> > knows about TCP connections being opened (SYN) and closed (FIN). Is there
> > any reason for NEW packets without SYN to be allowed through?
>
> Yes, it's a (well known) feature of netfilter. This way we can catch up
> connections already established. If you do not want to support it, use
> the last rule you wrote.

I thought it might be useful to block some weird portscans (e.g. nmap xmas 
scan).

> Back to the INVALID packets: enable ip_conntrack_tcp_be_liberal:
>
> # echo 1 > /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_be_liberal
>
> If the INVALID packets disappear, it can indicate the TCP window tracking
> bug and then you should use a newer kernel release (or run with
> ip_conntrack_tcp_be_liberal enabled).

Yep, I had this enabled on those servers. Now I turned it off on one of them 
and get more logs of this type: 

ip_ct_tcp: SEQ is under the lower bound (already ACKed data retransmitted) IN= 
OUT= SRC=192.168.1.10 DST=192.168.2.122 LEN=40 TOS=0x00 PREC=0x00 TTL=64 
ID=44558 DF PROTO=TCP SPT=3128 DPT=2140 SEQ=2998644047 ACK=4173779699 
WINDOW=62780 RES=0x00 ACK FIN URGP=0 UID=13

ip_ct_tcp: ACK is under the lower bound (possible overly delayed ACK) IN= OUT= 
SRC=192.168.2.122 DST=192.168.1.10 LEN=40 TOS=0x
00 PREC=0x00 TTL=128 ID=46970 DF PROTO=TCP SPT=2140 DPT=3128 SEQ=4173779699 
ACK=2998644048 WINDOW=64313 RES=0x00 ACK URGP=0

INVALID: IN=eth0 OUT= MAC=00:1a:64:6d:96:3f:00:13:d3:ed:6e:c7:08:00 
SRC=192.168.2.122 DST=192.168.1.10 LEN=40 TOS=0x00 PREC=0x00
 TTL=128 ID=46970 DF PROTO=TCP SPT=2140 DPT=3128 WINDOW=64313 RES=0x00 ACK 
URGP=0

Last line is logged by iptables. What I wonder is that there is corresponding 
log from iptables to "ACK is under the lower bound" but not to "SEQ is under 
the lower bound". I get also quite a few "ACK/SEQ is over the upper bound" 
bith with corresponding log from iptables. Does that mean that packets 
with "SEQ under the lower bound" are ESTABLISHED ? Thinking more about it, 
they should - ACK might be lost, so retransmitting already ACKed data is ok.

Where can I find which ip_ct_tcp log entries get flagged as INVALID and which 
as other states? 


-- 
Regards
        Vladislav Kurz
