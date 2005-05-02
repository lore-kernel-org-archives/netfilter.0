From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: TCP_CONNTRACK_ESTABLISHED 5days
Date: Mon, 02 May 2005 09:31:41 -0500
Message-ID: <427639CD.6080107@riverviewtech.net>
References: <42762C02.8060300@danbbs.dk> <427634ED.1030204@danbbs.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <427634ED.1030204@danbbs.dk>
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
To: netfilter <netfilter@lists.netfilter.org>

> Moritz, thanks for pointing that out.
> Your suggested 10 minutes seems a bit short, though..

I would not set ip_conntrack_tcp_timeout_established to any thing lower than tcp_fin_timeout.  I would be tempted to set ip_conntrack_tcp_timeout_established to approximately double what tcp_fin_timeout is set to.  I don't know of any reason that conntrack would need to keep things for twice tcp_fin_timeout, but I'd rather be safe than sorry.  Besides even double of tcp_fin_timeout is CONSIDERABLY less than 5 days.



Grant. . . .

