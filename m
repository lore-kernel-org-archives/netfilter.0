From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: how to block kazaa ?
Date: Wed, 26 Feb 2003 02:00:37 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302260200.37822.netfilter@newkirk.us>
References: <Pine.LNX.4.43.0302261032380.375-100000@debian.lan.deeproot.co.in>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.43.0302261032380.375-100000@debian.lan.deeproot.co.in>
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
To: Nimit Gupta <nimit@deeproot.co.in>
Cc: "inghau@perkom.co.id" <inghau@perkom.co.id>, "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

On Wednesday 26 February 2003 12:07 am, Nimit Gupta wrote:
> hello,
> =09Just going thru the thread so that i could learn form others
> problem. One thing I could not understand is, how to custom compile a
> kazaa-blocking kernel?

Sorry, what I was referring to was using Patch-O-Matic to add newer=20
features to netfilter, like the string match and Arnt Karlsen's favored=20
TARPIT target, and then recompiling the kernel to incorporate the=20
patches.  It's not really a 'kazaa-blocking' kernel, just in this case=20
one compiled especially because of the desire to block kazaa.

j

> > But newer implementations apparently support port-hopping, so it
> > seems that the only confirmed way to stop it with iptables is with
> > the STRING match from patch-o-matic, and block anything with the
> > string "kazaa" (don't recall case requirements) in it.  Compiling a
> > custom kazaa-blocking kernel may be more than you want to do,
> > though.
>
> =09Thanks a lot.
>
> with regards,
> Nimit.


