From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: strange behaviour
Date: Mon, 26 Feb 2007 17:18:01 +0100
Message-ID: <1172506681.4265.155.camel@anduril.intranet.cartel-securite.net>
References: <20070226124547.69013.qmail@web36804.mail.mud.yahoo.com>
	<45E2F479.7020804@plouf.fr.eu.org>
	<1172502565.4265.118.camel@anduril.intranet.cartel-securite.net>
	<45E2FE20.90701@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45E2FE20.90701@plouf.fr.eu.org>
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
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@lists.netfilter.org

Le lundi 26 f=E9vrier 2007 =E0 16:34 +0100, Pascal Hambourg a =E9crit :
> TCPMSS works only on TCP packets with the SYN flag set, so the options=20
> "-p tcp --tcp-flags SYN,RST SYN" are required.

Indeed.

> Also, wouldn't it be useful to do it in both directions to avoid=20
> fragmentation if host (b) does not use path MTU discovery ?

No, because you don't want to clamp inbound traffic to your MTU, but to
your peer MTU. It's your peer job to advertise correctly its own MSS.

Now, if you look more closely, you'll see you clamp MSS against
destination PMTU. As PMTU from your firewall to your server is most
probably ethernet MTU, you will clamp it to 1500. So, if your peer
advertise 1452 as MSS, you will overwrite it to a higher value of 1460
and break everything.


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

