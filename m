From: Ryan Anderson <ryan@michonline.com>
Subject: Doing MASQ for Asheron's Call
Date: Fri, 10 Oct 2003 19:45:27 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031010234527.GR27657@michonline.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

In the 2.2 days, this game (Asheron's Call) would work with
ip_masq_loose_udp turned on. (I think that's the right name.)

In 2.4, this functionality appears to be gone, at least with that name.
From my reading of Netfilter/Conntrack howtos, it would seem that a
NAT/CONNTRACK helper pair would do the job, but a confirmation would be
appreciated.

The game works, for a single machine, with a simple port-forwarding
mechanism - the trick is that making it work for multiple machines
becomes a significant amount of maintenace.

The protocol is fairly simple - the client begins sending from UDP:9000
to UDP:9000 on the server, then to UDP:9001 on the server.

The server replies using the same ports - and eventually hands the
client off to another server, which then uses the same port and replies
back to the client.

i.e (some duplicate lines remove for succinctness.):
08:15:35.019186 c.c.c.c.9000 > s.s.s.47.9000: udp 20
08:15:35.019354 c.c.c.c.9000 > s.s.s.47.9001: udp 20
08:15:35.022703 c.c.c.c.9000 > s.s.s.47.9000: udp 292
08:15:35.150427 s.s.s.47.9000 > c.c.c.c.9000: udp 36
08:15:35.019186 c.c.c.c.9000 > s.s.s.47.9000: udp 20
08:15:35.019354 c.c.c.c.9000 > s.s.s.47.9001: udp 20
08:15:35.022703 c.c.c.c.9000 > s.s.s.47.9000: udp 292

08:15:35.280787 s.s.s.48.9000 > c.c.c.c.9000: udp 122

Note the new server IP.  There has not been a packet from the client to
this IP.

Later on, another wrinkle appears:

08:15:36.309581 s.s.s.48.9001 > c.c.c.c.9000: udp 28

Same (new) server, a new port.

Eventually, more wrinkles:
8:15:46.830392 s.s.s.48.9000 > c.c.c.c.9000: udp 36
08:15:46.884290 s.s.s.56.9004 > c.c.c.c.9000: udp 90
08:15:46.884655 s.s.s.56.9004 > c.c.c.c.9000: udp 28
08:15:47.104630 s.s.s.56.9005 > c.c.c.c.9000: udp 484
08:15:47.104752 s.s.s.56.9005 > c.c.c.c.9000: udp 484

Another new server, 2 new ports.

The only sane thing is that the following rules appear to be true:
	The servers are fairly close to each other, IP-address wise -
	i.e, a blatant assumption of "within the same /24 block" should
	be safe.

	The *client* only ever uses a single port to communicate to the
	servers.

Is this supportable with conntrack?  I took a stab at writing a module 9
months ago, and got lost trying to figure out if I could support the /24
idea sanely.

I can provide a full tcpdump log of the game starting up until fully
functional, if that would help, but I believe I have an accurate summary
of the protocol above.

Thanks in advance to anyone willing to help with this,

-- 

Ryan Anderson
  sometimes Pug Majere

