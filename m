From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Iptables rule for multiple Ip addresses.
Date: Tue, 15 Jun 2004 08:13:14 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1087279994.1900.503.camel@anduril.intranet.cartel-securite.net>
References: <20040615053549.29391.qmail@web60408.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040615053549.29391.qmail@web60408.mail.yahoo.com>
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
To: ads nat <adsnat@yahoo.com>
Cc: netfilter@lists.netfilter.org

Le mar 15/06/2004 =E0 07:35, ads nat a =E9crit :
> I am trying to apply this rule for diverting trafic.=20
> "eth1" is LAN interface for subnet 192.168.0.0/24
> ##########
> [root@xxx root]# iptables -t nat -A PREROUTING -s
> 192.168.0.2-192.168.0.10 -i eth0 -p tcp -j DNAT --to
> 10.0.0.2:80
> iptables v1.2.7a: host/network
> `192.168.0.2-192.168.0.10' not found
> Try `iptables -h' or 'iptables --help' for more
> information.
> ##########
> It seems it does not accept multipal source addresses.

It does not.
Iptables only accept single address or network as source and/or
destination.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

