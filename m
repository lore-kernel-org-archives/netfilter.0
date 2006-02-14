From: Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik@iki.fi>
Subject: Re: Reading /proc/net/ip_conntrack still slow / causing packet loss?
Date: Tue, 14 Feb 2006 22:05:27 +0200
Message-ID: <20060214200526.GO16512@edu.joroinen.fi>
References: <20060214173923.GN16512@edu.joroinen.fi> <200602142051.05801@krak>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200602142051.05801@krak>
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
To: KOVACS Krisztian <hidden@sch.bme.hu>
Cc: netfilter@lists.netfilter.org

On Tue, Feb 14, 2006 at 08:51:04PM +0100, KOVACS Krisztian wrote:
>=20
>   Hi,
>=20
> On Tuesday 14 February 2006 18:39, Pasi K=E4rkk=E4inen wrote:
> > "<Gandalf> cap_: the most extreme experience I have is reading
> > /proc/net/ip_conntrack on a fairly busy router... that really slows
> > wthings down and packets get dropped because of the slowdown"
> >
> > "<Gandalf> and I had an identd daemon wich forwarding support that re=
ad
> > /p/n/ip_conntrack for each incoming ident request... 200ms forwarding
> > delays and lots of drops each time an ident request came in :)"
> >
> > Is that information still valid for the current 2.6 kernels? How abou=
t
> > for 2.4 ?
>=20
>   Yes, it's still valid (on both versions). However, on recent 2.6 kern=
els=20
> you can do all kinds of funny things through netlink. An example of wha=
t=20
> can be done through that interface is the 'conntrack' tool:
>=20
>   http://netfilter.org/projects/conntrack/index.html
>=20
>   For the API:
>=20
>   http://netfilter.org/projects/libnetfilter_conntrack/index.html
>=20
>   Please note that both of these is still work in progress, but they're=
=20
> definitely worth a try.
>=20

OK, Thanks for the info!

I suppose 'conntrack' tool does not block the whole netfilter like readin=
g
/proc/net/ip_conntrack ..=20

-- Pasi=20

