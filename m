From: Kiran Murari <kmurari@embeddedinfotech.com>
Subject: NAT Issue
Date: Thu, 19 Apr 2007 15:39:14 +0530
Message-ID: <46273FCA.4020200@embeddedinfotech.com>
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

Hi All,
I am facing an issue related to NAT.

My setup is as shown below.
PC--------Router---------ISP

I established a connection with the ISP (PPP link) and I am pinging 
google.com from LAN side host.
Now if I disable WAN (leave the ping running) and then enable it, the 
session does not resume.
Moreover, packet capture on the WAN interface shows LAN host address, 
but not the WAN IP.

The SNAT rules are in place.
# iptables -t nat -L POSTROUTING -n -v
Chain POSTROUTING (policy ACCEPT 13927 packets, 458K bytes)
 pkts bytes target     prot opt in     out      source           destination
    0     0   SNAT     all  --  *      ppp0     0.0.0.0/0        
0.0.0.0/0      to:xx:xx:xx:xx
    0     0   SNAT     all  --  *      *        0.0.0.0/0        
0.0.0.0/0      MARK match 0x1111 to:zz:zz:zz:zz

ip_conntrack shows the following entry:
# cat /proc/net/ip_conntrack | grep icmp
icmp     1 29 src=yy:yy:yy:yy dst=64.233.167.99 type=8 code=0 id=16446 
packets=575 bytes=48300 [UNREPLIED]
src=yy:yy:yy:yy dst=192.168.10.100 type=0 code=0 id=16446 packets=0 
bytes=0 mark=0 use=1
yy:yy:yy:yy being the IP address of the LAN host.

But if I kill the ping session and start a new session, this gets NAT'ed 
properly.

Couldn't understand why the running session does not resume after the 
WAN is enabled.

Any help in this aspect is highly appreciated.

Best Regards,
Kiran

