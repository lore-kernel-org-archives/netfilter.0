From: =?iso-8859-1?b?Sm9z6Q==?= Pablo =?iso-8859-1?b?UOlyZXo=?= 
	<josepablo@correo.co.cr>
Subject: Advice for nf_conntrack: table full: increase
	netfilter.ip_conntrack  or descrease timeouts?
Date: Thu, 14 Jun 2012 18:52:26 -0600
Message-ID: <20120614185226.uq30mm4474wkskks@correo.co.cr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="Yes	format=flowed"
To: netfilter@vger.kernel.org

Hello again guys...

I have a webserver who should be able to handle 10,000 established  
requests, right now its been tested with 1000 but it fails because of  
to many connections on TIME_WAIT

I have been reading prior to posting and it seems I have two options:

Increse these two:
sysctl -a | grep conntrack | grep net.nf_conntrack_max
net.nf_conntrack_max = 31772

sysctl -w net.netfilter.nf_conntrack_max=131072
echo 32768 > /sys/module/nf_conntrack/parameters/hashsize

Or decrease the timeouts.. which right now I have...

Right now I have:

sysctl -a | grep conntrack | grep timeout
net.netfilter.nf_conntrack_generic_timeout = 600
net.netfilter.nf_conntrack_tcp_timeout_syn_sent = 120
net.netfilter.nf_conntrack_tcp_timeout_syn_recv = 60
net.netfilter.nf_conntrack_tcp_timeout_established = 432000
net.netfilter.nf_conntrack_tcp_timeout_fin_wait = 120
net.netfilter.nf_conntrack_tcp_timeout_close_wait = 60
net.netfilter.nf_conntrack_tcp_timeout_last_ack = 30
net.netfilter.nf_conntrack_tcp_timeout_time_wait = 120
net.netfilter.nf_conntrack_tcp_timeout_close = 10
net.netfilter.nf_conntrack_tcp_timeout_max_retrans = 300
net.netfilter.nf_conntrack_tcp_timeout_unacknowledged = 300
net.netfilter.nf_conntrack_udp_timeout = 30
net.netfilter.nf_conntrack_udp_timeout_stream = 180
net.netfilter.nf_conntrack_icmp_timeout = 30
net.netfilter.nf_conntrack_events_retry_timeout = 15



Iam more keen to the second because high  
net.ipv4.netfilter.ip_conntrack_max according to what I read can lead  
to system freeze.... so can anybody offer me a reference to tune and  
lower these paratemers? I tried lowering the  
net.ipv4.netfilter.ip_conntrack_tcp_timeout_time_wait  to 5 ... but  
that didnt change anything much.

Thanks..!



