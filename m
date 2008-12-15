From: RUMI Szabolcs <rumi_ml@rtfm.hu>
Subject: IPsec vs. iptables NAT
Date: Mon, 15 Dec 2008 09:11:02 +0100
Message-ID: <20081215091102.3fe71080.rumi_ml@rtfm.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello!

I (still) have strange problems while NATing into an IPsec tunnel...
A while ago with kernel 2.6.22 I've had the following situation:

http://www.spinics.net/lists/netfilter/msg42699.html

I haven't got to any solution with the above thread but it
did contain some relevant information about the situation
and software environment. Now with 2.6.26 the situation seems
to have changed in that the NATed packets now do seem to go
out onto the IPsec VPN but still there are some strange things
happening and basically I still can't make it work as intended.

Scenario:

I'm trying to ping a host on the IPsec VPN from a host on our
internal VPN (OpenVPN based). Please note that I've called
this a "LAN" in the old thread cited above for simplicity.
The OpenVPN hub server has the IPsec tunnel set up and I
can ping hosts on the IPsec connected networks from there.
Basically the task at hand is to NAT the OpenVPN based network
towards the IPsec-based network.

With MASQUERADE I could not NAT probably because it didn't realize
that packets are intended for the IPsec VPN so that the source
address became not that of the IPsec tunnel endpoint (eth0:0)
but the external IP address of the host (eth0). With SNAT it
seemingly does work to some extent because there I can specify
the correct source address but I've still got two problems:

1.) when I do a tcpdump on -i eth0:0 (which is the IPsec tunnel
endpoint, or -i eth0 even) I cannot see the packets that go out
through the IPsec tunnel but I can see the replies that are inbound.
In addition to that, I'm not seeing the encrypted IPsec traffic
but the plain traffic that is going inside the tunnel, I don't
know whether this is normal or not.

2.) the SNAT seems to work in the outbound direction in that when
I'm pinging from a host on the OpenVPN based network (that has an
IP address that is illegal both on the internet and on the IPsec
network), reply packets do come back (e.g. the outgoing packets must
have been translated by SNAT although I cannot see them because of
problem 1. above) but they don't seem to get translated back by
NAT and thus they never reach back to the pinging host. Basically
the whole setup does not work because of this.

Below is some tcpdump output to clarify:

# tcpdump -n -i vpn0 proto \\icmp
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on vpn0, link-type EN10MB (Ethernet), capture size 96 bytes
08:08:20.582069 IP 10.1.1.5 > 137.65.244.209: ICMP echo request, id 60170, seq 1, length 64
08:08:21.567662 IP 10.1.1.5 > 137.65.244.209: ICMP echo request, id 60170, seq 2, length 64
08:08:22.569260 IP 10.1.1.5 > 137.65.244.209: ICMP echo request, id 60170, seq 3, length 64

# tcpdump -n -i eth0 proto \\icmp
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on eth0, link-type EN10MB (Ethernet), capture size 96 bytes
08:08:30.761049 IP 137.65.244.209 > 164.99.195.21: ICMP echo reply, id 60170, seq 11, length 64
08:08:31.759374 IP 137.65.244.209 > 164.99.195.21: ICMP echo reply, id 60170, seq 12, length 64
08:08:32.761849 IP 137.65.244.209 > 164.99.195.21: ICMP echo reply, id 60170, seq 13, length 64

In the above example, vpn0 is the tap interface of the OpenVPN hub.
It can be seen that from the OpenVPN-connected networks the packets
are coming in but there are no replies. At the same time on eth0
I can see only the replies but not the outgoing packets. The replies
have the destination address that the outgoing packets have been
SNAT-ed to (e.g. that of the IPsec tunnel endpoint on our side).

Is all this normal or I'm doing something wrong or ...?

Thanks,

Sab
