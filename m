From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: REJECTing ident requests (was: FTP problems)
Date: 28 Feb 2003 16:15:36 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1046445336.14100.33.camel@elendil.intranet.cartel-securite.net>
References: <Pine.LNX.4.33.0302281404260.9684-100000@lw2.cc-computer.de>
	 <1046440457.14100.23.camel@elendil.intranet.cartel-securite.net>
	 <Pine.LNX.4.51.0302281610340.4223@dns.toxicfilms.tv>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.51.0302281610340.4223@dns.toxicfilms.tv>
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
To: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Cc: Martin =?ISO-8859-1?Q?K=F6hling?= <mk@lw1.cc-computer.de>, Netfilter <netfilter@lists.netfilter.org>

Le ven 28/02/2003 =E0 16:13, Maciej Soltysiak a =E9crit :
> > Maybe because RFC says that a SYN on a closed port must be replied wi=
th
> > RST, and not ICMP port unreachable...
> It is true but by sending ICMP port unreach. you inform the second
> party's tcp stack that the port is unreachable, which should cause the
> stack to inform the application that there is a problem. Maybe the
> application (the mail daemon) was not handling this type of error.

It is probably the case.

> Properly written code should react for TCP RSTs and all other ICMP erro=
r
> messages, and other error conditions.

True.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
Consultant en s=E9curit=E9 des syst=E8mes et r=E9seaux  - Cartel S=E9curi=
t=E9
T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

