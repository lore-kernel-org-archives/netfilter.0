From: Iva "Cabric" Cabric <ivac@gnjilux.srk.fer.hr>
Subject: Re: ULOG with -m state
Date: Tue, 26 Nov 2002 12:34:34 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021126113434.GC9457@gnjilux.srk.fer.hr>
References: <20021122155352.GA5665@gnjilux.srk.fer.hr> <200211241945.38762.netfilter@newkirk.us>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200211241945.38762.netfilter@newkirk.us>
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
Content-Transfer-Encoding: 7bit
To: Joel Newkirk <netfilter@newkirk.us>
Cc: netfilter@lists.netfilter.org

More update,....
I have put new iptables version (1.2.7a-7 from Debian), and no
change:

$ iptables -A INPUT -j ULOG -p tcp -m state --state NEW
iptables v1.2.7a: You must specify `--state'
Try `iptables -h' or 'iptables --help' for more information.

also it looks that ULOG is not working at all:

Chain INPUT (policy ACCEPT 128K packets, 77M bytes)
 pkts bytes target     prot opt in     out     source               destination         
 5065  374K ACCEPT     all  --  *      *       xxx.xxx.xxx.xxx/19     xxx.xxx.xxx.xxx    
    0     0 ACCEPT     all  --  *      *       xxx.xxx.xxx.xxx/18     xxx.xxx.xxx.xxx    
 4022  338K ULOG       all  --  *      *       0.0.0.0/0            0.0.0.0/0          ULOG copy_range 0 nlgroup 1 prefix `INPUT:DROP' queue_threshold 1 
12630 1061K ULOG       all  --  *      *       0.0.0.0/0            0.0.0.0/0          ULOG copy_range 0 nlgroup 1 prefix `INPUT:DROP' queue_threshold 50 
12630 1061K DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0          

kernel is matching packets but ulogd doesnt produce any output in log
files. I have tried to strace ulogd but it just waits in "recvfrom(6,",
and according to lsof descriptor 6 is:

ulogd   21070 root    6u  sock    0,0         322745 can't identify protocol

Any help appreciated.

-- 
@

