From: "Charles Delorme" <charles.delorme@suricat.net>
Subject: Re: Problem with DNAT from localhost to LAN via loopback
Date: Thu, 14 Apr 2005 22:01:14 +0200
Message-ID: <001d01c5412c$b6fda5d0$0926a8c0@HECTISIE>
References: <1113492519.425e8c27488ab@imp1-q.free.fr>
	<20050414171847.GA2040@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: Jason Opperisano <opie@817west.com>, netfilter@lists.netfilter.org


>----- Original Message ----- 
>From: "Jason Opperisano" <opie@817west.com>
>Sent: Thursday, April 14, 2005 7:18 PM
> On Thu, Apr 14, 2005 at 05:28:39PM +0200, Charles Delorme wrote:
> > Hello list...
> > [..]
> your kernel needs to be compiled with:
>
>   CONFIG_IP_NF_NAT_LOCAL
>
> in order to DNAT locally-generated packets.
>

Thank you for that tip. Are there any side effects for this compilation
directive ?

> IIRC you then put the DNAT rule in the nat table OUTPUT chain to modify
> the destination of local packets.

I'm not sure to understand what kind of rule I need to add in the OUTPUT
chain. Should I copy the kind of rule I have in the PREROUTING table ?

Thanks.





