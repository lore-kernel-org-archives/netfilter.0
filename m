From: Aseem Rastogi <aseem@india.tejasnetworks.com>
Subject: NAT rules for Multiple IPAddresses on same physical interface
Date: Mon, 17 Oct 2005 16:14:34 +0530
Message-ID: <43538092.3050603@india.tejasnetworks.com>
References: <20051017044217.BF0C069BB7@smtp.sterenborg.info>
	<43535C6A.2090506@india.tejasnetworks.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Received: from localhost (unknown [127.0.0.1])
	by anche.india.tejasnetworks.com (*****) with ESMTP id 8B2BB739BF
	for <netfilter@lists.netfilter.org>;
	Mon, 17 Oct 2005 10:33:25 +0000 (UTC)
Received: from india.tejasnetworks.com (aseem.india.tejasnetworks.com
	[192.168.0.38])
	by anche.india.tejasnetworks.com (*****) with ESMTP id 66C3B739B2
	for <netfilter@lists.netfilter.org>;
	Mon, 17 Oct 2005 16:03:24 +0530 (IST)
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

Hi All,

I have a situation where my machine has one ethernet interface but i 
have assigned it multiple ipaddresses on same interface. Now I want to 
add some NAT rules so that a packet destined for my machine and port 
3023 is redirected to some other IP and port.

Do I need to write rules for each of the IPAddresses that my machine 
has? Or is there a way in NAT PREROUTING to identify if this packet is 
for localhost (Of course something other than --destination)? I do not 
want to write rules for each IPAddress, rather I am looking for a way to 
identify if this packet is for me.

Thanks in advance,

Regards,
Aseem.

-- 
The end is always good. If it's not good, it's not the end.




