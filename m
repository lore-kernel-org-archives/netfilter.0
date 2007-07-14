From: Yasuyuki KOZAKAI <yasuyuki.kozakai@toshiba.co.jp>
Subject: Re: iptables 1.2 in an AMD64 bit kernel howto ??
Date: Sun, 15 Jul 2007 03:35:15 +0900 (JST)
Message-ID: <200707141835.l6EIZGOf025711@toshiba.co.jp>
References: <4697479B.9040707@ditro.com>
	<200707130949.l6D9nBlY008820@toshiba.co.jp>
	<Pine.LNX.4.63.0707131252130.17664@qynat.qvtvafvgr.pbz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.63.0707131252130.17664@qynat.qvtvafvgr.pbz>
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
Content-Type: Text/Plain; charset="us-ascii"
To: david.lang@digitalinsight.com
Cc: netfilter@lists.netfilter.org

From: David Lang <david.lang@digitalinsight.com>
Date: Fri, 13 Jul 2007 12:52:37 -0700 (PDT)

> > The old kernels have '64bit kernel and 32bit userland' problem.
> > Your iptables is 32bit binary (try readelf -a `which iptables`) ? If so,
> > building 64bit binary of iptables will solve the problem. Upgrading the
> > recent kernel should also solve it, of cause.
> 
> what kernel versions are recent enough to have this problem solved?

I think 2.6.22. The compat layer sent into 2.6.21, but a fix was
needed and it seems not to be in 2.6.21.x yet.

-- Yasuyuki Kozakai

