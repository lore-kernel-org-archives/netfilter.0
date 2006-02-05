From: John Mok <jmok@attglobal.net>
Subject: Re: 2 DSL connection
Date: Mon, 06 Feb 2006 01:32:03 +0800
Message-ID: <43E63693.6030700@attglobal.net>
References: <1139149508.4793.2.camel@nirvana.aurokruti.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1139149508.4793.2.camel@nirvana.aurokruti.in>
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


The functions of iproute2 will suffice, that one route to the 2 
interfaces of equal metrics. Of course, the 2 interfaces eth0 and eth1 
have to be NAT'ed. For details, please reference the documentation at :-

http://www.lartc.org/

Regards,   John Mok

varun wrote:
> Hello,
>
> I want to use 2 DSL connections on one
> system.
>
> eth0 - DSL1 with static IP
>
> eth1 - DSL2 with static IP
>
> eth2 - LAN
>
> I would like all traffic from eth2(LAN)
> to be distributed equally between DSL1
> and DSL2.
>
> Is it possible to do that using iptables  ?
>
> Thanks in advance
>
> Varun
>
>
>   


