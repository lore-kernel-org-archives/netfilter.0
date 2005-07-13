From: "Steve Turner" <brainbugnj@yahoo.com>
Subject: DNAT and TCP RST
Date: Tue, 12 Jul 2005 20:35:50 -0700
Message-ID: <39468.1303915151$1121225764@news.gmane.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Here is my issues: 
I want to be able to take a request from the internet thru the linksys
router which has 192.168.1.161 setup as its DMZ.  Then from
192.168.1.161:8000 use DNAT to send over to 192.168.1.172:80.

As a test I have a 3rd internal machine so we can rule out the linksys -
192.168.1.163 all test conducted behind linksys.

Chart:
	  	   		   Internet
			    		|
		| Linksys DMZ defined 192.168.1.161	|
		|			|			|
	|192.168.1.161|	|192.168.1.172| |192.168.1.163|

All machines default gateway set 192.168.1.1
All static IPs
192.168.1.161, 172 - RH9 with kernel 2.4
192.168.1.163 - Mac OSX




192.168.1.161 has the below PREROUTING Line:
/sbin/iptables -t nat -A PREROUTING -p tcp -d 192.168.1.161 --dport 81 -j
DNAT --to 192.168.1.172:81



192.168.1.161 TCPDUMP shows:

20:29:31.597999 192.168.1.163.56063 > 192.168.1.161.8000: S
1238979630:1238979630(0) win 65535 <mss 1460,nop,wscale 0,nop,nop,timestamp
2985379529 0> (DF) [tos 0x10] 
20:29:31.598485 192.168.1.163.56063 > 192.168.1.172.81: S
1238979630:1238979630(0) win 65535 <mss 1460,nop,wscale 0,nop,nop,timestamp
2985379529 0> (DF) [tos 0x10]

So the request is being mangled by 192.168.1.161 as requested.



192.168.1.172 TCPDUMP shows:

20:30:23.713734 192.168.1.163.56179 > 192.168.1.172.81: S
2663332042:2663332042(0) win 65535 <mss 1460,nop,wscale 0,nop,nop,timestamp
2985379636 0> (DF) [tos 0x10] 
20:30:23.713784 192.168.1.172.81 > 192.168.1.163.56179: S
3973936785:3973936785(0) ack 2663332043 win 5792 <mss 1460,nop,nop,timestamp
7790272 2985379636,nop,wscale 0> (DF)
20:30:23.716981 192.168.1.163.56179 > 192.168.1.172.81: R
2663332043:2663332043(0) win 0 (DF)

It appears that the request is arriving - 192.168.1.172 is responding
(SYN/ACK) then origin 192.168.1.163 is sending back a RST.


