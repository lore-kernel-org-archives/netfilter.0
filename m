From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: trying to document/understand the iptables kernel config
	options
Date: 08 Apr 2003 13:23:12 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1049800992.11712.62.camel@elendil.intranet.cartel-securite.net>
References: <Pine.LNX.4.44.0304080639320.25860-100000@dell>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0304080639320.25860-100000@dell>
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
Cc: Joel Newkirk <netfilter@newkirk.us>, iptables mailing list <netfilter@lists.netfilter.org>

Le mar 08/04/2003 =E0 12:43, Robert P. J. Day a =E9crit :
> > Yes.  If you select "IP tables support" but no further options within=
=20
> > that set, you can still perform filtering.  For example, you could st=
ill=20
> > ACCEPT or DROP based on source or destination IP.
> i don't think so, tim.  if you look down that list of options,
> past all the "match" options, you'll see "Packet filtering",
> whose help screen claims that it defines the "filter" table.

You're right.
This option defines if you want (or not) filter table.

> without that filter table, i would have assumed that you can't
> do *any* filtering of any kind, since the filter table wouldn't
> even exist.

You should not be able to do this. In practice, you still can ACCEPT or
DROP in nat and mangle table, but they're not intended to, and this
should not be done.

> i get the feeling that, if you select only "IP tables support"
> and nothing else, you might be able to set up ACCEPT or DROP
> policies on the three chains, and that's about it.

IP tables support is the support of tables (nat, mangle and filter at
the time) for IPv4 protocole. Under this option, you can see all matches
that are available for all the tables, then the 3 tables and their
specific targets, and at the end of section, targets that are usable
within all tables (well, it should be the case, but it's not, as TTL
target is only valid for mangle table, as an exemple). Without table
support, you can't do anything as nothing will be attached to
Netfilter's hooks, except conntack is selected.

This how I understand things, may be wrong...

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
Consultant en s=E9curit=E9 des syst=E8mes et r=E9seaux  - Cartel S=E9curi=
t=E9
T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

