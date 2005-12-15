From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: DNAT to localhost
Date: Thu, 15 Dec 2005 15:59:41 +0100
Message-ID: <1134658781.4847.1.camel@anduril.intranet.cartel-securite.net>
References: <C43D74B62BA19A45ADD74C1AB7AEE542017BCEE1@nt-gws2.gws-muenster.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <C43D74B62BA19A45ADD74C1AB7AEE542017BCEE1@nt-gws2.gws-muenster.de>
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
To: "Steverding, Kai" <Kai.Steverding@gws.ms>
Cc: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

Le jeudi 15 d=E9cembre 2005 =E0 15:08 +0100, Steverding, Kai a =E9crit :
> iptables -t nat -I PREROUTING -p tcp -i eth0 -d 192.168.10.1/32 --dport 1=
10
> -j DNAT --to-destination 127.0.0.1

Not a solution to you, but a hint. REDIRECT target is just made for
this.

iptables -t nat -I PREROUTING -p tcp -i eth0 -d 192.168.10.1/32 \
			--dport 110 -j REDIRECT


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

