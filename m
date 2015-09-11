From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: iptables TRACE not logged
Date: Fri, 11 Sep 2015 14:28:03 +0200
Message-ID: <20150911122803.GA5460@salvia>
References: <CABLYT9hQERBkQWskobkKb8tJ64is48e8_4joAYivjo4a+_e+GA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CABLYT9hQERBkQWskobkKb8tJ64is48e8_4joAYivjo4a+_e+GA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vieri Di Paola <vieridipaola@gmail.com>
Cc: netfilter@vger.kernel.org

On Fri, Sep 11, 2015 at 10:25:15AM +0200, Vieri Di Paola wrote:
> Hi,
> 
> I'm trying to see the TRACE log by issuing the following commands:
> 
> /sbin/iptables -t raw -A PREROUTING --destination 10.215.237.237 -j TRACE
> /sbin/iptables -t raw -A OUTPUT --destination 10.215.237.237 -j TRACE
> 
> After ping'ing 10.215.237.237, I'd like to know where to look for the
> TRACE messages.
> I've looked in /var/log/messages (and other system logs) and
> /proc/kmsg but no sign of them.
> 
> What can I try?
> 
> Kernel has support for TRACE (CONFIG_NETFILTER_XT_TARGET_TRACE=m).
> 
> # lsmod | grep -i trace
> xt_TRACE                 551  0
> x_tables                8695  52
> xt_physdev,xt_pkttype,xt_statistic,xt_DSCP,xt_dscp,xt_iprange,xt_mark,xt_time,xt_CT,xt_helper,xt_length,xt_comment,xt_policy,xt_CHECKSUM,xt_recent,ip_tables,xt_socket,xt_tcpmss,xt_tcpudp,ipt_MASQUERADE,xt_LOGMARK,xt_condition,xt_NFQUEUE,xt_NFLOG,xt_TRACE,xt_iface,xt_ipp2p,xt_limit,xt_owner,xt_realm,xt_ACCOUNT,ipt_rpfilter,xt_connlimit,xt_conntrack,xt_IPMARK,xt_LOG,xt_mac,xt_nat,xt_set,xt_hashlimit,xt_multiport,iptable_filter,xt_CLASSIFY,xt_TARPIT,xt_TCPMSS,xt_TPROXY,xt_connmark,ipt_REJECT,xt_REDIRECT,iptable_mangle,xt_addrtype,iptable_raw
> 
> I'm using syslog-ng.but I've also tried metalog: still no TRACE messages.
> 
> So I guess the logger isn't to blame and there's something wrong with
> my kernel or netfilter installation.
> 
> # uname -a
> Linux fw3 4.1.4-hardened #1 SMP Thu Aug 13 15:49:17 CEST 2015 i686
> Intel(R) Xeon(TM) CPU 2.66GHz GenuineIntel GNU/Linux
> 
> # iptables --version
> iptables v1.4.21
> 
> Do you need more info?
> 
> What can I try?

What does

cat /proc/net/netfilter/nf_log

say?

If it looks like this, then you have no logger registered into the
nf_log framework:

 0 NONE ()
 1 NONE ()
 2 NONE ()
 3 NONE ()
 4 NONE ()
 5 NONE ()
 6 NONE ()
 7 NONE ()
 8 NONE ()
 9 NONE ()
10 NONE ()
11 NONE ()
12 NONE ()
