From: Anders Fugmann <afu@fugmann.dhs.org>
Subject: Re: problems filtering ppp devices
Date: Mon, 09 Sep 2002 14:06:23 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D7C8EBF.8030000@fugmann.dhs.org>
References: <004d01c257e4$eceb7890$0401a8c0@titanium>
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
To: Jeroen Wortelboer <jeroen@carotechnology.com>
Cc: netfilter@lists.netfilter.org

Jeroen Wortelboer wrote:
> Hi there,
>  
> I am encountering some weird stuff while filtering a ppp device.
> It seems like traffic from the ppp device does not enter the INPUT or 
> OUTPUT table.  Only when the destination of the traffic is another 
> interface on the same machne does the INPUT or OUTPUT table see the 
> traffic (i am logging all traffic through the ppp device. . .).
A packet traverses the INPUT chain (filter table), only if it is 
destined for the firewall itself. All packets originating from the 
firewall traverses the OUTPUT chain. The FORWARD chain is traversed by 
packets that enters one interface and leaves another (forwarded by 
linux). In all the obersevation is correct, and indeed intended.

> Filtering this fraffic on the forward of nat tables works fine, but 
> leaves me with an unhappy feeling...
Filtering in the nat table?. Please use the filter table for filtering.

>  
> I did some google-ing for this problem and came up empty. I hope I am 
> doing something wrong here because otherwise this could be a serious 
> problem.
I guess that you was not using the terms "iptables traversing tables".
It would have given you the link to the tutorial. See:
http://www.iptables.org/documentation/tutorials/blueflux/iptables-tutorial.html#TRAVERSINGOFTABLES 


Hope it helps.
Regards
Anders Fugmann
--
Author of FIAIF
FIAIF Is An Intelligent/Iptables Firewall.
http://fiaif.fugmann.dhs.org


