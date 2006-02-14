From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Drop Input Policy
Date: Tue, 14 Feb 2006 20:21:10 +0100
Message-ID: <1139944870.4650.24.camel@anduril.intranet.cartel-securite.net>
References: <1139943730.29158.254367263@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1139943730.29158.254367263@webmail.messagingengine.com>
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
To: netfilter@buglecreek.com
Cc: netfilter_list <netfilter@lists.netfilter.org>

Le mardi 14 f=E9vrier 2006 =E0 12:02 -0700, netfilter@buglecreek.com a
=E9crit :
> If the default INPUT chain policy is set to drop is there any reason to
> explicitly add rules to drop packets within the firewall script?

Well, it depends...

Take a very specific configuration in which you use a user chains tree
to reduce your ruleset complexity and thus increase performance compared
to a flat ruleset. In this very case, you want to drop packets at the
end of terminal user chains. As user chains do not have policy, you have
to set a DROP rule at the end.

To be less specific, you may want to drop packets as soon as you know
they must be, again for performance matters. As an example, if you don't
want to accept INVALID packets, it's useless (and a loss of processing)
to have them go through your entire ruleset so they get dropped by
policy. You will put an -m state --state INVALID -j DROP rule very
early, in the same mind lots of people accept ESTABLISHED/RELATED
packets at top of ruleset for they constitute the very big part of the
traffic.


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

