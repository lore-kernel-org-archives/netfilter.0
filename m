From: Marty Phee <mphee@jump-technologies.com>
Subject: Re: VPN through the firewall
Date: Thu, 03 Mar 2005 15:57:02 -0600
Message-ID: <4227882E.8040100@jump-technologies.com>
References: <27594E8BA9D5CA458F5EF87D88B6B48F1CB5@pxtvjoexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <27594E8BA9D5CA458F5EF87D88B6B48F1CB5@pxtvjoexd01.pxt.primeexalia.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

ip_conntrack is there.  Is that the same?

ip6t_state              2304  23
ip6_conntrack          43744  1 ip6t_state
ipt_state               2432  35
ip6t_REJECT             7936  3
ipt_REJECT              7680  3
iptable_mangle          3456  1
iptable_filter          3584  1
ip6table_mangle         3200  0
ip_nat_ftp              6096  0
iptable_nat            25804  1 ip_nat_ftp
ip_conntrack_ftp       73712  1 ip_nat_ftp
ip_conntrack           49312  4 
ipt_state,ip_nat_ftp,iptable_nat,ip_conntrack_ftp
ip_tables              18944  10 
ipt_TOS,ipt_policy,ipt_LOG,ipt_limit,ipt_pkttype,ipt_state,ipt_REJECT,iptable_mangle,iptable_filter,iptable_nat
ip6table_filter         3328  1
ip6_tables             20112  6 
ip6t_LOG,ip6t_limit,ip6t_state,ip6t_REJECT,ip6table_mangle,ip6table_filter
ipv6                  264096  23 ip6_conntrack,ip6t_REJECT


