From: "Samuel Jean" <sj-netfilter@cookinglinux.org>
Subject: Re: random patch with 2.6 kernel?
Date: Thu, 10 Feb 2005 11:52:12 -0500 (EST)
Message-ID: <12206.142.169.215.10.1108054332.squirrel@142.169.215.10>
References: <BAY102-DAV108E4B8D08A7D0E5D30147AE760@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <BAY102-DAV108E4B8D08A7D0E5D30147AE760@phx.gbl>
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
To: Brandon Hall <Jodious33@hotmail.com>
Cc: netfilter@lists.netfilter.org, siegex@atozcomp.com

On Thu, February 10, 2005 1:03 am, Brandon Hall said:
> i posted previously asking where i can get the random patch, i found th=
e
> random patch, compiled what needed to be compiled and no random.

Where did you find it ? I hope you didn't get it there :
https://lists.netfilter.org/pipermail/netfilter-devel/2004-November/01749=
1.html

> When I
> tried to add just the random patch it informed me that it was already
> applied but the libipt_random.so was not found.  Does this match not
> function with the 2.6 kernel?

It hasn't been ported yet. The link I gave is an _attempt_ to do,
but obivously the guy was confused about porting it to 2.6 _or_ ipv6.

It looks a mix of both.

--

SiegeX:

Did you try it before submitting ? Giving it a quick view, it seems
you play with ipv4 header, but register your match against ip6t_tables
(which is the ip6tables friend) instead of ipt_tables.

Would you mind giving it another try ?

Thanks,
Samuel


