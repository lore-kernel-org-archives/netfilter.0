From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: connection tracking query
Date: 07 Apr 2003 14:57:08 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1049720228.5056.49.camel@elendil.intranet.cartel-securite.net>
References: <7497DCA1C240C042B28F6657ADFD8E0926876C@i2km11-ukbr.domain1.systemhost.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7497DCA1C240C042B28F6657ADFD8E0926876C@i2km11-ukbr.domain1.systemhost.net>
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

Le lun 07/04/2003 =E0 11:02, dhiraj.2.bhuyan@bt.com a =E9crit :
> 1. I was reading the Iptables tutorial by Oskar Andreasson
> http://iptables-tutorial.frozentux.net/iptables-tutorial.html.
> It says that connection tracking in done in the PREROUTING chain or
> OUTPUT chain (for locally generated packets). If connection tracking
> is done only at these two chains, what happens to the packets that
> don't belong to an already established connection? I understand that
> it will have to go through the filter rules - before the state table
> is updated for a NEW/RELATED connection. If that is the case,
> "conntrack" must be taking place at other chains too (where the filter
> is applied). The following document
> http://www.knowplace.org/netfilter/syntax.html does infact say that
> "conntrack" is happening not only in the PREROUTING and the OUTPUT
> chain, but also in INPUT and POSTROUTING chain. What I find strange
> with this is that for a packet that goes through the "FORWARD" chain,
> "conntrack" is done twice on the same packet - first in the
> "PREROUTING" chain and second in the "POSTROUTING" chain. Does anyone
> have any explanation for this?

You're mixing two things :

        1. conntrack engine
        2. state matching

Conntrack engine is a module which is designed to recognize if a given
packet belongs or not to an existing connection, and update connection
table according to its decisions.

State matching is the ability for a rule to match a packet state,
understand the way it has been recognized by conntrack engine.

Conntrack engine has to examine packets very early. That's why it occurs
in PREROUTING for recieved packets and OUTPUT for locally generated
packets. In fact, you can see conntrack as a particular table which is
hooked on NF_IP_PRE_ROUTING and NF_IP_LOCAL_OUT with maximum precedence
(it is to be noted that conntrack also occurs on POSTROUTING and INPUT
for new connections validation, avoiding creation of connection that
would be droped by filter table).

So, once our packet is recognised, it is "flaged" with a state that can
be matched in rules with state match. and for conntrack has precedence
over any table, you can match state wherever you want to.

> 2. If a packet is found to belong to an already ESTABLISHED
> connection, does it still have to go through the filter rules again?

Yes it does. State is just a flag. It does not imply anything on packet
filtering, unless you explicitly specify decisions into your ruleset.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

