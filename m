From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: no ssh on eth0
Date: Mon, 31 Jul 2006 15:44:01 +0200
Message-ID: <44CE0921.7050103@plouf.fr.eu.org>
References: <1154239260.5429.2.camel@nirvana.aurokruti.in>	<87fygje700.fsf@newton.gmurray.org.uk>	<Pine.LNX.4.61.0607301343450.23827@yvahk01.tjqt.qr>	<44CCA802.2090403@plouf.fr.eu.org>	<facccfbd353e38901017e6dee5a54a99@former03.de>	<44CCE712.4070907@plouf.fr.eu.org>	<98ab1181f512c188a486f7e3667bb2c4@former03.de>	<44CD10E0.501@plouf.fr.eu.org>
	<f5cb25e84f751fd22816a75d4e6ba77b@former03.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <f5cb25e84f751fd22816a75d4e6ba77b@former03.de>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

former03 | Baltasar Cevc a =E9crit :
>=20
>> Why ? What is the difference with or without NAT ?
>=20
> You can filter out all incoming packets to local IP addresses on the wa=
n=20
> interface before NAT is done;

No you can't, unless you intend to do filtering in PREROUTING chain of=20
the 'mangle' table.

> if you just use MASQUERADE for outgoing=20
> packets, "iptables -A INPUT -i eth0.-d 192.168.0.0/16 -j DROP".

I just don't see how it is different whether you have NAT/MASQUERADE or=20
not. To me filtering and NAT in iptables are fundamentally independent.

