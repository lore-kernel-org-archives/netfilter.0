From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: next topic:  --limit and --burst-limit
Date: 31 Oct 2002 15:04:22 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1036073063.21852.34.camel@elendil>
References: <Pine.LNX.4.44.0210310704480.30108-100000@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0210310704480.30108-100000@localhost.localdomain>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: "Robert P. J. Day" <rpjday@mindspring.com>
Cc: netfilter mailing list <netfilter@lists.netfilter.org>

Le jeu 31/10/2002 =E0 13:15, Robert P. J. Day a =E9crit :
> example:
> 	limit: 3/hour
> 	burst: 5
>=20
> what does this mean?  it means that i start with a bucket of 5 tokens
> and, every time a matching packet comes in, i can accept it by paying
> a token.  simple as that.    when i run out of tokens, i can't accept
> any more packets until i get more tokens.

That's it. It another interesting point of vue ;)
=20
> and with a limit of 3/hour, every 20 minutes, i get another token dropp=
ed
> into my bucket, up to a maximum of my burst value of 5, so that i can=20
> accept more packets.  that's it.  is it really that simple?

You begin with 8 tokens and that's you maximum number of tokens. 5 for
the burst (lower part of my bucket), and 3 that are time dependant
(upper part of the bucket).
Each time you receive a packet, you pay it with a token, so you can pay
for 8 packets within the first _hour_. Then, at the end of this first
hour, you will get three more tokens up to 8 tokens.

I can be wrong, but that's what I understood from the HOWTO, as for 1/s
limit with burst of 5, you first accept 6 packets.

Moreover, limit does not imply average value. You say 3 packets in an
hour. If you loose all your toeksn within the first second, then you
won't be able to match anything till the next hour. That's why limit
match is not really applicable for trafic shaping as an example.

Hope I've been more clear.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security expert  - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

