From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipv6 and state matching
Date: Wed, 26 Mar 2003 00:33:38 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0303260014340.1739-100000@blackhole.kfki.hu>
References: <1048607597.1052.9.camel@localhost.localdomain>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1048607597.1052.9.camel@localhost.localdomain>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Trever L. Adams" <tadams-lists@myrealbox.com>
Cc: netfilter@lists.netfilter.org

On 25 Mar 2003, Trever L. Adams wrote:

> > Last year I worked on the prototype of an unified conntrack code, but it
> > was never released. Unfortunately just conntrack doesn't seem to be enough
> > - one is tempted to implement NAPT etc. as well.
>
> What is NAPT? Do you mean NAT?  Why was yours never released?

Sorry, I meant NAT-PT.

I did not release the code because it was never finished. That was just a
prototype, alone for conntrack.

> > > Are there plans on doing state support?  Is it all that much more
> > > difficult?
> >
> > A straight porting is not so difficult, but that direction cannot be
> > followed because it would result in a severe code-duplication.
> > Unification takes a lot of time.
>
> Hmm, what is the desired route right now?  Are they wanting to just
> share code base (lots of ifdefs all over) or are they wanting to
> actually have the two code bases use the same binary object?

ifdefs would be simply unmanageable. Kisza tried to use macros, but
the required macro levels were too deep.

Same binary objects are preferred...

> If one object is desired, can you just use ipv6 structs (whatever ones
> are involved) in all cases, or should there be a flag and use pointers
> so that each connection uses the appropriate structres?

...but without a blind union of the data structures: it'd mean a horrid
waste of the memory.

> I am willing to give this a go, I think.  However, this would be my
> first "major" work in the kernel (I have only helped a bit with cipe
> before).  I am not sure how great it would be.

It's a big challenge.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


