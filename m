From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: are the four packet "states" all-encompassing?
Date: 24 Oct 2002 13:58:12 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1035460692.18292.13.camel@elendil>
References: <Pine.LNX.4.44.0210240729250.31148-100000@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0210240729250.31148-100000@localhost.localdomain>
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

Le jeu 24/10/2002 =E0 13:37, Robert P. J. Day a =E9crit :
>   are the four conntrack states NEW, ESTABLISHED, RELATED and
> INVALID all-encompassing?  that is, does every single packet
> fall into one and only one of these states?

Yes.
One very packet can have one state, and one.

>   more to the point, what decides that a packet is NEW, given
> that it's possible for it to be categorized as NEW despite the
> fact that it has no SYN bit set?  (i just noticed the part
> in the docs about identifying traffic that's NEW but also
> "-p tcp ! --syn".

A NEW packet is a valid packet that can't be associated to an existing
conntrack entry.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
Consultant en s=E9curit=E9 des syst=E8mes et r=E9seaux  - Cartel S=E9curi=
t=E9
T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

