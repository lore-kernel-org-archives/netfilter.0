From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Stateless NAT
Date: Thu, 24 Feb 2005 20:08:40 +0100 (CET)
Message-ID: <Pine.LNX.4.58.0502242006240.5391@blackhole.kfki.hu>
References: <1109243487.9286.4.camel@jasiiitosh.nexusmgmt.com>
	<Pine.LNX.4.58.0502241738490.5273@blackhole.kfki.hu>
	<20050224165607.GA22228@zion.homelinux.com>
Mime-Version: 1.0
In-Reply-To: <20050224165607.GA22228@zion.homelinux.com>
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
To: Sven Schuster <schuster.sven@gmx.de>
Cc: "John A. Sullivan III" <jsullivan@opensourcedevel.com>, Netfilter users list <netfilter@lists.netfilter.org>

Hi,

On Thu, 24 Feb 2005, Sven Schuster wrote:

> On Thu, Feb 24, 2005 at 05:43:12PM +0100, Jozsef Kadlecsik told us:
> > You cannot do NAT without conntrack, because NAT in netfilter is built on
> > the top of conntrack. By the NOTRACK target you disable conntrack for
> > the selected packets thus disable NAT as well.
> >
> > Currently there is no way to define stateless NAT in netfilter. That is
> > the bad news. The good one is that however one could write a stateless NAT
> > target module, nothing prevents that.
>
> in 2.4 kernels there was a possibility to do "dumb NAT", i.e. NAT
> without connection tracking, which could be configured with the
> ip utility if I remember correctly. Unfortunately, this dumb NAT
> has been removed from the 2.6 kernel because it was broken (I think
> due to the ipsec/xfrm changes, again IIRC :-) )

Yes, but iproute2 works outside of the netfilter framework. The original
question was how to perform stateless that by netfilter.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

