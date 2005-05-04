From: George Alexandru Dragoi <waruiinu@gmail.com>
Subject: Re: matching the first packet of a connection
Date: Wed, 4 May 2005 20:43:34 +0300
Message-ID: <3063e50505041043787ebf03@mail.gmail.com>
References: <1115220105.26791.25.camel@localhost.localdomain>
Reply-To: George Alexandru Dragoi <waruiinu@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1115220105.26791.25.camel@localhost.localdomain>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: Eric Leblond <eric@inl.fr>
Cc: netfilter@lists.netfilter.org

If you have nothing against ip_conntrack, use -m state --state NEW and
accepts those connections


On 5/4/05, Eric Leblond <eric@inl.fr> wrote:
> Hi,
>=20
> I'm trying to match the first packet of a connection : for a TCP
> connection I want to match the first SYN packet received by the firewall
> and ignore the possible reemission, in fact I want to accept them.
>=20
> Is this possible ?
>=20
> I've try to use the conntrack module but I was not successful.
>=20
> BR,
> --
> Eric Leblond <eric@inl.fr>
>=20
>=20


--=20
Bla bla

