From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: SNAT: I'm going insane
Date: Sat, 31 Jan 2004 12:55:05 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1075571704.1907.3.camel@jasiiitosh.nexusmgmt.com>
References: <401B5396.8080202@palaver.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <401B5396.8080202@palaver.net>
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
To: Brian Capouch <brianc@palaver.net>
Cc: netfilter@lists.netfilter.org

On Sat, 2004-01-31 at 02:04, Brian Capouch wrote:
> This ought to be the simplest thing in the world, and I have rules like 
> this that work.  I hope someone can see something glaringly wrong with 
> what I'm doing here:
> 
> I want to SNAT all traffic from an internal address (10.2.2.2) to an 
> external one.  So I add to my rules:
> 
> iptables -t nat -I POSTROUTING -s 10.2.2.2 -j SNAT --to-source 
> 206.230.187.15
> 
> I test and my ssh traffic is passing perfectly; I go out to machines on 
> the net and they show me coming in from 206.230.187.15.
> 
> But some--BUT NOT ALL--of my UDP traffic seems to be heading out without 
> any change.
> 
> A short sniff on the *output* interface shows:
> 
> 02:31:56.696763 10.2.2.2.4569 > blah.blah.net.4569: udp 25 (DF) [tos 
> 0x10] 
> 
> 02:31:58.699259 10.2.2.2.4569 > blah.blah.net.4569: udp 25 (DF) [tos 
> 0x10] 
> 
> 02:32:06.704660 10.2.2.2.4569 > blah.blah.net.4569: udp 12 (DF) [tos 0x10
> 
> And the packet counters (which I reset for the test) show nothing 
> passing through:
> 
>      0     0 SNAT       all  --  *      eth1    10.2.2.2 
> 0.0.0.0/0        to:206.230.187.15
> 
> UDP traffic going to port 5036, which is heading from this same machine 
> to the same remote endpoint machine, gets NATted perfectly.
> 
> ***************************************
> 
> Does anyone know what I'm doing wrong?  Other similar rules in this same 
> table seem to be doing just what they need to. . . .
> 
> Thanks in advance for anyone who might be able to offer a potential 
> explanation.
> 
> B.

That sounds bizarre! Am I correct to assume that we know the packets are
arriving at the internal interface of the gateway because we see them
being passed in the clear on the public interface? That's how I
understood your e-mail.  Otherwise, I would start by making sure the
packets were arriving in the first place.

Is there any chance the unNATted packets are associated with an existing
packet flow and thus the POSTROUTING chain is being bypassed by
conntrack?

You may wish to place log rules at every step of the packet's traversal
through netfilter to see where the packet is being shunted.  That may
suddenly reveal this mysterious, insanity provoking behavior.  Good luck
- John
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com
---
If you are interested in helping to develop a GPL enterprise class
VPN/Firewall/Security device management console, please visit
http://iscs.sourceforge.net 


