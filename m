From: Cyber Dog <cyberdog3k@gmail.com>
Subject: Re: Problem with policy match extension...
Date: Mon, 31 Oct 2005 14:01:52 -0500
Message-ID: <cbb8f04c0510311101k6fbcbf20gb9556b275c354b0b@mail.gmail.com>
References: <cbb8f04c0510282116y58f7001dg17eccab80815a176@mail.gmail.com>
	<200510310741.51799.teastep@shorewall.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200510310741.51799.teastep@shorewall.net>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On 10/31/05, Tom Eastep <teastep@shorewall.net> wrote:
> On Friday 28 October 2005 21:16, Cyber Dog wrote:
>
> >
> > I can't get the policy extension to compile into iptables.  My
> > iptables source has libipt_policy.c and libipt_policy.man in the
> > extensions directory.  I do a make clean && make, but I see no
> > reference to the policy extension being compiled, and there are no new
> > files generated.  Furthermore doing iptables -m policy --help produces
> > Couldn't load match `policy'.
> >
>
> Did you follow the build instructions in the iptables INSTALL file?
>
>         make KERNEL_DIR=3D<<where-you-built-your-kernel>>
>

Yes I finally got it, thank you.  Policy match is working I just need
to figure out how to get the ipsec patches to apply.  I think that
will be a project for another day. :)  Have a good one.
> -Tom
> --
> Tom Eastep    \ Nothing is foolproof to a sufficiently talented fool
> Shoreline,     \ http://shorewall.net
> Washington USA  \ teastep@shorewall.net
> PGP Public Key   \ https://lists.shorewall.net/teastep.pgp.key
>

