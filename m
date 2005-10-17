From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: removing duplicate rules
Date: Mon, 17 Oct 2005 06:38:09 +0200
Message-ID: <20051017044217.BF0C069BB7@smtp.sterenborg.info>
References: <4352CA48.3070502@india.tejasnetworks.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4352CA48.3070502@india.tejasnetworks.com>
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

> Continuing this post:
> 
> Adding a rule multiple times shows multiple entries in
> iptables -L output. My question is : does it have any
> performance impact on packet processing ?

Yes.

> Should not be because as soon as a rule is matched, it should come
> out, Right? 

Well, what about the other rules that follow the duplicates ? Netfilter
has to check all duplicates before it reaches a rule that is different.
You may not notice the performance hit if you have a small ruleset, but
you will if you have a large one.


Gr,
Rob


