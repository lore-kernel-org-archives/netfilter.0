From: Stanislav Kruchinin <stas@crypt.org.ru>
Subject: Re: problems with connlimit extension
Date: Tue, 17 Jul 2007 22:20:45 +0400
Message-ID: <469D087D.7000907@crypt.org.ru>
References: <469CFE1D.6080006@crypt.org.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <469CFE1D.6080006@crypt.org.ru>
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
To: netfilter@lists.netfilter.org

Stanislav Kruchinin wrote:
> Hello.
> 
> I have problems with connlimit module. I've got properly configured, 
> patched and compiled kernel 2.6.21.5 and iptables 1.3.8. 
> patch-o-matic-ng-20070713 was used.
> 
> The module ipt_connlimit is loaded properly, but iptables still can't 
> create any rules with it.

I think I've found the reason. This is one of many bugs related to a
goddamn ipt_ -> xt_ renaming.

