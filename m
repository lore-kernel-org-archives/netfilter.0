From: Adhiraj <adhiraj@linsyssoft.com>
Subject: arp replies from two adapters of same type in a machine
Date: Wed, 22 Feb 2006 21:15:58 +0530
Message-ID: <1140623158.6987.59.camel@triumph>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

Hi all,

I have two RTL-8139 network adapters in a machine, they have these IP
addresses:
eth1: 192.168.20.1
eth2: 192.168.21.1

When I take tcpdump on these interfaces and ping to 192.168.21.1 from
192.168.21.50, I see that both the adapters reply to ARP requst sent by
192.168.21.50 machine:

/usr/sbin/tcpdump -i eth1 -vv
.
.
arp reply 192.168.21.1 is-at <MAC add of eth1>

/usr/sbin/tcpdump -i eth2 -vv
.
.
arp reply 192.168.21.1 is-at <MAC add of eth2>

Ideally eth1 should not reply to the ARP request.

Any idea why this happens?

Regards,
Adhiraj.


