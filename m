From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Help with IPtables and NAT
Date: Fri, 28 Jul 2006 12:31:30 +0200
Message-ID: <44C9E782.8080306@plouf.fr.eu.org>
References: <44C16109.20704@jemconsult.biz> <44C17846.4080403@plouf.fr.eu.org>
	<42950.2001:888:19e1::53.1153754175.squirrel@dexter>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42950.2001:888:19e1::53.1153754175.squirrel@dexter>
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

Martijn Lievaart a =E9crit :
> <citaat van=3D"Pascal Hambourg">
>>
>>You forgot the whole 127.0.0.0/8 subnet which can be used on the
>>loopback interface. Anyway, why don't you just allow all traffic on the
>>loopback interface ?
>=20
> Even worse, loopback is used for communicating with any local address, =
not
> just the one assigned to the lo interface.

Local addresses were already dealt with by the following rules :

iptables -A INPUT -p ALL -i lo -s 127.0.0.1 -j ACCEPT
iptables -A INPUT -p ALL -i lo -s 192.168.0.1 -j ACCEPT
iptables -A INPUT -p ALL -i lo -s 172.10.10.1 -j ACCEPT
iptables -A INPUT -p ALL -i lo -s 172.10.10.2 -j ACCEPT


> Don't restrict loopback unless you know exactly what you're doing.

Sure. Much less pain.

