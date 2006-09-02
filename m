From: Elvir Kuric <omasnjak@yahoo.com>
Subject: Re: Hardly loaded machines and iptables? Your experiences?
Date: Sat, 2 Sep 2006 12:11:30 -0700 (PDT)
Message-ID: <20060902191130.15294.qmail@web56202.mail.re3.yahoo.com>
References: <1157223567.5248.5.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1157223567.5248.5.camel@localhost.localdomain>
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
To: Eric Leblond <eric@inl.fr>
Cc: netfilter@lists.netfilter.org


Thanks Eric for this article about benchmark testing.

And of course for opinion :).

PS: 1000 hits per minute for my case.

Regards



--- Eric Leblond <eric@inl.fr> wrote:

> Le samedi 02 septembre 2006 =E0 10:48 -0700, Elvir
> Kuric a =E9crit :
> > Hi all,=20
> > How that works in  environment with many
> > reqestes to servers in the LAN, I mean about 10000
> > request per day?
>=20
> Per day are you sure ? or do you mean per second ?
> ;-)
> 10000 per day is completly out of scale compare to
> heavy loaded
> firewall.
>=20
> > Have you experience about this topic.
>=20
> Netfilter benchark document by kdlec is really good:
> http://people.netfilter.org/kadlec/nftest.pdf
>=20
>=20
> > What do you think is solution based on iptables
> enough
> > secure for mission critical cases? I just need
> your
> > frank opinion.
>=20
> Clearly yes.
>=20
> Don't forget that most of the firewall vendors
> (checkpoint for example)
> uses linux as OS. And almost all UTM are
> Linux/netfilter based.
>=20
> BR,
> --=20
> Eric Leblond <eric@inl.fr>
>=20
>=20


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around=20
http://mail.yahoo.com=20

