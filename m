From: Aseem Rastogi <aseem@india.tejasnetworks.com>
Subject: Re: IP  Forwarding
Date: Sat, 22 Oct 2005 18:41:29 +0530
Message-ID: <435A3A81.7020007@india.tejasnetworks.com>
References: <43595BFA.1070200@airmail.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Received: from localhost (unknown [127.0.0.1])
	by anche.india.tejasnetworks.com (*****) with ESMTP
	id 805057397B; Sat, 22 Oct 2005 13:00:25 +0000 (UTC)
Received: from india.tejasnetworks.com (aseem.india.tejasnetworks.com
	[192.168.0.38]) by anche.india.tejasnetworks.com (*****) with ESMTP
	id 664547391E; Sat, 22 Oct 2005 18:30:24 +0530 (IST)
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
To: Jerry Alexander <jerrya@airmail.net>
Cc: netfilter@lists.netfilter.org

did you enable ip forwarding ?

try "echo 1> /proc/sys/net/ipv4/ip_forward".

regards,
aseem.

Jerry Alexander wrote:

> Dear NF:
>
>          I cannot get IPTABLES FORWARDing to work when the machines 
> are directly
> connected via a twisted cable.
>         Does FORWARDing only work with a router between the machines 
> in question?
>         If not, how can I get it to work?   I see the packets coming 
> into the box(ethereal)
> but none going out.
>         Can someone give me a quick overview of how, at the kernel 
> code level,
> how FORWARDing works and how to modify it to get two machines who are 
> directly
> connected to work.
>
>
>                                                                                     
> Jerry
>
>
>


-- 
The end is always good. If it's not good, it's not the end.




