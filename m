From: "Robert Czechonski" <mlody@elpec.com>
Subject: Re: Re: connlimit problem SOLVED
Date: Wed, 14 Jul 2004 12:53:46 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4830.80.51.249.26.1089802426.squirrel@www.elpec.com>
Reply-To: mlody@elpec.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> 
> try iptables -A INPUT   ....
> or           -A OUTPUT  ....
> or           -A FORWARD ....
>
> depending on which chain you want this rule to append to (looking at
> your example, probably INPUT??). Or use
>
> iptables -I <chainname> <number> ....
> 
> to insert the rule at rule number <number>
> in the chain.
>
>
> HTH
>
> Sven



You're right. Thanks to all you guys.

-- 

Robert


