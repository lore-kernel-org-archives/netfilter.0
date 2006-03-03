From: Steven M Campbell <Netfilter@SCampbell.net>
Subject: Re: avoid conntrack
Date: Fri, 03 Mar 2006 09:48:44 -0500
Message-ID: <4408574C.4070003@SCampbell.net>
References: <200602201430.35996.clist@uah.es>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200602201430.35996.clist@uah.es>
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
To: clist@uah.es
Cc: netfilter@lists.netfilter.org

Clist wrote:
> Hi list,
>
> It is needed to do '-j NOTRACK'  in order to avoid conntracking for some 
> packets, or i can simply DROP packets on the raw table so they do not reach 
> other netfilter tables and so it is not conntracking for those packets..?
>
>
> Now and simply do
> *raw 
> -A PREROUTING <some criteria> -j DROP
>
> do i need to do
> -A PREROUTING <some criteria> -j NOTRACK
> -A PREROUTING <some criteria> -j DROP
>
> Thanks...
>   
conntrack only keeps track of  connections, it does absolutely nothing 
to your firewall rules,  it's up to you to decide what to do with the 
connection states in your rules.   At some point you have a rule that is 
similar to  --state established,related  -j ACCEPT, that's where you are 
allowing packets through because they are in conntrack, if you want to 
eliminate some packets regardless of state then just do so before you 
hit the rule.


