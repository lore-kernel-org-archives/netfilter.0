From: =?ISO-8859-1?Q?S=E9bastien_CRAMATTE?= <scramatte@zensoluciones.com>
Subject: Re: [RESOLVED] Can't change  ipt_conntrack hashsize under debian
 sarge  ???
Date: Thu, 19 Apr 2007 09:30:43 +0200
Message-ID: <46271AA3.1020508@zensoluciones.com>
References: <46266B31.1040505@zensoluciones.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------050204060407090803010401"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46266B31.1040505@zensoluciones.com>
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
Cc: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.
--------------050204060407090803010401
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

Was just a typografic problem !!!!
El module is   ip_conntrack and not  ipt_conntrack  ...

Works well now

S=E9bastien CRAMATTE a =E9crit :
> Hello,
>
> I've tried to  change  ipt_conntrack hashsize and con   under my debian
> charge  but doesn't work !
> Ive got 2876Mb available for conntrack so I've  done  (according to som=
e
> previous mail and this
> http://www.wallfire.org/misc/netfilter_conntrack_perf.txt)
>
> This server running  debian sarge 3.1 + 2.6.18 kernel
>
> CONNTRACK_MAX =3D 2876 * 64 =3D 184064
> HASHSIZE =3D 2876 * 8 =3D 23002
>
> But the near  power of  2 is 2^16  =3D 131072  ...  I'm not sure that i=
f
> it better to put 184064 or 131072 ?
> Seems that netfilter algorythm is more eficient with power of 2  value =
?
>
> I can set the CONNTRACK_MAX value but not the HASHSIZE ... I've tried
> add hashsize=3D paremeter   in /etc/modules or in
> /etc/modprobe.d/arch/i386 and I've done an "update-modules" ...  When
> reboot the server the value still 8192  ???? Any Ideas ?
>
> Moreover I've read somewhere that is better to augment HASHSIZE value
> to 1:2 ratio ... in my case 65440
> But how can I determine the best value ? My computer is P4 Hyper
> Threading  3.6 Ghz  ... Might be I should put 131072 as CONNTRACK_MAX ?
> This server is a bridge that only do L7 QoS  (filter + o - 70 Mbits for
>  =20
>> 600 customers ).
>>    =20
>
> # cat /etc/sysctl.conf
> net.ipv4.netfilter.ip_conntrack_max =3D 131072
>
> #cat /proc/sys/net/ipv4/netfilter/ip_conntrack_max
> 131072
>
> # cat /proc/sys/net/ipv4/netfilter/ip_conntrack_buckets
> 8192
>
> #cat /etc/modprobe.d/arch/i386
>
> alias eth0 tg3
> alias eth1 tg3
> alias eth2 e1000
>
> options ipt_conntrack hashsize=3D65440
>
> What about the patch 76_conntrack_bucket_sysctl.patch ?
> Many thanks for you help
> Regards
>
>
>
>
>  =20


--=20
ZEN SOLUCIONES - Be in XForms take your "Concentr=E9"
S=E9bastien CRAMATTE=20

Plaza Sandoval, 5, piso 4b
30004 Murcia - ESPA=D1A

M=F3vil : +34 627 66 52 83
Fijo : +34 968 29 29 65

E-mail : scramatte@zensoluciones.com
Site : www.zensoluciones.com

Skype : scramatte
Msn : scramatte@hotmail.com
Jabber: scramatte@jabber.org
--

CONCENTR=C9
xml entreprise grade framework
http://concentre.zensoluciones.com

--
This e-mail is privileged and may contain confidential information intend=
ed only for the person(s) named above. If you receive this e-mail in erro=
r, please notify the sender immediately and delete it. E-mail and interne=
t transmissions can't be warrant privacy, integrity or correct reception.=
 The sender will not be liable for any damages resulting.=20

Este mensaje va dirigido, de manera exclusiva, a su destinatario y puede =
contener informaci=F3n confidencial. En caso de haber recibido este mensa=
je por error, informe al emisor inmediatamente y proceda a su eliminaci=F3=
n. El correo electr=F3nico y las comunicaciones por medio de Internet no =
permiten garantizar la confidencialidad de los mensajes transmitidos, as=ED=
 como tampoco su integridad o su correcta de recepci=F3n. El emisor no as=
ume responsabilidad alguna por tales circunstancias.

Ce message est destin=E9 exclusivement =E0 son destinataire et peut conte=
nir des informations confidentielles. En cas de r=E9ception d'un tel mess=
age par erreur, informez l'exp=E9diteur imm=E9diatement et proc=E9dez =E0=
 son effacement. Il n'est pas possible de garantir la confidentialit=E9, =
l'int=E9grit=E9 ou la r=E9ception correcte du courrier =E9lectronique ain=
si que des communications par internet. L'exp=E9diteur ne peut =EAtre ten=
u pour responsable d'=E9ventuels dommages commis.


--------------050204060407090803010401--

