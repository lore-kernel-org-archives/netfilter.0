From: switcher <switcher@linuxwall.info>
Subject: Check connection state in libipq hook
Date: Mon, 18 Jun 2007 16:15:48 +0200
Message-ID: <20070618161548.120li24u9dcsok0k@webmail.microgate.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

Hi All,

 I'm coding a software that check if an incoming packet is part of an active
 connection.
 I'm using libipq to get the packet and I tried to submit it to
 ip_conntrack_find_get() as a tuple create with ip_conntrack_tuple but it
 doesn't work so I have some questions about that.

 I'm creating the tuple and submitting it with that piece of code :
 --------
 struct ip_conntrack_tuple *tuple;
 tuple->src.ip                 = iph->saddr;
 tuple->src.u.tcp.port         = tcp->source;
 tuple->dst.ip                 = iph->daddr;
 tuple->dst.u.tcp.port         = tcp->dest;
 tuple->dst.protonum         = iph->protocol;
 tuple->dst.dir                = 0;
 if (NULL == ip_conntrack_find_get(tuple, NULL))
 {
      fprintf(stdout, "tuple IS NOT part of an active connection");
 }
 else {
      fprintf(stdout, "tuple IS part of an active connection");
 }
 --------
 But I don't know what to put in tuple->dst.dir value... is it a static value ?

 Moreover, I included <linux/netfilter.h>,
 <linux/netfilter_ipv4/ip_conntrack_tuple.h> and
 <linux/netfilter_ipv4/ip_conntrack_core.h> (kernel 2.6.17.7) but when I try to
 compile it, I have an error message :
 --------
 /usr/include/linux/netfilter_ipv4/ip_conntrack_core.h: In function
 'ip_conntrack_confirm':
 /usr/include/linux/netfilter_ipv4/ip_conntrack_core.h:44: error: dereferencing
 pointer to incomplete type
 /usr/include/linux/netfilter_ipv4/ip_conntrack_core.h: At top level:
 /usr/include/linux/netfilter_ipv4/ip_conntrack_core.h:59: error: syntax error
 before 'ip_conntrack_lock'
 --------

 I'm not manipulating 'ip_conntrack_confirm' nor 'ip_conntrack_lock' so I guess
 I've made a mistake somewhere but I don't know where...
 Could you help me ?

 Thanks,
 julien


