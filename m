From: Bill Fung <ccbill@ust.hk>
Subject: use iptables to prevent DOS
Date: Fri, 02 Jan 2004 16:11:18 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FF527A6.4070205@ust.hk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi all,

I want to use ipchains to prevent dos and log some dos packets.

 From netfilter documentation:

Syn-flood protection:

    ||

# iptables -A FORWARD -p tcp --syn -m limit --limit 1/s -j ACCEPT
  

I wonder why it add to FORWARD chain? The dos should be against the local machine, so I guess it should add to INPUT chain, right?

I have used the following rules to prevent dos to my machine. I have search the web and can't find any dos tool to try my rules. May I ask if the following suit my purpose?
The following mainly limit the rate of syn to 1 per second. It logs the excessive syn flood packet information to log and then drop that packet.

iptables -A INPUT -p tcp --syn -m limit --limit 1/s -j ACCEPT
iptables -A INPUT -p tcp --syn -j LOG --log-prefix "SYN FLOOD "
iptables -A INPUT -p tcp --syn -j DROP
iptables -L

Chain INPUT (policy ACCEPT)
target     prot opt source               destination
ACCEPT     tcp  --  anywhere             anywhere           tcp flags:SYN,RST,ACK/SYN limit: avg 1/sec burst 5
LOG        tcp  --  anywhere             anywhere           tcp flags:SYN,RST,ACK/SYN LOG level warning prefix `DEF '
DROP       tcp  --  anywhere             anywhere           tcp flags:SYN,RST,ACK/SYN

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination


Thanks a lot.

Besides, I would like to use "echo 1 > /proc/sys/net/ipv4/tcp_syncookies" too. Why approach is better for prevent dos? What is the differences? Is it the best to use both simultaneourly?

Bill
HKUST



