From: Lewis Shobbrook <mylists@blue-matrix.org>
Subject: conntrack related dropped packets or HTB issues on 2.6.11?
Date: Fri, 27 May 2005 05:45:42 +1000
Message-ID: <200505270545.43149.mylists@blue-matrix.org>
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
To: netfilter@lists.netfilter.org, lartc@mailman.ds9a.nl

Hi All,

I'm looking for some comments on an issue that I'd had since the start of the 
week.
In short the problem appears to potentially be an overwhelming of the 
conntrack tables, where connection state is lost and packets dropped.

A combination of using htb & U32 QOS to clamp the smtp traffic to 128kb on a 
512kb sync line, some sizeable bulk emails sent from the marketing department 
(120 x 2MB) from an M$ exchange server (with default No. of simultaneous smtp 
connections of 1000), resulted in persistant delivery failures/time-outs and 
growth in queues.

The toplogy consitis of postfix on the firewall relaying valid virus cleaned 
mail to an internal exchange (don't be tempted to blame me here!), exchange 
sends directly to the net.

Most small messages were sent as expected, but the larger ones timed out and 
remained in the queue.

I noted that despite long established and functional firewall rules allowing 
for inbound tcp dport 25, the packets were being dropped and logged.
tcp IN:IN=ppp0 OUT= MAC= SRC=69.16.xxx.xxx DST=xxx.xxx.xxx.xxx LEN=52 TOS=0x00 
PREC=0x00 TTL=49 ID=26228 DF PROTO=TCP SPT=38158 DPT=25 WINDOW=5840 RES=0x00 
ACK FIN URGP=0

During the time these events were being logged I was still able to telnet to 
port 25 from a remote network to the xxx.xxx.xxx.xxx interface, so clearly 
something bogus was going on.  Email was still coming in and out at a heavy 
but not ridiculous rate. Note also that only some connections to port 25 were 
logegd this way, the test telnet's to port 25 showed only in the mail log not 
at all on the firewall.

I also noted that I was getting a huge increase in the number of "NEW" packets 
not marked as SYN which viewed as follows...
NEW NOT SYN!: IN=ppp0 OUT= MAC= SRC=203.57.xxx.xxx DST=xxx.xxx.xxx.xxx LEN=100 
TOS=0x00 PREC=0x00 TTL=57 ID=42058 DF PROTO=TCP SPT=25 DPT=6699 WINDOW=58080 
RES=0x00 ACK PSH URGP=0

I deduced from this that it was posible the contrack tables were overrun and 
the connection state being lost.  I didn't have focus to 
cat /proc/net/ip_conntrack >> to save the output.... Oh well...

NEW NOT SYN makes sense as being related to an overrun of the conntrack, but 
the inbound blocking to dport 25 seems to me totally strange.  
Similar entries were visible for port 80 web traffic to & from the proxy.  

We have multiple internet connections, changing the route to an alternate (non 
PPP) interface yielded the same results (totally separate networks).  I 
attempted to remove the 128kb clamp etc, despite the number of emails in 
queue were only around 20 with total K of maybe 10-15Mb ...they stayed 
delayed.   ICMP packets were given priority, but still the route across the 
interface facing the bulk of the inbound/outbound email traffic would 
saturate with 1000+ ms response times.
Logging on the exchange server did not indicate unusually high numbers of 
emails being sent that could be attributed to a worm/virus.
There was no indication of any DOS; regardless, each time the internet 
interface routes changed the problem moved from one interface to the next.

I've been using iptables for over 5 years and HTB for the last couple.  I've 
recently made some changes to the HTB QOS and applied it to all interfaces 
which I suspect may have contributed to conntrack tables reaching critical 
mass.  Removing & flushing the HTB rules did not have any immedate effect at 
least.

Has anyone witnessed such occurrences and have any inclination as to what 
causes it?
(Not sure how many of you will have made it to here... phew!)

Cheers & thanks ahead,

Lewis


