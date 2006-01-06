From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: RE: state ESTABLISHED,RELATED ignored within a bridge
Date: Fri, 06 Jan 2006 15:18:48 +0100
Message-ID: <1136557128.30718.0.camel@anduril.intranet.cartel-securite.net>
References: <200601060823.k068MwTB021814@zig.murex.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200601060823.k068MwTB021814@zig.murex.com>
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

Le vendredi 06 janvier 2006 =E0 09:21 +0100, DELORT Stephane a =E9crit :
>  The problem occurs with the br0 interface through which I cannot
> reach anything once the $IPTABLES -A INPUT -j DROP is activated.

From which machine can't you reach anything ? The bridge ? Or any LAN
host behind the bridge ?


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

