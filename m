From: "Marius Mertens" <marius.mertens@gmx.de>
Subject: Conntrack entries seem to get lost
Date: Wed, 22 Jun 2005 02:23:12 +0200
Message-ID: <002801c576c0$998f4930$4206a8c0@loki>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

Hi everybody,

a while ago I had a problem with my setup that, while otherwise working 
perfectly well, caused packets which should have been NATed to a computer in 
my private IP space to hit INPUT of the router. Unfortunately we did not 
find a solution, but all the packets had in common, that their state was 
considered INVALID. 
(http://lists.netfilter.org/pipermail/netfilter/2005-January/057795.html)
Since it was still mysterious why the packets became INVALID, and other 
people seemed to have similar problems (like 
http://lists.netfilter.org/pipermail/netfilter/2005-June/061090.html) which 
never got really solved, I finally did some more structured logging:
All packets from the LAN host that initialized new connections were logged 
as "FW FORWARD" and then accepted in FORWARD, while all packets that hit the 
router's INPUT with state INVALID were logged as "FW INPUT INVALID":

iptables -A INPUT -i ppp0 -m state --state INVALID -j LOG --log-level 
6 --log-prefix "FW INPUT INVALID: "
iptables -A FORWARD -i eth0 -o ppp0 -m state --state NEW -j LOG --log-level 
6 --log-prefix "FW FORWARD: "

And fortunately there appeared interesting blocks (in fact a lot of them) in 
my log, that were similar to the following example:
(X.X.X.X is the anonymized version of my local IP, Y.Y.Y.Y my public IP, 
Z.Z.Z.Z the public remote IP and please excuse the ugly linebreaks in the 
log snippet)

Jun 21 12:32:02 thor kernel: FW FORWARD: IN=eth0 OUT=ppp0 SRC=X.X.X.X
DST=Z.Z.Z.Z LEN=48 TOS=0x00 PREC=0x00 TTL=127 ID=38029 DF PROTO=TCP
SPT=3559 DPT=4662 WINDOW=65535 RES=0x00 SYN URGP=0
Jun 21 12:32:05 thor kernel: FW FORWARD: IN=eth0 OUT=ppp0 SRC=X.X.X.X
DST=Z.Z.Z.Z LEN=48 TOS=0x00 PREC=0x00 TTL=127 ID=38292 DF PROTO=TCP
SPT=3559 DPT=4662 WINDOW=65535 RES=0x00 SYN URGP=0
Jun 21 12:32:06 thor kernel: FW FORWARD: IN=eth0 OUT=ppp0 SRC=X.X.X.X
DST=Z.Z.Z.Z LEN=48 TOS=0x00 PREC=0x00 TTL=127 ID=38415 DF PROTO=TCP
SPT=3559 DPT=4662 WINDOW=65535 RES=0x00 SYN URGP=0
Jun 21 12:32:10 thor kernel: FW INPUT INVALID: IN=ppp0 OUT= MAC=
SRC=Z.Z.Z.Z DST=Y.Y.Y.Y LEN=48 TOS=0x00 PREC=0x00 TTL=116
ID=24904 DF PROTO=TCP SPT=4662 DPT=3559 WINDOW=64800 RES=0x00 ACK SYN URGP=0
Jun 21 12:32:13 thor kernel: FW INPUT INVALID: IN=ppp0 OUT= MAC=
SRC=Z.Z.Z.Z DST=Y.Y.Y.Y LEN=48 TOS=0x00 PREC=0x00 TTL=116
ID=25029 DF PROTO=TCP SPT=4662 DPT=3559 WINDOW=64800 RES=0x00 ACK SYN URGP=0
Jun 21 12:32:18 thor kernel: FW INPUT INVALID: IN=ppp0 OUT= MAC=
SRC=Z.Z.Z.Z DST=Y.Y.Y.Y LEN=48 TOS=0x00 PREC=0x00 TTL=116
ID=25300 DF PROTO=TCP SPT=4662 DPT=3559 WINDOW=64800 RES=0x00 ACK SYN URGP=0

My interpretation of this kind of log is the following:
The machine X.X.X.X in my local network starts a connection Z.Z.Z.Z. The 
router's MASQUERADE target works as intended so a packet with its source 
rewritten to Y.Y.Y.Y goes out via ppp0. The remote host answers to Y.Y.Y.Y. 
But when arriving at the router, the destination is not rewritten to X.X.X.X 
and the packet forwarded to the LAN host. Instead it hits the router with 
state INVALID and is dropped there.

So it looks like the NAT done by the MASQUERADE target worked, but somehow 
conntrack "forgot" that connection, or maybe that connection entry was never 
generated. Whatever the reason is, the result is that the packet does not 
reach its intended destination.

You can believe me that I more than double-checked my setup, but I was 
unable to find anything wrong in my configuration (well, let's say anything 
wrong that could lead to the mentioned results ;-) ). And since other 
people, with quite different setups, have problems so similar to mine, the 
most probable conclusion seems that there actually is a problem with 
conntrack, which results in connection entries being either forgotten or not 
created.
Again, searching the error elsewhere is nothing I do unfounded, but in this 
case I just did not find a different, more probable explanation. I would 
really like to know your opinion about this topic, for I am never sure that 
there is nothing else I might have missed.

Thanks in advance,

Marius 


