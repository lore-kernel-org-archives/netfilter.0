From: "Pete Davis" <peted@springisd.org>
Subject: Comments and questions about tuning IPTables for high volume
Date: Wed, 17 Dec 2003 08:58:02 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <sfe01aa8.008@gwadmin.springisd.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: , netfilter@lists.netfilter.org, , 

I have tuned my IPTables box running Redhat 9 on a dual 1ghz box with
1GB and raid1 scsi160 (2x36gb).  It is acting as a temporary replacement
(to test throughput/prove the proxy is a bottleneck) for our proxy but
it is NOT doing anything other than routing with a few firewall rules to
block ICMPs and UDP Microsoft ports (lingering Nachi infections). Here
are the parameters I have tuned and other pertinent settings:
ulimit -n 8192
/proc/sys/fs/file-max 104851
/proc/sys/net/ipv4/ip_conntrack_max 65528

sysctl ((Not sure exactly what they mean but these were the defaults...
Anyone have explanations for them??):
net.ipv4.tcp_wmem 4096 16384 131072  
net.core.wmem_default = 65535
net.core.wmem_max = 131071
(the rmem settings are the same)

I have seen up to 9700 connections in ip_conntrack with 95%+ being HTTP
connections.  The CPU never goes about 5%.  It has 800mb+ free.

Questions:
1) Any suggestions on other tuning?  It is just a packet processor
(router) with a few rules... less than 20 total.  It is protected by a
firewall so I don't need rule tuning/suggestions just throughput
suggestions.  It is servicing 6000+ desktops on an uncapped ds3
(normally capped at 15mb/s but uncapped for testing by the ISP).

2) I tuned sysctl for things like source routing, ICMP echo broadcast,
'martians, etc.  I turned on syncookies also.  Any sysctl things I may
have missed for an IPTables firewall?

3) I have tuned the max number of open files and file descriptors but a
cat /proc/sys/fs/file-nr says "240 67 104851", or close to it (not much
being used).  When I do a "lsof | wc -l", I get a number between 300 and
390.  Question:  I thought that each connection took one or more file
descriptors? (I might be confusing it with FreeBSD, which I also use). 
I thought the max number of open files was necessary for an IPTables
firewall/'router' also, correct??

4)  When I do a 'vmstat', I see the number of interrupts steadily
climbing up (under 'system' the column labeled 'in').  Once it gets near
300-350, it goes back to zero.  It doesn't seem to be tied to the number
of connections or any other statistic I can find.  I suspect the
interrupts are related to the NIC.  Any ideas what might be going on? 
Is this even a concern based on the purpose/performance of the box (It
has gotten up to 21mb/s to the internet).

BTW, thanks to all for the help on the syslogd problem.  It was set up
correctly and 'started' working some time between Thursday night and
Monday morning... I have no idea why it took a few hours to kick it but
thanks to all anyway.

Pete

