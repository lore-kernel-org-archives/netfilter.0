From: Felix Joussein <felix@joussein.com>
Subject: D-LINK 504T DSL Router
Date: Tue, 07 Feb 2006 16:25:37 +0100
Message-ID: <1139325937.7825.28.camel@ntb-joussein-01.home.joussein.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hello List,

I want to make the following issue public:

D-LINK sells a 100% native linux-based DSL Modem/Router "D-LINK 504T"
WHen I bought that router, I didn't know, that it is linux based... but
the price was fine.

I installed the router, configured it for PPPOA (ADSL Austria) and
figured out, regarding the "Systemlog"-tab in the web admin surface,
that the debugging message looks quiet like syslogd and ppp messages.

So I telnetet the router - and yes, it's linux.

As long as you connect with Windows XP 2000 clients, all fine, but then
I plugged a Linux PC to it, and except a ping nothing worked, so I
checked the iptables rules: except the MASQUERADING in the postrouting
table no rules where set and all chains set to ACCEPT.

I connected a second linux client - same thing, the VMWare on that linux
client was able to connect... so... tell me, whats wrong with that
device?

So I sent a support request to D-LINK.
Unfortunatly it's german, but I'm sure, some of you will be able to read
it.

Mainly I want to reach Harald Velte as he gave an interview to the
german "Linux Magazine" regarding the GPL License, DLINK didn't shipp
with their products - at least, now they do that.



So: Here beginns the message:=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Sehr geehrter Kunde,

zu Ihrer Anfrage:

 Habe ADSL Router an ADSL Anschluss von Provider Tele2 in =D6sterreich
angeschlossen.
Habe 2 PCs, einer mit Linux einer mit Windows 2000
Funktioniert unter Windows einwandfrei , aber nicht unter Linux (no
chance!).
Auch ein Bekannter der Linux Server berufsm=E4=DFig installiert und
konfiguriert
konnte das Problem nicht l=F6sen.
Bitte um Hilfe.

haben wir folgende Antwort f=FCr Sie:

 Der DSL-504T ist leider nicht kompatibel mit Linux.

>>>>>>>>>>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
>> Meaning: "The DSL-504T unfortunatly is not compartible with linux" <<
>>>>>>>>>>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


Davon ausgehend, das Ihnen diese Antwort helfen wird haben wir Ihre
Anfrage
geschlossen.=20
Diese Informationen finden Sie auch in unserem Support-Portal unter
http://service.dlink.biz



Ihr D-Link Support Team=20

PS: Sollten Sie weitere Fragen zu dieser Anfrage haben, antworten Sie
uns
bitte mit dieser eMail ohne die Betreff Zeile zu ver=E4ndern und l=F6schen
Sie
den
Textbereich f=FCr Ihre neue Information an uns.=20
Wir werden den Vorgang umgehend wieder in Bearbeitung nehmen. (abx)

GEBEN SIE UNS EINE NOTE
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Lieber Kunde,

in unserem st=E4ndigen Bem=FChen unseren Support weiter zu verbessern bitten
wir
um Ihre Unterst=FCtzung.
Bitte nehmen Sie sich 2 Minuten Zeit, folgen sie dem Link und bewerten
Sie
die von uns erhaltene Support Leistung.
=20
http://imn-client.ch/137/online_umfrage.htm

Die Umfrage erfolgt anonym, die erhaltenen Daten nutzen wir
ausschlie=DFlich
zur Beurteilung der Qualit=E4t unseres Supports.
Ihre Mausklicks zeigen uns ob und wie Sie mit uns zufrieden waren, bzw.
wo
wir uns verbessern k=F6nnen.

Herzlichen Dank f=FCr Ihre Unterst=FCtzung.

Ihr D-Link Support Team
D-Link Central Europe

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

I'm realy upset...=20
Harald: maybe the netfilter core team can do something against that?




--=20
mit freundlichen Gr=FC=DFen,

Felix Joussein


