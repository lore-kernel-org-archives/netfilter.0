From: Scott Mcdermott <scott@omnisys.com>
Subject: empty filter on FORWARD chain with rp_filter means safe right?
Date: Thu, 7 Oct 2010 21:31:29 -0700
Message-ID: <20101008043129.GA2017@omnius.omnisys.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I encountered a system today with two attached
networks, one public and the other RFC1918.  The box
had ip_foward=1, FORWARD chain empty, policy ACCEPT.
rp_filter was set on both the interfaces.

Now if I were somewhere off the public interface, but
many hops away, there is no possible way to get packets
to the RFC1918 side of the box is there?  Because I
have no way to actually route the packets to the
gateway with destination addresses on the far side.  So
actually this box is safe from malicious activity, even
though there is an ACCEPT policy on FORWARD and it's
set with routing enabled.  Is this correct?

Now if instead I have control of a station on the same
segment as the gateway's public interface, or if I
control routers in-between and can set up routes to get
packets to the box with the internal IPs as
destinations, then it's a different story.  But in the
common case of having ISPs in between (which will drop
my packets with RFC1918 destinations), it's not
possible to get packets to the gateway's internal
network except if they NAT some of them for me.

Please help me to see if my understanding is correct.

Thanks.
