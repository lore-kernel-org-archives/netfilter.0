From: Aseem Rastogi <aseem@india.tejasnetworks.com>
Subject: Re: --state NEW -j DROP (would be great)
Date: Wed, 26 Oct 2005 11:28:51 +0530
Message-ID: <435F1B1B.1050306@india.tejasnetworks.com>
References: <001501c5d9ef$62a26c30$0510a8c0@cornerpc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Received: from localhost (unknown [127.0.0.1])
	by anche.india.tejasnetworks.com (*****) with ESMTP
	id 73FC773A77; Wed, 26 Oct 2005 05:47:28 +0000 (UTC)
Received: from india.tejasnetworks.com (aseem.india.tejasnetworks.com
	[192.168.0.38]) by anche.india.tejasnetworks.com (*****) with ESMTP
	id 18E6F73A82; Wed, 26 Oct 2005 11:17:27 +0530 (IST)
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
To: Sylvan Andrew <sylvan_nids@norfolk.nf>
Cc: netfilter@lists.netfilter.org

i think tcpdump is packet dump at L2 and iptable rules are applied at 
L3. thats why you see these packets but they are dropped at L3.

Sylvan Andrew wrote:

> Hello,
>
> Could somebody please explain the  'iptables -A INPUT -eth0 -m state 
> --state NEW -j DROP' a bit more for me ?  I understand that it won't 
> allow any outside initiated inbound connections into a network. 
> However occasionally if I'm doing a tcpdump we see things like:
>
> 21:04:48.935367 IP 82.29.180.221.15378 > 213.17.40.204.4154: R 0:0(0) 
> ack 1 win 0
> 21:04:48.935447 IP 82.29.180.221.15378 > 213.17.40.204.4154: R 0:0(0) 
> ack 1 win 0
> 21:04:48.935455 IP 82.29.180.221.15378 > 213.17.40.204.4154: R 0:0(0) 
> ack 1 win 0
> 21:04:48.935537 IP 82.29.180.221.15378 > 213.17.40.204.4154: R 0:0(0) 
> ack 1 win 0
> 21:04:48.935545 IP 82.29.180.221.15378 > 213.17.40.204.4154: R 0:0(0) 
> ack 1 win 0
> 21:04:48.935629 IP 82.29.180.221.15378 > 213.17.40.204.4154: R 0:0(0) 
> ack 1 win 0
> 21:04:48.935637 IP 82.29.180.221.15378 > 213.17.40.204.4154: R 0:0(0) 
> ack 1 win 0
> 21:04:48.935812 IP 82.29.180.221.15378 > 213.17.40.204.4154: R 0:0(0) 
> ack 1 win 0
> 21:04:48.935821 IP 82.29.180.221.15378 > 213.17.40.204.4154: R 0:0(0) 
> ack 1 win 0
> 21:04:48.936045 IP 82.29.180.221.15378 > 213.17.40.204.4154: R 0:0(0) 
> ack 1 win 0
> 21:04:48.936053 IP 82.29.180.221.15378 > 213.17.40.204.4154: R 0:0(0) 
> ack 1 win 0
> 21:04:48.936153 IP 82.29.180.221.15378 > 213.17.40.204.4154: R 0:0(0) 
> ack 1 win 0
>
> What is that and shouldn't it be dropped ? Or is the : R 0:0(0) ack 1 
> win 0 part of it a already establish connection ? Although that's one 
> of our IP's it's not active on our network.
>
> Any ideas / advice  would be greatly appreciated !
>
> Regards
>
> Sylvan
>
>


-- 
The end is always good. If it's not good, it's not the end.




