From: "DELORT Stephane" <Stephane.DELORT@murex.com>
Subject: RE: state ESTABLISHED,RELATED ignored within a bridge
Date: Thu, 5 Jan 2006 18:11:37 +0100
Message-ID: <200601051713.k05HD7TB004486@zig.murex.com>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="iso-8859-1"
To: cbrenton@chrisbrenton.org
Cc: netfilter@lists.netfilter.org


 Hi chris,

 the default policy is to accept any outgoing traffic.
=20
 however, ping and telnet work fine before I add one of these rules.
=20
 ++
 St=E9phane
=20

-----Message d'origine-----
De : Chris Brenton [mailto:cbrenton@chrisbrenton.org]
Envoy=E9 : jeudi 5 janvier 2006 18:04
=C0 : DELORT Stephane
Cc : netfilter@lists.netfilter.org
Objet : Re: state ESTABLISHED,RELATED ignored within a bridge


On Thu, 2006-01-05 at 17:02 +0100, DELORT Stephane wrote:
>
>  when I use a rule :
>    $IPTABLES -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
>    $IPTABLES -A INPUT -j DROP
>=20
>  The server cannot ping or telnet any other host !=20

This only lets replies back through. You need a rule that permits the
initial session establishment as well. (ICMP type 8 and TCP/23).

HTH,
Chris



