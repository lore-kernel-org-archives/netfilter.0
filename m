From: Mickael DILY <woksy@ether.net1.nerim.net>
Subject: Re: iptables masquerade cache  problems
Date: Mon, 29 Sep 2003 13:04:35 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200309291304.46583.woksy@ether.net1.nerim.net>
References: <001e01c38662$f2a93bc0$01070a0a@858sxt07>
Reply-To: woksy@ether.net1.nerim.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001e01c38662$f2a93bc0$01070a0a@858sxt07>
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
To: j.lu@tiesse.com, netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi, i have already had this problem with windows clients. It seems it's n=
ot a=20
bug from your linux box, but only from the windows client, whose still ha=
ve=20
your old ip in cache. For my part, i don't know how to work around for th=
is=20
bug

Le Lundi 29 Septembre 2003 10:23, lu a =E9crit :
 Hi,
 I have two lines that were masqueraded, one ADSL and another is ISDN for
 backup. When the line ADSL is broken  I switch the line to ISDN. The pro=
blem
 is: when I use ping to test (ping -t from windows client), after the lin=
e
 was switched to ISDN, the source address was still that of ADSL  instead=
 of
 ISDN. But, when I stopped the ping from client for a while, all things w=
ent
 well. It seems a problem of cache. What is the work-around for it? At a
 moment I just down the ADSL interface.  You can do this test with two la=
n
 interfaces.
 The Configuration is:
 	iptables -t nat -A POSTROUTING -o hsb0 -j MASQUERADE    # for ADSL
 	iptables -t nat -A POSTROUTING -o ippp0 -j MASQUERADE    # for ISDN

 	default gw dev was hsb0  (ADSL)
 	when ADSL was down then :
 	route del default dev hsb0
 	route add default dev ippp0


 Best regards,
 Jianliang Lu

 TieSse s.p.a      Ivrea (to) Italy
 j.lu@tiesse.com
 luj@libero.it
 http://www.tiesse.com

- --=20
- - M. DILY, administrateur r=E9seau, geek :-)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE/eBHIzEzekoYhlpsRAnbvAJwMYms5Vg+d0gVfoPH3rJ/jV7s1LgCfTyKN
SJ8P+jawRbS97afL3VxnNKg=3D
=3DZeBt
-----END PGP SIGNATURE-----


