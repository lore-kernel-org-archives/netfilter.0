From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: RE: state ESTABLISHED,RELATED ignored within a bridge
Date: Thu, 05 Jan 2006 22:59:52 +0100
Message-ID: <1136498392.6695.5.camel@anduril.intranet.cartel-securite.net>
References: <200601051713.k05HD7TB004486@zig.murex.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200601051713.k05HD7TB004486@zig.murex.com>
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
To: DELORT Stephane <Stephane.DELORT@murex.com>
Cc: cbrenton@chrisbrenton.org, netfilter@lists.netfilter.org

Le jeudi 05 janvier 2006 =E0 18:11 +0100, DELORT Stephane a =E9crit :
>  the default policy is to accept any outgoing traffic.
>  however, ping and telnet work fine before I add one of these rules.

Bridged traffic is seen in FORWARD chain, not INPUT nor OUTPUT.


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

