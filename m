From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Not quite understanding DNAT
Date: 25 Jul 2003 12:10:52 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1059127851.1020.45.camel@elendil.intranet.cartel-securite.net>
References: <Pine.LNX.4.44.0307251045220.1760-100000@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0307251045220.1760-100000@localhost>
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
To: Chris Wilson <chris@netservers.co.uk>
Cc: Coutts@elendil.intranet.cartel-securite.net, "Ashe (Testing Account)" <ATest@sbsdk12.org>, netfilter@lists.netfilter.org

Le ven 25/07/2003 =E0 11:47, Chris Wilson a =E9crit :
> You could try:
> 	route add <internal-server-10.0.0.x> dev eth0 \
> 		gw <address-of-eth0:x>
> Using an address of your own box as the gateway of a route will cause
> locally-generated traffic going down that route to come from that addre=
ss,
> instead of the default address on the device. This should mean that the
> masquerading uses that address too, but I haven't tested it.

I've just tested this, it does not work as I was expecting.

Therefore, you can use iproute2 to achieve this kind of behaviour. You
can specify to use an arbitrary local IP as source for a given route.
Ashe, you should try this :

	ip route add $INSERV dev eth0 src $SRCIP

I use this quite often on net2net VPN using FreeS/WAN to force gateways
to use their private IP when communicating through the tunnel.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

