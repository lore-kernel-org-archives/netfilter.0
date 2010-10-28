From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Delay in getting destroy events
Date: Thu, 28 Oct 2010 11:55:16 +0200
Message-ID: <4CC94884.1010003@netfilter.org>
References: <2DE723F44CAFD24A9B6BF606813F010C4072C5C698@aae-exch> <4CAD7EB1.8010407@netfilter.org> <2DE723F44CAFD24A9B6BF606813F010C4078F34B60@aae-exch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <2DE723F44CAFD24A9B6BF606813F010C4078F34B60@aae-exch>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bill Rogers <BillR@aaesys.com>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

On 27/10/10 20:47, Bill Rogers wrote:
> Hi Pablo Neira Ayuso,
> 
> I am monitoring when connections are created and destroyed based on the example presented in conntrack_events.c.  I get notified promptly with an NFCT_T_NEW message when a connection is created.  (Occasionally I see more than one NFCT_T_NEW message for the same connection, but I can simply ignore those.)  
> 
> When a connection is closed, it is taking several minutes before I get an NFCT_T_DESTROY message for the connection.  If I poll /proc/net/nf_conntrack file, I see the connection being closed within a few seconds of stopping iperf, which I am using to create the connections.
> 
> I want to be able to get notified when a connection is destroyed rather than poll /proc/net/nf_conntrack.  Is this a configuration issue?  Is there a long timeout defined somewhere that needs to be changed?  It is taking at least 5 to 10 minutes before being notified of the destroyed event.
> 
> Any guidance you could provide would be deeply appreciated.

# ls /proc/sys/net/netfilter/nf_conntrack_tcp_*
/proc/sys/net/netfilter/nf_conntrack_tcp_be_liberal
/proc/sys/net/netfilter/nf_conntrack_tcp_loose
/proc/sys/net/netfilter/nf_conntrack_tcp_max_retrans
/proc/sys/net/netfilter/nf_conntrack_tcp_timeout_close
/proc/sys/net/netfilter/nf_conntrack_tcp_timeout_close_wait
/proc/sys/net/netfilter/nf_conntrack_tcp_timeout_established
/proc/sys/net/netfilter/nf_conntrack_tcp_timeout_fin_wait
/proc/sys/net/netfilter/nf_conntrack_tcp_timeout_last_ack
/proc/sys/net/netfilter/nf_conntrack_tcp_timeout_max_retrans
/proc/sys/net/netfilter/nf_conntrack_tcp_timeout_syn_recv
/proc/sys/net/netfilter/nf_conntrack_tcp_timeout_syn_sent
/proc/sys/net/netfilter/nf_conntrack_tcp_timeout_time_wait
/proc/sys/net/netfilter/nf_conntrack_tcp_timeout_unacknowledge

These allow to set up the timeouts for different TCP states. The default
values are based on the RFCs.

The connection generally remains in TIME_WAIT for 120 seconds once it is
closed (as specified by the RFC).

The destroy event is delivered once the flow-state information is
released from the kernel, ie. once the timer expires.
