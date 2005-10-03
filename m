From: Aseem Rastogi <aseem@india.tejasnetworks.com>
Subject: Re: Iptables and vlan interfaces
Date: Mon, 03 Oct 2005 12:18:11 +0530
Message-ID: <4340D42B.2070106@india.tejasnetworks.com>
References: <20050930112129.19898.qmail@focomunicatii.ro>	<Pine.LNX.4.61.0509301440560.19019@filer.marasystems.com>	<20050930125427.28160.qmail@focomunicatii.ro>	<200509300839.15330.rob0@gmx.co.uk>
	<Pine.LNX.4.61.0509301706580.24680@filer.marasystems.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Received: from localhost (unknown [127.0.0.1])
	by anche.india.tejasnetworks.com (*****) with ESMTP
	id 229E4739A5; Mon,  3 Oct 2005 06:36:01 +0000 (UTC)
Received: from india.tejasnetworks.com (aseem.india.tejasnetworks.com
	[192.168.0.38]) by anche.india.tejasnetworks.com (*****) with ESMTP
	id CEBAD73999; Mon,  3 Oct 2005 12:05:59 +0530 (IST)
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
To: Henrik Nordstrom <hno@marasystems.com>
Cc: netfilter@lists.netfilter.org, /dev/rob0 <rob0@gmx.co.uk>

i have been following this post rather keenly. it now seems to have died 
down. but still i am not able to understand what is a vlan interface. 
can somebody please give me some pointer where i can read about this. 
vlan i thought is a l2 concept and should have nothing to do with l3.

thanks in advance.

regards,
aseem.

Henrik Nordstrom wrote:

> On Fri, 30 Sep 2005, /dev/rob0 wrote:
>
>> Hmmm, I had always thought you couldn't use virtual interfaces.
>> # iptables -vI INPUT -i eth0:101
>
>
> The above is not a virtual interface like VLAN interfaces are, only a 
> labelled IP address on eth0.
>
>   /sbin/ip addr show
>
> will give you a quite good picture of these things.
>
> to make your life saner I recommend unlearning ifconfig and instead 
> learn to use the ip command from iproute. ifconfig only confuses things..
>
> This difference is also seen in netstat -i.
>
> Regards
> Henrik
>
>


-- 
The end is always good. If it's not good, it's not the end.




