From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Order in ruleset edition
Date: Wed, 26 Nov 2003 11:56:29 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122EA9@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: "Hildebrand, Brian" <BrianHildebrand@universalcomputersys.com>, =?iso-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?= <leolistas@solutti.com.br>, "Netfilter (E-mail)" <netfilter@lists.netfilter.org>

That may be true, but even if you aren't using the iptables-save =
techniques to speed up the loading of rules, there are other better ways =
to improve the loading of rules. My current configuration works as =
follows when 'reloading':

# Input is small so no optimization
INPUT flush
INPUT load

Block traffic forwarding
FORWARD FLUSH
FORWARD add established,related
FORWARD add links to sub-chains
Un-Block traffic forwarding
# At this point, the forward ruleset has been re-applied, but since =
there are only few rules in here, there is no loss in packet data
FORWARD_SUB_CHAIN1 FLUSH
FORWARD_SUB_CHAIN1 add rules
FORWARD_SUB_CHAIN2 FLUSH
FORWARD_SUB_CHAIN2 add rules
FORWARD_SUB_CHAIN3 FLUSH
FORWARD_SUB_CHAIN3 add rules

So, the rules that fall into sub-chain 1 will only be blocked to the =
period it takes to flush and reapply rules to that sub-chain, instead of =
the time it takes to reapply the entire forwarding ruleset, which for me =
takes ~30 seconds (my poor slow bash scripts).

With proper breakdown of each major network component away from the =
FORWARD table, you can efficiently rebuild your ruleset to minimize =
down-time.


