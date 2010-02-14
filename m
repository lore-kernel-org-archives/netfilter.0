From: Guido Trentalancia <guido@trentalancia.com>
Subject: Re: Natting html traffic
Date: Sun, 14 Feb 2010 17:08:06 +0100
Message-ID: <1266163686.2983.15.camel@tesla.lan>
References: <368e93c51002130846j1d3d6db9i6247a729ac326418@mail.gmail.com>
	 <1266080143.2916.65.camel@tesla.lan>
	 <368e93c51002140252p2c6eef7fg8d87650d324bb726@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <368e93c51002140252p2c6eef7fg8d87650d324bb726@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bojan Sukalo <shukalo83@gmail.com>
Cc: netfilter@vger.kernel.org

On Sun, 2010-02-14 at 11:52 +0100, Bojan Sukalo wrote:
> First thing thank you both on your usefull remarks.
> 
> 
> Guido wrote:
> 
> > The kernel is not that old. Most probably you won't necessarily need to
> > upgrade the kernel as it is 2.6.x. You can try building and installing
> > the latest iptables (version 1.4.6) and only after that a new kernel
> > (latest version is 2.6.32.8).
> 
> > But before doing that, I would suggest you first try another ISP using a
> > dial-up connection to understand whether the TCP MSS diagnosis is
> > correct or not.
> 
> But also Mart said:
> 
> > Changing the iptables version will not change anything, if the current
> > version does not have problems setting the kernel part correctly.
> > You would need to upgrade kernel.
> 
> I suspect that Mark is right because iptables is just userspace app to
> set netfilter kernel module but if that is not the case I could try
> and install new version of iptables.
> 
> Mark:
> > The rule-set looks okay for me.
> > Does it only happen with google.com, or with all web hosts?
> 
> It's happenin for all types of tcp traffic from inside to internet.
> Session established but nothing after that. No data traffic.
> 
> > Look how you have set the /proc/sys/net/ipv4/tcp_* options.
> 
> [root@natbox net]# grep -r '' ./ipv4 | grep tcp
> ./ipv4/netfilter/ip_conntrack_tcp_max_retrans:3
> ./ipv4/netfilter/ip_conntrack_tcp_be_liberal:0
> ./ipv4/netfilter/ip_conntrack_tcp_loose:3
> ./ipv4/netfilter/ip_conntrack_tcp_timeout_max_retrans:300
> ./ipv4/netfilter/ip_conntrack_tcp_timeout_close:10
> ./ipv4/netfilter/ip_conntrack_tcp_timeout_time_wait:120
> ./ipv4/netfilter/ip_conntrack_tcp_timeout_last_ack:30
> ./ipv4/netfilter/ip_conntrack_tcp_timeout_close_wait:60
> ./ipv4/netfilter/ip_conntrack_tcp_timeout_fin_wait:120
> ./ipv4/netfilter/ip_conntrack_tcp_timeout_established:432000
> ./ipv4/netfilter/ip_conntrack_tcp_timeout_syn_recv:60
> ./ipv4/netfilter/ip_conntrack_tcp_timeout_syn_sent:120
> ./ipv4/tcp_slow_start_after_idle:1
> ./ipv4/tcp_workaround_signed_windows:1
> ./ipv4/tcp_bic_beta:819
> ./ipv4/tcp_tso_win_divisor:8
> ./ipv4/tcp_moderate_rcvbuf:1
> ./ipv4/tcp_bic_low_window:14
> ./ipv4/tcp_bic_fast_convergence:1
> ./ipv4/tcp_bic:1
> ./ipv4/tcp_vegas_gamma:2
> ./ipv4/tcp_vegas_beta:6
> ./ipv4/tcp_vegas_alpha:2
> ./ipv4/tcp_vegas_cong_avoid:0
> ./ipv4/tcp_westwood:0
> ./ipv4/tcp_no_metrics_save:0
> ./ipv4/tcp_low_latency:0
> ./ipv4/tcp_frto:0
> ./ipv4/tcp_tw_reuse:0
> ./ipv4/tcp_adv_win_scale:2
> ./ipv4/tcp_app_win:31
> ./ipv4/tcp_rmem:4096	87380	174760
> ./ipv4/tcp_wmem:4096	16384	131072
> ./ipv4/tcp_mem:786432	1048576	1572864
> ./ipv4/tcp_dsack:1
> ./ipv4/tcp_ecn:0
> ./ipv4/tcp_reordering:3
> ./ipv4/tcp_fack:1
> ./ipv4/tcp_orphan_retries:0
> ./ipv4/tcp_max_syn_backlog:1024
> ./ipv4/tcp_rfc1337:0
> ./ipv4/tcp_stdurg:0
> ./ipv4/tcp_abort_on_overflow:0
> ./ipv4/tcp_tw_recycle:0
> ./ipv4/tcp_syncookies:0
> ./ipv4/tcp_fin_timeout:60
> ./ipv4/tcp_retries2:15
> ./ipv4/tcp_retries1:3
> ./ipv4/tcp_keepalive_intvl:75
> ./ipv4/tcp_keepalive_probes:9
> ./ipv4/tcp_keepalive_time:7200
> ./ipv4/tcp_max_tw_buckets:180000
> ./ipv4/tcp_max_orphans:262144
> ./ipv4/tcp_synack_retries:5
> ./ipv4/tcp_syn_retries:5
> ./ipv4/tcp_retrans_collapse:1
> ./ipv4/tcp_sack:1
> ./ipv4/tcp_window_scaling:1
> ./ipv4/tcp_timestamps:1
> 
> Please if you can find any strange things in this setup let me know
> 
> Bojan
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Some parameters are non-default at least according to more recent
kernels, for example:

./ipv4/tcp_workaround_signed_windows:0
./ipv4/tcp_tso_win_divisor:3
./ipv4/tcp_frto:2
./ipv4/tcp_ecn:2
./ipv4/tcp_max_orphans:16384

But you could have already rebuilt kernel and iptables in this time...
And have you tried another ISP ? The latter is a very important test.

Guido

