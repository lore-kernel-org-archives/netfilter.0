From: Olivier Sessink <lists@olivier.pk.wau.nl>
Subject: Re: INVALID FIN/ACK packets
Date: Wed, 14 Nov 2007 23:35:27 +0100
Message-ID: <473B782F.2030907@olivier.pk.wau.nl>
References: <20071114100226.GA29362@thorin.admin.heise.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20071114100226.GA29362@thorin.admin.heise.de>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Aiko Barz <aiko@deepco.de>, netfilter@vger.kernel.org

Aiko Barz wrote:
> Hi,
> 
> like others, I'm facing some conntrack problems. A typical logentry
> looks like this:
> 
>> Nov 14 10:46:22 lain fire: INVALID IN=eth0 OUT= MAC=00:e0:81:5c:f7:d9:00:02:85:04:0e:c0:08:00 SRC=a.b.c.d DST=88.198.253.172 LEN=40 TOS=0x00 PREC=0x00 TTL=57 ID=47775 DF PROTO=TCP SPT=49184 DPT=993 WINDOW=65535 RES=0x00 ACK RST URGP=0
>> Nov 14 10:46:22 lain fire: INPUT IN=eth0 OUT= MAC=00:e0:81:5c:f7:d9:00:02:85:04:0e:c0:08:00 SRC=a.b.c.d DST=88.198.253.172 LEN=40 TOS=0x00 PREC=0x00 TTL=57 ID=47775 DF PROTO=TCP SPT=49184 DPT=993 WINDOW=65535 RES=0x00 ACK RST URGP=0 
>> Nov 14 10:46:22 lain fire: OUTPUT IN= OUT=eth0 SRC=88.198.253.172 DST=a.b.c.d LEN=68 TOS=0x00 PREC=0xC0 TTL=64 ID=13872 PROTO=ICMP TYPE=3 CODE=13 [SRC=a.b.c.d DST=88.198.253.172 LEN=40 TOS=0x00 PREC=0x00 TTL=57 ID=47775 DF PROTO=TCP SPT=49184 DPT=993 WINDOW=65535 RES=0x00 ACK RST URGP=0 ]
> 
> lain is an IMAP server. This is not happening in any FORWARDING chain.
> I have one more server with this same kind of problem. "ACK RST" and
> "ACK FIN" packets are involved.

same problem here. Even on a local very high speed (gigabit) network I
see INVALID packages when connections are closed (especially when the
server load is high). I see them between blades in the same bladecenter.

I think that the timeouts are too strict. Most of the problems are
solved (for me) when the timeouts are increased:

echo "240" >
/proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_close_wait
echo "60" > /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_close
echo "240" > /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_fin_wait
echo "60" > /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_last_ack

perhaps one of the developers can elaborate why these timeouts are this
strict by default?

Olivier
