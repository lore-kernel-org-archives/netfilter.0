From: Aseem Rastogi <aseem@india.tejasnetworks.com>
Subject: NAT tables and FILTER tables
Date: Wed, 14 Sep 2005 16:37:19 +0530
Message-ID: <43280467.4050801@india.tejasnetworks.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Received: from localhost (unknown [127.0.0.1])
	by anche.india.tejasnetworks.com (*****) with ESMTP id C25E17394E
	for <netfilter@lists.netfilter.org>;
	Wed, 14 Sep 2005 10:56:08 +0000 (UTC)
Received: from india.tejasnetworks.com (aseem.india.tejasnetworks.com
	[192.168.0.38])
	by anche.india.tejasnetworks.com (*****) with ESMTP id E00737393C
	for <netfilter@lists.netfilter.org>;
	Wed, 14 Sep 2005 16:26:07 +0530 (IST)
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

Hi,

I have a small query.

I have read that whenever a packet requesting a connection is 
encountered, NAT table is used. My question is : Does it mean that for 
new connection request packets ONLY NAT table is considered and not 
default FILTER table?

Thanks in advance.

Regards,
Aseem.

-- 
The end is always good. If it's not good, it's not the end.




