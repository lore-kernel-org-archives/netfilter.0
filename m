From: Aseem Rastogi <aseem@india.tejasnetworks.com>
Subject: Re: Iptables and vlan interfaces
Date: Mon, 03 Oct 2005 14:25:11 +0530
Message-ID: <4340F1EF.3010000@india.tejasnetworks.com>
References: <20050930112129.19898.qmail@focomunicatii.ro>	<Pine.LNX.4.61.0509301440560.19019@filer.marasystems.com>	<20050930125427.28160.qmail@focomunicatii.ro>	<200509300839.15330.rob0@gmx.co.uk>	<Pine.LNX.4.61.0509301706580.24680@filer.marasystems.com>	<4340D42B.2070106@india.tejasnetworks.com>
	<20051003074444.GA27873@torres.l21.ma.zugschlus.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Received: from localhost (unknown [127.0.0.1])
	by anche.india.tejasnetworks.com (*****) with ESMTP
	id 993B7739C1; Mon,  3 Oct 2005 08:42:59 +0000 (UTC)
Received: from india.tejasnetworks.com (aseem.india.tejasnetworks.com
	[192.168.0.38]) by anche.india.tejasnetworks.com (*****) with ESMTP
	id 106AA739A5; Mon,  3 Oct 2005 14:12:55 +0530 (IST)
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
To: Marc Haber <mh+netfilter@zugschlus.de>
Cc: netfilter@lists.netfilter.org

i understand vlans. but how is a vlan network interface different from a 
normal eth interface as far as higher layer protocols are concerned? or 
for that matter of fact how is this different from even l2 perspective. 
only difference is the broadcast domain. right ?

also, if somebody can give me an example of ifconfig output for vlan 
interface, that will be helpful.

thanks.

Marc Haber wrote:

>On Mon, Oct 03, 2005 at 12:18:11PM +0530, Aseem Rastogi wrote:
>
>>i have been following this post rather keenly. it now seems to have died 
>>down. but still i am not able to understand what is a vlan interface. 
>>can somebody please give me some pointer where i can read about this. 
>>vlan i thought is a l2 concept and should have nothing to do with l3.
>>
>
>http://en.wikipedia.org/wiki/Vlan might be a good start.
>
>While VLANs are basically a layer 2 concept, you somehow need to reach
>them from upper layers. This is accomplished by having "virtual
>interfaces" which are "connected" to the VLAN and feel just like a
>physical interface on a physical LAN from the software side.
>
>Greetings
>Marc
>


-- 
The end is always good. If it's not good, it's not the end.




