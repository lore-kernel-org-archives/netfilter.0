From: "Joshua, C.S. Chen" <cschen@asiaa.sinica.edu.tw>
Subject: kernel panic because of recent match
Date: Fri, 09 Sep 2005 00:52:46 +0800
Message-ID: <43206C5E.30605@asiaa.sinica.edu.tw>
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
I am using linux iptables at my institute serving as gate/firewall. It's
working fine and smooth. Recently we enable the following rule to block
the ssh brute-force attack



### ssh brute-force attack rule
$IPTABLES -A INPUT -p tcp --syn --dport 22 -m recent --name sshattack --set
$IPTABLES -A INPUT -p tcp --dport 22 --syn -m recent --name sshattack \
--rcheck --seconds 60 --hitcount 3 -j LOG --log-prefix 'SSH REJECT: '
$IPTABLES -A INPUT -p tcp --dport 22 --syn -m recent --name sshattack \
--rcheck --seconds 60 --hitcount 3 -j REJECT --reject-with tcp-reset


$IPTABLES -A FORWARD -p tcp --syn --dport 22 -m recent --name sshattack
--set
$IPTABLES -A FORWARD -p tcp --dport 22 --syn -m recent --name sshattack \
--rcheck --seconds 60 --hitcount 3 -j LOG --log-prefix 'SSH REJECT: '
$IPTABLES -A FORWARD -p tcp --dport 22 --syn -m recent --name sshattack \
--rcheck --seconds 60 --hitcount 3 -j REJECT --reject-with tcp-reset


And it really block ssh connect at some threshold (3/60 seconds).
BUT after some time (several hours, or sometimes several tens of
minutes),the firewall crash with kernel panic, without any logs to trace.

The kernel is from CentOS 4.1, 2.6.9-11.ELsmp. The machine is a DUAL AMD
optron cpu with 2G ram. It will go kernel panic sooner or later once we
enable the recent match. Is there any hope to solve this problem? Is AMD
cpu or SMP (dualcpu) the reason?



And I am so curious about the internal 'recent match list'. Do I have a
chance to see the list? Once an IP triggered the drop or log rule, can I
see them? Is the list somewhere in /proc/*?


Thanks in advance
Joshua

[root@fw ~]# man procmailrc
Formatting page, please wait...
[root@fw ~]#
[root@fw ~]# cat ssh_brute_force_attack_kernel_panic
Dear all,
We are using linux iptables at our institute serving as gate/firewall.
It's working fine and smooth. Recently we enable the following rule to
block thessh brute-force attack



### ssh brute-force attack rule
$IPTABLES -A INPUT -p tcp --syn --dport 22 -m recent --name sshattack --set
$IPTABLES -A INPUT -p tcp --dport 22 --syn -m recent --name sshattack \
--rcheck --seconds 60 --hitcount 3 -j LOG --log-prefix 'SSH REJECT: '
$IPTABLES -A INPUT -p tcp --dport 22 --syn -m recent --name sshattack \
--rcheck --seconds 60 --hitcount 3 -j REJECT --reject-with tcp-reset


$IPTABLES -A FORWARD -p tcp --syn --dport 22 -m recent --name sshattack
--set
$IPTABLES -A FORWARD -p tcp --dport 22 --syn -m recent --name sshattack \
--rcheck --seconds 60 --hitcount 3 -j LOG --log-prefix 'SSH REJECT: '
$IPTABLES -A FORWARD -p tcp --dport 22 --syn -m recent --name sshattack \
--rcheck --seconds 60 --hitcount 3 -j REJECT --reject-with tcp-reset


And it really block ssh connect at some threshold (3/60 seconds).
BUT after some time (several hours, or sometimes several tens of
minutes),the firewall crash with kernel panic, without any logs to trace.

The kernel is from CentOS 4.1, 2.6.9-11.ELsmp. The machine is a DUAL AMD
optron cpu with 2G ram. It will go kernel panic sooner or later once we
enable the recent match. Is there any hope to solve this problem? Is AMD
cpu or SMP (dualcpu) the reason?



And I am so curious about the internal 'recent match list'. Do I have a
chance to see the list? Once an IP trigger the drop or log rule, can I
see the ip? Is the list somewhere in /proc/*?


Thanks in advance
Joshua


