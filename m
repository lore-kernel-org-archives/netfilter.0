From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Server can't send :-/
Date: Thu, 04 Sep 2003 13:52:39 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1062676358.7531.21.camel@elendil.intranet.cartel-securite.net>
References: <001801c371ee$abce1230$0000fea9@kessler.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001801c371ee$abce1230$0000fea9@kessler.local>
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
To: "yomega.info - Stephan Kessler" <sk@yomega.info>
Cc: netfilter@lists.netfilter.org

Le mer 03/09/2003 =E0 09:40, yomega.info - Stephan Kessler a =E9crit :
> I got that Configuration of my Firewall:
> http://warpy.yomeganet.biz/fw.txt
> It seemed to be nice, everything worked but then i tried to initiate
> outbound Traffic from my Server via SSH. The result: I can't establish
> any connection from my to an another, except DNS (via UDP?). What did i
> wrong?

Returning packets will get dropped by last rule, for they are not
destined to any of accepted ports. You have to add a rule to accept them
explicitly, such as one using ESTABLISHED and RELATED states.

By the way, I don't understand why your chains policy are all set to
ACCEPT... In particular, OUTPUT rules are useless for they only ACCEPT
in an ACCEPT policy chain ! Moreover, in INPUT chain, you implicitly
allow any layer 4 protocol that is not TCP or ICMP (remember that trojan
catched by Honeynet project that used IP protocol 11 for
communications...).

What I would do is :

	1. set all chains policy to DROP :
		iptables -P INPUT DROP
		iptables -P OUTPUT DROP
		iptables -P FORWARD DROP

	2. get rid of 2 last DROP rules (DROP handled by policy) and
	   optionnaly add a specific rule for each protocol you really
	   need to allow (UDP, GRE, ESP, etc.).

	3. insert an ESTABLISHED, RELATED state ACCEPT at the top of
	   INPUT rule :
		iptables -I INPUT -m state --state ESTABLISHED,RELATED \
			-j ACCEPT

	4. invert OUTPUT rules order for optimization (far more valid
	   packets are likely to match second rule than first one) :
		iptables -D OUTPUT 2
		iptables -I OUTPUT -m state --state \
			ESTABLISHED,RELATED -j ACCEPT

	5. add a NEW state match to all ACCEPT rules for services

My 0.02=A4

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

