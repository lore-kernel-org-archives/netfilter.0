From: Damjan <gdamjan@mail.net.mk>
Subject: Re: What is the diference between ipfw of *bsd and netfilter of
	linux?
Date: Fri, 22 Oct 2004 04:16:25 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041022021625.GD17225@legolas.on.net.mk>
References: <1096920404.658.4.camel@pretorian>
	<1096979251.668.2.camel@nostromo.bgsecm.com>
	<20041005172315.GA22610@legolas.on.net.mk>
	<1097000655.4415.4.camel@wolfpack.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1097000655.4415.4.camel@wolfpack.ljm.dom>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="utf-8"
To: netfilter@lists.netfilter.org

> > However I agree with you that netfilter is easier to use and has more
> > capabilities, I still can't beleive that netfilter (iptables actually=
)
> > doesn't have a way to identify rules uniquely (via an ID). So simple
> > feaure, so powerfull, and still iptables doesn't have this.
> >=20
> > And no, linenumbers don't identify rules uniquely, they can change at
> > any moment.
>=20
> check out the comment patch from POM.

Ohh, and its in kernel-2.6.9 by default... I'm happy again.


--=20
damjan | =D0=B4=D0=B0=D0=BC=D1=98=D0=B0=D0=BD
This is my jabber ID --> damjan@bagra.net.mk <-- not my mail address!!!

