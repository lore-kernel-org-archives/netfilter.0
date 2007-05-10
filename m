From: Andres Paglayan <andres@paglayan.com>
Subject: NAT "triangulation" and already opened nat port not reachable
Date: Thu, 10 May 2007 17:01:59 -0600
Message-ID: <96B053D2-93A1-4B81-96B1-B56DC2AF7121@paglayan.com>
Mime-Version: 1.0 (Apple Message framework v752.3)
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
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

Sorry to post only problems,
after this saga I am into, I might became someone able to post  
solutions as well,

With Infinite thanks to Jan Engelhardt who has been helping beyond  
any imaginable point and getting me closer to the solution,

I have a subnet which needs to connect to a several other subnets   
through a T1

for some reason at the other end, a request I initiate to a machine  
at 172.16.2.34
generates as well a response from 172.16.1.49 which in turn needs to  
trespass the nat
thus the triangulation

I tried from one to one nat, with proxy arping and would fail as well,
could be a hardware problem?

as a hint, when replaced my ipcop by a cheapo dsl router,
the natting to the other subnets worked just fine,


dump from ipcop box shows the following,

I set a rule to allow whatever from 172.16.1.49

root@ipcop:~ # iptables -I CUSTOMINPUT -s 172.16.1.49 -j ACCEPT

Now I dump the relevant (to my opinion)

root@ipcop:~ # tcpdump -i eth2 | grep '172.16'
tcpdump: verbose output suppressed, use -v or -vv for full protocol  
decode
listening on eth2, link-type EN10MB (Ethernet), capture size 68 bytes

(here goes the first request)

16:47:06.068643 IP 192.168.50.1.qsm-proxy > 172.16.2.34.ms-sql-m:  
UDP, length 7

(now this machine gets in the middle)
16:47:06.072886 IP 172.16.1.49.ms-sql-m > 192.168.50.1.qsm-proxy:  
UDP, length 120
16:47:06.073061 arp who-has 172.16.1.49 tell 192.168.50.1
16:47:06.073511 arp reply 172.16.1.49 is-at 00:18:18:c4:96:50 (oui  
Unknown)

(since I gave permission to 172.16.1.49 to do whatever, then why is  
the already opened port qsm-proxy unreachable?)

16:47:06.073541 IP 192.168.50.1 > 172.16.1.49: ICMP 192.168.50.1 udp  
port qsm-proxy unreachable, length 156


(tree more times until it fails)
16:47:09.958188 IP 192.168.50.1.vchat > 172.16.2.34.ms-sql-m: UDP,  
length 7
16:47:09.962465 IP 172.16.1.49.ms-sql-m > 192.168.50.1.vchat: UDP,  
length 120
16:47:09.962550 IP 192.168.50.1 > 172.16.1.49: ICMP 192.168.50.1 udp  
port vchat unreachable, length 156
16:47:11.060699 arp who-has 172.16.2.34 tell 192.168.50.1
16:47:11.061148 arp reply 172.16.2.34 is-at 00:18:18:c4:96:50 (oui  
Unknown)
16:47:13.943012 IP 192.168.50.1.tripwire > 172.16.2.34.ms-sql-m: UDP,  
length 7
16:47:13.947216 IP 172.16.1.49.ms-sql-m > 192.168.50.1.tripwire: UDP,  
length 120
16:47:13.947293 IP 192.168.50.1 > 172.16.1.49: ICMP 192.168.50.1 udp  
port tripwire unreachable, length 156
16:47:18.130143 IP 192.168.50.1.indigo-server > 172.16.2.34.ms-sql-m:  
UDP, length 7
16:47:18.134375 IP 172.16.1.49.ms-sql-m > 192.168.50.1.indigo-server:  
UDP, length 120
16:47:18.134457 IP 192.168.50.1 > 172.16.1.49: ICMP 192.168.50.1 udp  
port indigo-server unreachable, length 156
2469 packets captured
2491 packets received by filter
0 packets dropped by kernel



