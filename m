From: "Samuel Jean" <sj-netfilter@cookinglinux.org>
Subject: Re: Ip packet reduction.
Date: Wed, 12 Jan 2005 12:47:37 -0500 (EST)
Message-ID: <51610.142.169.215.10.1105552057.squirrel@142.169.215.10>
References: <200501101656.j0AGuw1D078849@jkcpub.iserver.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200501101656.j0AGuw1D078849@jkcpub.iserver.net>
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
To: Michael Tedesco <mtedesco@broadbandmaritime.com>
Cc: netfilter@lists.netfilter.org

On Mon, January 10, 2005 11:56 am, Michael Tedesco said:
> Hello Everyone

Hello Mike!

>
[...]
> My goal is to reduce my log file. Also it seems that the 3
> packet is the same as the 15 or 20 or 30.  Can anyone help me out.
>

Yes, there's 3 ways depending on what you really want.

As of writing it, only ipt_recent allows you to count packet *but*
on a per-ip basis. Am just scared it doesn't behave normally when
you supply negation. So --hitcount 10 would start logging the 11th and
so on. You can't ! --hitcount 8(
*I am rewriting this module from scratch and called it ipt_iplist,
 keep an eye on it*

Rusty wrote ipt_limit which purpose is exactly to reduce flooded logs.

-m limit --limit 1/s -j LOG will LOG as long as you don't receive more th=
an
1 packet per second.

NOTE: Not on a per-ip basis.

Harald rebuilt this idea adding a per-tuple concept.
See ipt_hashlimit for further details.
http://www.netfilter.org/patch-o-matic/pom-base.html#pom-base-hashlimit

> Mike


HTH,

Samuel


