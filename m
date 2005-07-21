From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: is this the zillionth mail asking for this detail?
Date: Thu, 21 Jul 2005 16:02:03 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0507211557070.27131@blackhole.kfki.hu>
References: <65aa6af905072021501603cfd5@mail.gmail.com>
	<42DF85AE.1000400@gmx.co.uk>
	<Pine.LNX.4.58.0507211511240.27131@blackhole.kfki.hu>
	<Pine.LNX.4.61.0507211521120.17188@yvahk01.tjqt.qr>
	<Pine.LNX.4.58.0507211523100.27131@blackhole.kfki.hu>
	<42DFA8D1.207@mnemon.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42DFA8D1.207@mnemon.de>
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
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Cc: netfilter@lists.netfilter.org

On Thu, 21 Jul 2005, [ISO-8859-1] J=F6rg Harmuth wrote:

> >>>local process -> routing -> OUTPUT chain -> routing -> POSTROUTING cha=
in
> >>>
> >>>No problem with policy routing for the locally generated traffic.
> >>
> >>This sounds like a total overhead calculating the route twice.
> >
> > The first one is required to fill out output device for the packet. The
> > second one is there to give chance to play with routing in OUTPUT.
>
> Still only 95% clear to me. You say, the second routing decision takes
> place right after filter/OUTPUT ? And if so, do packets after
> filter/FORWARD have this second routing decision too ?

No, that's the forward path.

But for the record: for locally generated packets the routing engine is
called after OUTPUT only if source address, destination address, nfmark
field or tos of the skbuff changed. So it's not called blindly for every
packet.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

