From: Philip Craig <philipc@snapgear.com>
Subject: Re: where did ipt_unclean go in kernel 2.6.5 ?
Date: Wed, 07 Apr 2004 10:31:36 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40734BE8.6060100@snapgear.com>
References: <407324E2.5080408@diwancomputing.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <407324E2.5080408@diwancomputing.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Madhav Diwan <madhav@diwancomputing.com>
Cc: netfilter@lists.netfilter.org, mvdiwan@hotmail.com

Madhav Diwan wrote:
> Just curious but where did the unclean match target disappear to? I 
> thought that was part of the base iptables target set.

It was removed in 2.6.  See the following for the reasons:
http://lists.netfilter.org/pipermail/netfilter-devel/2003-August/012199.html

> patchomatic-ng was no help either.

It should eventually turn up in pom-ng, but nobody has cared enough about
it yet to get it working for 2.6.

> By the way , as a side note, just which iptables patches DO apply to the 
> kernel 2.6 series? its at version 2.6.5 now and severely needs some 
> firewalling support. , for instance h323 and the failover connection 
> tracking?

The patch-o-matic-ng/*/info files give the version requirements for each
patch.  Again, it's just a matter of someone needing them enough to fix
them for 2.6.

-- 
Philip Craig - SnapGear, A CyberGuard Company - http://www.SnapGear.com


