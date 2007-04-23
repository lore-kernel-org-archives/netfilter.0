From: Nagy Zoltan <nagy.zoltan@cit.hu>
Subject: Re: How to filter this packet?
Date: Mon, 23 Apr 2007 18:22:25 +0200
Message-ID: <462CDD41.8020505@cit.hu>
References: <450608.64360.qm@web63507.mail.re1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <450608.64360.qm@web63507.mail.re1.yahoo.com>
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
To: monty denis <montydenis@yahoo.com>
Cc: netfilter@lists.netfilter.org

monty denis wrote:
> Hello, all.
> 
> I can filter some protocol packet like below.
> 
> iptables -A INPUT -p x 
> 
> But how can I filtre like (proto 0) below?
> proto 0 means protocol 0 ?
> 
> I can find protocol 0 information at  
> http://www.iana.org/assignments/protocol-numbers
> 
> 
>  11.34.254.146 -> xx.xx.xx.xx [proto 0]
>   ........WinSock 2.0.....LG@.

hi
you can use: l7,string,u32
string is the simplest and cheapest for this,
but if you place a rule like:
$ipt -m string --from 8 --to 16 --string WinSock
you maybe have to face with false positives.

or you can create a chain and return for all legal protocols, in this 
way you can provide a negate for the others, and kick out proto 0 (and 
others as well)
or you can go ahead and implement handling of protocol 255 it's reserved 
anyway ;)
that way netfilter can use proto 255 for marking any protocol is ok
and use 0 and others as protocol identifiers

eg:

table INPUT
ipt -j PROTONEG

table PROTONEG
ipt -p tcp -j RETURN
ipt -p udp -j RETURN
ipt -p icmp -j RETURN
ipt -j DROP


good luck ;)
kirk

