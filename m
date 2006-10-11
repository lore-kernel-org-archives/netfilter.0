From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Redirecting incoming packets to other port
Date: Wed, 11 Oct 2006 12:04:52 +0200
Message-ID: <1160561093.3906.17.camel@anduril.intranet.cartel-securite.net>
References: <c936c6b70610110109v73453362h65b8e34d6771dadd@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <c936c6b70610110109v73453362h65b8e34d6771dadd@mail.gmail.com>
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
To: Holger Kinkelin <holger.kinkelin@gmail.com>
Cc: netfilter@lists.netfilter.org

Le mercredi 11 octobre 2006 =E0 10:09 +0200, Holger Kinkelin a =E9crit :
> I tried: iptables -A PREROUTING -t nat -p udp --dport 5060 --sport
> 5060 -j DNAT --to-destination 192.168.0.21:5063
> This rule is accepted but doesn't do anything. There are no other
> rules that could cause side effects.

Is your filtering ruleset consistent with this ? I.e. are theses packets
allowed by a FORWARD or INPUT rule ? If you want to redirect traffic to
your host, you can give a try to REDIRECT target.


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

