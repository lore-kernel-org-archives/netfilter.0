From: "Dick St.Peters" <stpeters@NetHeaven.com>
Subject: Re: where did ipt_unclean go in kernel 2.6.5 ?
Date: Wed, 7 Apr 2004 09:05:40 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <16499.64676.732432.801807@saint.heaven.net>
References: <407324E2.5080408@diwancomputing.com>
	<40734BE8.6060100@snapgear.com>
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40734BE8.6060100@snapgear.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Philip Craig <philipc@snapgear.com>
Cc: Madhav Diwan <madhav@diwancomputing.com>, netfilter@lists.netfilter.org, mvdiwan@hotmail.com

Philip Craig writes:
> Madhav Diwan wrote:
> > Just curious but where did the unclean match target disappear to? I 
> > thought that was part of the base iptables target set.
> 
> It was removed in 2.6.  See the following for the reasons:
> http://lists.netfilter.org/pipermail/netfilter-devel/2003-August/012199.html
> 
> > patchomatic-ng was no help either.
> 
> It should eventually turn up in pom-ng, but nobody has cared enough about
> it yet to get it working for 2.6.

The posted removal patch is easily reversed, with only one or two
hunks needing minor fiddling.  I've posted a restore patch for 2.6.3:
   ftp://ftp.netheaven.com/pub/outgoing/unclean-restore-2.6.3.patch

It applies to 2.6.4 with a little fuzz; I haven't tried 2.6.5 yet.

Anyone restoring the unclean match should understand the reasons for
its removal in the first place.  It can break things.  (Of course,
that can be said about all the rest of netfilter.)

--
Dick St.Peters, stpeters@NetHeaven.com 
Gatekeeper, NetHeaven, Saratoga Springs, NY

