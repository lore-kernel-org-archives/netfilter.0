From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: iptables on Satellite receive only linux PC
Date: Wed, 28 Jul 2004 08:11:13 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1090995073.2141.35.camel@anduril.intranet.cartel-securite.net>
References: <410736B8.D9130BBF@neduet.edu.pk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <410736B8.D9130BBF@neduet.edu.pk>
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
To: yunus <yunus@neduet.edu.pk>
Cc: netfilter@lists.netfilter.org

Le mer 28/07/2004 =E0 07:16, yunus a =E9crit :
> In my last post I got good suggestions. Unfortunately they dont work.
> This is a linux PC with satellite receive only card. The router is also
> on the same network that is taking the traffic outside. Linux PC runnin=
g
> iptables has a satellite receive only pentanet card (data is received
> and transmitted through cisco router.)

Juste a bet. Have you desactivated reverse path filtering that does not
allow asymetric routing from working ?

	echo 0 > /proc/sys/net/ipv4/conf/all/rp_filters


--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

