From: Bill Hayes <hayes@mail.ru>
Subject: iptables: forwarding, masquerading, and high-availability
Date: Wed, 08 Sep 2004 23:16:23 +0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <E1C57vb-000JD8-00.hayes-mail-ru@f25.mail.ru>
Reply-To: Bill Hayes <hayes@mail.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I have a problem trying to create a high availability firewall/router setup. Multiple servers on the internal network should be masqueraded to appear as a single server on the external network.

The simplest case that fails for me looks like this...


Configuration: SuSE 9.1 (linux 2.6.5, iptables 1.2.9, heartbeat 1.2.0)

firewall-1: eth0 = 192.168.1.1, eth1 = 10.1.1.1
firewall-2: eth0 = 192.168.1.2, eth1 = 10.1.1.2

         +--------+
         | server |
         +----+---+
              |
    +---------+---------+
    |        hub        |
    +-+---------------+-+
      |               |
+-----+------+ +------+-----+
| firewall-1 | | firewall-2 |
+-----+------+ +------+-----+
      |               |
    +-+---------------+-+
    |        hub        |
    +---------+---------+
              |
          +---+----+
          | router |
          +---+----+
              |

If I configure my servers to use 192.168.1.1 as their gateway, and tell all my clients that 10.1.1.1 is my server, then everything works as desired.

On to high availability, I configure my servers to use 192.168.1.3 as their gateway, and tell all my clients that 10.1.1.3 is my server. I start heartbeat and soon my firewalls now look like...

firewall-1: eth0 = 192.168.1.1, eth0:1 = 192.168.1.3, eth1 = 10.1.1.1, eth1:1 = 10.1.1.3
firewall-2: eth0 = 192.168.1.2, eth1 = 10.1.1.2

Now, all my outgoing connections are established as before, but all the incoming connections fail with...

SFW2-INext-DROP-DEFLT

instead of succeeding with...

SFW2-FWDext-ACC-REVMASQ

I know that iptables treats virtual interfaces as if they are the underlying physical interface, thus eth1:1 should be eth1, and outgoing connections work, thus I have proof that eth0:1 is eth0, so what is happening? Why are the packets being dropped?

Thanks to anyone that can help,
Bill

wjh [at] sympatico [dot] ca
hayes [at] mail [dot] ru

