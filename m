From: Thomas Heinz <thomasheinz@gmx.net>
Subject: Ipsec, policy match and PROTO=4
Date: Tue, 25 Jul 2006 20:59:02 +0200
Message-ID: <200607252059.02920.thomasheinz@gmx.net>
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

Hallo guys

I have the following standard ipsec tunnel:

[tun_A] host_A [pub_A]-------------[pub_B] host_B [tun_B]

pub_A/B: public IP of host_A/B
tun_A/B: tunnel IP of host_A/B

After establishing the ipsec connection, putting two simple log-all rules 
in INPUT and OUTPUT like this:
# iptables -I INPUT -j LOG
# iptables -I OUTPUT -j LOG
and pinging tun_B from host_A, I get the following log entries:

IN= OUT=eth0 SRC=tun_A DST=tun_B LEN=84 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF 
PROTO=ICMP TYPE=8 CODE=0 ID=16181 SEQ=1
IN= OUT=eth0 SRC=pub_A DST=pub_B LEN=136 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF 
PROTO=ESP SPI=0xxxxxxxxx

Very nice so far: the packet is seen twice, once clear and once encrypted. 
Now, let's look at the ICMP reply.

IN=eth0 OUT= MAC=xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx SRC=pub_B 
DST=pub_A LEN=136 TOS=0x00 PREC=0x00 TTL=56 ID=57843 PROTO=ESP 
SPI=0xxxxxxxxx
IN=eth0 OUT= MAC=xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx SRC=pub_B 
DST=pub_A LEN=104 TOS=0x00 PREC=0x00 TTL=56 ID=57843 PROTO=4

Here, we see the packet also twice but the cleartext one has PROTO=4 
(ipencap, ipip tunnel).

This has been observed in e.g. this thread: 
http://marc.theaimsgroup.com/?l=netfilter-devel&m=114010374229806&w=2

However, I don't see any solution. What is your approach to filter 
cleartext packets? Adding a rule to allow all PROTO=4 packets does not 
count ;-)
Is the issue considered a bug?

Thanks for your support.


Best regards,

Thomas

