From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: REJECTing ident requests (was: FTP problems)
Date: 28 Feb 2003 14:54:18 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1046440457.14100.23.camel@elendil.intranet.cartel-securite.net>
References: <Pine.LNX.4.33.0302281404260.9684-100000@lw2.cc-computer.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.33.0302281404260.9684-100000@lw2.cc-computer.de>
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
To: Martin =?ISO-8859-1?Q?K=F6hling?= <mk@lw1.cc-computer.de>
Cc: Netfilter <netfilter@lists.netfilter.org>

Le ven 28/02/2003 =E0 14:06, Martin K=F6hling a =E9crit :
> Better use "--reject-with tcp-reset".

Sure.

> Quite some time ago, I had strange problems with some (broken?) mail
> servers refusing to accept mail when I simply REJECTed ident connects -
> apparently they didn't like the default ICMP error message
> (icmp-port-unreachable, I think)...

Maybe because RFC says that a SYN on a closed port must be replied with
RST, and not ICMP port unreachable...

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
Consultant en s=E9curit=E9 des syst=E8mes et r=E9seaux  - Cartel S=E9curi=
t=E9
T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

