From: xavier <list.netfilter-W+vduneg5OqcvWdFBKKxig@public.gmane.org>
Subject: tcp & udp timeout hardcoding
Date: Mon, 17 Nov 2003 09:42:08 -0500
Sender: netfilter-admin-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org
Message-ID: <20031117144208.GA22431@nest.8d.com>
Mime-Version: 1.0
Return-path: <netfilter-admin-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
Errors-To: netfilter-admin-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org
List-Help: <mailto:netfilter-request-wool9L35kiczKOhml7GhPuLxvTOCFHmI2yCS0tKOigE@public.gmane.org>
List-Post: <mailto:netfilter-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request-wool9L35kiczKOhml7GhPuLxvTOCFHmIRj+87qQpzpCql8G6E966Ow@public.gmane.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request-wool9L35kiczKOhml7GhPuLxvTOCFHmIFcjs2lY4wUfKtGCp0j7rLg@public.gmane.org>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org



Hello,

I saw in the 2.4.22 kernel source : 

/usr/src/linux/net/ipv4/netfilter/ip_conntrack_proto_tcp.c
static unsigned long tcp_timeouts[]
= { 30 MINS,    /*      TCP_CONNTRACK_NONE,     */
    5 DAYS,     /*      TCP_CONNTRACK_ESTABLISHED,      */
    2 MINS,     /*      TCP_CONNTRACK_SYN_SENT, */
    60 SECS,    /*      TCP_CONNTRACK_SYN_RECV, */
    2 MINS,     /*      TCP_CONNTRACK_FIN_WAIT, */
    2 MINS,     /*      TCP_CONNTRACK_TIME_WAIT,        */
    10 SECS,    /*      TCP_CONNTRACK_CLOSE,    */
    60 SECS,    /*      TCP_CONNTRACK_CLOSE_WAIT,       */
    30 SECS,    /*      TCP_CONNTRACK_LAST_ACK, */
    2 MINS,     /*      TCP_CONNTRACK_LISTEN,   */
};


ip_conntrack_proto_udp.c
#define UDP_TIMEOUT (30*HZ)
#define UDP_STREAM_TIMEOUT (180*HZ)


Is there any plan to be able to set thoses values throught /proc ?

in some cases a 5 days timeout on tcp connexions may be too long...

thanks



-- 
xavier

