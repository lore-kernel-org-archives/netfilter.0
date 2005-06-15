From: "Rakotomandimby (R12y) Mihamina"
	<mihamina.rakotomandimby@etu.univ-orleans.fr>
Subject: IPv6 default behaviour
Date: Wed, 15 Jun 2005 20:40:36 +0200
Message-ID: <pan.2005.06.15.18.40.36.356305@etu.univ-orleans.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hi,

I have a small server written in Java and it's listening on the 18000 port.

My firewall rules are all for IPv4

There is nothing for IPv6

My firewall drops all by default, then I allowed INPUT for UDP and TCP for
18000 port. All with iptables.


Will IPv6 be dropped? How and what should I do to have port 18000 opened
for IPv6, TCP and UDP?

--=20
Miroir de logiciels libres        http://www.etud-orleans.fr
D=E9veloppement de logiciels libres http://aspo.rktmb.org/activites/develop=
pement
Infogerance de serveur d=E9di=E9      http://aspo.rktmb.org/activites/infog=
erance
(En louant les services de l'ASPO vous luttez contre la fracture numerique)



