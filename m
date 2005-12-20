From: Sorin Panca <sorin.panca@gmail.com>
Subject: network flood imunity
Date: Tue, 20 Dec 2005 13:57:55 +0200
Message-ID: <43A7F1C3.7010805@gmail.com>
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

Hi!
I have a network with no natting and i would linke to develop a rule set
for flood protection of some windows stations. Recently one station was
flooded while it was powered off (for me this is a uncomprehensible
situation / act).. My ISP added a filter against my station and I can't
acces the internet on it now. The server is running kernel 2.4.22-10mdk
with mandrake-<some.version> and iptables-1.2.8. I tried to replace it
(the server) but due to unknown reasons, I failed three times. And I
gave up.
If someone has an ideea of how can I protect the server in this
configuration against floods, I would be very happy to learn.
iptraf also shows some arp traffic that I don't know what is and I don't
know how to fiter it.
Here is a sample:
ARP request for 85.186.68.52 (63 bytes) from 000ed6bdc070 to
ffffffffffff on eth1
ARP request for 83.103.129.16 (40 bytes) from 000ed6bdc070 to
ffffffffffff on eth1
ARP request for 83.103.132.190 (63 bytes) from 000ed6bdc070 to
ffffffffffff on eth1
ARP request for 83.103.128.51 (40 bytes) from 000ed6bdc070 to
ffffffffffff on eth1                         ARP request for
83.103.133.236 (1500 bytes) from 000ed6bdc070 to ffffffffffff on eth1
These are marked with red.
Thank you!

Sorin.

