From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: iptables and 802.1q tagging
Date: 27 May 2003 19:38:29 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1054057108.3577.6.camel@elendil.intranet.cartel-securite.net>
References: <661F9268BBA8CB4EB92CC12B8C42F06901F63B@pluto.rovingplanet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <661F9268BBA8CB4EB92CC12B8C42F06901F63B@pluto.rovingplanet.com>
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
To: Paul Albert <palbert@rovingplanet.com>
Cc: netfilter@lists.netfilter.org

Le mar 27/05/2003 =E0 19:22, Paul Albert a =E9crit :
> I googled to determine whether an iptables bridge that is filtering on
> IP addresses would be smart enough to pick up on the fact that the
> packets have 802.1Q tags or not.  No definitive answer was found.  My
> question is just that - does iptables notice that the tag is present or
> will it not know what to do with such a packet?

iptables configures IP layer (OSI 3) and dot1q is layer 2 concept. Thus,
iptables cannot match dot1q extensions.

Nevertheless, you can use ebtables that provides layer 2 filtering on
birdged interfaces and has dot1q matching (vlan match). Using ebtables
you can filter dot1q frames from classicla ones, even match VLAN id,
prio and encapsulated proto.

See http://ebtables.sourceforge.net/

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
Consultant en s=E9curit=E9 des syst=E8mes et r=E9seaux - Cartel S=E9curit=
=E9
T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

