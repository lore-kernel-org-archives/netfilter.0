From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Dynamically changing destination ip address using iptables - IMP
Date: Wed, 31 Aug 2005 22:46:26 -0500
Message-ID: <43167992.9000503@riverviewtech.net>
References: <20050901014449.75567.qmail@web51611.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050901014449.75567.qmail@web51611.mail.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

> We are trying to modify the TCP protocol a little but so that when a packet arrives at a router, it would be possible to read a particular field (lets say options or the reserved field) of the packet(that would give the actual path that the packet needs to take) and populate the destination ip address of that packet with the new ipadress read from this reserved field. I know that using dnat you can change the destination ipaddress of the packet but in my problem, I would not knwo the destination ipaddress prior (it would be dynamic) and it would change with every packet - so I would not be able to use a static ip address in the iptables rule. So I wanted to know if there is anyt way to get around this , or if iptables would not provide a solution to thsi problem at all . I knwo this can be done using raw sockets but adding a single line (as in iptables) seems to be a better proposition
  than writing pages of code. Basically, I want to know if there is a way to dynamically co
nfigure the destination ipaddress that a packet is being routed to by mapping certain other bits of the same packet coming in. 

(IMHO) This is WAY out side the scope of IPTables.  If you are wanting to do something like this I think you should write a small program that would read the destination from the other field and set it as the IP destination of the packet.  If you did this and did it in the Mangle table PREROUTING chain I think you could then DNAT as you would like with IPTables as you would then have an IP address that you could check against.  That is if I understand you correctly.  As I understand it IPTables is meant to try to fall with in the IP standards and not go out side of it (at least I have not seen any thing to the contrary).  What I mean is that IPTables (and it's associated brethren EBTables and ARPTables) try to work on existing standards with out using non standard things or altering a packet in a way that would make the resulting packet non standard.  As such I don't think what you are w
 anting to do is with in the guys of IPTables.  Sorry.  The only other option that comes to
 mind is to use the QUEUE target and pass the packet to a user space daemon.



Grant. . . .

