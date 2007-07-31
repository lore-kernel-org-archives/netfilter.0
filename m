From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: two subnets...
Date: Tue, 31 Jul 2007 15:07:48 -0500
Message-ID: <46AF9694.1060709@riverviewtech.net>
References: <46ADBDF0.3020200@mp.pl> <46AF4FC7.1000500@riverviewtech.net>
	<46AF8D63.8080900@interia.pl>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46AF8D63.8080900@interia.pl>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

On 07/31/07 14:28, Pawel Zawora wrote:
> I need separate 3 foreign machines (security reason - firewall 
> between subnets is required).

*nod*  This is not a problem at all.

> I cannot divide one 128 pubic IPs  subnet...

You do not need to.

> Foreign machines have to use public IPs....

*nod*

Say you have the following systems:

+---------+
| a.b.c.1 +---+
+---------+   |
| a.b.c.3 +---+
+---------+   |
| a.b.c.5 +---+
+---------+   |   +--------+
| a.b.c.7 +---+---+ Router +---(Internet)
+---------+   |   +--------+
| a.b.c.9 +---+
+---------+   |
| a.b.c.8 +---+
+---------+   |
| a.b.c.6 +---+
+---------+

And you want to split some of the computers off on to their own segment 
so that they can not talk to the others and others can not talk to them.

+---------+
| a.b.c.1 +---+
+---------+   |
| a.b.c.3 +---+
+---------+   |
| a.b.c.5 +---+
+---------+   |
| a.b.c.7 +---+---+
+---------+       |   +-------------------------------+
                   +---+                               |
======================| Bridge / OSI Layer 2 Firewall +---(Internet)
                   +---+                               |
+---------+       |   +-------------------------------+
| a.b.c.9 +---+---+
+---------+   |
| a.b.c.8 +---+
+---------+   |
| a.b.c.6 +---+
+---------+

Let's assume that:
  - eth0 (top) goes to the top set of computers
  - eth1 (middle) goes to the internet
  - eth2 (bottom) goes to the bottom set of computers

Add eth0 and eth2 to the bridge.

Allow all traffic to pass through the bridge by default.
Block traffic from coming in to the bridge from eth0 and going out eth2.
Block traffic from coming in to the bridge from eth2 and going out eth0.

This allows traffic to come in eth0 and go out eth1.
This allows traffic to come in eth1 and go out either eth0 or eth2.
This allows traffic to come in eth2 and go out eth1.

This prevents computers on either part of the bridge from talking with 
each other.  Thus your computers that you can not change the IP 
addresses on are still at the same IP address.

This allows you to have two logically separated LANs so that they can 
not communicate with each other.

Does this help explain what I'm talking about?  Again, I have used this 
scenario MANY MANY times and have been EXTREMELY pleased with it.  Let 
me know if I need to try to explain this differently.

If this is what you are wanting to do, EBTables can VERY easily 
accomplish this.  Let me know if this is what you need and I'll help 
provide you with a mach EBTables set up.



Grant. . . .

