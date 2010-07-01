From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: [Bridge] Bridge blocking network traffic
Date: Thu, 01 Jul 2010 19:57:54 +0200
Message-ID: <4C2CD722.4070905@plouf.fr.eu.org>
References: <m2nbc9320b91004211748o5548f351z646076fab6744cca@mail.gmail.com>	<20100422130919.70206765@nehalam>	<AANLkTimPiriAOGpHHrAoEyFGuuyn1g8vFqW6Pimdz9CQ@mail.gmail.com>	<4C2B97CC.8090007@riverviewtech.net> <AANLkTilE0uZQu6SjlkX1WaY32Ir9STQXT4kVNiSc4sCa@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTilE0uZQu6SjlkX1WaY32Ir9STQXT4kVNiSc4sCa@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Mail List - Netfilter <netfilter@vger.kernel.org>
Cc: bridge@lists.linux-foundation.org

ratheesh k a =E9crit :
>=20
> brctl addbr br0
> brctl  addif eth0
> brctl  addif eth1
> ifconfig br0  0.0.0.0 up
>=20
> The problem was "default brouter policy is accept " . So packets are
> coming to layer2  only .

Indeed, by default (i.e. no brouting) packets received on a bridge port
are intercepted by the bridge. This is the intended behaviour of a
bridge, isn't it ? Thus a bridge port is not supposed to be assigned an
IP address (or be used by any protocol), because the IP stack (or any
other upper protocol layer) won't receive any packet directly from it
but from the bridge interface (which should have the IP address).

>I applied the below command and every thing
> seemed to work exactly like connecting eth0 and eth1 to hardware hub =
=2E
>=20
> ebtables -t broute  -P BROUTING -j DROP

I strongly doubt it. This rule forces routing of all packets instead of
bridging, so IIUC it effectively totally disables bridging and you are
back to two independent interfaces.
