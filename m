From: "Eric B." <ebenze@hotmail.com>
Subject: Need help understanding how to debug packet traversal
Date: Tue, 8 Apr 2008 14:52:21 -0400
Message-ID: <ftgetg$e3q$1@ger.gmane.org>
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I'm trying to configure my server to route different packets via different
kernel route tables in conjunction with the mangle table.  I thought I had
things configured properly, but apparently there is something not working
somewhere along the pipe.  My problem is that I am not sure where, and
furthermore, not sure how to debug the problem.

Is there a way I can verify / validate that my packets are acutally using
the routing table I have specified and are being retransmitted to the
correct gateway?

My setup is as follows (RHEL 4.2):
# iptables -t mangle -A PREROUTING -d 192.168.104.64 -j MARK --set-mark 3
# iptables -t nat -A POSTROUTING -m mark --mark 3 -j SNAT --to-source
192.168.104.64
# ip rule add fwmark 3 table 3
# ip route add unicast default via 192.168.104.251 table 3

My goal is as follows:
My server is multi-homed; the same NIC serving both 192.168.101.64 and
192.168.104.64.
I'm looking to configure it such that any incoming packets destined for
192.168.104.64 get a mark added to them.  Any response to that packet will
get routed to gateway 192.168.104.251 (from the default route in table 3),
and have its source address modified to 192.168.104.64.

However, if I check my logs on my router at 192.168.104.251, I don't see any
packets showing up.

There is obviously something I'm doing wrong, but just not quite sure what.

How can I start debugging the packet sequencing?  From my understanding of
how a packet is routed in the kernel, it goes through the different
iptables/chains until the OUTPUT chain at which point it examines the RPDB
and the kernel's route tables, and finally the POSTROUTING chain (and
nat/mangle tables).  So my question is that assuming that everything is
happening correctly, is there any way that I can "see" what the packet's
actual next hop destination is?  Or which part of the sequence is
responsible for determining the next hop destination (ie: from a mangle
table, or which kernel table, etc)?

Any help / suggestions / ideas would be greatly appreciated!  I've been 
pulling hair for a couple of days on this already and am confident that it 
is something silly that I am overlooking, but I just can't figure it out.

Thanks,

Eric





