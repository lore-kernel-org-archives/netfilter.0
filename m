From: Jorge Davila <davila@nicaraguaopensource.com>
Subject: Re: specify source port on NAT
Date: Fri, 29 Jun 2007 10:57:22 -0600
Message-ID: <468539F2.50106@nicaraguaopensource.com>
References: <6d86fd720706290637i60bb2fb3l12408f33e2a8bf4d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <6d86fd720706290637i60bb2fb3l12408f33e2a8bf4d@mail.gmail.com>
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
To: Snow Wolf <snowwolfv@gmail.com>
Cc: netfilter@lists.netfilter.org


 From http://iptables-tutorial.frozentux.net/

An example:

iptables -t nat -A POSTROUTING -p tcp -o eth0 -j SNAT --to-source=20
194.236.50.155-194.236.50.160:1024-32000

Best regards,

Jorge D=E1vila.

Snow Wolf wrote:
> hello members,
>=20
> My client has a strange requirement.When I made a nat firewall with
> iptables for him,he need the forwarded package's source port was not
> changed,or changed to a specified port which he can control.
>=20
> For example,
>=20
> 192.168.1.1  --->   iptables(nat)  ---> www.aol.com
> (sport: 1234)          (sport: 1234)       (dport:80)
>=20
> He need that when a package was left from iptables,the source port was
> still 1234.
> (or something like 1235 is also ok,but he need to control it,it means
> he can descide which port is the source port from iptables.)
>=20
> How to do it?thanks.
>=20
>=20


--=20
Jorge Isaac Davila Lopez
Nicaragua Open Source
+505 430 5462
davila@nicaraguaopensource.com


