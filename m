From: "Michael J. Tubby B.Sc. \(Hons\) G8TIC" <mike.tubby@thorcom.co.uk>
Subject: Re: Try to NAT a RTP stream
Date: Wed, 30 Apr 2003 12:12:15 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001a01c30f09$5b4ad8e0$6401a8c0@int.thorcom.com>
References: <200304270824.31892.lists@ohlmeier.de> <20030430032642.GA4762@home.tig-grr.com>
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
To: Tom Marshall <tommy@home.tig-grr.com>, Nils Ohlmeier <lists@ohlmeier.de>
Cc: netfilter@lists.netfilter.org

Tom,

I also want to get NAT of RTP/RTSP working for Cisco (Selsius)
Voice over IP (VOIP), ie. a Cisco/Selsius phone on the inside NAT'ted
out to a Cisco Call Manager (CCM).

The phone uses a TCP connection on port 2000 for Skinny Client
Control Protocol (SCCP) to the CCM (SCCP is beleived to be based
on an ASN1 derrived version of ISDN Q.931 signalling) to setup/
clear down calls and RTS/RTSP traffic for the duration of the actual
call.

Again, the problem is that the outgoing RTP/RTSP (which is really UDP
with a particular ToS value - 0xB8 if I remember my tcpdumps correctly)
works fine with current NAT but the inbound replies which are on an
unrelated port number fail.

I suspect that this means that a contrack_sccp module would be required
to watch the SCCP/ASN1 on port 2000 and prime in the inbound NAT
of the subsequent RTS/RTSP ?

Mike


----- Original Message -----
From: "Tom Marshall" <tommy@home.tig-grr.com>
To: "Nils Ohlmeier" <lists@ohlmeier.de>
Cc: <netfilter@lists.netfilter.org>
Sent: Wednesday, April 30, 2003 4:26 AM
Subject: Re: Try to NAT a RTP stream

What application are you using to setup the RTP stream?  If you are using
RTSP, I posted an RTSP NAT module for kernel 2.4.21-preX a couple of weeks
ago that may solve your problem.

On Sun, Apr 27, 2003 at 08:24:31AM +0200, Nils Ohlmeier wrote:
> Hello,
>
> i try to NAT RTP streams with my own application (i do not use iptables to
> insert the rules -> should i go to netfilter-devel?).
>
> Scenario:
> 192.168.0.114 <-----> 192.168.0.2
>                       Netfilter NAT
>                      217.224.223.167 <--------------> 195.37.77.110
>
> The result is that packets go from private to public but not vice versa.
And
> the ruleset looks like this (empty chains omitted, ruleset is only for
> debuging, masquerade rule is for keeping my existing connections):
>
> Chain FORWARD (policy ACCEPT 237 packets, 47356 bytes)
>  pkts bytes target     prot opt in     out     source
> destination
>     0     0 ACCEPT     udp  --  *      *       195.37.77.110
> 192.168.0.114      udp spts:18554:18555 dpts:8766:8767
>   399 79648 ACCEPT     udp  --  *      *       192.168.0.114
> 195.37.77.110      udp spts:8766:8767 dpts:18554:18555
>
> Chain PREROUTING (policy ACCEPT 3481 packets, 552K bytes)
>  pkts bytes target     prot opt in     out     source
> destination
>     0     0 DNAT       udp  --  *      *       195.37.77.110
> 217.224.223.167    udp spts:18554:18555 dpts:32790:32791
> to:192.168.0.114:8766-8767
>
> Chain POSTROUTING (policy ACCEPT 660 packets, 52480 bytes)
>  pkts bytes target     prot opt in     out     source
> destination
>     0     0 SNAT       udp  --  *      *       192.168.0.114
> 195.37.77.110      udp spts:8766:8767 dpts:18554:18555
> to:217.224.223.167:32790-32791
>     9  1835 MASQUERADE  all  --  *      *       192.168.0.0/23
0.0.0.0/0
>
> What i do not understand is why the packets from internal hit the rule in
> FORWARD but do not hit the same rule in POSTROUTING.
> The second strange thing is that packets come in on the external interface
> (observed with ngrep) but to not hit the PREROUTING rule.
> I fear i missed something obvious :-(
>
> Any help/ideas appreciated.
>
> Greetings
>   Nils Ohlmeier


