From: Pablo Neira <pablo@eurodev.net>
Subject: Re: TIME extension rule not matching under (Fedora) kernel 2.6.9?
Date: Sat, 05 Mar 2005 15:42:05 +0100
Message-ID: <4229C53D.2060604@eurodev.net>
References: <200503042355.j24NtSu3027597@mail79.megamailservers.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <200503042355.j24NtSu3027597@mail79.megamailservers.com>
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
To: Kevin Stadlmayer <kevins@wirelessedge.ca>
Cc: netfilter@lists.netfilter.org

Kevin Stadlmayer wrote:
> I have patched the kernel with the patch-o-matic, and any rules that I add
> show up in the iptables rules listing.  However, no packets are matching the
> rules.  I can create a rule that is identical to the TIME based rule,
> without the TIME constraint, and the rule matches fine.  As soon as I add
> the "-m time" component to the rule, no more matching.

There has been some discussion about TIME in netfilter-devel, have a 
look at the mail archive.

https://lists.netfilter.org/pipermail/netfilter-devel/2005-January/018136.html

Those changes are still pending to be applied to pom-ng.

--
Pablo

