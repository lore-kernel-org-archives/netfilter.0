From: RedNuX@gmx.at
Subject: ROUTING A IP and EREASE the URL EXTENSION ?
Date: Sat, 13 Mar 2004 11:35:50 +0100 (MET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <23362.1079174150@www13.gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org

On my network a Client has problems with an URL which has burned in, in his
system. Even if I remove the entries from registry, the URL is there with a
restart again.

 I have diverted the inquiries the hate IP on google.de.

$IPTABLES -t nat -A PREROUTING -p tcp -d $HATEIP --dport 80 -i eth1 -j DNAT
--to $GOOGLE

The Problem is the URL-Extension... ( $HATEIP/index.php?v=3D4&aff=3D2130 ) =
...

On my Client, google says:

Not Found
The requested URL /index.php?v=3D4&aff=3D2130 was not found on this server.


Is it possible to be deleted this extension or gives it another possibility
the inquiry on " $HATEIP / index.php? V=3D4*aff=3D2130 " on "google.de" far=
ther
supply?

sorry for my bad English 8/

--=20
+++ NEU bei GMX und erstmalig in Deutschland: T=DCV-gepr=FCfter Virenschutz=
 +++
100% Virenerkennung nach Wildlist. Infos: http://www.gmx.net/virenschutz


