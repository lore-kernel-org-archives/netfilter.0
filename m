From: "Gary W. Smith" <gary@primeexalia.com>
Subject: physical interface ? with bridging
Date: Sat, 25 Mar 2006 12:31:09 -0800
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE5829016747F@pxtbenexd01.pxt.primeexalia.com>
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

I have a bridge setup one a set of firewalls that I would like to do
some custom filtering with.  Here is the config:

eth0 -> WAN
eth1 -> heartbeat=20
eth2 -> DMZ
eth3 -> LAN

Most of the checks we do are from the DMZ to the LAN but now we would
like to filter out specific traffic between WAN and DMZ.  We have some
blanket global rules in place (only 80, 445, 25, etc) in via the DMZ but
lately this isn't cutting it.

Looking into the log, netfilter is seeing the physical device in and
out.  I found some table about ipt_physdev module.  I loaded the module
and tried filtering on the physical device and received some errors:

-A FORWARD -physin eth0 -j LOG --log-prefix "FW ETH0:"

iptables-restore v1.2.11: unknown protocol `-physin' specified

I have also tried using the --physdev-in as per the man iptables
listing.

How can I build a rule on this with netfilter using the basic rules?
This is a RHEL 4 environment and we would rather not patch these
machines with pom items.  I seems like I'm missing something simple.



