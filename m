From: Esteban <eribicic@sinectis.com>
Subject: argument error while natting?
Date: 26 Feb 2003 02:13:59 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1046236439.12245.8.camel@debian>
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

always i try to use the nat issues i get "Invalid argument" ..
why could it be?

root@debian:~# iptables -t nat -A PREROUTING -i eth2 -p tcp --dport 80
-j DNAT --to 127.0.0.1:3128
iptables: Invalid argument
root@debian:~# 
root@debian:~# iptables -t nat -A PREROUTING  -p tcp --dport 80 -j DNAT
--to 127.0.0.1:3128
iptables: Invalid argument
root@debian:~# 
root@debian:~# iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables: Invalid argument

root@debian:~# 
root@debian:~# iptables  --version
iptables v1.2.7a
root@debian:~# lsmod 
Module                  Size  Used by    Not tainted
ipt_MASQUERADE          1912   0  (autoclean)
iptable_nat            23064   0  (autoclean) [ipt_MASQUERADE]
ip_conntrack           28832   1  (autoclean) [ipt_MASQUERADE
iptable_nat]
iptable_filter          1672   1  (autoclean)
ip_tables              14360   5  [ipt_MASQUERADE iptable_nat
iptable_filter]
root@debian:~# 



