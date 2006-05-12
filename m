From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: RE: [ANNOUNCE] ipset-2.2.9 released
Date: Fri, 12 May 2006 10:25:29 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0605121021570.10772@blackhole.kfki.hu>
References: <BAY106-F22C1E316E8ECC9F51B39CCD6AF0@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY106-F22C1E316E8ECC9F51B39CCD6AF0@phx.gbl>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Kraslavsky <andykras@hotmail.com>
Cc: netfilter@lists.netfilter.org

On Thu, 11 May 2006, Andrew Kraslavsky wrote:

> >- 'limit' module parameter added to the kernel modules of the
> >   iphash, ipporthash, nethash and iptree type of sets so that
> >   the maximal number of elements can now be limited
>
> By amazing coincidence, I was just looking into adding a "--limit" argument
> to ipset iphash, nethash, ipporthash, and iptree sets when I saw this
> announcement.
[...]
> I would be very glad if my changes (or corrected/improved version thereof)
> were folded into the next ipset release.  Where should I post my changes
> (e.g. this list? the developers' list or...) and in what format (all of the
> affected source files as attachments or in a tar file or as patch files
> or...)?

Post your patch as an unified diff in the netfilter-devel mailing list,
that's it!

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

