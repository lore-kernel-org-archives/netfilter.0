From: Georgi Alexandrov <tehlists@hotpop.com>
Subject: Re: input filter
Date: Wed, 05 Jan 2005 19:17:32 +0200
Message-ID: <41DC212C.4050106@hotpop.com>
References: <20050104223520.2120.qmail@web53904.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050104223520.2120.qmail@web53904.mail.yahoo.com>
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
Cc: allambhasker@yahoo.com

Bhasker Allam wrote:

>Hi,
>I am a newbie and I was reading the howto for packet
>filter. The howto has the following picture:
>
>Incoming                 /     \         Outgoing
>       -->[Routing ]--->|FORWARD|------->
>          [Decision]     \_____/        ^
>               |                        |
>               v                       ____
>              ___                     /    \
>             /   \                   |OUTPUT|
>            |INPUT|                   \____/
>             \___/                      ^
>               |                        |
>                ----> Local Process ----
>
>The input filtering is done only for local bound
>packets and after the routing decision. Is the above
>true ? 
>
yes.

>Is there a facility to perform input filtering
>before the routing decision ? Thanks.
>
>  
>
How come you know if it is INPUT or FORWARD before the routing decision ?
Won't the "routing decision" decide if the packet(s) will be destined 
for INPUT (to the local machine) or FORWARD (for the machines behind 
you/gw/fw).

The two chains and tables that are hit by incoming packets before the 
routing decision are:
1. table mangle, chain PREROUTING (from the iptables-tutorial: "This 
chain is normally used for mangling packets, i.e., changing TOS and so on.")
then:
2: table nat, chain PREROUTING (from the iptables-tutorial: "This chain 
is used for DNAT mainly. Avoid filtering in this chain since it will be 
bypassed in certain cases.")

If you explain better your situation i'm sure we'll find reasonable 
solution for your filtering needs ;-)

>Bhasker.
>
>  
>
Georgi Alexandrov.

>__________________________________________________
>Do You Yahoo!?
>Tired of spam?  Yahoo! Mail has the best spam protection around 
>http://mail.yahoo.com 
>
>
>  
>


