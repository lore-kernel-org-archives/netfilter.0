From: "former03 | Baltasar Cevc" <baltasar.cevc@former03.de>
Subject: Re: no ssh on eth0
Date: Mon, 31 Jul 2006 00:57:52 +0200
Message-ID: <f5cb25e84f751fd22816a75d4e6ba77b@former03.de>
References: <1154239260.5429.2.camel@nirvana.aurokruti.in>	<87fygje700.fsf@newton.gmurray.org.uk>	<Pine.LNX.4.61.0607301343450.23827@yvahk01.tjqt.qr>	<44CCA802.2090403@plouf.fr.eu.org>	<facccfbd353e38901017e6dee5a54a99@former03.de>	<44CCE712.4070907@plouf.fr.eu.org>
	<98ab1181f512c188a486f7e3667bb2c4@former03.de>
	<44CD10E0.501@plouf.fr.eu.org>
Mime-Version: 1.0 (Apple Message framework v624)
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44CD10E0.501@plouf.fr.eu.org>
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
Content-Type: text/plain; charset="macroman"; format="flowed"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@lists.netfilter.org


On 30.07.2006, at 22:04, Pascal Hambourg wrote:

> former03 | Baltasar Cevc a =E9crit :
>> You're right, of course - I thought of a firewall situation with NAT =
-
>
> Why ? What is the difference with or without NAT ?

You can filter out all incoming packets to local IP addresses on the=20
wan interface before NAT is done; if you just use MASQUERADE for=20
outgoing packets, "iptables -A INPUT -i eth0.-d 192.168.0.0/16 -j=20
DROP".
Granted, if filtering breaks that does not help, but in case of an=20
attacker who is not on the same physical network as the WAN interface=20
it will probably break with the other listen address as he will hardly=20=

manage to get the packets routed to the host.

Baltasar

--
Baltasar Cevc

_____ former 03 gmbh
_____ infanteriestra=DFe 19 haus 6 eg
_____ D-80797 muenchen

_____ http://www.former03.de


