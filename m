From: sven@hin.de
Subject: Re: Update Iptables in order to use String-Match
Date: Sun, 02 Apr 2006 23:41:24 +0200
Message-ID: <44304504.7010808@hin.de>
References: <001701c65693$58272720$0101000a@sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <001701c65693$58272720$0101000a@sterenborg.info>
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

Rob Sterenborg schrieb:
> So your iptables isn't installed or installed in a different path than
> the original.
hmm bad...how do I correct this?

> So that's where things go wrong : if it doesn't show up, you couldn't
> have patched the kernel for it.
> 
> The string match is in the Extra repository. Did you run POM with
> "./runme extra" ?
> http://www.netfilter.org/projects/patch-o-matic/pom-extra.html#pom-extra
> -string
hmm no, I will do this now...

 > I think not completely.
> What does "iptables -V" say ? (Mine says : "iptables v1.3.5-2006xxxx")
iptables v1.3.5

