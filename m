From: Ryan D <netfilter@mandrake.us>
Subject: round-robin aliases
Date: Fri, 17 Sep 2004 11:57:29 -0600
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040917175729.GF2579@dearing.us>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Ive been trying to find a way to do this... I have eth0 on the
192.168.2.0/24 network (eth0 has ip 192.168.2.10). I also have 5 aliases
on the same network with these ips:

eth0:1 192.168.2.11
eth0:2 192.168.2.12
eth0:3 192.168.2.13
eth0:4 192.168.2.14


Id like to round-robin the source ip on a per connection basis, meaning,
if I ssh to 192.168.2.100 it may come from eth0:1, if I then ssh to
192.168.2.110 it will come from eth0:2, etc.  So the destination ssh
machines will see different source IPs.

Is this possible with netfilter/iproute2?  The only potential problem I
see is with the arp table, but I also dont understand this stuff as well
as I would like.

-Ryan

