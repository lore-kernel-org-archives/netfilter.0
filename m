From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: are the four packet "states" all-encompassing?
Date: 24 Oct 2002 15:57:45 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1035467865.16954.27.camel@elendil>
References: <Pine.LNX.4.44.0210240928360.32101-100000@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0210240928360.32101-100000@localhost.localdomain>
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

Le jeu 24/10/2002 =E0 15:29, Robert P. J. Day a =E9crit :
> On 24 Oct 2002, Cedric Blancher wrote:
> > One very packet can have one state, and one.=20
> so every syntactically correct ("well-formed"??) packet is one
> of NEW, ESTABLISHED or RELATED, while all others are just
> INVALID?  ok, i can accept that, thanks.

Yes and no, it is a bit more complicated...

INVALID applies to all packets for which ip_conntrack is not able to
give a state. As common examples :

	. TCP packets that does not complies to RFC 793
	. ICMP errors non related to existing flows
	. lack of memory or conntrack table full

So, well formed packets can sometimes fall into INVALID state, but it is
safe to DROP them.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
Consultant en s=E9curit=E9 des syst=E8mes et r=E9seaux  - Cartel S=E9curi=
t=E9
T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

