From: <bmcdowell@coxhealthplans.com>
Subject: RE: Chain Policy DROP versus ACCEPT and logging
Date: Mon, 13 Oct 2003 10:54:30 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7A3B4AA360FDEF448F3390421FC8D731F419BF@coxhpexg.coxhp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: blancher@cartel-securite.fr, tedkaz@optonline.net
Cc: netfilter@lists.netfilter.org


I may be a little late chiming in on this, but personally my rules use a =
'BAD' chain.  That chain ends with the LOG and DROP just like a normal =
appended chain.  The difference is, I can explicitly deny things by =
sending them to -j BAD.

I do the same with -j GOOD, and then run sanity checks against the =
packet  -sending some stuff to BAD before it actually hits the ACCEPT.

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Cedric Blancher
Sent: Sunday, October 12, 2003 10:12 AM
To: tedkaz@optonline.net
Cc: netfilter@lists.netfilter.org
Subject: Re: Chain Policy DROP versus ACCEPT and logging


Le dim 12/10/2003 =E0 16:00, Ted Kaczmarek a =E9crit :
> Is their a way to log the default INPUT and FORWARD policies for =
dropped
> packets with them set to DROP as opposed to having them set to ACCEPT
> and putting in logs for any deny rules.

Logging in Netfilter does not behave as it used to with ipchains. You
cannot log and drop within the same rule. Suppose you want to log and
drop all UDP traffic :

	iptables -A INPUT -p udp -j LOG --log-prefix "UDP dropped : "
	iptables -A INPUT -p udp -j DROP

LOG is a target (non terminating one).

This said, if you want to log packets that hit chain policy, then you
have to put a logging rule at the very end of the chain :

	iptables -A INPUT -j LOG "INPUT chain policy drop : "

And you're done.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: =
FA62226DA9E72FA8AECAA240008B480E157E98EE

