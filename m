From: Kerin Millar <kerframil@gmail.com>
Subject: Re: NEW packets with no SYN bit set in OUTPUT
Date: Wed, 14 Mar 2012 12:05:54 +0000
Message-ID: <jjq1j8$ko$1@dough.gmane.org>
References: <4F6080C8.40506@mandragor.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4F6080C8.40506@mandragor.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 14/03/2012 11:28, Yann Hamon wrote:
> Hi,
>
> I am having an issue related to conntrack and iptables than I am having
> a hard time fixing. My policy for the OUTPUT chain looks basically like
> this:
>
> Set default policy to DROP
> DROP all invalid pakets
> ACCEPT all established an related
> Then a fairly long list of rules and chains to filter what NEW packets
> should be allowed out
> At the end, LOG those that haven't been matched by a previous rule in an
> unauthorized_outgoing chain.
>
> Now I am getting a small number of packets in that chain (about 15-20
> per hour, and the server does about 30mbps), like this one:
>
> kernel: [12817249.101873] [fw] UNAUTH. OUTGOING CONN.IN= OUT=eth0
> SRC=188.xx.xx.xx DST=80.xx.xx.xx LEN=40 TOS=0x00 PREC=0x00 TTL=64
> ID=59528 DF PROTO=TCP SPT=80 DPT=16258 WINDOW=6432 RES=0x00 ACK URGP=0
>
> I am wondering about a few things in that packet:
>
> * Its source port is 80 - the server being a HTTP proxy, this packet is
> (fairly) likely a reply to another connection
> * The packet goes into the unauthorized_outgoing logging chain, so the
> packet doesn't have the state established, related, or invalid : it must
> be "new". However the packet doesn't have the SYN bit set - it's just an
> ACK.

It might be a case of Fast Retransmit as per RFC 2001. The duplicate ACK 
is supposed to be sent by the receiver if segments are received 
out-of-order. As far as I'm aware, if three such ACKs are received by 
the sender - all referring to the same segment - then it is assumed by 
the sender that the segment was never received and that it should be 
retransmitted as quickly as possible. At that point, the sender would 
also increase the congestion window and reduce the transmission rate.

My tentative guess would be that, if more than three are seen for the 
same segment, they are deemed INVALID by the connection tracking system. 
You could use tcpdump to evaluate this possibility. Alternatively, 
perhaps someone with a strong knowledge of conntrack internals could 
confirm one way or the other.

Cheers,

--Kerin

