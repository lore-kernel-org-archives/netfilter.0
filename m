From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Configure my firewall
Date: Wed, 17 Mar 2004 11:46:56 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1079520416.3615.38.camel@anduril.intranet.cartel-securite.net>
References: <20040317093541.C8A5BC154@postfix3-2.free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040317093541.C8A5BC154@postfix3-2.free.fr>
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
To: nicolas boussekeyt <nicolas.boussekeyt@free.fr>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Le mer 17/03/2004 =E0 10:37, nicolas boussekeyt a =E9crit :
> Hi, I want filter my firewall for raleka worm.
> Actually, i have used :
> iptables -A FORWARD -p tcp -i $EXTIF --dport 135 -j DROP
> iptables -A FORWARD -p tcp -i $EXTIF --dport 135 -j LOG
[...]
> But the worm is back.

Do you mean that FORWARD policy is set to ACCEPT and only thoses ports
are blocked ? If so, you have a _major_ misconfiguration, as you should
block _everything_ first and then only accept what is OK for you.

I am not aware of your need of course, but I don't think you need your
LAN stations :

	. being accessible on TCP/135 from the Internet (needed for the
	  worm to infect)
	. being accessible on TCP/32767 from the Internet (needed for
	  the backdoor to be accessible)

Furthermore, if the worm comes back, that means that your stations are
still vulnerable. It may be time to patch...
If the rules you gave are not overriden by another, as we do not have
your complete ruleset to check its consistency, this means you still
have an infected host inside your LAN that on one hand continue to
infect other hosts and on the other hand may has its backdoor
potentially reachable from the Internet as you do not block all upper
32767 ports.

So, things to do :

	. shut the Internet down
	. clean and patch all your boxes (see Antony's post to both
	  Symantec and MS advisory)
	. have a full rewrite of filtering ruleset


--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

