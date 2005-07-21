From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: is this the zillionth mail asking for this detail?
Date: Thu, 21 Jul 2005 15:15:28 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0507211511240.27131@blackhole.kfki.hu>
References: <65aa6af905072021501603cfd5@mail.gmail.com>
	<42DF85AE.1000400@gmx.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42DF85AE.1000400@gmx.co.uk>
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
To: netfilter <netfilter@lists.netfilter.org>

On Thu, 21 Jul 2005, /dev/rob0 wrote:

> Edmundo Carmona wrote:
> > I don't think I'm that smart to be the first to need this feature...
> > so I hope I'm the ONE vote that flips the balance to convince
> > netfilter developers that this is indeed <i>good and necessary</i>.
>
> I am not sure we have developers posting here regularly. I've seen
> Harald Welte, but not often. I just looked and see that Jozsef
> Kadlecsik, who does post here, is on the Core Team.

Just as time permits, alas...

> > Maybe a new chain could be used to do some PREROUTING actions (like
> > marking) before the routing decision is made for output traffic.
>
> Is there any reason you can't use mangle/PREROUTING or nat/PREROUTING
> for what you need? What would filter/PREROUTING provide that those do
> not? In fact, although I don't do anything with mangle, I thought
> marking was in mangle territory.

The original post was about locally generated packets and OUTPUT chain.

There's no need for extra hooks, because the routing engine is called
after the OUTPUT chain as well:

local process -> routing -> OUTPUT chain -> routing -> POSTROUTING chain

No problem with policy routing for the locally generated traffic.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

