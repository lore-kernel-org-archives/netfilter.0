From: <bmcdowell@coxhealthplans.com>
Subject: RE: netfiltering and ethernet bridging doesn't appear to work as advertised, help!
Date: Wed, 21 Jan 2004 08:55:15 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7A3B4AA360FDEF448F3390421FC8D731014BE786@coxhpexg.coxhp.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


I can attest that it does work.  Hang in there.

As for patching, it is my understanding that the statement about 'newer
kernels' is only half right.  You do not need to patch your kernel to
add bridging functionality (just enable it in the menu).  You DO need to
patch it if you want to use netfilter to filter said bridge traffic.  I
use this patch:
http://bridge.sourceforge.net/devel/bridge-nf/bridge-nf-0.0.7-against-2.
4.19.diff

With only that patch, I have successfully enabled bridges netfilter
under both RedHat 7.3 and 9.

To clarify a tad on the chains, INPUT and OUTPUT refer to traffic for
and from the firewall itself.  FORWARD refers to traffic crossing the
firewall.  These are two separate things and the rules do not effect
chains they aren't applied to.  For example, your rule...

	iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
-v

...needs a FORWARD counterpart (if you also want that behavior on
traffic crossing the firewall):

	iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j
ACCEPT -v

Also your policy on FORWARD is accept.  Your post didn't show any
FORWARD drop rules, so if traffic is passing right through the firewall
with these rules, well, it's working correctly.  On the other hand, if
you switch them all to FORWARD then there is no filtering on traffic to
the firewall.

Hope that helps.


Bob

