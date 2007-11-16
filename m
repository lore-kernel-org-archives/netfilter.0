From: =?ISO-8859-1?Q?S=E9bastien_CRAMATTE?= <scramatte@zensoluciones.com>
Subject: ip_conntrack: falling back to vmalloc
Date: Fri, 16 Nov 2007 23:24:16 +0100
Message-ID: <473E1890.7070209@zensoluciones.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------000204010501090902000703"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

This is a multi-part message in MIME format.
--------------000204010501090902000703
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello

I've got  a server with 3Gb of ram and I want to keep 256 for the system
and allocate  the rest to conntrack ...

I've tried to change the HASHSIZE of the  ip_conntrack  but  dmesg
return me this error !

ip_conntrack version 2.4 (2097152 buckets, 16777216 max) - 236 bytes per
conntrack
ip_conntrack: falling back to vmalloc.

....

I've use this "math"  to calculate it :


(3072 - 256)  x 10242  -  236 =3D 12511822,1027

The near "power of 2"  seems to be 223 =3D 8388608

With this result I've change my "sysctl.conf" file =20

net.ipv4.netfilter.ip_conntrack_max =3D 8388608
net.ipv4.netfilter.ip_conntrack_tcp_timeout_established=3D 28800

and  I've to change the HASHSIZE to  ip_conntrack_max / 4 ...


What is wrong ! How can I solve the problem ...
I'm waiting for a server with 8Gb (8192) of ram  most of available to
use with conntrack !

Regards

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
This e-mail is privileged and may contain confidential information intended=
 only for the person(s) named above. If you receive this e-mail in error, p=
lease notify the sender immediately and delete it. E-mail and internet tran=
smissions can't be warrant privacy, integrity or correct reception. The sen=
der will not be liable for any damages resulting.=20

Este mensaje va dirigido, de manera exclusiva, a su destinatario y puede co=
ntener informaci=F3n confidencial. En caso de haber recibido este mensaje p=
or error, informe al emisor inmediatamente y proceda a su eliminaci=F3n. El=
 correo electr=F3nico y las comunicaciones por medio de Internet no permite=
n garantizar la confidencialidad de los mensajes transmitidos, as=ED como t=
ampoco su integridad o su correcta de recepci=F3n. El emisor no asume respo=
nsabilidad alguna por tales circunstancias.

Ce message est destin=E9 exclusivement =E0 son destinataire et peut conteni=
r des informations confidentielles. En cas de r=E9ception d'un tel message =
par erreur, informez l'exp=E9diteur imm=E9diatement et proc=E9dez =E0 son e=
ffacement. Il n'est pas possible de garantir la confidentialit=E9, l'int=E9=
grit=E9 ou la r=E9ception correcte du courrier =E9lectronique ainsi que des=
 communications par internet. L'exp=E9diteur ne peut =EAtre tenu pour respo=
nsable d'=E9ventuels dommages commis.


--------------000204010501090902000703
Content-Type: text/x-vcard; charset=utf-8;
 name="scramatte.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="scramatte.vcf"

begin:vcard
fn;quoted-printable:S=C3=A9bastien CRAMATTE
n;quoted-printable:CRAMATTE;S=C3=A9bastien
org:Zen Soluciones;IT and Network
adr;quoted-printable:4b;;Plaza Sandoval, 5 ;Murcia;Murcia;30004;Espa=C3=B1a
email;internet:scramatte@zensoluciones.com
title:Consultant
tel;work:+34968292965
tel;cell:+34627665283
x-mozilla-html:FALSE
url:http://www.zensoluciones.com
version:2.1
end:vcard


--------------000204010501090902000703--
