From: fgentili@ialeware.it
Subject: Iptables Stateful Failover
Date: Mon, 11 Nov 2002 09:07:09 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OFC8C56C9B.170CF0F7-ONC1256C6E.002B3390-C1256C6E.002C99B8@tomware.it>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org
Cc: coreteam@netfilter.org, mgua@tomware.it

Hi,

I would know if is possible to implement iptables failover using stateful
inspection capabilities of iptables.

This is simply a proof of concept.

All information of stateful inspection is stored in /proc/net/ip_conntrack

well, so if I write every firewall rules with
--module STATE --state NEW,ESTABLIESHED ..... and so on

every packet will be matched and a connection will be put in that file.

if I send this file to another fw, send alias ip (for natted address &
routing) and replace /proc/net/ip_conntrack ( if it is writeble. If not, is
it possible to do ?)

all session will be persistent, isn't it ?

The problem of arp, proxyarp can be bypassed by rewriting mac address of
the network adapter and using hub connected to the switch.

Let me know if I'll hurt by a meteor !

bye.


Gentili Filippo
mail : fgentili@tomware.it
http://www.tomware.it




