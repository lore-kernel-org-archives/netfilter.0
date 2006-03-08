From: Jorge Davila <davila@nicaraguaopensource.com>
Subject: Re: Rules on SSH connection requests
Date: Wed, 08 Mar 2006 13:43:57 -0600
Message-ID: <1141847038.4266.27.camel@davila.nicaraguaopensource.com>
References: <a10b0c8a0603080737u61843de2k85a6314cb60e8916@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <a10b0c8a0603080737u61843de2k85a6314cb60e8916@mail.gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: JCA <1.41421@gmail.com>
Cc: netfilter@lists.netfilter.org

If you want prevent a brute force attack you can use public key
authentication and configure the ssh daemon to use the version 2.

As you wrote the rule


> /usr/sbin/iptables -A INPUT -p tcp -i eth0 -m state --state NEW \
>                    --dport 22 -m recent --update --seconds 15 -j DROP

all packets travers the rule, does not matter from where they come.

Hope this helps.

Jorge.

El mi=E9, 08-03-2006 a las 15:37 +0000, JCA escribi=F3:
>     I have the following setup:
>=20
> Internet ---- ADSL modem/router A ----- Linux firewall F ------ Linux box=
 B
>=20
>    TCP/IP packets for port 22 (the SSH port) are allowed in by A. In
> turn, F just forwards such packets to B without any further
> processing. In B I have the following IPTables set of rules:
>=20
> /usr/sbin/iptables -A INPUT -p tcp -i eth0 -s 192.168.1.0/24 \
>                    --dport 22 -j ACCEPT
> /usr/sbin/iptables -A INPUT -p tcp -i eth0 -m state --state NEW \
>                    --dport 22 -m recent --update --seconds 15 -j DROP
> /usr/sbin/iptables -A INPUT -p tcp -i eth0 -m state --state NEW \
>                    --dport 22 -m recent --set -j ACCEPT
>=20
>   My understanding is that with these rules, whenever an SSH
> connection attempt to port 22 from a given IP address fails (because
> the wrong credentials were used), no further connection requests from
> that IP address will be honored for 15 seconds. The first rule just
> specifies that this mechanism is not to be applied to connections from
> my internal LAN.
>=20
>   If I make an SSH connection from some machine I in the Internet to
> B, B honours this connection request promptly (modulo network
> performance, of course). If, the first connection having been
> successful, from I another SSH connection to B is opened immediately
> afterwards (that is, within a few seconds), this second connection
> request takes a long time to be honored - 45 seconds or more. The only
> thing that I can think of interfering here is the set of rules above.
>=20
>   Can anybody throw some light on this? In particular, if the rules
> are causing this behavior, can they be modified so that the behavior
> disappears, while preserving the 15 second timeout for failed
> connection attempts?
>=20
>   B is running a 2.4.27 Linux kernel, and iptables 1.2.10.
>=20
--=20
Jorge Isaac Davila Lopez
Nicaragua Open Source
+505 808 2478
davila@nicaraguaopensource.com=20


