From: "Carlo Florendo" <carlo@hq.astra.ph>
Subject: Re: local DNAT with bind,postfix,and iptables
Date: Thu, 16 Oct 2003 14:53:56 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <005b01c39438$610bd270$200aa8c0@thorin>
References: <DAAAFFB7B8C62F40BC87BF3E729F79E1296038@ibfdmail.ibfd.oin>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Gaby Schilders <G.Schilders@ibfd.org>
Cc: netfilter list <netfilter@lists.netfilter.org>

> ----- Original Message -----
> From: "Gaby Schilders"
>
> Perhaps I'm out of line here,

No. Not at all :)

but there are several ways leading to Rome,
> as
> they say here.
>
> 1) Postfix trick mentioned by George (and obviously having only one
> postfix
> box instead of two with a voodoo like setup to compensate... ;-)
> 2) Bind views (show the internal world something different than the
> outside). This seems to generally be the most standard and most advised
> way
> of handling this kind of problem. See the Bind administrator guide at
> isc.org.
> 3) Local DNAT has been implemented but through p-o-m patches (in
> CVS/snapshots only afaik), not standard kernel and I've never tried it so
> I
> don't know how good it will work. Use the CVS web-interface to look at the
> patches/comments.

Those insights are really useful.  Upon reading what you've mentioned, I
remember split DNS.  The postfix trick by George was also new to me.
However, I don't think I could try the patch soon.


> 4) There was a four. It slipped my mind while thinking of the other
> options
> and I'll mention it as soon as it comes back to me... :-|
>
> If you need more explanation, do ask, but I'm very busy today/tomorrow so
> I
> may not respond before Monday.

Ok.  Just make sure you post them.  It could be something new and something
I haven't heard of before.
Some might also find that useful.

Thanks!

Best Regards,

Carlo
------
Carlo Florendo
Astra Philippines Inc.
www.astra.ph


