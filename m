From: mortar <slacklist@op.pl>
Subject: Question about marking traffic.
Date: Mon, 28 Jun 2004 18:17:07 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1987903676.20040628181707@op.pl>
Reply-To: mortar <slacklist@op.pl>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi

I marked few types of traffic:

$IPTABLES -t mangle -A PREROUTING -p tcp -j CONNMARK --restore-mark
$IPTABLES -t mangle -A PREROUTING -p tcp -m mark ! --mark 0 -j ACCEPT

$IPTABLES -t mangle -A PREROUTING -p tcp -m ipp2p --ipp2p -j MARK --set-mark $P2P
$IPTABLES -t mangle -A PREROUTING -p tcp --dport 21   -j MARK --set-mark $FTP
$IPTABLES -t mangle -A PREROUTING -p tcp --dport 80   -j MARK --set-mark $WWW

$IPTABLES -t mangle -A PREROUTING -p tcp -j CONNMARK --save-mark


With rules below I can count traffic of this types:


$IPTABLES -t mangle -A POSTROUTING -m mark --mark $P2P -j ACCEPT
$IPTABLES -t mangle -A POSTROUTING -m mark --mark $FTP -j ACCEPT
$IPTABLES -t mangle -A POSTROUTING -m mark --mark $WWW -j ACCEPT


But I want count all other traffic, not marked with marks $P2P, $FTP,
$WWW withe speparated rule. How can I do that?

  

-- 
Pozdrawiam
 Marcin                         mailto:slacklist@op.pl


