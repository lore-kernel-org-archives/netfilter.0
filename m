From: "Joshua, C.S. Chen" <cschen@asiaa.sinica.edu.tw>
Subject: max size of ipt_recent match
Date: Fri, 04 Nov 2005 16:52:28 +0800
Message-ID: <436B214C.40205@asiaa.sinica.edu.tw>
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

Hi folks,
I am now using recent match to block ssh brute-force attack like



### ssh brute-force attack rule
$IPTABLES -A INPUT -p tcp --syn --dport 22 -m recent --name sshattack --set

$IPTABLES -A INPUT -p tcp --dport 22 --syn -m recent --name sshattack \
--rcheck --seconds 5 --hitcount 3 -j LOG --log-prefix 'SSH REJECT: 3/5 '
$IPTABLES -A INPUT -p tcp --dport 22 --syn -m recent --name sshattack \
--rcheck --seconds 5 --hitcount 3 -j REJECT --reject-with tcp-reset






$IPTABLES -A FORWARD -p tcp --syn --dport 22 -m recent --name sshattack
--set


$IPTABLES -A FORWARD -p tcp --dport 22 --syn -m recent --name sshattack \
--rcheck --seconds 5 --hitcount 3 -j LOG --log-prefix 'SSH REJECT: 3/5 '
$IPTABLES -A FORWARD -p tcp --dport 22 --syn -m recent --name sshattack \
--rcheck --seconds 5 --hitcount 3 -j REJECT --reject-with tcp-reset


It works very well for me.
Then I found that, the internal table at /proc/net/ipt_recent/sshattack
has a max limit of 100 entries, after the max number of entry has been
reached, no more new entry can be added so the above will have no effect.

Any knows how to 'enlarge' the limit of the table? or what should be
done to cycle/purge old entries so new hit entries can be added.


Thanks in advance
Joshua



