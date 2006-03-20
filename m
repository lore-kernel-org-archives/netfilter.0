From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: website access problem
Date: Mon, 20 Mar 2006 07:43:12 +0100
Message-ID: <000001c64be9$8fcba930$0101000a@sterenborg.info>
References: <1799.210.56.5.120.1142830426.squirrel@210.56.5.120>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1799.210.56.5.120.1142830426.squirrel@210.56.5.120>
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

> i am using squid and iptables on FC4, recently i am getting
> problem when
> user browse
> 
> https://www.akd-trade.com
> 
> page doesn't open and shows broswing bar continously.   i also nat 443
> port, when i stop iptables, website opens in 5 seconds, while squid
> running. 
> 
> i re-install FC4 getting same error.  i installed RHEL 3  and copied
> iptables and squid to that system without changing any thing.
> 
> whil i can brwse this site
> 
> 
> strange ......?
> 
> any idea to solution.

No. Well, since it works when you clear the rules I'd say it must be
your ruleset, but we don't know anything about that.


Gr,
Rob


