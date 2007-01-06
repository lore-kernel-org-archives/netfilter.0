From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Destination NAT from an LKM
Date: Sat, 6 Jan 2007 15:33:53 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0701061530160.22558@yvahk01.tjqt.qr>
References: <BAY101-F173439B62595972E816E8CDDBF0@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY101-F173439B62595972E816E8CDDBF0@phx.gbl>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom Blane <tomblane@hotmail.com>
Cc: netfilter@lists.netfilter.org


On Jan 5 2007 16:02, Tom Blane wrote:
>
> I have an LKM that hooks into the NF_IP_PRE_ROUTING hook for IP 
> traffic. The kernel module examines certain fields of the IP header 
> and then makes a decision as to either allow the packet on to its 
> intended destination or to re-route the packet to another system. 
> However Im having a problem re-routing the traffic. [...]

Why is not it possible for you to use the regular (iptables) DNAT?

> Any pointers towards code or articles would be great.

Your code is first to show.


	-`J'
-- 

