From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: iptables and 802.1q tagging
Date: Tue, 09 Sep 2003 21:15:55 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1063134954.765.10.camel@elendil.intranet.cartel-securite.net>
References: <20030521000814.26768.qmail@web40811.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030521000814.26768.qmail@web40811.mail.yahoo.com>
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
To: Paul Albert <palbert1@yahoo.com>
Cc: netfilter@lists.netfilter.org

Le mer 21/05/2003 =E0 02:08, Paul Albert a =E9crit :
> I googled to determine whether an iptables=20
> bridge that is filtering on IP addresses would be=20
> smart enough to pick up on the fact that the packets=20
> have 802.1Q tags or not.  No definitive answer was=20
> found.  My question is just that - does iptables=20
> notice that the tag is present or will it not know=20
> what to do with such a packet?

I would say no, but not 100% sure of this, for Netfilter as no
particular knowledge about layer 2 (except for mac match). You should
have a look to ebtables :

	http://ebtables.sourceforge.net/

ebtables is a layer 2 filtering tool for Linux bridges, that act as a
Netfilter complement. In particular, it can filter 802.1q frames as such
and match VLAN ID or Prio. From ebtables man :

   vlan
	Specify  802.1Q Tag Control Information fields. The protocol
	must be specified as 802_1Q (0x8100).
                                                               =20
	--vlan-id [!] id
		The VLAN identifier field (VID). Decimal number from 0
		to 4095.

	--vlan-prio [!] prio
		The  user_priority field. Decimal number from 0 to 7.
		The VID should be set to 0 ("null VID") or unspecified
		(for this case the VID is deliberately set to 0).
=20
	--vlan-encap [!] type
		The encapsulated Ethernet frame type/length. Specified
		as hexadecimal number from 0x0000 to 0xFFFF or as a
		symbolic name from /etc/ethertypes.

See ebtables-user@lists.sourceforge.net list if needed.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

