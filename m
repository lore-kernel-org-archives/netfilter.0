From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: two negatived parameters
Date: Mon, 06 Sep 2004 11:00:19 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094461219.2309.24.camel@anduril.intranet.cartel-securite.net>
References: <7421.1094459312@www2.gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <7421.1094459312@www2.gmx.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: Akolinare@gmx.net
Cc: netfilter@lists.netfilter.org

Le lun 06/09/2004 =E0 10:28, Akolinare@gmx.net a =E9crit :
> I create a rule, which should only match if source and destination are =
not
> the given. I think that it is easy and try the following rule:
> iptables -A FORWARD -s ! host1 -d ! host2 -j ACCEPT
> But with this rule pakets from host1 to host3 (or from host2 to host3) =
were
> not affected. It seems like the logical combination is OR and not AND u=
nlike
> the not negatived rule.

When you build a rule, all parameters are combined with an AND, and it's
logical (to me) that it is style the case here. When you write :

	iptables -A FORWARD -s host1 -d host2 -j ACCEPT

You say :

	if packet is (from host1) AND (to host2) then ACCEPT

Now, if you negate a parameter, you only negate this one, not a couple
of them. So you get :

	if packet is (not from host1) AND (not to host2) then ACCEPT

Which can be translated as :

	if packet is not (from host1 OR to host2) then ACCEPT

And it explains why your packets are not matched, as your test packet is
from host1. So there's no bug (imho) ;)

But there's something about the second packet that should matche (host2
to host3). Can you confirm that this very packet does not match ? As
Alistair, I did a similar test (iptables 1.2.11 on 2.6.5 kernel) on a
double negative rule and it matched.


--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

