From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: logging/preventing RST as in US-CERT TA04-111A
Date: Thu, 22 Apr 2004 16:20:02 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1082643602.1826.60.camel@anduril.intranet.cartel-securite.net>
References: <20040422132701.87006.qmail@web21411.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040422132701.87006.qmail@web21411.mail.yahoo.com>
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
To: unor <unorlist@yahoo.com>
Cc: netfilter@lists.netfilter.org

Le jeu 22/04/2004 =E0 15:27, unor a =E9crit :
> Will something like:
> $IPTABLES -A INPUT -p tcp --tcp-flags RST -m state
> --state NEW -j LOG
> Log "RST injection" packets potentially explointing
> that mentioned in US-CERT TA04-111A?  If not, any
> ideas?

Nope.

First, the rule should be :

	$IPTABLES -A INPUT -p tcp --tcp-flags RST RST \
		-m state --state NEW -j LOG

So you won't get this error :

iptables v1.2.9-20040302: --tcp-flags requires two args.
Try `iptables -h' or 'iptables --help' for more information.

;@


To get serious... This rule will show you RST that don't have the
correct tuple (src IP, src port, dst IP, dst port) for targeted
connection.

If RST has correct tuple, I don't know how it will get handled by
conntrack, since it does not track TCP window for stock kernel. Maybe
someone could answer here. Will RST get caught and conntrack entry
dropped ? I'm too lazy to check code ;)

If you patch your kernel with TCP windows tracking, out of windows RST
should get INVALID state (I may be wrong), so you can match them and
LOG.

BTW, you won't be able to spot successful ones...


--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

