From: Damjan <gdamjan@mail.net.mk>
Subject: Re: What is the diference between ipfw of *bsd and netfilter of
	linux?
Date: Tue, 5 Oct 2004 19:23:15 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041005172315.GA22610@legolas.on.net.mk>
References: <1096920404.658.4.camel@pretorian>
	<1096979251.668.2.camel@nostromo.bgsecm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1096979251.668.2.camel@nostromo.bgsecm.com>
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

> > im looking for the diference between ipfw and iptables.   Many people
> > say to ipfw is more secure of iptables, but they cant explain why tha=
t.
> >=20
> > How can i found some documentation to create a document to explain th=
ats
> > diferences?

> I find netfilter superior in terms of capabilities, it has
> more extensions and it's technically superior to ipfw. It
> let you do things that you can't do with ipfw. But it's
> just an opinion, xBSD supporters would surely say otherwise.
> My advice: Try both and use the one that suits you better. You
> probably can look into other matters, as the routing
> capabilities of both systems.

However I agree with you that netfilter is easier to use and has more
capabilities, I still can't beleive that netfilter (iptables actually)
doesn't have a way to identify rules uniquely (via an ID). So simple
feaure, so powerfull, and still iptables doesn't have this.

And no, linenumbers don't identify rules uniquely, they can change at
any moment.



--=20
damjan | =D0=B4=D0=B0=D0=BC=D1=98=D0=B0=D0=BD
This is my jabber ID --> damjan@bagra.net.mk <-- not my mail address!!!

