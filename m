From: "Samuel Jean" <sj-netfilter@cookinglinux.org>
Subject: Re: Policy for *nat*
Date: Thu, 17 Feb 2005 13:48:46 -0500 (EST)
Message-ID: <57363.142.169.215.10.1108666126.squirrel@142.169.215.10>
References: <1108662672.24164.5.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1108662672.24164.5.camel@localhost.localdomain>
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
To: Mohammad Khan <mkhan@lextranet.com>
Cc: netfilter@lists.netfilter.org

On Thu, February 17, 2005 12:51 pm, Mohammad Khan said:
> Hello list:
>
> What should be the policy for
> PREROUTING
> POSTROUTING
> OUTPUT
> chain in *nat* table?

First off, a default policy can only be ACCEPT or DROP.

This should all be ACCEPT.

> And why?

Because the NAT table is not meant for filtering.
The filter table provides the 3 necessary hook for
filtering purpose, INPUT--FORWARD--OUTPUT

Also, keep in mind that NAT table is traversed only
when there's no corresponding tuples in the conntrack.
i.e. only NEW unated packets get thru.

>
> Please explain.

I insist : keep filtering job in filter table. If you care about
duplicated rules in different chains, then create a custom chain
and call it from built-in chains.

One would also move incoming filtering to the mangle:PREROUTING hook.
Yes. It's feasable, but might break other things (ex.: NAT).

NAT is meant for NAT, not filtering.
MANGLE is meant for packet mangling, not filtering.
FILTER is meant for _filtering_ not NAT nor MANGLE'ing.

IMHO, the only chains that should contain DROP policy is filter's one.

>
>
> Thanks
> MOhammad
>

This is just my opinion - and the obvious way to see netfilter.
Because netfilter is permissive, one can do what netfilter was
not built for.

Best regards,
Samuel


