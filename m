From: "Tanen" <tanen@tanen.dyndns.org>
Subject: RE : [IP ?] what ip must be filtered ?
Date: Thu, 11 Dec 2003 12:42:34 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <015501c3bfdb$de9c8ad0$02fea8c0@ALESK>
References: <200312111123.27777.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200312111123.27777.Antony@Soft-Solutions.co.uk>
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
To: 'Antony Stone' <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.netfilter.org

Hellon
Thanks for your help,
This dedicated box, is on my local network, but don't be a reuters, just =
a
server, i have a hard reuters, with hard firewall integrate in this =
reuters.
My question is not realy clear, i try again to explain it :
I want block, all attack, and all flood or other shit related to the
hackers, of my server, for this, i have only forward few ports on my
hardware reuters, 80, 110, 25, 143, 21, 53, 443, 993, all others are =
blocked
by the hardware firewall. Now i want prevent any thing would be attempt =
by
using this ports. So i want create an firewall for prevent this, and
authorise ALL traffic in the local network, but filtering the outgoing
packets from the server, for not allow any other things that the things
requested by the puters itself. I'm not sure to be clear if no, i can =
try
again to explain it, but i'm not speaking english very well, that's not =
my
main language. I'm a realy begginer to Iptables, and a novice to Linux. =
Ihe
local network, but filtering the outgoing packets from the server, for =
not
allow any other things that the things requested by the puters itself. =
I'm
not sure to be clear if no, i can try again to explain it, but i'm not
speaking english very well, that's not my main language. I'm a realy
begginer to Iptables, and a novice to Linux. I'm listening ALL help ... =
:)
and any help would be appreciated.

Thanks in advance for any help from anyone :)

Sincerely,
Tanen.

---> -----Message d'origine-----
---> De=A0: netfilter-admin@lists.netfilter.org [mailto:netfilter-
---> admin@lists.netfilter.org] De la part de Antony Stone
---> Envoy=E9=A0: jeudi 11 d=E9cembre 2003 12:23
---> =C0=A0: netfilter@lists.netfilter.org
---> Objet=A0: Re: [IP ?] what ip must be filtered ?
--->=20
---> On Thursday 11 December 2003 8:58 am, Tanen wrote:
--->=20
---> > Hello,
---> >
---> > I'm confused, i try to set up my Firewall, with iptables sure :)
---> > The problem, an easy problem to solve for you, but a big for me, =
it's
---> the
---> > next :
---> > I have an Dedicated server, Linux, on an internal local network, =
who
---> have
---> > as ip 192.168.0.1, and other puters have 192.168.0.2 *.3 *.4 etc =
...
---> BUT
---> > the dedicated box, use the reuters of my connection to be =
connected
---> to
---> > internet. This reuters have as ip 192.168.0.100, and my external =
ip
---> have as
---> > ip 63.*.*.*, my problem is to know, WHAT ip i must filter, to =
prevent
---> of
---> > any attack or hack, the reuters is forwarding the needed port =
(http,
---> > pop/imap/smpt) to the dedicated box. All work fine sure. But what =
IP
---> i must
---> > filtered, and authorised for have my firewall working fine ? =
actualy
---> when
---> > i'm filtering my local ip, or my external ip, my mail server, =
isn't
---> getting
---> > any mail from www, someone can help me please ?
--->=20
---> The simplest way to do what you want is not to think about IP =
addresses
---> so
---> much as which interface they're connected to.
--->=20
---> Let's assume that your firewall has 192.168.0.100 on eth0 (private,
---> internal)
---> and 63.x.y.z on eth1 (public, external)
--->=20
---> Then a good start to your ruleset would be:
--->=20
---> iptables -P FORWARD DROP
---> iptables -A FORWARD -i eth0 -o eth1 -j ACCEPT
---> iptables -A FORWARD -i eth1 -o eth0 -m state --state
---> ESTABLISHED,RELATED -j
---> ACCEPT
---> iptables -A POSTROUTING -t nat -o eth1 -j SNAT --to 63.x.y.z
--->=20
---> An improvement on the above rules would be to be more restrictive =
about
---> what
---> traffic you allow from internal clients to the Internet, however =
this
---> is a
---> start.
--->=20
---> If you don't understand anything about the above rules feel free to =
ask
---> again.
--->=20
---> Antony.
--->=20
---> --
---> It is also possible that putting the birds in a laboratory setting
---> inadvertently renders them relatively incompetent.
--->=20
--->  - Daniel C Dennet
--->=20
--->                                                      Please reply =
to
---> the list;
--->                                                            please =
don't
---> CC me.
--->=20



