From: "Reckhard, Tobias" <tobias.reckhard@secunet.com>
Subject: RE: portfw on iptables 2.4 kernel problem.
Date: Thu, 12 Dec 2002 08:31:29 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <96C102324EF9D411A49500306E06C8D1021AE45A@eketsv02.cubis.de>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

[snip]
> > The above takes care of the control connection only. Since the
> > Internet machine believes it is accessing an FTP server on the
> > firewall itself, the latter is addressed by its FTP control
> > connection. This means that the packets cross the firewall's INPUT
> > chain, before they can be DNATed in the PREROUTING chain. I'm not
> > entirely sure about the outbound packets, but most things netfilter
> > apart from NAT require symmetric rules, so I suppose you need an
> > OUTPUT rule to match the INPUT one.
> 
> I don't see how this would be.  The first chain that a packet 
> entering 
> the firewall hits is mangle-PREROUTING, second is nat-PREROUTING.  At 
> that point it is DNATted, and then hits a routing decision that 
> determines if it is local or not, IE INPUT or FORWARD.  It 
> should never 
> 'cross' INPUT at all, unless my understanding (and most sources I've 
> read, and traversal tests performed) is faulty.

Then that's where our impression differs. I have thought up to now that
INPUT is hit before PREROUTING before FORWARD before POSTROUTING before
OUTPUT. And that a packet may stop being processed between PREROUTING and
FORWARD as well as between POSTROUTING and OUTPUT.

I may check the one NATing firewall I have running.. later.

Cheers,
Tobias

