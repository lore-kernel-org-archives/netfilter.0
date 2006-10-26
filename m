From: "Pablo Sanchez" <pablo@blueoakdb.com>
Subject: RE: Block smtp traffic
Date: Thu, 26 Oct 2006 15:49:43 -0400
Message-ID: <010301c6f937$e22daec0$0419a8c0@fly>
References: <1cc2dc830610261235q7d678544r7dc62711bbea43d9@mail.gmail.com>
Reply-To: pablo@blueoakdb.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1cc2dc830610261235q7d678544r7dc62711bbea43d9@mail.gmail.com>
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

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org 
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of 
> Allan Spagnol Comar
> Sent: Thursday, October 26, 2006 3:36 PM
> To: netfilter@lists.netfilter.org
> Subject: Block smtp traffic
> 
> Hi list, this is my first post.
> 
> I had a internet gateway that I want to block all traffic send to smtp
> ports ( 25 tcp ). I had done this:
> iptables -A FORWARD -i eth1 -p tcp --dport 25 -j DROP
> 
> and I cannot make this rule work, my user still can connect to port
> 25.... I try to change from drop to reject and still the same problem,
> where can I look for to make this work ?

Think of iptables as being a huge if-then check per rule until a
DROP/RETURN/ACCEPT/QUEUE is encountered - the man page does an excellent job
of describing this in paragraph one of 'TARGETS'

	if rule #1 applies _and_ DROP/RETURN/ACCEPT/QUEUE, stop
	if rule #2 applies _and_ DROP/RETURN/ACCEPT/QUEUE, stop
	...
	if rule #N applies or not and we've run out of things to do, apply
the POLICY as our 'DEFAULT'

This means that given you're A(ppending) your rule, you probably have
another rule preceeding the rule above which is ACCEPT'ing the packet
somehow.  

Move the above rule up the chain.  You might even put it at the very
beginning as a test:

	iptables -I FORWARD ....

I hope that helps.
---
Pablo Sanchez - Blueoak Database Engineering, Inc
Ph:    819.459.1926          Toll free:  888.459.1926
Cell:  819.918.9731                Pgr:  pablo_p@blueoakdb.com
Fax:   603.720.7723 (US)


