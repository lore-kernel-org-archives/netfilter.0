From: Askar <askarali@gmail.com>
Subject: Re: Sharing Limited Internet Connection
Date: Fri, 2 Sep 2005 16:07:06 +0500
Message-ID: <a0f69e505090204074a5f0dbb@mail.gmail.com>
References: <025601c5afe2$21c119a0$0200a8c0@etpi> <4317FB85.2030209@my-mail.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4317FB85.2030209@my-mail.ch>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: "lists.netfilter.org" <netfilter@lists.netfilter.org>

All you have to do on your linux gateway
# enable ip forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

#iptables nat rule goes as..
#use snat if you have static ip
iptables -t nat -A POSTROUTING -j SNAT --to xx.xxx.xxx.xx=20
# use MASQ if you get dynamic ip
iptables -A POSTROUTING -t nat -o eth0 -j MASQUERADE


On client side make this route/gateway machine as default gateway.


hope this will helps.

regards

Askar
On 9/2/05, Ruprecht Helms <rhelms@my-mail.ch> wrote:
>=20
> TestMail wrote:
> > Hello List!
> >
> > My ISP said i can only connect 1 PC in my DSL account (is this=20
> true????).
> > If it is not true how can i share it using iptables???
>=20
> Configure your gateway as proxy with nat.
>=20
> Regards,
> Ruprecht
>=20
>=20
> -------------------------------------------------------------------------=
-----------------
> Ruprecht Helms IT-Service & Softwareentwicklung
>=20
> Tel./Fax +49[0]7621 16 99 16
> Web: htp://www.rheyn.de
>=20
>=20
>=20
>=20


--=20
Unix is very simple, but it takes a genius to understand the simplicity.
(Dennis Ritchie)
