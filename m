From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: HELP! Transparent Proxy using bridging 2.6.9 and REDIRECT on
 different subnet
Date: Thu, 24 Mar 2005 15:09:43 -0600
Message-ID: <42432C97.4050008@riverviewtech.net>
References: <2F413D5F33545D4A8465BBEE900238CC3FA777@cymmail.cymphonix.com>
Reply-To: gtaylor@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <2F413D5F33545D4A8465BBEE900238CC3FA777@cymmail.cymphonix.com>
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
To: Trevor Paskett <tpaskett@cymphonix.com>
Cc: coreteam@netfilter.org, netfilter@lists.netfilter.org

There is one last really dastardly thing that I think *might* work.  That would be running your system with a UML in side of it that does nothing but DNATing/SNATing of traffic coming in to it so that traffic could be redirected right back to Squid and then out and back through the DNAT/SNAT router and then back to the box it's self where things can be handled.  But when I start thinking of things like this I also start thinking that there is something either missing or broken that is preventing me from doing what I want to do, but sometimes things like this are necessary.  I presently do not have a system set up any where to test this and I will not have time to do so for a while.  If you would like me to continue down this road next week I would be willing to do so.  In short the following would be the packet's path through the network:

Client System(s) <-> Linux 2.6.9 System (DNAT/SNAT) <-> Linux 2.6.9 UML (DNAT/SNAT) <-> Squid on Linux 2.6.9 System <-> Linux 2.6.9 UML (DNAT/SNAT) <-> Linux 2.6.9 System (DNAT/SNAT) <-> INet Router <-> Client System(s)

Yes this is a LONG convoluted path, but this is all that I can think of with out really messing with the packet.  I have had reasonable success running UMLs for routing before as I have a client that routes out across 8 cable modems on the same subnet in a pseudo round robin fashion via routing to 8 UML virtual routers and then bridging back to the interfaces that the cable modems are connected to.  I ended up using 802.1q VLAN tagging to create the 8 virtual interfaces with wonderful success.  So things like this are doable, just cumbersome and I've not seen any network config or firewall package that would even come close to doing things like this.  This is all hand rolled stuff.



Grant. . . .

Trevor Paskett wrote:

> Thanks for your reply. Our product is a Linux based product that uses
> netfilter. We have Squid and a filtering engine on our box. We are
> strong supporters of netfilter. Our customers have many subnets behind
> our box because of where it is placed in their network. Bringing up
> alias's on br0 for each of their subnets that are not even on that
> broadcast domain is a big band aid :). I think this is somehow a bug in
> ip_nat_core.c and will investigate that further and have cc'd
> coreteam@netfilter.org and hopefully that will get to Rusty who wrote
> it.
> 
> As for the SNAT I think Jason Opperisano's response is correct.
> Everything works great, except somewhere in ip_nat_core.c the src port
> is getting changed to 1 from 80. I have attached an ethereal dump to
> show this happening and a dump when it does what it is supposed to.
> Everything between the 2 is the same, except after I captured the
> no_work.cap, I did
> 
> ifconfig br0:0 192.168.255.165
> 
> So it had an IP on the test machine's subnet. Of course it worked fine
> and that capture is work.cap
> 
> Thanks for all your help.
> 
> Trevor Paskett
> Cymphonix Programmer - CCNA, CWNA
> P: 801-938-1500 F: 801-938-1501


