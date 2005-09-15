From: Rob Burris <rburris@cires.colorado.edu>
Subject: iptable rules not working across similar fedora machines
Date: Thu, 15 Sep 2005 17:00:13 -0600
Message-ID: <BF4F591D.80F%rburris@cires.colorado.edu>
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

Hi all, this is my first post on this list.

I'm trying to block ssh brute force attempts on my system. I'm using the
following iptables rules, which works great on my system.

$IPTABLES -A INPUT -p tcp --dport 22 -m state --state NEW -m recent --set
--name SSHBRUTE
$IPTABLES -A INPUT -p tcp --dport 22 -m recent --update --seconds 180
--hitcount 5 --rttl --name SSHBRUTE -j LOG --log-prefix "SSH Brute Force: "
$IPTABLES -A INPUT -p tcp --dport 22 -m recent --update --seconds 180
--hitcount 5 --rttl --name SSHBRUTE -j DROP

However, they do NOT work on another similar system. When I test the rule
set ANY SSH connection is blocked.

Sep 15 16:21:32 host kernel: SSH Brute Force: IN=eth0 OUT=
MAC=XX:XX:XX:XX:XX:XX SRC=X.X.X.X DST=X.X.X.X LEN=52 TOS=0x00 PREC=0x00
TTL=64 ID=33343 DF PROTO=TCP SPT=44398 DPT=22 WINDOW=1460 RES=0x00 ACK
URGP=0 

Both systems have the same modules loaded (i.e. ipt_recent, ipt_state,
ipt_conntrack, etc). There is a virtual IP address on the nonworking system,
which I don't think is a problem, but I figured I should mention it. Other
than that everything is pretty much the same. Here's a comparison of the two
systems.

(working system)
Fedora Core 4
2.6.12
Iptables v1.3.0

(nonworking system)
Fedora Core 3
2.6.11
Iptables v1.3.0

Can anyone point me to a better set of rules I might try, or perhaps shed
some light on this? I'm kinda at a loss.

Rob 


