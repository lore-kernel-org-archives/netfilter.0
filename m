From: "Gary W. Smith" <gary@primeexalia.com>
Subject: iptables/bridge/nfs
Date: Mon, 20 Nov 2006 14:18:23 -0800
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE5829024ED21@pxtbenexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I'm trying to get NFS (udp) to work through an iptables firewall that
also has a bridge. =20

The bridge is eth0 and eth2.  The NFS server resides on eth3, the client
exist on eth2 the internet is on eth0.  My iptables contains this as the
FORWARD rule:

-A FORWARD -m physdev  --physdev-in eth2 -j ACCEPT=20

-A FORWARD -i eth3 -j ACCEPT

We did have it locked down pretty much but we want to try to find out
why this doesn't work.  Some posts say that if the MTU is different then
it might fragment but in this case they are both 1500. =20

Does anyone have any basic ideas why this might not be working?

Gary Wayne Smith


