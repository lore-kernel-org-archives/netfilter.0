From: =?iso-8859-1?Q?P=E4r_H=E4ggblad?= <par.haggblad@terraplay.com>
Subject: SV: iptables 1.2.10 and linux kernel 2.6.7 problems.
Date: Thu, 24 Jun 2004 14:04:04 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <6BFFA187E8806C4E9740A353F715DDBDE5718E@newmailer.terraplay.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@lists.netfilter.org

Hi.

> -----Ursprungligt meddelande-----
> Fr=E5n: Jozsef Kadlecsik [mailto:kadlec@blackhole.kfki.hu]
> Skickat: den 24 juni 2004 10:34
> Till: P=E4r H=E4ggblad
> Kopia: netfilter@lists.netfilter.org
> =C4mne: Re: iptables 1.2.10 and linux kernel 2.6.7 problems.
>=20
> On Wed, 23 Jun 2004, [iso-8859-1] P=E4r H=E4ggblad wrote:
>=20
> > I have used iptables 1.2.9 with kernel 2.4.x since a week ago.
> > Now I'm using the new 2.6.7 kernel and iptables 1.2.10.
>=20
> You did compile iptables 1.2.10 using the 2.6.7 source code, didn't =
you?
Yes of cource. There was however a compiling error which made me to look =
in this mailing list and pointed me to a patch that I used to get it to =
compile. This patch:  =
http://lists.netfilter.org/pipermail/netfilter/2004-June/053639.html


> > modprobe ip_nat_ftp ports=3D ab,cde,fgh
>                             ^
> That space is illegal there |


My fault, my changing of my ftp ports resulted in a space addition. This =
is not the case in the script.=20

>=20
> > 2. $IPTABLES -v -A INPUT -i eth0 -p icmp -j DROP
> >    Does not work. I can still ping my compu, the packets are not
> dropped.
>=20
> If you list out the rules, you can see the same ones you fed into the
> kernel?

Yes I can see the same. I'm doing a "iptables -L"
=20

>=20
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : KFKI Research Institute for Particle and Nuclear Physics
>           H-1525 Budapest 114, POB. 49, Hungary
>=20

It must be something else that is creating my problems. I haven't tried =
kernel 2.4.23 with iptables 1.2.10. If that works then it's the kernel =
(2.6.7) that's causing the trouble.

/Per


