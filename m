From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: DNS with iptables
Date: Thu, 11 Dec 2003 10:00:28 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1071133228.796.31.camel@elendil.intranet.cartel-securite.net>
References: <4D365C260C742A4AABFBF2EE41B7E59F312D8D@itfbsv01.itservices.intern>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4D365C260C742A4AABFBF2EE41B7E59F312D8D@itfbsv01.itservices.intern>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="utf-8"
To: "Centkowski, Peter (SSFB)" <Peter.Centkowski@schmalz-schoen.de>
Cc: netfilter@lists.netfilter.org

Le ven 05/12/2003 =C3=A0 15:31, Centkowski, Peter (SSFB) a =C3=A9crit :
> Kann ich statt IP-Adresse auch ein Name in Iptables verwenden?
> Es geht um Dyndns und damit einem Problem=E2=80=A6

Please note this is a english speaking mailing list ;)

To your question... Yes, you can use a name in an iptables rule, but it
won't have the behaviour you want it to. Suppose you do :

	iptables -t nat -A POSTROUTING -p ppp0 \
		-j SNAT --to-source myhost.dyndns.org

Then, when you hit enter, iptables tools issues a DNS request so it can
resolve myhost.dyndns.org name to its IP. And it is this very IP that
will be used to create the rule within kernel. So, my rule is equivalent
to (as supposed myhost.dyndns.org resolves to 11.22.33.44) :

	iptables -t nat -A POSTROUTING -p ppp0 \
		-j SNAT --to-source 11.22.33.44

Afterwards, the rule won't be affected if IP attached to this name
changes, because the 11.22.33.44 is affected the same way it would be if
you had entered it directly.

So you have to find something else to update your firewall ruleset
whenever your IP changes. If you use PPP (RTC, RNIS or DSL access), you
can use ip-up and ip-down scripts to update your rule with new IP, that
is passed to the script as fourth parameter (see man 8 pppd). I used to
do this on my DSL access and it worked fine. At PPP link raise, I
updated my DynDNS account and my firewalling rules.

I've heard some DHCP clients provided the same functionnalities. I never
had a look at this situation.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!=20

