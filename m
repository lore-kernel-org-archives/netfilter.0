From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: FORWARD rules
Date: Fri, 12 Sep 2003 12:45:34 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1063363533.879.52.camel@elendil.intranet.cartel-securite.net>
References: <20030910175253.GA2752@linux.local>
	 <1063260568.26703.1.camel@risingsun.penguindia.com>
	 <20030912100957.GA3360@linux.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030912100957.GA3360@linux.local>
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
To: Payal Rathod <payal-iptables@staticky.com>
Cc: "Vishwanatn T. K." <tkvishy@yahoo.com>, netfilter@lists.netfilter.org

Le ven 12/09/2003 =E0 12:09, Payal Rathod a =E9crit :
> Just confirming this from all. Please check whether this is ok.
[...]
> $IPTABLES -A INPUT -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT

With this rule, you will just accept anything, except INVALID packets
that are quite uncommon (very most of them are ICMP).

> $IPTABLES -A FORWARD -s 125.125.125.0/32 -p tcp -m tcp --dport 53 -j AC=
CEPT
> $IPTABLES -A FORWARD -s 125.125.125.0/32 -p udp -m tcp --dport 53 -j AC=
CEPT
> $IPTABLES -A FORWARD -s 125.125.125.0/32 -p tcp -m tcp --dport 80 -j AC=
CEPT
> $IPTABLES -A FORWARD -s 125.125.125.0/32 -p tcp -m tcp --dport 110 -j A=
CCEPT

Thoses rules won't get reached, as first one accept all packets. You
should consider this instead :

$IPTABLES -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -m state --state NEW -s 125.125.125.0/32 -p tcp \
	-m tcp --dport 53 -j ACCEPT
$IPTABLES -A FORWARD -m state --state NEW -s 125.125.125.0/32 -p udp \
	-m tcp --dport 53 -j ACCEPT
$IPTABLES -A FORWARD  -m state --state NEW -s 125.125.125.0/32 -p tcp \
	-m tcp --dport 80 -j ACCEPT
$IPTABLES -A FORWARD  -m state --state NEW -s 125.125.125.0/32 -p tcp \
	-m tcp --dport 110 -j ACCEPT

Keeping ESTABLISHED,RELATED rule at top of ruleset is an optimization,
as most packet you will receive will have ESTABLISHED state. It's better
to treat them early so they don't go through the whole chain.

> echo "1" > /proc/sys/net/ipv4/ip_forward
>=20
> $IPTABLES -P FORWARD ACCEPT
> 		     ^^^^^^
> $IPTABLES -A INPUT -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT

Same than below. It's about the same than an policy set to ACCEPT...

> Can I now change the ACCEPT statement to DROP without any fear?

Sure.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

