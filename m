From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Why does this connection stop being tracked?
Date: Wed, 15 Jun 2005 13:47:32 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0506151342350.27306@blackhole.kfki.hu>
References: <20050614161105.GN750@strugglers.net>
	<Pine.LNX.4.58.0506151312470.27260@blackhole.kfki.hu>
	<20050615113045.GF754@strugglers.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050615113045.GF754@strugglers.net>
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
To: Andy Smith <andy@strugglers.net>
Cc: netfilter@lists.netfilter.org

On Wed, 15 Jun 2005, Andy Smith wrote:

> > You have two choices: either disable TCP SACK support on all your
> > real/virtual machines behind your firewall, or upgrade the kernel on the
> > firewall.
>
> Do you have any instructions or a pointer to documentation onhow to
> temporarily disable SACK?  If it was a /proc setting that would be
> ideal; I don't really want to have to recompile kernels though.

echo 0 > /proc/sys/net/ipv4/tcp_sack

> > There is a SACK related bug in netfilter connection tracking in
> > 2.6.11 (and below).  According to the dumped traffic your connections
> > suffer from packet losses,
>
> Interesting; this may explain why I only notice this when I'm coming
> from 82.44.131.131 - its network is kind of sucky. :)
>
> >        SACK kicks in and conntrack screws up tracking
> > the given TCP connections. (Sorry, I can't recall at which rc release was
> > the fix submitted in.)
>
> How sure are you that this is the problem I am seeing?

The dump file shows that the communicating parties advertise sack support
and later on in the traffic they do use sack options. And because living
connections hangs up, that indicates the sack bug. You can simply check it
by disabling sack.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

