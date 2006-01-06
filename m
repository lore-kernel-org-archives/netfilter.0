From: "DELORT Stephane" <Stephane.DELORT@murex.com>
Subject: RE: state ESTABLISHED,RELATED ignored within a bridge
Date: Fri, 6 Jan 2006 09:21:27 +0100
Message-ID: <200601060823.k068MwTB021814@zig.murex.com>
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
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: cbrenton@chrisbrenton.org, netfilter@lists.netfilter.org


 Thank you Cedric,

 I already know this and the bridge is working fine.
 The problem occurs with the br0 interface through which I cannot reach =
anything once the $IPTABLES -A INPUT -j DROP is activated.
 Output is in accept mode and established,related packets are to be =
accepted - while they are obvisouly not, and this is the problem.

 Regards,
 St=E9phane
=20


-----Message d'origine-----
De : Cedric Blancher [mailto:blancher@cartel-securite.fr]
Envoy=E9 : jeudi 5 janvier 2006 23:00
=C0 : DELORT Stephane
Cc : cbrenton@chrisbrenton.org; netfilter@lists.netfilter.org
Objet : RE: state ESTABLISHED,RELATED ignored within a bridge


Le jeudi 05 janvier 2006 =E0 18:11 +0100, DELORT Stephane a =E9crit :
>  the default policy is to accept any outgoing traffic.
>  however, ping and telnet work fine before I add one of these rules.

Bridged traffic is seen in FORWARD chain, not INPUT nor OUTPUT.


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: =
FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

