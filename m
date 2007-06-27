From: Msquared <1.list.netfilter@msquared.id.au>
Subject: 'recent' matching when less than hitcount hits
Date: Wed, 27 Jun 2007 17:00:43 +0800
Message-ID: <20070627090043.GC31525@sliderule.msquared.com.au>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi people!

I seem to be having a problem where a rule with --hitcount is matching
when there are fewer hits than is listed in the hitcount parameter.

I have the following two rules in a chain called service-ssh:

  -m recent --update --seconds 40 --hitcount 5 --name SSH --rsource -j DROP
  -m recent --set --name SSH --rsource -j ACCEPT

The rules are in a chain that is only hit for incoming SSH connections.
EG: I have this rule in the INPUT chain:

  -m tcp --dport 22 -j service-ssh

The problem is that while the first attempt to connect to SSH on the
server succeeds, the second one fails.

The match counts after restarting iptables:


[root@server ~]# iptables -vnL service-ssh
Chain service-ssh (1 references)
 pkts bytes target     prot opt in     out     source      destination
    0     0 DROP       all  --  *      *       0.0.0.0/0   0.0.0.0/0           recent: UPDATE seconds: 40 hit_count: 5 name: SSH side: source
    0     0 ACCEPT     all  --  *      *       0.0.0.0/0   0.0.0.0/0           recent: SET name: SSH side: source


After one connection to SSH:

[root@server ~]# iptables -vnL service-ssh
Chain service-ssh (1 references)
 pkts bytes target     prot opt in     out     source      destination
    0     0 DROP       all  --  *      *       0.0.0.0/0   0.0.0.0/0           recent: UPDATE seconds: 40 hit_count: 5 name: SSH side: source
    1    48 ACCEPT     all  --  *      *       0.0.0.0/0   0.0.0.0/0           recent: SET name: SSH side: source

[root@server ~]# cat /proc/net/ipt_recent/SSH
src=202.89.183.219 ttl: 122 last_seen: 3951144554 oldest_pkt: 1 last_pkts:
3951144554 


After the second connection to SSH (which times out):

[root@server ~]# iptables -vnL service-ssh
Chain service-ssh (1 references)
 pkts bytes target     prot opt in     out     source       destination
    2    96 DROP       all  --  *      *       0.0.0.0/0    0.0.0.0/0           recent: UPDATE seconds: 40 hit_count: 5 name: SSH side: source
    1    48 ACCEPT     all  --  *      *       0.0.0.0/0    0.0.0.0/0           recent: SET name: SSH side: source

[root@server ~]# cat /proc/net/ipt_recent/SSH
src=202.89.183.219 ttl: 122 last_seen: 3951159153 oldest_pkt: 4 last_pkts: 3951144554, 3951158254, 3951158551, 3951159153



Note that there are only four hits listed, yet the DROP rule still
matched.

As I understand it, my rules mean the following:

  -m recent --update --seconds 40 --hitcount 5 --name SSH --rsource -j DROP

              If this IP address has been seen five times or more, and the
              last time was in the last 40 seconds mark it as seen again,
              and drop the connection.
    
  -m recent --set --name SSH --rsource -j ACCEPT

              Mark this IP address as seen, and accept the connection.

Is this correct?  Am I missing something about how --seconds and
--hitcount interact?

Also, all of this (plus the contents of /proc/net/ipt_recent/SSH) makes me
wonder how entries in the IP list are aged and removed.  Can I control
that, or is that up to the ipt_recent module itself only?


Regards, Msquared...

