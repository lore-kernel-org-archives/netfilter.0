From: jo@neolabs.be
Subject: ssh gets cut off
Date: Fri, 30 Jan 2004 19:32:32 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401301832.i0UIWWu16787@neo1.neolabs.be>
Reply-To: jo@neolabs.be
Mime-Version: 1.0
Content-Transfer-Encoding: binary
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

Hi, does anyone recognize the following problem :

people here lose their ssh connections to a remote server over the
internet if they leave their ssh open but inactive for like 30 minutes.
This has happened since I replaced our gateway firewall ipfilter
(solaris) by a netfilter(linux) exactly two days ago. So I am pretty sure 
it must be some setting in netfilter.

I have become so desperate that I have cleared out the whole filter
table, leaving only the SNAT in the nat table and some kernel tunings,
but the problem persists. So it cannot be the --syn thing.

The default timeouts make no sense either, I see correct values in
/proc/net/ip_conntrack...

/usr/src/linux/net/ipv4/netfilter/ip_conntrack_proto_tcp.c :

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

The only time frame that comes close to the drop out time reported
by the users is the NONE (???), since they are cut off appr. after
30 minutes of inactivity.

The only 'special' thing is that I SNAT two different internal networks
(10.xx.xx.xx and 172.17.xx.xx - on two internal nic's off
course) to a fixed external ip with the following rule :

iptables -t nat -A POSTROUTING -o $EXTIF -j SNAT --to $EXTIP

Any ideas? Must have already happened ;-)

Thanks for any ideas or hints on how I can trace this. By the way I am
running the Red Hat 9 kernel without any updates.

Jo



NEOlabs - http://www.neolabs.be - mailto:info@neolabs.be

