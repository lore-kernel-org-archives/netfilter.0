From: "Samuel Jean" <sj-netfilter@cookinglinux.org>
Subject: Re: random patch with 2.6 kernel?
Date: Thu, 10 Feb 2005 11:57:49 -0500 (EST)
Message-ID: <12847.142.169.215.10.1108054669.squirrel@142.169.215.10>
References: <BAY102-DAV108E4B8D08A7D0E5D30147AE760@phx.gbl>
	<12206.142.169.215.10.1108054332.squirrel@142.169.215.10>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <12206.142.169.215.10.1108054332.squirrel@142.169.215.10>
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
To: siegex@atozcomp.com
Cc: netfilter@lists.netfilter.org

On Thu, February 10, 2005 11:52 am, I said without knowing detail:
> SiegeX:
>
> Did you try it before submitting ? Giving it a quick view, it seems
> you play with ipv4 header, but register your match against ip6t_tables
> (which is the ip6tables friend) instead of ipt_tables.

SiegeX, discard this. Actually, it looks like _I_ was confused by the
subject of your post.

After a review, I figured out you ported it for both linux-2.6 and
linux-2.6/ipv6.

Can you confirm it works great ?

Thanks !

Samuel


