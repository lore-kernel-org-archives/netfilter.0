From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: PPP over Ethernet (PPPoE)... what ports does it need open for
	netfilter?
Date: 30 Jan 2003 08:38:35 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1043912314.20157.2.camel@elendil.intranet.cartel-securite.net>
References: <20030129150633.B14273@spawar.navy.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030129150633.B14273@spawar.navy.mil>
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
To: seberino@spawar.navy.mil
Cc: netfilter@lists.netfilter.org

Le jeu 30/01/2003 =E0 00:06, seberino@spawar.navy.mil a =E9crit :
> I'm having trouble converting an old static ip=20
> iptables script to PPPoE/DSL.
> Does PPPoE/DSL need more ports open I don't
> know about???  That would explain lots.

PPPoE does not need any port, for it is a layer 2 concept. You do not
ever need an IP on the interface that supports your PPPoE link.

While I do not think this is an accurate place to discuss this, I can
point you to http://www.roaringpenguin.com/pppoe/ where you'll find very
usefull documentation stuff.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
Consultant en s=E9curit=E9 des syst=E8mes et r=E9seaux  - Cartel S=E9curi=
t=E9
T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE


