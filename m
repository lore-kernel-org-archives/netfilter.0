From: =?ISO-8859-1?Q?S=E9bastien_CRAMATTE?= <scramatte@zensoluciones.com>
Subject: require netfilter time patch for 2.6.18.3 kernel ... mine not works
 : time match: invalid size 0 != 16
Date: Wed, 13 Dec 2006 09:40:07 +0100
Message-ID: <457FBC67.3040802@zensoluciones.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------000203020701070608070603"
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.
--------------000203020701070608070603
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello


I've applied the netfilter time patch to my 2.6.18.3 kernel.
I use a  2.6.18.3 from kernel.org (I mean not a distribution package)
+iptables 1.3.6 debian sarge backport from backports.org

in the iptables package,the time patch is included ( libipt_time.c,
.test-time)
but include/linux/netfilter_ipv4/ipt_time.h is required too and this
file is not available in my kernel.

I've trie with pom without success because try to apply many patch
except the time patch ...
So I've search on google and I found one! It applied correctly and I can
compile my kernel ...

What happens is that seems that the time patch is incompatible with
2.6.18.3 kernel
I found on google a post that tell this patch works with a 2.16.15 but
not with 2.6.17 due to change on somes internals kernel features

As you can see the patch is detected :

#iptables -m time --help
...
TIME v1.3.6 options:
 [ --timestart value ] [ --timestop value] [ --days listofdays ] [
--datestart value ] [ --datestop value ]
          timestart value : HH:MM (default 00:00)
          timestop  value : HH:MM (default 23:59)
                            Note: daylight savings time changes are not
tracked
          listofdays value: a list of days to apply
                            from Mon,Tue,Wed,Thu,Fri,Sat,Sun
                            Coma speparated, no space, case sensitive.
                            Defaults to all days.
          datestart value : YYYY[:MM[:DD[:hh[:mm[:ss]]]]]
                            If any of month, day, hour, minute or second =
is
                            not specified, then defaults to their smalles=
t
                            1900 <=3D YYYY < 2037
                               1 <=3D MM <=3D 12
                               1 <=3D DD <=3D 31
                               0 <=3D hh <=3D 23
                               0 <=3D mm <=3D 59
                               0 <=3D ss <=3D 59
          datestop  value : YYYY[:MM[:DD[:hh[:mm[:ss]]]]]
                            If the whole option is ommited, default to
never stop
                            If any of month, day, hour, minute or second =
is
                            not specified, then default to their smallest


Unfortunately when I try to apply somes rules I obtain this

#iptables -A OUTPUT -m time --timestart 16:11
iptables: Invalid argument

and this in "dmesg"

Dec 12 18:37:05 gestor1 kernel: ip_tables: time match: invalid size 0 !=3D=
 16
Dec 12 18:37:09 gestor1 kernel: ip_tables: time match: invalid size 0 !=3D=
 16
Dec 12 18:37:51 gestor1 kernel: ip_tables: time match: invalid size 0 !=3D=
 16


This patch should be very usefull for me. My customers ask me for this
features on QOS anf firewall appliances.

I hope that someone can propose me a solution.
seems that the orginal author doesn't maitain this patch ?


S=E9bastien










--=20
ZEN SOLUCIONES - Be in XForms take your "Concentr=E9"
S=E9bastien CRAMATTE

C/ Alfonso X el Sabio, 29
30565 Las Torres de Cotillas (Murcia)
ESPA=D1A

Mobile : +34 627 66 52 83

E-mail : scramatte@zensoluciones.com
Site : www.zensoluciones.com

Skype : scramatte
Msn : scramatte@hotmail.com
Jabber: scramatte@jabber.org
VoIP: +33 1 7090 3413
--

CONCENTR=C9
xml entreprise grade framework
http://concentre.zensoluciones.com

--
This e-mail is privileged and may contain confidential information
intended only for the person(s) named above. If you receive this e-mail
in error, please notify the sender immediately and delete it. E-mail and
internet transmissions can't be warrant privacy, integrity or correct
reception. The sender will not be liable for any damages resulting.

Este mensaje va dirigido, de manera exclusiva, a su destinatario y puede
contener informaciones confidential. En caso de haber recibido este
mensaje por error, informe al emisor imediadamente y proceda a su
eliminaci=F3n. El correo electr=F3nico y las comunicaciones por medio de
Internet no permiten garantizar la confidencialidad de los mensajes
transmitidos, as=ED como tampoco su integridad o su correcta recepci=F3n.=
 El
emisor no asume responsabilidad alguna por tales circunstancias.

Ce message est destin=E9 exclusivement =E0 son destinataire et peut conte=
nir
des informations confidentielles. En cas de r=E9ception d'un tel message
par erreur, informez l'exp=E9diteur imm=E9diatement et proc=E9dez =E0 son
effacement. Il n'est pas possible de garantir la confidentialit=E9,
l'int=E9grit=E9 ou la r=E9ception correcte du courrier =E9lectronique ain=
si que
des communications par internet. L'exp=E9diteur ne peut =EAtre tenu pour
responsable d'=E9ventuels dommages commis.

--------------000203020701070608070603--

