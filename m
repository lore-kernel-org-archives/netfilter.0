From: Aseem Rastogi <aseem@india.tejasnetworks.com>
Subject: Re: Iptables and vlan interfaces
Date: Mon, 03 Oct 2005 14:57:12 +0530
Message-ID: <4340F970.7060900@india.tejasnetworks.com>
References: <20050930112129.19898.qmail@focomunicatii.ro>
	<Pine.LNX.4.61.0509301440560.19019@filer.marasystems.com>
	<20050930125427.28160.qmail@focomunicatii.ro>
	<200509300839.15330.rob0@gmx.co.uk>
	<Pine.LNX.4.61.0509301706580.24680@filer.marasystems.com>
	<4340D42B.2070106@india.tejasnetworks.com>
	<Pine.LNX.4.61.0510031035150.22605@filer.marasystems.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Received: from localhost (unknown [127.0.0.1])
	by anche.india.tejasnetworks.com (*****) with ESMTP
	id 81D34739C9; Mon,  3 Oct 2005 09:14:59 +0000 (UTC)
Received: from india.tejasnetworks.com (aseem.india.tejasnetworks.com
	[192.168.0.38]) by anche.india.tejasnetworks.com (*****) with ESMTP
	id 471A073999; Mon,  3 Oct 2005 14:44:56 +0530 (IST)
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
Cc: netfilter@lists.netfilter.org

thanks all for the info.

regards,
aseem.

Henrik Nordstrom wrote:

> On Mon, 3 Oct 2005, Aseem Rastogi wrote:
>
>> i have been following this post rather keenly. it now seems to have 
>> died down. but still i am not able to understand what is a vlan 
>> interface.
>
>
> VLANs is IEEE 802.1Q, dividing Ethernet into 4097 virtual Ethernet 
> networks. (the normal untagged network + 4096 .1q tagged networks = 4097)
>
> VLAN is normally only used within and between switches, but it is also 
> possible to use between the switch and a server/host allowing the 
> server to participate in multiple VLANs on the switch.
>
> This is configured on the Linux side using vconfig, creating one 
> vritual network interface per such virtual Ethernet being used between 
> the server and the switch. The virtual interfaces created by vconfig 
> is true virtual interfaces and can even have a different MAC address 
> than the physical interface if you like (defaults to use the same MAC 
> however). These virtual interfaces is named like 
> physicalinterface.vlannumber (i.e. eth0.45 for the VLAN with the .1q 
> tag 45 on the eth0 physical connection).
>
> More information on the VLAN support in Linux can be found from 
> http://www.candelatech.com/~greear/vlan.html. The needed software is 
> also available in most distributions (the kernel driver is available 
> in the kernel since many years back).
>
>> can somebody please give me some pointer where i can read about this. 
>> vlan i thought is a l2 concept and should have nothing to do with l3.
>
>
> vlan is indeed purely a l2 concept, using a slightly different 
> Ethernet frame format than normal Ethernet allowing for multiple 
> virtual Ethernet networks to be transported over the same cable.
>
> IP-aliases on the other hand is purely a l3 concept, allowing you to 
> have more than one IP address on the same interface, optionally 
> labelled with a name (interface:name) for administrative purposes. The 
> (optional) label on an IP-alias has no significant meaning other than 
> as a reminder to the administrator, and to produce confusing results 
> when using ifconfig (ifconfig has the odd habit of displaying the 
> named ip-aliases as if they were separate interfaces).
>
> Regards
> Henrik
>


-- 
The end is always good. If it's not good, it's not the end.




