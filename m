From: Piotr Chytla <pch@packetconsulting.pl>
Subject: Re: nf-hipac for current kernels?
Date: Fri, 9 Mar 2007 00:01:13 +0100
Message-ID: <20070308230113.GC24342@packetconsulting.pl>
References: <200703081538.00702.ml@hboeck.de> <45F020FE.8020704@zoomnet.ro>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <45F020FE.8020704@zoomnet.ro>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Alexandru Dragoi <alex@zoomnet.ro>
Cc: netfilter@lists.netfilter.org

On Thu, Mar 08, 2007 at 04:43:10PM +0200, Alexandru Dragoi wrote:
> Hanno B=F6ck wrote:
> >Hi,
> >
> >wanted to ask if there's information about the status of nf-hipac. I=20
> >couldn't find any patches to up-to-date kernels.
> >
> >Is there any development happening or is the project considered dead? Ar=
e=20
> >there plans to merge stuff with iptables/replace in-kernel stuff with it?
> >
> > =20
> You can find one for 2.6.17 kernels on google, i think posted in this=20
> list. But i don't really recomend it. On a dual P3 machine, i=20
> experimented random and then almoust total packet drop, and i couldn't=20
> remove the module from kernel, so i rebooted, and never used it again.=20
> That happened a few months ago on a 2.6.17 kernel (with imq).
>
Huh , I'm pushing about 150Mbit/s on single 3GHz Xeon, and about
100Mbit/s on dual 2Ghz Xeon machine , both have nf-hipac and imq.=20
In my setups I'm not using nf-hipac for some complex firewall, only for=20
simple blacklisting spybots and other network crap.=20

/pch

--=20
Dyslexia bug unpatched since 1977 ...
exploit has been leaked to the underground.

