From: Brian Capouch <brianc@palaver.net>
Subject: SNAT: I'm going insane
Date: Sat, 31 Jan 2004 02:04:54 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <401B5396.8080202@palaver.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

This ought to be the simplest thing in the world, and I have rules like 
this that work.  I hope someone can see something glaringly wrong with 
what I'm doing here:

I want to SNAT all traffic from an internal address (10.2.2.2) to an 
external one.  So I add to my rules:

iptables -t nat -I POSTROUTING -s 10.2.2.2 -j SNAT --to-source 
206.230.187.15

I test and my ssh traffic is passing perfectly; I go out to machines on 
the net and they show me coming in from 206.230.187.15.

But some--BUT NOT ALL--of my UDP traffic seems to be heading out without 
any change.

A short sniff on the *output* interface shows:

02:31:56.696763 10.2.2.2.4569 > blah.blah.net.4569: udp 25 (DF) [tos 
0x10] 

02:31:58.699259 10.2.2.2.4569 > blah.blah.net.4569: udp 25 (DF) [tos 
0x10] 

02:32:06.704660 10.2.2.2.4569 > blah.blah.net.4569: udp 12 (DF) [tos 0x10

And the packet counters (which I reset for the test) show nothing 
passing through:

     0     0 SNAT       all  --  *      eth1    10.2.2.2 
0.0.0.0/0        to:206.230.187.15

UDP traffic going to port 5036, which is heading from this same machine 
to the same remote endpoint machine, gets NATted perfectly.

***************************************

Does anyone know what I'm doing wrong?  Other similar rules in this same 
table seem to be doing just what they need to. . . .

Thanks in advance for anyone who might be able to offer a potential 
explanation.

B.

