From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: FORWARD rules
Date: Mon, 15 Sep 2003 09:56:22 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1063612582.928.17.camel@elendil.intranet.cartel-securite.net>
References: <20030910175253.GA2752@linux.local>
	 <1063260568.26703.1.camel@risingsun.penguindia.com>
	 <20030912100957.GA3360@linux.local>
	 <1063363533.879.52.camel@elendil.intranet.cartel-securite.net>
	 <20030912163656.19b9fb66.arnt@c2i.net>
	 <1063378301.888.66.camel@elendil.intranet.cartel-securite.net>
	 <20030912201425.25ca0ab4.arnt@c2i.net> <20030913022658.GD1667@linux.local>
	 <20030913084256.73dc4a3d.arnt@c2i.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030913084256.73dc4a3d.arnt@c2i.net>
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
To: Arnt Karlsen <arnt@c2i.net>
Cc: netfilter@lists.netfilter.org

Le sam 13/09/2003 =E0 08:42, Arnt Karlsen a =E9crit :
> ..wrong snippet.  ;-)  Reread the thread, and you'll see both I=20
> and Cedric weren't to clear on that we meant to say, we _implied_=20
> things instead of actually _saying_ them

So, for the things to get clear, the whole script should be[1] :


$IPTABLES -P FORWARD DROP
$IPTABLES -P INPUT DROP

$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -m state --state NEW -s 125.125.125.0/32 -p tcp \
        -m tcp --dport 53 -j ACCEPT
$IPTABLES -A FORWARD -m state --state NEW -s 125.125.125.0/32 -p udp \
        -m tcp --dport 53 -j ACCEPT
$IPTABLES -A FORWARD  -m state --state NEW -s 125.125.125.0/32 -p tcp \
        -m tcp --dport 80 -j ACCEPT
$IPTABLES -A FORWARD  -m state --state NEW -s 125.125.125.0/32 -p tcp \
        -m tcp --dport 110 -j ACCEPT

$IPTABLES -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

echo "1" > /proc/sys/net/ipv4/ip_forward


A -m state --state NEW,ESTABLISHED,RELATED _should not_ be used, as it's
an quasi-generic full match (i.e. nearly matches all packets).


[1] Note I did a typo in my
<1063363533.879.52.camel@elendil.intranet.cartel-securite.net> post,
it's FORWARD, not INPUT...

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

