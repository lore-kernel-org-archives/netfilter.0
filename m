From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Can't get access remote LAN through firewall
Date: Thu, 19 Oct 2006 11:46:21 +0200
Message-ID: <4537496D.7010707@plouf.fr.eu.org>
References: <453178E2.5020602@gigared.com> <453233EB.3080404@plouf.fr.eu.org>
	<453523BF.3020902@gigared.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <453523BF.3020902@gigared.com>
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

piraguasu a =E9crit :
> #
> # On my LAN
>=20
> iptables -A FORWARD -i eth1 -s $MY_LAN -d $REMOTE_LAN -o tun0 -j ACCEPT
> iptables -A FORWARD -i tun0 -s $REMOTE_LAN  -d $MY_LAN -o eth1 -j ACCEP=
T
>=20
> #
> # On remote LAN
>=20
> iptables -A FORWARD -i eth1 -s $REMOTE_LAN -d $MY_LAN -o tun0 -j ACCEPT
> iptables -A FORWARD -i tun0 -s $MY_LAN  -d $REMOTE_LAN -o eth1 -j ACCEP=
T

What happens if you remove the -s and -d options ?
No SNAT/MASQUERADE on the tunnel ?
Could it be that the tunnel packets are dropped on the WAN interface ?
What kind of tunnel protocol is it ?

> The packets can't gain access to tunnel tcpdump say me.

Can you explain this please ? My tcpdump only shows packets which enter=20
and leave a network interface, it does not tell anything about getting=20
access or not.

