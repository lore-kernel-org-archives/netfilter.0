From: Aseem Rastogi <aseem@india.tejasnetworks.com>
Subject: Re: removing duplicate rules
Date: Mon, 17 Oct 2005 13:40:18 +0530
Message-ID: <43535C6A.2090506@india.tejasnetworks.com>
References: <20051017044217.BF0C069BB7@smtp.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Received: from localhost (unknown [127.0.0.1])
	by anche.india.tejasnetworks.com (*****) with ESMTP
	id 638B5739BD; Mon, 17 Oct 2005 07:59:10 +0000 (UTC)
Received: from india.tejasnetworks.com (aseem.india.tejasnetworks.com
	[192.168.0.38]) by anche.india.tejasnetworks.com (*****) with ESMTP
	id BAD3373995; Mon, 17 Oct 2005 13:29:08 +0530 (IST)
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
To: Rob Sterenborg <rob@sterenborg.info>
Cc: netfilter@lists.netfilter.org

okay.

from linux man page for iptables:

       A firewall rule specifies criteria for a packet, and a target.  
If the packet does not match,  the  next  rule  in  the
       chain  is  the examined; if it does match, then the next rule is 
specified by the value of the target, which can be the
       name of a user-defined chain or one of the special values ACCEPT, 
DROP, QUEUE, or RETURN.

which means for packets matching the rule, duplicates won;t matter but 
for packets not matching the rule, each rule will be checked separately.

regards,
aseem.

Rob Sterenborg wrote:

>>Continuing this post:
>>
>>Adding a rule multiple times shows multiple entries in
>>iptables -L output. My question is : does it have any
>>performance impact on packet processing ?
>>
>
>Yes.
>
>>Should not be because as soon as a rule is matched, it should come
>>out, Right? 
>>
>
>Well, what about the other rules that follow the duplicates ? Netfilter
>has to check all duplicates before it reaches a rule that is different.
>You may not notice the performance hit if you have a small ruleset, but
>you will if you have a large one.
>
>
>Gr,
>Rob
>
>
>


-- 
The end is always good. If it's not good, it's not the end.




