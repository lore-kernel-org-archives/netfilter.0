From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: netfilter resets TCP conversation that was DNATed from the local machine to another
Date: Mon, 30 Jun 2003 10:29:08 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030630142908.GA29083@cannon.eng.us.uu.net>
References: <3EFD10A2.6020807@adsl-209-204-165-151.sonic.net> <20030630020152.GA27602@cannon.eng.us.uu.net> <3EFF9ED5.9070808@adsl-209-204-165-151.sonic.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3EFF9ED5.9070808@adsl-209-204-165-151.sonic.net>
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
To: Michael <freeware@adsl-209-204-165-151.sonic.net>
Cc: netfilter@lists.netfilter.org

On Sun, Jun 29, 2003 at 07:22:13PM -0700, Michael wrote:

> What would you like me to confirm? That it's broken? It is broken. That 
> the RST sending port is not the same as the initiating SYN port? It is 
> not; it's low, just above 1024, so I assumed it to be 
> netfilter-generated, whereas the Squid port was in the 30000 range. That 
> my rule set isn't sending it? "I have no reject-with-tcp-reset lines in 
> my tables." Don't know what else you could mean.

What I mean is this:

squid:		ip1:port1
webserver:	ip2:80

Then what you say is:

packet1:	ip1:port1 -> ip2:80    (SYN)
packet2:	ip2:80    -> ip1:port1 (SYN ACK)
packet3:	ip1:port2 -> ip2:80    (RST)

What I'm saying is that the third packet should not be able to tear down
the connection between ip1:port1 <-> ip2:80  just because the ports are
different. The TCP stack on ip2 should discard this RST packet...

Again, my question:
do you see any other packets between ip1:port1 <-> ip2:port2 after the RST
packet?

Ramin





