From: Mickael DILY <woksy@ether.net1.nerim.net>
Subject: Re: iptables masquerade cache  problems
Date: Mon, 29 Sep 2003 15:17:21 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200309291517.25281.woksy@ether.net1.nerim.net>
References: <001e01c38662$f2a93bc0$01070a0a@858sxt07> <200309291304.46583.woksy@ether.net1.nerim.net> <1064834366.16245.24.camel@raylinux.internal>
Reply-To: woksy@ether.net1.nerim.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1064834366.16245.24.camel@raylinux.internal>
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
To: Ray Leach <raymondl@knowledgefactory.co.za>, Netfilter Mailing List <netfilter@lists.netfilter.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Thanks for your help, but i think it's something more vicious thant ipcon=
fig.
When I boot the win2000 client, he's got an ip via dhcp. all is correct.
Now, i disconnect it physically from the network, ipconfig /renew, same t=
hing.
I reboot it without cable, same thing : the same ip, and it also find a d=
hcp=20
(remember it is not connected).
3 or 4 reboot later, everything is correct.... I don't know where it come=
s=20
from, but it is from windows, and i don't have time to find an answer


Le Lundi 29 Septembre 2003 13:19, Ray Leach a =E9crit :
 On Mon, 2003-09-29 at 13:04, Mickael DILY wrote:
 > -----BEGIN PGP SIGNED MESSAGE-----
 > Hash: SHA1
 >
 > Hi, i have already had this problem with windows clients. It seems it'=
s
 > not a bug from your linux box, but only from the windows client, whose
 > still have your old ip in cache. For my part, i don't know how to work
 > around for this bug

 You need to use ipconfig on the windows clients to flush the dns and
 routing cache. See the docs on ipconfig /? on winblows.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE/eDDhzEzekoYhlpsRAmM3AKDI6n6ygpj9m+O62GxawR5RP9TTqACfSlV3
U0F3OQlw30moaF20r+hkQOM=3D
=3DBkse
-----END PGP SIGNATURE-----


