From: Steve Turnbull <steve.turnbull@yhgfl.net>
Subject: Re: No chain/target/match by that name
Date: Sun, 05 Sep 2004 19:32:48 +0100
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <413B5BD0.8070905@yhgfl.net>
References: <413B233C.3000601@yhgfl.net>
	<200409051351.03018.Alistair@nerdnet.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200409051351.03018.Alistair@nerdnet.ca>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Alistair Tonner wrote:
> On September 5, 2004 10:31 am, Steve Turnbull wrote:
> 
>>Hi
>>
>>Our web server is configured;
>>Debian (Woody) (No X installed)
>>Kernel 2.4.23 - configured with iptables in mind
>>iptables v1.2.6a
>>
>>When we start the firewall script, we get this message;
>>'No chain/target/match by that name'
> 
> 
> 	urmm ... try rebuilding iptables code against this kernel?
> 
> 	I'm not sure about Debian's packages, but is it possible that the iptables 
> code is precompiled here?

	I have just rebuilt the Kernel - I daren't reboot into it until I am on 
site tomorrow - we will see what happens, I have added various 
components along side the existing ones.


> 
> 
>>The firewall works however, but is constantly logging;
>>'Sep  5 16:00:52 www kernel: Input: IN=eth0 OUT=
>>MAC=00:e0:81:29:01:75:00:07:85:06:c2:e1:08:00 SRC=195.92.195.93
>>DST=195.92.38.54 LEN=302 TOS=0x00 PREC=0x00 TTL=61 ID=0 DF PROTO=UDP
>>SPT=53 DPT=32833 LEN=282'
> 
> 	
> 	This looks like a reply to a DNS query.   It the state rule below didn't get 
> accepted this looks correct.
> 
> 
>>Something is ammis here, and we can't ping out from the server with the
>>firewall running, also, we can't use Lynx to browse. Turn the firewall
>>off and all is well for both of these.
> 
> 	
> 	You haven't included any rules here that regard ICMP -- no pings.

	I was meaning I couldn't ping out FROM the server. The rule for 
outgoing traffic is accept all - "iptables -P OUTPUT ACCEPT", this is 
why I was confused about the inability to ping or browse with Lynx outbound.

> 
> 
>>Has anybody got any ideas what is wrong? Our firewall rule is below.
>>
>>Regards
>>Steve
>>
>>
>>
>>#!/bin/sh
>>
>>
>>#
>># This is the firewall up script.
>>#
>>
>>#
>># Lets start by dropping all incoming traffic and allowing all
>># outbound traffic
>>#
>>
>>iptables -P INPUT DROP
>>iptables -P FORWARD DROP
>>iptables -P OUTPUT ACCEPT
>>
>>
>>
>># Flush any existing rules...
>>iptables -F
>>
>>
>># Allow any established connections to come on through...
>>iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>>
>>
>># This is a web server. We only require access to http ports
>># 80,21,53 and 443. New ports to allow will be added here...
>>iptables -A INPUT -p tcp --dport 80 -j ACCEPT
>>iptables -A INPUT -p tcp --dport 443 -j ACCEPT
>>
>>#ssh
>>iptables -A INPUT -p tcp --dport 22 -j ACCEPT
>>
>>#ftp
>>iptables -A INPUT -p tcp --dport 21 -j ACCEPT
>>
>>#DNS
>>iptables -A INPUT -p tcp --dport 53 -j ACCEPT
>>iptables -A INPUT -p udp --dport 53 -j ACCEPT
>>
>>
>># Allow the loopback connection...
>>iptables -A INPUT -i lo -j ACCEPT
>>
>>
>># Log stuff that doesn't match above rules...
>>iptables -A INPUT -j LOG --log-prefix="Input: "
> 
> 


-- 
Steve Turnbull
Digital Content Developer
YHGfL Foundation

t 01724 275030
e steve.turnbull@yhgfl.net


