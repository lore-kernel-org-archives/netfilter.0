From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: High CPU usage + Kernel option
Date: Tue, 06 Apr 2004 16:42:53 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1081262572.24338.37.camel@raylinux.internal>
References: <4072B238.6050509@xana.ro>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-iCxOviqo8wvdFR3XxJWv"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4072B238.6050509@xana.ro>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Netfilter Mailing List <netfilter@lists.netfilter.org>


--=-iCxOviqo8wvdFR3XxJWv
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2004-04-06 at 15:35, Vlad Adomnicai wrote:
> Hi,
>    I have a K6/2 333 machine with 64Mb of RAM and two network cards.=20
> (3c509 and an Intel one both with TCP cheksum offloading and Cpu )
>    I use Fedora Core 1 with the default kernel    and iptables 1.2.9.
>=20
>    At high traffic through the router (6-7Mbytes/second) the CPU goes to=20
> 100% and I can't even log on to it through SSH:
> [root@root web]# ssh 192.168.200.1 -C -v
> OpenSSH_3.5p1, SSH protocols 1.5/2.0, OpenSSL 0x0090701f
> debug1: Reading configuration data /etc/ssh/ssh_config
> debug1: Applying options for *
> debug1: Rhosts Authentication disabled, originating port will not be=20
> trusted.
> debug1: ssh_connect: needpriv 0
> debug1: Connecting to 192.168.200.1 [192.168.200.1] port 22.
> debug1: Connection established.
> debug1: identity file /root/.ssh/identity type -1
> debug1: identity file /root/.ssh/id_rsa type -1
> debug1: identity file /root/.ssh/id_dsa type -1
>     and stands there until a timeout occures.
>    On the network behind the router are aproxymately 200 users for which=20
> I have about 200 iptables rules  like this iptables -A FORWARD -s <ip>=20
> -m mac --mac-source <mac> -j ACCEPT and 200   iptables -A FORWARD -d=20
> <ip> -j ACCEPT, to allow passage only for the machines with the corect=20
> pair of ip/mac. I could give up the last 200 rules, as they don't serve=20
> a real purpose in limiting the access but they are used only for=20
> bandwidth monitoring / ip.
>    Does anyone know how to lower the cpu usage with this configuration?=20
It should be very low ...

> tweaks of any kind? Would a 2.6 kernel improve the situation? I have=20
> also seen an option in the 2.4 kernels CONFIG_NET_HW_FLOWCONTROL=20
> (Forwarding between high speed interfaces) but there it is written that=20
> it supports only some network devices and I don't know about 3coms or=20
> intel ones.
>=20
>   Any one has any ideas? another way of setting the rules? another=20
> filtering method? tweaking parameters? or at least what kind of system=20
> will it be necessary for this setup to be able to at least log on to the=20
> machine and do something on it. Also, would a FreeBSD be more suitable=20
> for this on the same configuration?
>=20
Run something like sar, vmstat, top on the machine during high usage to
see if there is another proc running that may be causing the high cpu
usage. Do you run squid on that machine? If so, check the memory config
...

> Thanks in advance for any informations.
> Vlad Adomnicai
>=20
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-iCxOviqo8wvdFR3XxJWv
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQBAcsHsh1fuR/Bv+ygRAsliAKCq140K/zz2NGmnBi7VlBdRElbFZwCghdvB
pxKMs4MGi8rC9WXvTpmepSI=
=bz9s
-----END PGP SIGNATURE-----

--=-iCxOviqo8wvdFR3XxJWv--


