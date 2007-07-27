From: Chris Kanich <ckanich@cs.ucsd.edu>
Subject: load balancing over a very large number of outgoing addresses?
Date: Thu, 26 Jul 2007 18:27:59 -0700
Message-ID: <46A94A1F.4000107@cs.ucsd.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,
I have recently developed a need to multiplex connections from within a 
NAT over several (hundred, even thousand if possible) external IPs. I 
can have all of these IPs routed to a single interface on my NAT box, 
however I am not exactly sure how to set up a random/round robin load 
balancing scheme such that outgoing connections from my network each get 
a random source address from my source address pool.

I have come across this how-to:
http://lartc.org/howto/lartc.rpdb.multiple-links.html

However it seems that I cannot scale these routing rules past 255 
routes, and unlike the example, I am not multiplexing interfaces but 
only IPs in roughly a contiguous /16 range being routed to this linux 
machine.

Any suggestions on how to get this up and running would be greatly 
appreciated.

Many thanks,
Chris Kanich

