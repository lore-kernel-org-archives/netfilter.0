From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: [patch 2/16] list_head debugging
Date: Fri, 14 Jun 2002 14:07:24 +0200 (CEST)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.33.0206141404350.17402-100000@blackhole.kfki.hu>
References: <3D00FBDA.7020106@zip.com.au>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <3D00FBDA.7020106@zip.com.au>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@zip.com.au>
Cc: Bernd Jendrissek <berndj@prism.co.za>, linux-kernel@vger.kernel.org, netfilter@lists.samba.org

Hi,

On Fri, 7 Jun 2002, Andrew Morton wrote:

> Bernd Jendrissek wrote:
> > [sorry for the nonexistent In-Reply-To/whatever headers - cutting&pasting]
> >
> > Andrew Morton wrote:
> >
> >>  A common and very subtle bug is to use list_heads which aren't on any
> >>  lists. It causes kernel memory corruption which is observed long after
> >>  the offending code has executed.
> >>
> >>  The patch nulls out the dangling pointers so we get a nice oops at the
> >>  site of the buggy code.
> >
> >
> > I'm not current with the kernel tree, but will one such oops occur in
> > netfilter?  See
> >
> > http://lists.samba.org/pipermail/netfilter-announce/2002/000010.html
> >
> > Hmm, no.  A DoS maybe?
> >
>
> An oops, actually.  This code:
>
>
>          /* Remove from both hash lists: must not NULL out next ptrs,
>             otherwise we'll look unconfirmed.  Fortunately, LIST_DELETE
>             doesn't do this. --RR */
>          LIST_DELETE(&ip_conntrack_hash
>                      [hash_conntrack(&ct->tuplehash[IP_CT_DIR_ORIGINAL].tuple)],
>                      &ct->tuplehash[IP_CT_DIR_ORIGINAL]);
>          LIST_DELETE(&ip_conntrack_hash
>                      [hash_conntrack(&ct->tuplehash[IP_CT_DIR_REPLY].tuple)],
>                      &ct->tuplehash[IP_CT_DIR_REPLY]);
>
>
> I think what is needed is:
>
> --- 2.5.20/net/ipv4/netfilter/ip_conntrack_core.c~ipconntrack-lists	Fri Jun  7 11:26:38 2002
> +++ 2.5.20-akpm/net/ipv4/netfilter/ip_conntrack_core.c	Fri Jun  7 11:26:42 2002
> @@ -210,17 +210,22 @@ static void destroy_expectations(struct
>   static void
>   clean_from_lists(struct ip_conntrack *ct)
>   {
> +
> struct list_head *l1;
> +
> struct list_head *l2;
> +
>   	DEBUGP("clean_from_lists(%p)\n", ct);
>   	MUST_BE_WRITE_LOCKED(&ip_conntrack_lock);
> -
> /* Remove from both hash lists: must not NULL out next ptrs,
> -           otherwise we'll look unconfirmed.  Fortunately, LIST_DELETE
> -           doesn't do this. --RR */
> +
> +
> l1 = &ct->tuplehash[IP_CT_DIR_ORIGINAL];
> +
> l2 = &ct->tuplehash[IP_CT_DIR_REPLY];
> +
>   	LIST_DELETE(&ip_conntrack_hash
>   		    [hash_conntrack(&ct->tuplehash[IP_CT_DIR_ORIGINAL].tuple)],
> -
> 	    &ct->tuplehash[IP_CT_DIR_ORIGINAL]);
> -
> LIST_DELETE(&ip_conntrack_hash
> -
> 	    [hash_conntrack(&ct->tuplehash[IP_CT_DIR_REPLY].tuple)],
> -
> 	    &ct->tuplehash[IP_CT_DIR_REPLY]);
> +
> 	    l1);
> +
> if (l1 != l2)
> +
> 	LIST_DELETE(&ip_conntrack_hash
> +
> 		    [hash_conntrack(&ct->tuplehash[IP_CT_DIR_REPLY].tuple)],
> +
> 		    l2);
>
>   	/* Destroy all un-established, pending expectations */
>   	destroy_expectations(ct);
>

The two codes actually identical, because the condition is always true.
There is no connection where the ORIGINAL and REPLY tuples would be equal.

Regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
WWW-Home: http://www.kfki.hu/~kadlec
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


