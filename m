From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: IP alias and NAT
Date: 27 Jan 2003 14:08:36 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1043672915.15779.16.camel@elendil.intranet.cartel-securite.net>
References: <001e01c2c5f8$bc5d7d40$0bc8c80a@dolphin>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001e01c2c5f8$bc5d7d40$0bc8c80a@dolphin>
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
To: Jet <yenjet.chan@eglobal.com.my>
Cc: netfilter@lists.samba.org

Le lun 27/01/2003 =E0 12:31, Jet a =E9crit :
> I just got a strange setup on a client site.
> It is a standard network setup, from Internet-> router->firewall->DMZ
> The firewall is doing NAT for the servers at DMZ.
>=20
> The strange part is they always do a IP alias at the firewall external
> interface when creating a NAT rule (either preroute or post-route).
> If I remove the ip alias, then the connection will never work.
>=20
> My question is, is this the right setup?

Yes it is.

> To my understanding, it should be just doing NAT with pre-route or
> post-route, and then creating the policy using FORWARD chain.
> Using IP alias never seems make sence to me here (what if there is 1000
> servers in DMZ).

To get packets NATed as you want them to, they have to reach PREROUTING
chain on the firewall. That means when access router wants to forward
theses packets, it must get an ARP reply for their destination IP. If
NATed IPs were not aliased on firewall, then nobody would answer access
router's ARP requests, and connections would not get established.

When you create such a configuration, you have two ways for having it
work.

	(eth0)Routeur(eth1) ---- (eth0)Firewall(eth1) ---- DMZ
			   interco

Access router is supposed to be Linux box.

1. You set access router as usual and use aliases on firewall :

	on router : route add -net $interco_net dev eth1
	on firewall : ip address add $nated_ip dev eth0
		      NAT and filtering stuff

   With this configuration, firewall answers ARP stuff for NATed IPs.

2. You explicitly configure your access router to route NATed IP to
   firewall :

	on routeur : route add -host $firewall dev eth1
		     route add -host $nated_ip gw $firewall
	on firewall : NAT and filtering stuff

   With this configuration, router only ARP for firewall IP.

In both case, this is quite painful configuration stuff, but you can
handle it quite easily with a shell script that will automate aliasing,
NATing and filtering stuff for all IP you want to NAT. You can also
provide some king of Perl frontend that can help you add new IPs.

The only thing you have to keep in mind is that packets you want to NAT
have to reach the firewall. As they're not destined to, you have to
force them a bit ;)

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security expert  - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE



