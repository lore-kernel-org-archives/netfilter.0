From: Vincent Lim <vincent.lim@nestac.com>
Subject: conntrack timeout values
Date: Tue, 08 Oct 2002 11:28:04 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DA250C4.F8D32F1D@nestac.com>
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

Folks,

I'm experiencing some problems with conntrack...the reported timeout
values seems to be wrong:

<snip from ip_conntrack_proto_tcp.c>

static unsigned long tcp_timeouts[]
= { 30 MINS,    /*  TCP_CONNTRACK_NONE, */
    5 DAYS, /*  TCP_CONNTRACK_ESTABLISHED,  */
    2 MINS, /*  TCP_CONNTRACK_SYN_SENT, */
    60 SECS,    /*  TCP_CONNTRACK_SYN_RECV, */
    2 MINS, /*  TCP_CONNTRACK_FIN_WAIT, */
    2 MINS, /*  TCP_CONNTRACK_TIME_WAIT,    */
    10 SECS,    /*  TCP_CONNTRACK_CLOSE,    */
    60 SECS,    /*  TCP_CONNTRACK_CLOSE_WAIT,   */
    30 SECS,    /*  TCP_CONNTRACK_LAST_ACK, */
    2 MINS, /*  TCP_CONNTRACK_LISTEN,   */
};
<snip>

According to the code, TIME_OUT connections should have a timeout value
of 2 minutes. However, according to my /proc/net/ip_conntrack, some of
the TIME_OUT connection has values well above 2 minutes and some even
close to 5 days (equivalent to ESTABLISHED).

tcp      6 372830 TIME_WAIT src=172.16.1.66 dst=172.16.1.194 sport=4204
dport=110 src=172.16.1.194 dst=172.16.1.66 sport=110 dport=4204
[ASSURED] use=1 
tcp      6 179403 TIME_WAIT src=172.16.1.193 dst=172.16.1.194
sport=39197 dport=25 src=172.16.1.194 dst=172.16.1.193 sport=25
dport=39197 [ASSURED] use=1 
tcp      6 175904 CLOSE src=172.16.1.193 dst=172.16.1.194 sport=37165
dport=25 src=172.16.1.194 dst=172.16.1.193 sport=25 dport=37165
[ASSURED] use=1 

I've reviewed the patch 

http://samba.org/ftp/unpacked/netfilter.old/userspace/patch-o-matic/optimizations/ip_ct_refresh_optimization.patch

and the comments by the authors, it seems that it attempts to fix the
issue I'm facing but evidently it's not working. Can someone shed some
light as to what's going on?

-- 
Vincent Lim
Software Engineer
NESTAC Solution Sdn Bhd
vincent.lim@nestac.com | +(6012) 659-6609

