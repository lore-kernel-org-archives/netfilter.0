From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Overriding REDIRECT for certain hosts (SQUID)
Date: 23 Nov 2002 17:05:58 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1038067558.8071.12.camel@elendil.intranet.cartel-securite.net>
References: <20021123052657.30417.33449.Mailman@kashyyyk>
	 <1038066385.4859.12.camel@rbhome>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1038066385.4859.12.camel@rbhome>
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
To: Ryan Beisner <ryanb@thedataarc.com>
Cc: netfilter@lists.netfilter.org

Le sam 23/11/2002 =E0 16:46, Ryan Beisner a =E9crit :
> OK, so how would one turn this rule around into a couple of rules that
> redirect port 80 to 3128, *unless* it's to/from "any-host.xyzzz.com" or
> "any-host.anotherdomain.com"  etc ?
[Snip]
> I realize I could create a rule based on their IP range, but I want the
> rule to be based on the domain name -- I haven't yet seen that in
> action.  ;}

For now, you just can't, because Netfilter is a _packet_ filter that
juste doesn't know anything about DNS to resolve source or destination
IP.

But, maybe it would be interesting to have a match that could reverse
source or destination IP... But it is still not the case, and could lead
to strange results and particulary flaws if someone could tamper your
DNS system informations.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
Consultant en s=E9curit=E9 des syst=E8mes et r=E9seaux  - Cartel S=E9curi=
t=E9
T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

