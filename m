From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: is it possible with iptables
Date: Mon, 15 Dec 2003 08:45:38 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1071474338.789.7.camel@elendil.intranet.cartel-securite.net>
References: <001f01c3c2d2$a9c72ff0$b84526c0@thor>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001f01c3c2d2$a9c72ff0$b84526c0@thor>
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
To: Hlynur Thor Olason <thorolason@web.de>
Cc: netfilter@lists.netfilter.org

Le lun 15/12/2003 =E0 07:14, Hlynur Thor Olason a =E9crit :
> Im trying to get local traffic from a linux box destined for the same b=
ox
> routed through a test network.

You should have a look to iproute package, trying to play with advanced
routing stuff. Having a look at local routing table should be a good
start :

root@elendil:~# ip route list table local
[...]
local 192.168.1.2 dev eth0  proto kernel  scope host  src 192.168.1.2
[...]

Maybe deleting this kind of entries will achieve what you want.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!=20

