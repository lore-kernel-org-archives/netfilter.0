From: Andrew Schulman <andrex@alumni.utexas.net>
Subject: Re: Is this possible?
Date: Mon, 14 Feb 2005 11:54:10 -0500
Message-ID: <MPG.1c7aa1bb6cf712669896c1@localhost>
References: <420CD815.1000806@thompsonmike.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> I have a issue where I cannot connect to my server because the 
firewall 
> only allows ports 80 and 443 out.
> 
> I previously ran SSH on port 443 to overcome this, but I have had to 
> implement a HTTPS solution for users who wanted secure access, so that 
> is now gone.
> 
> This system has DNS records for ssh.server.co.uk and www.server.co.uk, 
> so can I use IPTables or similar to recognise if it is being connected 
> to via ssh.server.co.uk on port 443 and forward the traffic to port 22? 
> If www.server.co.uk:443 is used apache gets the traffic? Or is this (As 
> I suspect) Impossible?

I don't think that's possible, because the address resolution happens on 
the client side.  Both names are resolved to your one IP address before 
you ever see any packets.

One option would be to get a second IP address.  Another would be to get 
the client admins to open an outgoing port in their firewall, as Jose 
suggests.

A third possibility would be to direct both sets of traffic to port 443, 
and use application-level filtering to distinguish them.  See for 
example 
http://l7-filter.sourceforge.net/.  I see that they have a pattern for 
recognizing SSH, that's supposed to work well.  They don't have one for 
HTTPS, but you could either assume that as the default for non-SSH 
traffic, or maybe write your own pattern.

Good luck,
Andrew.


