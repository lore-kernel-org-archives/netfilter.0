From: "Britt Tabor" <btabor@edgeaccess.net>
Subject: Policy, why is it doing that
Date: Thu, 16 Oct 2003 11:37:22 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BDF3100EBB9E3A47B84F816A10D9A4E5A8E5@eai-exchange.edgeaccess.net>
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
To: netfilter@lists.netfilter.org

Hello,

	I have a linux (slackware) box that I am running iptables on. I have =
masq. on and I have only one entry in the table. I currently have the =
policy for FORWARD set to ACCEPT. Here's the problem, if I set the =
policy to DROP it drops everything. No rules are looked at before =
dropping it just drops everything. Here is a list of my iptables.

bash-2.05# iptables -L
Chain INPUT (policy ACCEPT)
target     prot opt source               destination        =20

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination        =20
ACCEPT     all  --  anywhere             anywhere          =20

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination        =20
bash-2.05# iptables -t nat -L
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination        =20

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination        =20
MASQUERADE  all  --  anywhere             anywhere          =20

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

with this everything is fine but as you can tell there is no real =
security, because I ACCEPT all. However, if I set the policy on FORWARD =
to DROP everything gets dropped regardless of rule entries. Previously I =
used ipchains, when a packet came in it would traverse the rule entries =
in the FORWARD list and if it didn't match anything it would apply the =
policy. With iptables it seems to be doing just the opposite. When =
packets come in it applys the policy first.???

Is this the case?=20




=A0
=A0
Britt Tabor
Edge Access, Inc.
btabor@edgeaccess.net
http://www.edgeaccess.net
813.594.6142 Voice
813.249.1126 Fax
=A0
=A0
=A0


