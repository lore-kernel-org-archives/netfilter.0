From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Too many ARP entries and Re: sendto: No buffer space available
Date: 03 Dec 2002 14:08:54 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1038920934.8888.4.camel@elendil.intranet.cartel-securite.net>
References: <571705138.20021202111645@pobox.com>
	 <14127620470.20021202182836@pobox.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <14127620470.20021202182836@pobox.com>
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
To: Andre Docena Correa <andre.docena@pobox.com>
Cc: netfilter@lists.netfilter.org, andre.correa@pobox.com

Le lun 02/12/2002 =E0 21:28, andre.correa@pobox.com a =E9crit :
> But  there  is  still a question for me. Looking at my arp table, I
> see that there are =3D~ 150 entries, seconds passing and more entries
> coming, 20 seconds after I can have =3D~1100, it goes on until it reach=
s
> =3D~2200  entries,  then it goes back to the =3D~100 and starts over ag=
ain.

Wierd...

> I  have  less  then  50  NAT users. Is it normal to have some many ARP
> entries with this variation? Looking the ARP table I see my "Internet"
> interface with lots of entries, with internet host IP addresses and my
> gateway's NIC MAC address.
> Isn't ARP supposed to keep entries just to local network systems?

Yes it is.
ARP is supposed to keep track of IP/MAC associations for network
directly routed to interface, i.e. directly connected, aka local LANs.

> Is it all normal? And if so, how big can gc_threash[1,2,3] be?

It is not normal. You should monitor ARP traffic on your network using
arpwatch (see Freshmeat, available as .deb, .rpm too) to see if someone
would be playing ARP cache poisoning (see http://www.arp-sk.org/).
--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security expert  - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

