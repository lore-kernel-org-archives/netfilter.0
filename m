From: "Dick St.Peters" <stpeters@NetHeaven.com>
Subject: Re: pop3 and dns
Date: Wed, 12 May 2004 17:21:46 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <16546.38250.722288.473286@saint.heaven.net>
References: <F22386C3FEB012449238672E38ED61E706C2D5@overlord.overturemedia.com>
	<162701c4375d$1f28a4a0$49caa8c0@caris.priv>
	<20040512042251.GB24345@samad.com.au>
	<1084346112.24001.35.camel@raylinux.internal>
	<40A2777E.4010008@netgods.us>
	<1084390445.1791.30.camel@anduril.intranet.cartel-securite.net>
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1084390445.1791.30.camel@anduril.intranet.cartel-securite.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>

Cedric Blancher writes:
> Le mer 12/05/2004 =E0 21:14, Dana Bourgeois a =E9crit :
> > >>tcp for zone transfers
> > > and large answers ...
> > ...where a 'large answer' is usually taken to be a UDP packet of more=20
> > than 512 bytes.
>=20
> I don't quite understand the meaning of this answer... So, I clarify.
>=20
> When a DNS server has to reply on UDP with more than 512 bytes of data,
> it sends back an answer with TC bit (truncated) set to let client know
> answer is not complete and have him send it again using TCP.

To add my own bit of clarification, it's not large answers that need
TCP open, it's requests that have large answers.  If the client gets a
UDP answer with the TC bit set, it should send the query again using a
TCP connection ... and the server must listen for such connections
... and its firewall must let them through.

--
Dick St.Peters, stpeters@NetHeaven.com=20

