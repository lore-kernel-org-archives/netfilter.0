From: Oskar Andreasson <blueflux@koffein.net>
Subject: Re: State of Stateful Inspection
Date: Fri, 25 Oct 2002 12:44:09 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210251241470.1817-100000@laptop1.agatha>
References: <1035534115.9045.9.camel@elendil>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1035534115.9045.9.camel@elendil>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: Jason Dixon <jasondixon@myrealbox.com>, netfilter@lists.netfilter.org

On 25 Oct 2002, Cedric Blancher wrote:

> Le jeu 24/10/2002 =E0 22:06, Jason Dixon a =E9crit :
> > I'm about to become a migrated iptables user, but I had a couple of
> > questions about the stateful abilities of netfilter.  First, it appea=
rs
> > that true sequence number analysis is available via this "patch-o-mat=
ic"
> > thingy.  At what point does this feature become part of the default
> > release?
>=20
> Well, you should ask netfilter-devel mailing list ;)
> But, as the patch is still in patch-o-matic extra section, I do not
> think it will be submitted to kernel soon.
>=20

According to the last mails I read on the list on this topic, the=20
tcp-window-tracking.patch is waiting for someone to take a look at=20
problems with very slow mail deliveries that arose because of the patch.=20
After that, Josefsson(i think?) sent out a new version of the patch that=20
should hopefully fix the problem.... that's the last I heard.=20

If the new patch fixes the problem and everything seems to work it should=
=20
go into mainstream kernel rather soon actually.


----
Oskar Andreasson
http://www.frozentux.net
http://iptables-tutorial.frozentux.net
http://ipsysctl-tutorial.frozentux.net
mailto:blueflux@koffein.net


