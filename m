From: Pekka Savola <pekkas@netcore.fi>
Subject: Re: RFE: ability to show the current state tables?
Date: Mon, 4 Nov 2002 12:28:20 +0200 (EET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0211041227230.4405-100000@netcore.fi>
References: <1036404953.8845.29.camel@elendil>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1036404953.8845.29.camel@elendil>
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
Cc: netfilter@lists.netfilter.org

On 4 Nov 2002, Cedric Blancher wrote:
> Le dim 03/11/2002 =E0 11:37, Pekka Savola a =E9crit :
> > I've been looking for a way to check the current netfilter '-m state'=
=20
> > tables.  This should be invaluable in debugging.  I couldn't find any=
 way=20
> > to do it.  I think this could be important.
>=20
> See /proc/net/ip_conntrack file which contains all informations about
> current states.
>=20
> You can also have a look at iptstate :
>=20
> 	http://home.earthlink.net/~jaymzh666/iptstate/
>=20
> It is a top like curses based tool which allows you to observe state
> table.

Thanks.  These seem to answer my questions precisely :-)

--=20
Pekka Savola                 "Tell me of difficulties surmounted,
Netcore Oy                   not those you stumble over and fall"
Systems. Networks. Security.  -- Robert Jordan: A Crown of Swords


