From: David Coulson <david@davidcoulson.net>
Subject: NAT reversal issue
Date: Tue, 08 Mar 2005 23:19:18 -0500
Message-ID: <422E7946.8060903@davidcoulson.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Hello,

	I've got a NAT rule which NATs a TCP port from an outside IP onto a 
non-routable address. If this is a local IP address, it will work fine 
without any issues. However, if the IP is on the other end of a GRE 
tunnel, it never seems to reverse the DNAT rule when it throws the 
packet back out the external interface.

23:17:15.214869 IP 207.166.193.108.47867 > 207.166.203.130.2525: S 
3159601203:3159601203(0) win 5840 <mss 1460,sackOK,timestamp 3010684420 
0,nop,wscale 2>
23:17:15.277547 IP 10.2.4.5.25 > 207.166.193.108.47867: S 
2921522304:2921522304(0) ack 3159601204 win 5792 <mss 
1460,sackOK,timestamp 1996689776 3010684420,nop,wscale 2>
23:17:18.215536 IP 207.166.193.108.47867 > 207.166.203.130.2525: S 
3159601203:3159601203(0) win 5840 <mss 1460,sackOK,timestamp 3010687420 
0,nop,wscale 2>
23:17:18.278776 IP 207.166.193.237 > 207.166.193.108: icmp 48: host 
207.166.203.130 unreachable
23:17:18.289971 IP 10.2.4.5.25 > 207.166.193.108.47867: S 
2921522304:2921522304(0) ack 3159601204 win 5792 <mss 
1460,sackOK,timestamp 1996692783 3010684420,nop,wscale 2>
23:17:19.036447 IP 10.2.4.5.25 > 207.166.193.108.47867: S 
2921522304:2921522304(0) ack 3159601204 win 5792 <mss 
1460,sackOK,timestamp 1996693476 3010684420,nop,wscale 2>
23:17:21.291234 IP 207.166.193.237 > 207.166.193.108: icmp 48: host 
207.166.203.130 unreachable

tcp      6 29 SYN_SENT src=207.166.193.108 dst=207.166.203.130 
sport=47867 dport=2525 [UNREPLIED] src=10.2.4.5 dst=207.166.193.108 
sport=25 dport=47867 mark=21 use=1

I'm drawing a blank as to why the NAT rule is not reversed - There are 
no specific rules which limit traffic to or from the GRE interfaces, 
which are entirely non-routable, and I'm sure it's not a routeing issue 
with the tunnel as I see the SYN come in and the SYN ACK go out on the 
remote end of the tunnel. I can connect to port 25 on 10.2.4.5 from the 
firewall without any problems. The only issue may be that the MTU of the 
GRE tunnels is 1420, rather than 1500...

Any debugging pointers would be appreciated - I'm not sure exactly where 
to go from here.

Thanks,
David

-- 
David J. Coulson
email: david@davidcoulson.net
web: http://www.davidcoulson.net/
phone: (216) 920-3100 / (216) 258-4942

