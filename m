From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: strange behaviour
Date: Mon, 26 Feb 2007 16:07:55 +0000
Message-ID: <1172506075.4265.145.camel@anduril.intranet.cartel-securite.net>
References: <416274.29873.qm@web36802.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <416274.29873.qm@web36802.mail.mud.yahoo.com>
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
To: angico <angico@yahoo.com>
Cc: netfilter@lists.netfilter.org

Le lundi 26 f=E9vrier 2007 =E0 07:35 -0800, angico a =E9crit :
> hi, buddys. thanks for your attention, but...
> nothing works, yet. and this option "--clamp-mss-to-pmtu" just send me an=
 error: "iptables: Invalid argument".=20
> angico.

My mistake.
As Pascal stated, you have to specify a "-p tcp --tcp-flags SYN,RST SYN"
as well, as TCPMSS clamping only works on TCP packets with SYN flag set:

        iptables -t mangle -A FORWARD -o ppp0 -p tcp \
           --tcp-flags SYN,RST SYN -j TCPMSS --clamp-mss-to-pmtu

It should work better.


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

