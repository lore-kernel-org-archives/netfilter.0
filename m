From: Francois LE BOURDELLES <flebourdelles@free.fr>
Subject: Re: DNAT/SNAT stuff
Date: 11 May 2003 17:56:01 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1052668561.17939.34.camel@charlebourg-2-81-57-105-138.fbx.proxad.net>
References: <1052386761.5804.5.camel@mdew>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-Qlj8EXZZhVhL71+dZA83"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1052386761.5804.5.camel@mdew>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: mdew <mdew@orcon.net.nz>
Cc: netfilter <netfilter@lists.netfilter.org>, Laurent Luyckx <lololuy@tiscali.be>


--=-Qlj8EXZZhVhL71+dZA83
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

Hello,

Thanks to Laurent Luyckx, here could be something to help you for subnet
nating :
(see attached)

Regards.

Le jeu 08/05/2003 =E0 11:39, mdew a =E9crit :
> current setup,=20
>=20
> $IPTABLES -t nat -A PREROUTING -i eth0 -d 210.54.175.12 -p tcp --dport
> 4661 -j DNAT --to 10.0.0.3
> $IPTABLES -t nat -A PREROUTING -i eth0 -d 210.54.175.12 -p tcp --dport
> 4662 -j DNAT --to 10.0.0.3
> $IPTABLES -t nat -A POSTROUTING -o eth0 -s 10.0.0.3 -p tcp --sport 4661
> -j SNAT --to 210.54.175.12
> $IPTABLES -t nat -A POSTROUTING -o eth0 -s 10.0.0.3 -p tcp --sport 4662
> -j SNAT --to 210.54.175.12
> $IPTABLES -t nat -A PREROUTING -i eth0 -d 210.54.175.12 -p udp --dport
> 4665 -j DNAT --to 10.0.0.3
> $IPTABLES -t nat -A PREROUTING -i eth0 -d 210.54.175.12 -p udp --dport
> 4672 -j DNAT --to 10.0.0.3
> $IPTABLES -t nat -A POSTROUTING -o eth0 -s 10.0.0.3 -p udp --sport 4665
> -j SNAT --to 210.54.175.12
> $IPTABLES -t nat -A POSTROUTING -o eth0 -s 10.0.0.3 -p udp --sport 4672
> -j SNAT --to 210.54.175.12
>=20
> i would like specify 10.0.0.x instead of 10.0.0.3, how is this done?
>=20
> and some problems i had attempting it..
>=20
> Try `iptables -h' or 'iptables --help' for more information.
> iptables v1.2.6a: Bad IP address `10.0.0.0/24'
> iptables v1.2.6a: host/network `10.0.0.3-10.0.0.8' not found
> Try `iptables -h' or 'iptables --help' for more information.
>=20
> cc: please :)
--=20
Francois LE BOURDELLES <flebourdelles@free.fr>

--=-Qlj8EXZZhVhL71+dZA83
Content-Disposition: inline
Content-Type: message/rfc822

Return-Path: <lololuy@tiscali.be>
Delivered-To: online.fr-flebourdelles@free.fr
Received: (qmail 20086 invoked from network); 11 May 2003 11:02:51 -0000
Received: from spoolo2.tiscali.be (HELO smtp-out.tiscali.be)
	(62.235.13.211) by mrelay2-1.free.fr with SMTP; 11 May 2003 11:02:51 -0000
Received: from [62.235.84.11] (helo=ftp.luyckx.net) by smtp-out.tiscali.be
	with esmtp (Tiscali)  id 19EobS-00049K-00; Sun, 11 May 2003 13:02:50 +0200
Subject: Re: How to nat a full subnet ?
From: Laurent Luyckx <lololuy@tiscali.be>
To: Francois LE BOURDELLES <flebourdelles@free.fr>
Cc: netfilter@lists.netfilter.org
In-Reply-To: <1052642696.17942.14.camel@charlebourg-2-81-57-105-138.fbx.proxad.net>
References: 
	 <1052642696.17942.14.camel@charlebourg-2-81-57-105-138.fbx.proxad.net>
Content-Type: text/plain
Organization: 
Message-Id: <1052650980.699.4.camel@laurent.luyckx.net>
Mime-Version: 1.0
X-Mailer: Ximian Evolution 1.2.4 
Date: 11 May 2003 13:03:00 +0200
X-Evolution-Source: pop://flebourdelles@pop.free.fr
Content-Transfer-Encoding: 7bit

Have look a the NETMAP patch from p-o-m.
It creates a static 1:1 mapping of the network address.

(http://www.netfilter.org/documentation/pomlist/pom-combined.html#NETMAP)

Cheers.

On Sun, 2003-05-11 at 10:44, Francois LE BOURDELLES wrote:
> Hello happy netfilter users,
> 
> First i use kernel 2.4.20 patch-o-matic'ed and iptables 2.4.8
> I have to SNAT an DNAT a full subnet (199.1.4.0/0 (internal address
> plan) to 1998.1.4.0/0 (external view))
> so I tried to use the command :
> 
> iptables -t nat -A POSTROUTING -s 199.1.4.0/24 --to 199.1.4.0/24 -o
> tunnel0 -j SNAT
> (tunnel0 is a GRE typed tunnel)
> 
> as the NAT Howto page shows (NAT-HOWTO-6.html).
> 
> The aim is to have per exemple : 199.1.4.13 source changed to 198.1.4.13
> 
> but this command is rejected :
> 
> As I understand the sources (iptables and kernel) this is because the
> --to only accept single IP address
> or a range of IP-address, the last one for a pool automatic selection
> [And I do not know for what this could be used !).
> 
> DO THE HOW-TO PAGES HAVE TO BE UPDATED (removing of the full subnet SNAT
> and DNAT) ... or the iptables/ipfilter updated ?
> 
> Regards.
-- 
Laurent Luyckx <lololuy@tiscali.be>


--=-Qlj8EXZZhVhL71+dZA83--


