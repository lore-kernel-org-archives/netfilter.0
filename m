From: Oleg Savostyanov <savostyanov@internetplustravel.ru>
Subject: Re[2]: Invalid argument in -j SNAT
Date: Fri, 5 Dec 2003 18:55:29 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <190115679638.20031205185529@internetplustravel.ru>
References: <13211830200.20031202215027@internetplustravel.ru>
 <20031202201831.EAB3C1710@sterenborg.info>
Reply-To: Oleg Savostyanov <savostyanov@internetplustravel.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031202201831.EAB3C1710@sterenborg.info>
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

Hello Rob,

Yes sure

firewall:# lsmod   Module                  Size  Used by    Not tainted
ipt_state                608   2  (autoclean)
ipt_REJECT              3424   1  (autoclean)
ipt_LOG                 3296   1  (autoclean)
iptable_filter          1728   1  (autoclean)
ip_nat_pptp             2304   0  (unused)
ip_nat_ftp              3488   0  (unused)
ip_conntrack_pptp       2720   1  [ip_nat_pptp]
ip_conntrack_proto_gre    3168   0  [ip_nat_pptp ip_conntrack_pptp]
ip_conntrack_ftp        4192   1  [ip_nat_ftp]
iptable_nat            20756   2  (autoclean) [ip_nat_pptp ip_nat_ftp]
ip_conntrack           24852   5  (autoclean) [ipt_state ip_nat_pptp ip_nat_ftp ip_conntrack_pptp ip_conntrack_proto_gre ip_conntrack_ftp iptable_nat]
ip_tables              13504   7  [ipt_state ipt_REJECT ipt_LOG iptable_filter iptable_nat]
firewall:#




Tuesday, December 2, 2003, 11:18:29 PM, you wrote:

>> iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 
>> XXX.XXX.XXX.XXX
>> with an error "iptables: Invalid argument" I suspect, that an argument
>> is XXX.XXX.XXX.XXX

RS> Did you compile and load the module iptable_nat ?


RS> Gr,
RS> Rob


-- 
Best regards,
 Oleg                            mailto:savostyanov@internetplustravel.ru


