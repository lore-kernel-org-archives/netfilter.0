From: Lars Knudsen <gandalfit@virgilio.it>
Subject: Bug with netfilter and NFS server on same machine
Date: Sat, 23 Nov 2002 17:26:18 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DDFAC2A.6060409@virgilio.it>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I have been experiencing problems running a nfs server and iptables on 
the same machine.The problem was also reported almost a year ago by Paul 
Raines 
http://lists.netfilter.org/pipermail/netfilter/2002-January/030002.html 
but it seems no solution has been found yet.

The problem is this: A machine running linux 2.4.18 or 2.4.19 works just 
fine when running just the kernel nfsd. A single client connected to the 
server with 100Mbit ethernet sees throughput of 5-10MByte/sec even after 
an hour or two of continous transfers. If the nfs server is also running 
iptables the throughput is initially the same (5-10MByte/sec) but after 
a while (200MByte-500MByte total transfer) the client starts reporting 
"nfs server not responding" followed after a while by "nfs server OK" 
and of course the transfer rate goes way down (< 1MByte/sec). Using 
tcpdump on the client seems to indicate that some packets have their 
headers garbled - wrong fragment ids being the typical error.

Having iptables compiled as modules and simply loading or unloading the 
ipt_conntrack module is
sufficient for causing/removing the problem. Having iptables support 
compiled into the kernel causes the problem allways.

The problem has been verified on 4 different machines with a variety of 
different ethernet cards. In
all cases the network continues to work without problems for all other 
types of traffic - i.e a telnet connection from client to server works 
with no delay and a ftp transfer goes at >5MByte/sec even when nfs 
throughput is suffering.

\Lars Knudsen


