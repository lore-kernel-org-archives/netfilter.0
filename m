From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: HELP! Transparent Proxy using bridging 2.6.9 and REDIRECT on
 different subnet
Date: Wed, 23 Mar 2005 18:35:31 -0600
Message-ID: <42420B53.4090700@riverviewtech.net>
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

One thing that I forgot to mention is that if you are DROPing FORWARD traffic in your filter / FORWARD table you will need to ACCEPT traffic that come sin your LAN interface and back out your LAN interface.

iptables -t filter -A FORWARD -i ${LAN} -o ${LAN} -j ACCEPT

You could possibly put a -s and -d match in place to tighter constraints on what is forwarded around the LAN.



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


