From: xchris <lyra@fastwebnet.it>
Subject: Re: VPN Issue - help
Date: Tue, 6 May 2003 11:35:30 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200305061135.30694.lyra@fastwebnet.it>
References: <006c01c31357$a1565ce0$6400a8c0@homes>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <006c01c31357$a1565ce0$6400a8c0@homes>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org
Cc: Voltaire Pascual <voltaire@voltaire.servebeer.com>

On Tuesday 06 May 2003 00:42, Voltaire Pascual wrote:
> repost:
>
> Clients can connect to the VPN server w/o any problem. Private network =
is
> 192.168.0.0/24. VPN server IP is
>
> Public (ppp0) =3D 203.x.x.x
> Private (eth0) =3D 192.168.0.10
>> When client is connected to the VPN server, it can ping the VPN but no=
t the
> other machines in the network. Client IP when connected is
> 192.168.0.80/255.255.255.255. clients can surf the net after they are
> connected but cannot see other machines inside the network.
>
> ###########################
> other config:
> net.ipv4.ip_forward =3D 1
> net.ipv4.conf.eth0.proxy_arp =3D 1
>
> ###########################
> client is connected to the VPN. here's the result of ifconfig:
>
> ppp1      Link encap:Point-to-Point Protocol
>           inet addr:192.168.0.10  P-t-P:192.168.0.80  Mask:255.255.255.=
255
>           UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1400  Metric:1
>           RX packets:18 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:10 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:3
>           RX bytes:1062 (1.0 Kb)  TX bytes:147 (147.0 b)
> ###########################
> route -n
>
> 192.168.0.180   0.0.0.0         255.255.255.255 UH    0      0        0
> ppp1 ###########################
>
>
> What could be the problem? What iptables rule should i do.



from route -n
you should have
192.168.0.0      0.0.0.0         255.255.255.0   U     0      0        0=20
eth(?)

not 192.168.0.180/32
what is .180?


maybe you should post your ifconfig (complete) and route -n (complete) an=
d=20
maybe your pptpd.conf

bye

