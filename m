From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Can't get access remote LAN through firewall
Date: Sun, 15 Oct 2006 15:13:15 +0200
Message-ID: <453233EB.3080404@plouf.fr.eu.org>
References: <453178E2.5020602@gigared.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <453178E2.5020602@gigared.com>
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

Hello,

piraguasu a =E9crit :
>=20
> I have two LAN, both connected to Internet through proxy/firewall on=20
> Linux. One is my working LAN and other remote. I want to see internal=20
> machines of remote LAN from any computers of my LAN, for this I setup a=
=20
> tunnel and when the  firewall  is down in both LAN, all OK.
>=20
> When firewall is up, my problem is forwarding between tunnel device and=
=20
> internal card (eth1), I can't get pass through firewall, iptables rules=
=20
> don't work.

Does the FORWARD chain contains rules which accept packets between the=20
tunnel interface and the LAN interface in both directions ?

Something like :
iptables -A FORWARD -i eth1 -o tun0 -j ACCEPT
iptables -A FORWARD -i tun0 -o eth1 -j ACCEPT

