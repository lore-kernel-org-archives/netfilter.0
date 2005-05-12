From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Tarpit usage question
Date: Thu, 12 May 2005 18:37:00 -0500
Message-ID: <4283E89C.5050709@riverviewtech.net>
References: <57F9959B46E0FA4D8BA88AEDFBE582907389@pxtbenexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <57F9959B46E0FA4D8BA88AEDFBE582907389@pxtbenexd01.pxt.primeexalia.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

> Hi guys, 
> 
> I had a usage question about tarpit in respects to connection tracking.
> We have a firewall that has a fairly heavy usage so we have put a
> separate box external of the firewall to do tarpitting of port scanners.
> Anyways, we are still being hit pretty hard by many things on this
> firewall.  I was thinking about configuration tarpit on the firewall
> cluster but wanted to ensure that connection tracking wasn't a problem.
> 
> Is it as simple as just sending the connection to the NOTRACK chain
> before sending it to tarpit?
> 
> iptaables -t raw -A INPUT -p tcp -m tcp --dport 80 -j NOTRACK
> iptables -A INPUT -p tcp -m tcp --dport 80 -j TARPIT
> 
> Is there a better approach to this?  Will this even work?  The rules
> above are more or less just a sample.  I would want to block almost all
> traffic destined for the input chain on the firewall on the external
> interface unless it is related traffic.

If you were worried about just one port, as in your example, I would do what you have done.  However if you are planing on TARPITing a lot of ports (the majority of them) I would be tempted to do something like the following:

iptables -t raw -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -t raw -A INPUT -p tcp --dport 443 -j ACCEPT
iptables -t raw -A INPUT -p tcp -j NOTRACK
iptables -t filter -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -t filter -A INPUT -p tcp --dport 443 -j ACCEPT
iptables -t filter -A INPUT -p tcp -j TARPIT

This should cause any traffic that is not destined to known good ports to be not tracked and thus safe to send to the TARPIT.



Grant. . . .

