From: "Michael Forrest" <michael@erg.abdn.ac.uk>
Subject: Source NAT
Date: Tue, 6 Jul 2004 19:49:15 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001401c46389$f059c1a0$66cf858b@enterprise>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
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


Has anyone tried using source nat with multicast packets? Basically, I =
have
incoming multicast groups on one network interface and I want the =
packets to
appear as though they came from another interface. Is this possible =
using an
iptables module or something in patch-o-matic?

I've previously managed to do this via some code hacking of an iptables
module and would prefer a more reliable and longer term solution.

Any suggestions appreciated,

Michael.

=20




