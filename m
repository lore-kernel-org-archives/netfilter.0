From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Can't DROP spoofed packet. Bug or feature ?
Date: Mon, 06 Oct 2003 15:55:09 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1065448509.815.56.camel@elendil.intranet.cartel-securite.net>
References: <52208.212.239.118.101.1065447313.squirrel@www.frumar.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <52208.212.239.118.101.1065447313.squirrel@www.frumar.it>
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
To: pigi@pigi.org
Cc: netfilter@lists.netfilter.org

Le lun 06/10/2003 =E0 15:35, pigi a =E9crit :
> $iptables -t nat -A PREROUTING -s 127.0.0.0/8 -i ppp0 -j LOG --log-leve=
l
> debug --log-prefix "Spoof PREROUTING"
> $iptables -t nat -A PREROUTING -s 127.0.0.0/8 -i ppp0  -j DROP
>=20
> this other it's working.
> My question is: why do the prerouting chain is able to catch the spoofe=
d
> packet, while the INPUT one isn't ?.
> The destination address IS on my ppp0 interface, so it should be caught
> also in the INPUT chain.

Do you have rp_filters activated ? If so, packet is dropped at first
routing point for kernel checks reverse path. Activate martians logging
to confirm this :

	echo 1 > /proc/sys/net/ipv4/conf/all/log_martians

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

