From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: how to filter applications with iptables
Date: 26 Jun 2003 09:19:58 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1056611998.624.19.camel@elendil.intranet.cartel-securite.net>
References: <20030626070125.065CEC11A@postfix4-2.free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030626070125.065CEC11A@postfix4-2.free.fr>
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
To: Liber ChrXtien <liber.chretien@free.fr>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Le jeu 26/06/2003 =E0 10:03, Liber ChrXtien a =E9crit :
> I've a LAN at home with mdk as server and win and mdk on the clients
> My question is : is there a way to block certain applications, such as =
specific=20
> softwares (office suite for example), to access internet with iptables?
>  How to identify the packets emitted from such applications and block t=
hem ?

If you've planed to do this remotly, I mean on a dedicated firewall,
such as your network gateway, you can't, as Netfilter is a packet
filter. Thus, you can say "allow TCP/80 as destination, but cannot force
HTTP usage through this port. To filter application protocols, you'll
have to use an application proxy (e.g. HTTP proxy). Eventhough,
distinguishing IE on Win, Word on Win or Mozilla on Win or Linux will be
difficult if they all use HTTP. You can only rely on related HTTP fields
that can be changed/forged.

If you've planed to do this locally, I mean using Netfilter on the
GNU/Linux clients, then you can use owner match which provides a command
line match (-m owner --owner-cmd $CMD). Although it is not as strict as
expected (you can use a well named symlink to gain access through an
authorized command), it allows some kind of valuable "personnal firewall
like" filtering.

For Win clients, use a personnal firewall, such as Kerio or Outpost. But
this part is off-topic ;)

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

