From: David Leangen <dleangen@canada.com>
Subject: Re: NAT: Slow connection on Mac OSX
Date: Tue, 06 Sep 2005 07:17:54 +0900
Message-ID: <431CC412.6010104@canada.com>
References: <431BD40E.7020001@canada.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <431BD40E.7020001@canada.com>
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


Just to follow up for the archives...

It was just a coincidence that it happened to be the Mac and not one of 
the Linux boxes. The problem had absolutely nothing to do with iptables 
(which appears to be set up correctly). Rather, it was a bad port in a hub.

Conclusion: double check hardware and cables first!


Cheers,
Dave



David Leangen wrote:
> 
> Hello!
> 
> I have set up NAT/masquerading on my router box.
> 
> Everything seems to be working fine on my Linux client host. However, my 
> Mac is having a lot of trouble: the connection is very slow and I can't 
> even finish loading, for example, the google home page.
> 
> 
> Is there something else I need to do to get this going right?
> 
> 
> Mac: 192.168.2.4
> Client Linux: 192.168.2.2
> Linux firewall (eth1): 192.168.2.1
> Linux firewall (eth0): 192.168.1.2
> 
> ip_forward is set to "1".
> 
> In my iptables "nat" table, I have:
> 
> -A POSTROUTING -o ppp0 -j MASQUERADE
> 
> 
> Thanks for any advice you can give me!
> 
> 
> 
> 


