From: Pete Toscano <pete-netfilter@verisignlabs.com>
Subject: Re: iptables not responding to packets destined for subinterface
Date: Mon, 25 Oct 2004 09:26:14 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <417CFEF6.7090101@verisignlabs.com>
References: <002201c4ba44$e1ff8ba0$6601a8c0@CHELA>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <002201c4ba44$e1ff8ba0$6601a8c0@CHELA>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Support Team <support@precisenetworksinc.com>
Cc: netfilter@lists.netfilter.org

Support Team wrote:
> My public interface has serveral IP address aliases.  Only the primary IP
> address responds to traffic (ip, imcp, et al).  I inserted a log statement
> at the top of each table and found that the packets destined for the virtual
> addresses never made it to any table.  However, according to tcpdump, I
> confirmed that the packets did get picked up by the kernel on the secondary
> address.  I guess they are just not passed to iptables.  Obviously, the
> packet was never replied to (icmp) or acknowledged (ip) by the process.
> 
> How can I get iptables to respond to the packets on the secondary
> interfaces?  Or, how can I get the kernel to pass the packets to iptables?
> 
> I understand that when the packet hits the chain, all I have to do is create
> a rule with the primary interface and use the IP address to distinguish the
> packets of different virtual addresses.

Patrick,

I don't have time to read the volume of details of your message, but the 
summary sounds a lot like a problem I was having.  Maybe this will help you.

I was upgrading a bunch of boxes.  I'd take a spare box, configure it, 
then swap it in in place of the old box.  I was seeing some real 
strangeness.  In tcpdump, I could see the packets, but they weren't 
hitting the iptables chains (verified with LOG statements at the top of 
every chain in every table).

It turns out to have been an ARP cache issue.  The router I was attached 
to still had the MAC address of the old machine's Ethernet interface in 
its cache.  I could see the packets in tcpdump because it was putting 
the interface in promiscuous mode and filtering on the "problem" IP 
address assigned to one of my subinterfaces.  It wasn't until I finally 
looked at the dest MAC address in the packets I was seeing in tcpdump 
(but not in iptables) and compared it to my actual MAC address that I 
figured out this problem.  A simple ARP cache flush on the router 
cleared up the problem.  (Or, if you're patient, just waiting for the 
relevant entries to timeout would work too.)

Hopefully, this helps you with your problem (or maybe it'll help others).

pete

