From: Blizzards <blizzards@libero.it>
Subject: Re: NAT IP POOL!
Date: Thu, 05 Dec 2002 12:59:32 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DEF3FA4.1010404@libero.it>
References: <3DEF3465.4070003@libero.it> <1039088743.489.31.camel@xbox>
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
To: Filip Sneppe <filip.sneppe@cronos.be>
Cc: netfilter@lists.netfilter.org

>
>
>Hi,
>
>You probably want to look at the NETMAP target that is in patch-o-matic.
>SNAT and DNAT targets will do some loadbalancing. You'll get weird
>results with your setup.
>
>With NETMAP you can do source NAT and destination NAT of whole subnets
>with a strict 1:1 mapping.
>
Ok, but if i need to SNAT a whole subnet 192.168.1.0/24 with a short 
pool of address like 172.16.1.1-172.16.1.10
with a strict 1:1 only 10 ip are natted.
NETMAP give me the ability to write down a PAT address for the rest of 
connections?
Or for short pool it's better to setup interfaces aliases?

Thanks.
Giulius.

>
>Regards,
>Filip
>
>
>  
>




