From: Curtis Hawthorne <cghawthorne@yahoo.com>
Subject: Firewall allows new connections back in
Date: Sat, 18 Jan 2003 14:27:58 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030118222758.49963.qmail@web41113.mail.yahoo.com>
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

Hi,

I just recently noticed a problem with my firewall (Debian
3.0 with the standard Debian 2.4.18-586tsc kernel and
iptables version 1.2.6a-5).  My firewall connects to the
internet and then does NAT for the network behind it (which
happens to be Windows machines).  I have my firewall set to
drop all incoming connections (except a few specific ports)
unless they are for an established connection or related to
an established connection with this rule:

-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

I wanted to see if I could use nbtstat (a windows utility
that shows netbios information about a remote computer -
Uses UDP packets from port 137 to port 137) to query a
friend's machine (Windows, directly connected to the
internet) through my firewall.  He did not have Microsoft
Networking installed, so this did not work.  What surprised
me was that he then tried to do an nbtstat on my machine
and it worked.  Not only did it work, but it also returned
information about the machine that I had used to do the
query with on my internal network.  Further investigation
showed that this only worked if he did the nbtstat shortly
after I did an nbtstat on him, otherwise the connection
would be dropped like it was supposed to be.

Here is the tcpdump log of my running nbtstat.  My friend's
IP address is shown as remote.ip, my firewall's external IP
address is shown as local.ip, and my internal machine's IP
address is shown as internal.ip:

13:51:39.546078 local.ip.netbios-ns > remote.ip.netbios-ns:
>>> NBT UDP PACKET(137): QUERY; REQUEST; BROADCAST
13:51:39.878680 remote.ip.netbios-ns > local.ip.netbios-ns:
>>> NBT UDP PACKET(137): QUERY; POSITIVE; RESPONSE; UNICAST

And here is the entry in /proc/net/ip_conntrack:

udp      17 18 src=internal.ip dst=remote.ip sport=137
dport=137 src=remote.ip dst=local.ip sport=137 dport=137
use=1


And the tcpdump log of my friend's nbtstat query on me:

13:51:59.336869 remote.ip.netbios-ns > local.ip.netbios-ns:
>>> NBT UDP PACKET(137): QUERY; REQUEST; BROADCAST
13:51:59.337499 local.ip.netbios-ns > remote.ip.netbios-ns:
>>> NBT UDP PACKET(137): QUERY; POSITIVE; RESPONSE; UNICAST


And the entry in /proc/net/ip_conntrack again:

udp      17 176 src=internal.ip dst=remote.ip sport=137
dport=137 src=remote.ip dst=local.ip sport=137 dport=137
[ASSURED] use=1

Next, my friend installed Microsoft Networking and I ran an
nbtstat on him.  It worked and nothing showed up in the
ip_conntrack file.  However, if he ran an nbtstat on me
shortly after that (20 seconds or so), then it would still
work for him and an entry would show up under ip_conntrack.
 But if he waited a little longer it would be dropped like
it should be.

Is this a bug in NetFilter (and has it been fixed?), or am
I doing something wrong?  I don't like the idea of new
connections being allowed back through the firewall after a
certain kind of packet has been sent, so any help would be
greatly appreciated.

Thanks!

Curtis H.

__________________________________________________
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
http://mailplus.yahoo.com

