From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: traceroute
Date: Thu, 1 Jul 2004 12:27:39 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0407011209200.29404-100000@blackhole.kfki.hu>
References: <200407011030.28788.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407011030.28788.Antony@Soft-Solutions.co.uk>
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
To: netfilter <netfilter@lists.netfilter.org>

On Thu, 1 Jul 2004, Antony Stone wrote:

> > > No, that's true for Windows systems.   Unix machines (Linux included)
> > > use high-port numbered UDP packets.
> > >
> > Actually UDP based traceroute uses ports in the range 33434-33523.
>
> That's one of things I like about this mailing list - I can find people who
> are even more precise and pedantic than I am :)

It's from Building Internet Firewalls by Chapman & Zwicky :-).

We have been using the corresponding rule for ages. It failed for HPUX
only because we used unclean matching as well and the old one did not know
about the fact that UDP checksumming is not mandatory. [unclean match has
been fixed since then, of course.]

Can't be repeated enough time, your tireless valuable help on the list is
highly appreciated! (And your sigs are simply great! :-)

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


