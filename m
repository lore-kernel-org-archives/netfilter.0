From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Imposible configuration?
Date: Fri, 14 May 2004 17:52:58 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1084549978.1783.27.camel@anduril.intranet.cartel-securite.net>
References: <200405141622.37892.christian@finnberg.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200405141622.37892.christian@finnberg.net>
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
To: christian@finnberg.net
Cc: netfilter@lists.netfilter.org

Le ven 14/05/2004 =E0 17:22, Christian E. L=F3pez Finnberg a =E9crit :
> So the only resting step is to translate 192.168.x.1 to 192.168.55.1 in=
 the=20
> apropiate interface (In a POSTROUTE way), but I dont
> see a form to do this. :-(

I see your point. You can't change destination in POSTROUTING, so your
approach is not appropriate.

You should implement policy routing against Netfilter mark :

	iptables -t mangle -A PREROUTING -d 192.168.2.1 \
		-j MARK --set-mark 0
	iptables -t mangle -A PREROUTING -d 192.168.2.1 \
		-j DNAT --to 192.168.55.1

Then, set policy routing as explained in LARTC[1] using iproute2 :

	echo 200 ippp0 >> /etc/iproute2/rt_tables
	ip rule add fwmark 0 table ippp0
	ip route add default dev ippp0 table ippp0

Do the same for every route you have, or script in a loop.


[1] http://lartc.org/

=09

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

