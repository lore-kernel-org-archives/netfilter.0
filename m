From: "Wacker, Klaus" <Klaus.Wacker@inteq.com>
Subject: getting iptables into embedded kernel
Date: Tue, 31 Jul 2007 10:54:34 +0200
Message-ID: <4244373FF2155241B4AEDE42D89F665DDB8431@MSGCELMBX.ent.bhicorp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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

> How to get iptables into a ppc kernel (2.6, netfilter
> enabled) and where to store what to have functionality from the
> start?
> I used NO_SHARED_LIBS=3D1
> I am able to download start the kernel, but do not find iptables.

AFAIK you cannot.
Iptables is a *user*space utility to configure the Netfilter framework
and I don't see how you'd compile that into the kernel.


Rob


Ok, I am a little confused with kernel modules. Anyhow I would like to
do something like this here (from the install):=20
"
4) If you want to build a statically linked version of the iptables
binary,
   without the need for loading the plugins at runtime (e.g. for an
embedded
   device or router-on-a-disk), please use

	% make NO_SHARED_LIBS=3D1
"

and I get a rather large executable binary (700kB). But I can't execute
this nor do I know how to make it run inside my target.
Klaus


Baker Hughes INTEQ GmbH
Baker-Hughes-Strasse 1, D - 29221 Celle
Tel.: +49 5141 203 0, Fax: +49 5141 203 296
Sitz der Gesellschaft: Celle, Amtsgericht Lueneburg HRB 100845
Geschaeftsfuehrer: Hermann Rathkamp, Ruediger Lichte, Friedhelm Makohl, Dr.=
 Hans-Werner Hesse

Diese Nachricht ist ausschliesslich fuer die Person oder Organisation besti=
mmt, an die sie adressiert ist. =20
Sie kann herstellerspezifische, nur fuer bestimmte Personen bestimmte,  ver=
trauliche oder andere Informationen enthalten,=20
die kraft Gesetzes nicht offen gelegt werden muessen.  Wenn Sie nicht der i=
n der Adresse genannte Empfaenger sind oder=20
versehentlich in der Adresszeile angesprochen werden, sind Sie nicht berech=
tigt, diese Nachricht oder Teile davon zu lesen,=20
zu drucken, aufzubewahren, zu kopieren oder zu verbreiten.  Sollten Sie die=
se Nachricht irrtuemlich erhalten haben,=20
benachrichtigen Sie bitte den Absender umgehend per Email und vernichten Si=
e saemtliche Kopien der Nachricht.=20
 =20
This message is intended exclusively for the individual or entity to which =
it is addressed. This communication may contain=20
information that is proprietary, privileged or confidential or otherwise le=
gally exempt from disclosure.=20
If you are not the named addressee, or have been inadvertently and erroneou=
sly referenced in the address line=20
you are not authorized to read, print, retain, copy or disseminate this mes=
sage or any part of it.=20
If you have received this message in error, please notify the sender immedi=
ately by e-mail and delete all copies of the message.=20

DISC-GER-A


