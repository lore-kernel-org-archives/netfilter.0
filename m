From: "IZEM Farid" <Farid.IZEM@abxlogistics.fr>
Subject: (no subject)
Date: Wed, 30 Jun 2004 15:33:16 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <B732FD42D68974438C1451C73C1D030FD1EE0E@FR92EX02.eu.abxlogistics.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: netfilter@lists.netfilter.org

Hi all,

I'm trying to customize my iptables rules.
Let us imagine we have three hosts which users have to access:=20
	HOST1
	HOST2
	HOST3

Is this configuration correct?
	Iptables -N HOST1_RULESETS
	Iptables -N HOST2_RULESETS
	Iptables -N HOST3_RULESETS
=09
In each new chain, I will add rules to accept connections to some =
services like telnet, ssh, IBM Client Access.
And after, I will do this thing:
	Iptables -A FORWARD -i eth0 -o eth1 -j HOST1_RULESETS
	Iptables -A FORWARD -i eth0 -o eth1 -j HOST2_RULESETS
	Iptables -A FORWARD -i eth0  -o eth1 -j HOST3_RULESETS

In fact, what I'm looking for is that I can organized my rules by hosts =
instead of adding all rules to all hosts in FORWARD chain ?

With the configuration, I describe, will all rules in the HOSTX_RULESETS =
being check ?

I think, it's correct but I'm not totally sure.

Thanks for you help,

Best regards,=09
=20
Farid IZEM
Ing=E9nieur Syst=E8me Unix
Soci=E9t=E9 ABX Logistics France
48-50, route principale du port
92232 Gennevilliers
T=E9l. : 01-41-47-61-78
Email : farid.izem@abxlogistics.fr


