From: Esteban <eribicic@sinectis.com>
Subject: string is not working, any help?
Date: 10 Jun 2003 20:59:24 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1055289564.829.3.camel@dejawu>
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
Cc: winfield@freegates.be

root@dejawu:/lib/modules/2.4.20/kernel/net/ipv4/netfilter# lsmod 
Module                  Size  Used by    Tainted: P  
ipt_unclean             6712   0  (unused)
ipt_string              1688   0  (unused)
iptable_nat            18872   0  (autoclean) (unused)
ip_conntrack           24224   1  (autoclean) [iptable_nat]
ip_tables              12952   5  [ipt_unclean ipt_string iptable_nat]
i810_audio             20680   0 
ac97_codec              9992   0  [i810_audio]
8139too                16424   1 
mii                     2272   0  [8139too]
root@dejawu:/lib/modules/2.4.20/kernel/net/ipv4/netfilter# 
root@dejawu:/lib/modules/2.4.20/kernel/net/ipv4/netfilter# 
root@dejawu:/lib/modules/2.4.20/kernel/net/ipv4/netfilter# cd 
root@dejawu:~# 
root@dejawu:~# 
root@dejawu:~# iptables -t mangle -A PREROUTING -p tcp -m --string
"pepee" -j DROP
iptables v1.2.7a: Couldn't load match
`--string':/lib/iptables/libipt_--string.so: cannot open shared object
file: No such file or directory

Try `iptables -h' or 'iptables --help' for more information.

why is not working --string match??
im using pom version patch-o-matic-20030107 under 2.4.20 kernel.






