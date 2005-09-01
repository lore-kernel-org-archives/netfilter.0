From: kavitha <fd99127@yahoo.com>
Subject: Dynamically changing destination ip address using iptables - IMP
Date: Wed, 31 Aug 2005 18:44:48 -0700 (PDT)
Message-ID: <20050901014449.75567.qmail@web51611.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

Hi,
 
We are trying to modify the TCP protocol a little but so that when a packet arrives at a router, it would be possible to read a particular field (lets say options or the reserved field) of the packet(that would give the actual path that the packet needs to take) and populate the destination ip address of that packet with the new ipadress read from this reserved field. I know that using dnat you can change the destination ipaddress of the packet but in my problem, I would not knwo the destination ipaddress prior (it would be dynamic) and it would change with every packet - so I would not be able to use a static ip address in the iptables rule. So I wanted to know if there is anyt way to get around this , or if iptables would not provide a solution to thsi problem at all . I knwo this can be done using raw sockets but adding a single line (as in iptables) seems to be a better proposition t
 han writing pages of code. Basically, I want to know if there is a way to dynamically configure
 the destination ipaddress that a packet is being routed to by mapping certain other bits of the same packet coming in. 
 
It would really help if someoen can provide some information in this regard. Any pointers too would really be useful.I looked at the man pages and searched the internet but was not able to come across any rela examples where such a thing may have been used.
 
Thanks for your time! Please let me know if you need more clarifications!
Kavitha

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
