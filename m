From: "Hildebrand, Brian" <BrianHildebrand@universalcomputersys.com>
Subject: RE: Order in ruleset edition
Date: Wed, 26 Nov 2003 14:27:09 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D8FBABA1EF6F2E4DBCC88903F60691F3023F15A1@houxchsvr.ucscorp.ucs.pvt>
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
To: "Netfilter (E-mail)" <netfilter@lists.netfilter.org>

This is basically the steps in mine again:

1. First ruleset load ever - create the user defined chain FORWARD_0. =
Load all the rules there.=20
2. Add a rule to chain FORWARD (ie. iptables -A FORWARD -j FORWARD_0) to =
make sure that the traffic is traversing the user defined chain with all =
the filtering rules inside. Default policy on a fresh firewall should =
always be DENY or the firewall should be uninstalled when the first =
ruleset is loaded. The firewall now is functional and working.=20
3. Load the new ruleset. Create a new user defined chain called =
FORWARD_1. Load all the new rules here. You now have two copies of your =
rules loaded on the firewall at the same time.=20
4. If the default policy of FORWARD is not DENY, which mine always is =
anyway, then set the default policy to DENY.=20
5. Change the "iptables -A FORWARD -j FORWARD_0" rule to "iptables -A =
FORWARD -j FORWARD_1". Any traffic received while this change takes =
place will be dropped. The change is pretty much instantaneous except on =
extremely large rulesets (and I mean extreme, even on the 5 minute to =
load ruleset the change was not noticeable). There is supposedly a =
modification to netfilter that can be made to make the process faster. =
I'm not sure because I have never needed it. Netfilter does some sanity =
checks that eat up additional time, and that modification supposedly =
gets rid of them (I like sanity checks, I expect everyone else is pretty =
fond of them as well :)).
6. Remove all of the old FORWARD_0 rules (and the user defined sub =
rules). It is important, in our script at least, that every user defined =
chain have an extension to the name identifying the ruleset it belongs =
to (for instance chain ALLOWED_PORTS would need to be ALLOWED_PORTS_0 or =
ALLOWED_PORTS_1, depending on which ruleset it belongs to). This =
prevents conflicts and ensures that new ruleset links to the objects =
meant for the new ruleset and not remnants from the old one.=20
7. Finished.

Obviously this is all scripted. I just load a firewall script file to =
the system, run the script, and wait for the new ruleset to take effect. =
While the ruleset is loading all the old rules are still enforced, when =
the ruleset switches a minimal amount of traffic is dropped (never had a =
user notice a ruleset update), and then the new ruleset is loaded. From =
a safety / uptime standpoint this is the best way I have seen to do it. =
The other alternatives render the network useless for an extended period =
of time, and users notice the outage and get angry.=20


----------------------------------------
The information transmitted in this message is intended only for the =
person or entity to whom it is addressed and may contain confidential =
and/or privileged material.  Any review, retransmission, dissemination =
or other use of, or taking of any action in reliance upon this =
information by persons or entities other than the intended recipient is =
prohibited.  If you received this in error, please contact the sender =
and destroy any copies of this document.

