From: Alexis <alexis@attla.net.ar>
Subject: Re: kernel2.6.2-3 + iptables/shorewall
Date: Thu, 19 Feb 2004 12:01:01 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1077202860.1578.13.camel@pepelui.baicom>
References: <1077202137.4302.12.camel@gb7tf.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1077202137.4302.12.camel@gb7tf.org.uk>
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
To: Richard Bown <richard.bown@blueyonder.co.uk>
Cc: 'netfilter' <netfilter@lists.netfilter.org>

Yes, i have at least 4 firewalls running SNAT and DNAT with 2.6.2 and
iptables 1.2.9 without any problem. (using redhat 8,9 or debian)



IP forwarding could be enabled and disabled at

/proc/sys/net/ipv4/ip_forward if this is your question



On Thu, 2004-02-19 at 11:48, Richard Bown wrote:
> Hi
> having a real headach with this
> Running kernel-2.6.2-3mdk patched for win4lin
> iptables 1.2.9-5mdk
> shorewall 1.4.8-3mdk
> modules loaded are :-
> ipt_TOS 2240 0 - Live 0xe197f000
> ipt_REJECT 6464 0 - Live 0xe198e000
> ipt_LOG 5312 0 - Live 0xe198b000
> ipt_state 1728 2 - Live 0xe1985000
> ipt_multiport 1856 0 - Live 0xe1983000
> ipt_conntrack 2304 0 - Live 0xe1981000
> iptable_filter 2624 1 - Live 0xe1932000
> iptable_mangle 2624 0 - Live 0xe18d2000
> iptable_nat 23116 1 ipt_MASQUERADE, Live 0xe18c3000
> ip_conntrack 31120 4 ipt_MASQUERADE,ipt_state,ipt_conntrack,iptable_nat,
> Live 0xe1963000
> ip_tables 16704 10
> ipt_MASQUERADE,ipt_TOS,ipt_REJECT,ipt_LOG,ipt_state,ipt_multiport,ipt_conntrack,iptable_filter,iptable_mangle,iptable_nat, Live 0xe1952000
> 
> 
> now in the 2.4 series kernels if I remember right you could turn /off
> IPV4 forwarding, I hav'nt found this at all in the config file on a
> 2.6.2 kernel.
> So as you guys are more at the iptables end, is anyone successfully
> getting MASQ,& DNAT functional with a 2.6.2 kernel, and maybe on a
> mandrake system :)
> 
> Thanks
> Richard
-- 
Alexis <alexis@attla.net.ar>


