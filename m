From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: Is this firewall good enough?
Date: Tue, 08 Jun 2004 08:38:47 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1086698326.2008.31.camel@grendel>
References: <20040608091436.84113.qmail@web14712.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040608091436.84113.qmail@web14712.mail.yahoo.com>
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
To: Sagara Wijetunga <sagaralists@yahoo.com>
Cc: netfilter <netfilter@lists.netfilter.org>

On Tue, 2004-06-08 at 05:14, Sagara Wijetunga wrote:
>
> 1. Does this effectively offer connections ONLY to the
> services I offer and nothing more than that? 

Others have commented on your rules specifically, so I'll skip that
commentary. One thing I would like to point out however is that you are
exposing 11 services to Internet connectivity. That's 11 opportunities
for someone to find a way into the box.

> 2. Does the rule 2 create any security loophole?

#2 just lets in replies to outbound traffic. Its not so much a problem
as this:

17. /sbin/iptables -P OUTPUT ACCEPT

This rule reads "If you can find a way to exploit any one of the 11
exposed services, you can use any outbound transport to pull over your
rootkit". 

> 3. This firewall allows passive as well as non-passive
> FTP connections. Is passive FTP connections   a
> security threat?

Nope, because it will be handled via inspection in your RELATED rule.

> 4. Is this firewall good enough to protect the server?
> If no, could you kindly comment how could I improve
> further?

IMHO you have two problems:
1) Too many exposed services
2) You have configured the box to act like a client and a server
resulting in even more open conduits

Also keep in mind that iptables is a packet filter, not a proxy. This
means you are not seeing any protection to payload based attacks.

So in an ideal world you would want to break up these services across
multiple boxes. You would also want to limit them to server activity
only, and not permit them to generate random outbound sessions. 

Now with all that said, it could be that you don't have the resources to
setup multiple boxes and you are stuck with this setup. If that's the
case, you are going to have to live with an elevated level of risk to
getting whacked. 

Some other things you could do to mitigate this risk:
Setup an automatic patching system
Setup Tripwire or Aide to check system integrity
Setup another system to collect the logs off of this system 
	Setup Swatch or a similar tool to check these logs
Setup an IDS

HTH,
Chris




