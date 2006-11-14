From: Danny <dineshg@hostway.com>
Subject: Re: Iptables for load balancing internet traffic
Date: Tue, 14 Nov 2006 15:08:53 +0530
Message-ID: <45598EAD.8090900@hostway.com>
References: <4558A3B8.9080905@hostway.com> <45597F2B.4060101@alinto.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45597F2B.4060101@alinto.com>
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


>
bill wrote:
>
> And did you tried the CLUSTERIP target?
>    CLUSTERIP
> This module allows you to configure a  simple  cluster  of  nodes  that
> share a certain IP and MAC address without an explicit load balancer in
> front of them.  Connections  are  statically  distributed  between  the
> nodes in this cluster.
>
>
Well, I havent tried this. But this looks good for an inbound traffic to 
a specific port.
In my case, the traffic is outgoing and has to be NATed.

I am sure that there is some way out, using nth patch. Someone might 
have done this.


Thank you,
- Danny

