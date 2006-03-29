From: bash <0x62ash@gmail.com>
Subject: Re: help me (nfcan: addressed to exclusive sender for this address)
Date: Wed, 29 Mar 2006 23:14:21 +0400
Message-ID: <20060329231421.0d6d3a59.0x62ash@gmail.com>
References: <20060329215458.bf063d97.0x62ash@gmail.com>
	<000201c6535e$a2282910$0101000a@sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000201c6535e$a2282910$0101000a@sterenborg.info>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Wed, 29 Mar 2006 20:28:53 +0200
"Rob Sterenborg" <rob@sterenborg.info> wrote:

> >> I am not an expert on this,
> >> but for what it is worth:
> >> 
> >> Perhaps the rules used to detect
> >> and limit brute force ssh attacks
> >> could be adapted to your need.
> > 
> > You are talking about "recent" module... I don't know how I can use
> > it in my situation.... 
> > 
> >> Does NetLook have a predictable pattern?
> > 
> > Forget about NetLook...
> > 
> > My criteria for blocking is:
> > if rate of SYN packages from ONE source IP is greater then
> > 3packets/sec => then block this IP
> > 
> > And i can't add rule "-m limit" per all source IP in my net,
> > because my net is big (~255^3)....
> 
> Wouldn't that look something like :
> 
> $ipt -A [INPUT|FORWARD] -i $IF_LAN -m state --state NEW -s $LAN_NET \
>   -p tcp --syn -m limit --limit 3/sec -j ACCEPT

If just ONE host from my $LAN_NET will exceed this limit, then ALL
hosts in $LAN_NET will not able to start new session... and this is
bad. I want to limit 3/sec per host, not for all net....

> This would match NEW packets on your LAN interface with SYN set, coming
> from any of your LAN IP's and not allowing more than 3 of these per
> second. Of course, you'd also need a rule like this to allow the
> complete connection :
> 
> $ipt -A [INPUT|FORWARD] -m state --state RELATED,ESTABLISHED -j ACCEPT
> 
> Or am I missing something ?
> 
> 
> Gr,
> Rob
> 
> 


-- 
Biomechanica Artificial Sabotage Humanoid

