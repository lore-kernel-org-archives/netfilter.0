From: Jim Carter <jimc@math.ucla.edu>
Subject: MTU issues with tunnel: frag needed, --set-mss, --clamp-mss-to-ptmu
Date: Tue, 14 Oct 2003 15:37:11 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0310141530230.5712@xena.cft.ca.us>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Here's the setup:

Client ------ NATbox -- Internet --+-- Target-hosts
(ESP-in-UDP)+                      |
            ||                     |
            ||  tunnel             +-- IPSec-server
             +============================+

There is an IPSec tunnel from the client to the IPSec server; the server
uses FreeS/WAN (super, 1.99, with Nat-T and X.509 patches and ESP-in-UDP
kernel patch); the client is either Linux with the same setup, or Windows
XP with native IPSec.  On packets emerging from the tunnel the server
does NAT, so the target machine will send replies to the server, not to
the (non-routeable) private IP address of the client.

With this configuration the MSS is 1320 (determined empirically, maybe
over-conservative by a few bytes), when the client and NATbox link MTUs
are 1500.  This firewall rule on the server is effective in preventing
TCP connections from hanging:

    iptables -t filter -A FORWARD -p tcp --tcp-flags SYN,RST SYN \
	-j TCPMSS --set-mss 1320

However, if the client's link MTU is less, as it would be in the likely
case of a PPP connection, the code in net/ipv4/netfilter/ipt_TCPMSS.c
unconditionally sets the MSS to 1320, which would be wrong.  I would
like to be able to tell my users, find out your real link MTU (let's say
800), subtract 180, and put the corresponding filter rule on the client,
e.g.

    iptables -t filter -A INPUT -p tcp --tcp-flags SYN,RST SYN \
	-j TCPMSS --set-mss 620
    iptables -t filter -A OUTPUT -p tcp --tcp-flags SYN,RST SYN \
	-j TCPMSS --set-mss 620

This is effective on non-IPSec connections, but when the connection goes
through the tunnel, the client is seen to send small packets but the
target machine sends big packets sized to the payload of 1320 bytes.

I would suggest that in ipt_TCPMSS.c, the logic of --clamp-mss-to-pmtu
should always be used, i.e. the MSS may be decreased, never increased.

By the way, --clamp-mss-to-ptmu is ineffective at getting the packets to
be small enough.  I don't know what it's not doing, but it (doesn't)
happen even with a small value in ipsec.conf overridemtu.

Of course the real solution is to get ICMP Frag Needed packets to work.
There was a posting earlier on this list describing this scenario, which
I re-tested on my machines.  The client (xena, 192.168.1.100) starts up
a connection through the server (harlech, 128.97.4.250) to the target
machine (holly, 128.97.70.187). The server NATs the packets so the
target will answer back to the server.  The target machine sends back a
big packet which it thinks is going to harlech (server).  The server
de-NATs it and stuffs it down the tunnel.  It doesn't fit.  A ICMP Frag
Needed packet is generated which looks like this on my system:

    IP header: src 128.97.4.250 (harlech), dst 128.97.70.187 (holly),
	proto ICMP
    ICMP data: type 3 (dest unreachable) code 4 (frag needed)
	Next hop MTU: 1360 (from ipsec.conf overridemtu)
    Then comes the first part of the rejected packet:
    IP header: src 128.97.70.187 (holly), dst 192.168.1.100 (xena),
	proto TCP
    TCP header: src port 80, dst port 32815 (can't be sure whose port it is)
    Then the initial part of the payload, total about 500 bytes.

This is the packet that was sent down the tunnel.  For it to tell Holly
(the target machine) anything useful, the rejected packet needs to be
NATted to show Harlech as the source and whatever port Harlech is
NATting this connection to.  As far as I can see, the problem is not
specific to FreeS/WAN; I had the same problem with vtun.

This is going to be kind of hard to deal with.

Could someone, who is more experienced and authoritative with the
netfilter sources, please have a look at particularly the --set-mss
issue?

James F. Carter          Voice 310 825 2897    FAX 310 206 6673
UCLA-Mathnet;  6115 MSA; 405 Hilgard Ave.; Los Angeles, CA, USA 90095-1555
Email: jimc@math.ucla.edu  http://www.math.ucla.edu/~jimc (q.v. for PGP key)

