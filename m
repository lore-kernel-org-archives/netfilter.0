From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: simple question on connection tracking and protocols
Date: 27 Apr 2003 11:19:29 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1051435168.1122.5.camel@elendil.intranet.cartel-securite.net>
References: <Pine.LNX.4.44.0304261857280.4005-100000@dell>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0304261857280.4005-100000@dell>
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
Cc: iptables mailing list <netfilter@lists.netfilter.org>

Le dim 27/04/2003 =E0 00:59, Robert P. J. Day a =E9crit :
>   i'm sure this is a simple one to answer.  aside from the more
> complex protocols like FTP that require special handling, once i
> configure iptables to accept RELATED,ESTABLISHED, will this cover
> all of TCP, UDP and ICMP?  that is, if i'm not protocol-specific?

Yes it will cover _all_ protocols that will be handled by conntrack.
That can be of cours TCP, UDP and ICMP, but can also be others, such as
GRE as an example.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

