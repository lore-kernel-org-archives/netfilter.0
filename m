From: Aseem Rastogi <aseem@india.tejasnetworks.com>
Subject: Re: NAT tables and FILTER tables
Date: Wed, 14 Sep 2005 16:57:34 +0530
Message-ID: <43280926.5090508@india.tejasnetworks.com>
References: <43280467.4050801@india.tejasnetworks.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Received: from localhost (unknown [127.0.0.1])
	by anche.india.tejasnetworks.com (*****) with ESMTP
	id 3863D739F9; Wed, 14 Sep 2005 11:16:25 +0000 (UTC)
Received: from india.tejasnetworks.com (aseem.india.tejasnetworks.com
	[192.168.0.38]) by anche.india.tejasnetworks.com (*****) with ESMTP
	id B5955739CF; Wed, 14 Sep 2005 16:46:23 +0530 (IST)
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
To: Aseem Rastogi <aseem@india.tejasnetworks.com>
Cc: netfilter@lists.netfilter.org

in continuation:

i am actually trying to understand how nat and default filter table work 
together. my understanding is this:

when a packet is encountered it is either:

1. a new connection creation request packet.

2. a packet associated with a connection that has been mangled by NAT 
earlier.

3. a packet assiciated with a connection that has not been mangled by 
NAT earlier.

Each case goes like this:

Case 1: NAT table is considerd. Packet passes through PREROUTING chain, 
routing decision and then POSTROUTING chain.

Case 1a -- If either of them modified the packet, this packet and all 
subsequent packets of this connection DO NOT PASS THROUGH FILTER TABLE 
CHAINS.

Case 1b -- None of NAT tables modifies packet. It passes through FILTER 
table chains as usual.

Case 2: This packet follows the fate of its earlier packets. (PREROUTING 
AND POSTROUTING NAT table chains BUT NO FILTER table chains)

Case 3. Passes through FILTER TABLE chains.

is this correct??

Aseem Rastogi wrote:

> Hi,
>
> I have a small query.
>
> I have read that whenever a packet requesting a connection is 
> encountered, NAT table is used. My question is : Does it mean that for 
> new connection request packets ONLY NAT table is considered and not 
> default FILTER table?
>
> Thanks in advance.
>
> Regards,
> Aseem.
>


-- 
The end is always good. If it's not good, it's not the end.




