From: Jacob Friis Larsen <jfl@list.idg.dk>
Subject: Re: Port is open but I am unable to connect
Date: Wed, 08 Sep 2004 08:38:33 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <413EA8E9.3090700@list.idg.dk>
References: <413E0B9E.8010708@list.idg.dk>
	<1094588398.1890.54.camel@wolfpack.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1094588398.1890.54.camel@wolfpack.ljm.dom>
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
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org

> i would content that while you believe your source IP is 1.2.3.4 in this
> scenario--it; in fact, is not.

I know.
1.2.3.4 is just for the example :)

> try:
> 
>   iptables -A INPUT -j LOG --log-prefix "FW DROP INPUT: "
> 
> and see what the logs have to say about it.

This will log all incoming packets?

Thanks,
Jacob

