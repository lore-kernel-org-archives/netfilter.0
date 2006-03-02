From: Oleg <sov.rbsec@gmail.com>
Subject: Re: filtering HTTP signatures/headers ?
Date: Thu, 2 Mar 2006 14:36:18 +0300
Message-ID: <200603021436.18745.sov.rbsec@gmail.com>
References: <20060302040400.27574.qmail@web51111.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060302040400.27574.qmail@web51111.mail.yahoo.com>
Content-Disposition: inline
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

> now
> there are couple of p2p applications out there that
> tunnel through my port 80 as its open, this is taking
> up my internet bandwith, i want to stop that ...
To detect p2p try:
- iptables-p2p (mega.ist.utl.pt/~filipe/iptables-p2p/)
- ipp2p (check latest patch-o-matic-ng)
- l7-filter (l7-filter.sf.net)

-- 
Best regards, Oleg


