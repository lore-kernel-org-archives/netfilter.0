From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: FW: Allowing FTP and internal but nothing else
Date: Wed, 03 Mar 2004 19:46:42 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1078339602.2601.91.camel@anduril.intranet.cartel-securite.net>
References: <4A8849EC2E153F41B6CECD20C81BC63BD11E76@wolfcreek.skld.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4A8849EC2E153F41B6CECD20C81BC63BD11E76@wolfcreek.skld.net>
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
To: Paul Harlow <pharlow@skld.com>
Cc: netfilter@lists.netfilter.org

Le mer 03/03/2004 =E0 19:08, Paul Harlow a =E9crit :
> As I said I'm severly new to IPTables so it's all expirementation now
> and I would never have been able to come up with your last lines here.
> I have used www.netfilter.org to get where I am this far.

I strongly advise you read Oskar Andreasson iptables tutorial at :

	http://iptables-tutorial.frozentux.net/

This is a very good document, accessible for a beginner, that explains
both syntax and concepts. A must read if you want to produce strong
ruleset for Netfilter.

> My question about your "full ruleset" of:
> iptables -P INPUT DROP
> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A INPUT -i eth0 -m state --state NEW -j ACCEPT
> iptables -A INPUT -i eth1 -m state --state NEW -p tcp --dport 21 --syn
> -j ACCEPT
> This doesn't appear to cover TCP port 20 for ftp-data conns. Or would
> that be covered by the RELATED tag?

Yes, that's it.
Matching states allows you to cope with connection initiation (NEW
state), following packets (ESTABLISHED state) and, for protocols such as
FTP, related connections establishment (RELATED state). RELATED state
also covers ICMP errors. So my rules will cover full FTP session, both
command and data connection, and ICMP error that could be raised during
transit.

You'll see Netfilter conntrack is very powerful as it allows you to
produce strong ruleset easily.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

