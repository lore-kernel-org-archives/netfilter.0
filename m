From: "www.piratehosting.net" <webmazter@gmail.com>
Subject: ip_conntrack: table full, dropping packet.
Date: Thu, 23 Sep 2004 22:01:27 -0600
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <e73cec8004092321013f0350be@mail.gmail.com>
Reply-To: "www.piratehosting.net" <webmazter@gmail.com>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

ip_conntrack: table full, dropping packet.

i have been using
echo "4008192" > /proc/sys/fs/file-max
echo 4008192 > /proc/sys/net/ipv4/ip_conntrack_max
to increase the limits to avoid this dropping of packets.
can i just clear the list from
/proc/net/ip_conntrack
or something

some info
ip_conntrack_ftp       70576  0
ip_conntrack_irc       70064  0
ip_conntrack           24968  4
iptable_nat,ip_conntrack_ftp,ip_conntrack_irc,ipt_state

