From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Redirect DHCP requests to DMZ?
Date: 24 Apr 2003 11:00:08 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1051174808.3356.9.camel@elendil.intranet.cartel-securite.net>
References: <3EA66634.2020508@blinkenlichten.de>
	 <1051100353.12295.96.camel@elendil.intranet.cartel-securite.net>
	 <3EA6C622.3020103@blinkenlichten.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3EA6C622.3020103@blinkenlichten.de>
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
To: Carsten Maass <cm@blinkenlichten.de>
Cc: netfilter@lists.netfilter.org

Le mer 23/04/2003 =E0 18:58, Carsten Maass a =E9crit :
> which discards them, why am I unable to apply a rule which redirects=20
> them to another subnets interface? Shouldn't the DNAT thingy take care=20
> of the new destination address?

Because after DNAT, it won't be broadcast anymore.

> Yes, a DHCP relay would be a solution, but I opted against it. I am=20
> trying to keep the router/firewall as (c)lean as possible: just routing=
,=20
> firewall and ssh stuff.

I understand this point, and, as I said below, this would be a bad idea.

> Right you are. But our setup was a compromise between money and=20
> security: Another server is just not affordable at the moment.

You can just use an existing server to provide this service as it is
very light, even consider having it run on your firewall's internal
interface only waiting for a dedicated box.

> But you make me considering if it wouldn't be better to convince our=20
> Windows admin to let go his DHCP idea. The administrative overhead of a=
=20
> static client setup might be a better price to pay, pondering the=20
> security impact of the current setup.

DHCP is a good thing, to save time. But I don't like the idea of dynamic
IPs. So I configure my DHCPd to give addresses on MAC address, so I have
static IPs, but DHCP distributed.

> On the other hand I am also eager=20
> to find out, why this doesn't work out as expected.

Just because DHCP cannot be NATed.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

