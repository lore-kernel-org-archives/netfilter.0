From: "Rohit Neupane" <bikrant@wlink.com.np>
Subject: Problem with TCP
Date: Wed, 1 Sep 2004 19:19:05 +0530
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <002401c4902a$74caf220$630910ac@wlink.com.np>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,
 I have a linux box which acts as gateway and b/w manager for our wireless
network. I have 3 Interfaces ( one not is use yet). I have created 3 aliases
on the interface connected to the wireless (with 3 different class C
address).
I have around 350-400 wireless clients with over 10Mbps traffic at peak
hours.
These days I have observed some abnormal behavior.

System:
Dell P4 Poweredge
Red Hat 8.0 with 2.4.25 kernel
Lan Cards:
 1. Intel 82540EM Gigabit Ethernet Controller (Intenet)
 2. 3com 3c905B Cyclone (Wireless)


The problem is:
Everything works fine for about 5-10 mins then all of a suddent TCP services
are not accessable.
For some reason TCP times out. However at the same time ping,tracerout and
dns trace works without any problem.

The connected TCP sokets keeps working without any problem. I verified this
by using Msn chat. I observerd that I chat session ( which I had started
when everything was normal) continued without any problem however I was not
able to initiate a new chat session.

Result of tcpdum on eth0 (internet) and eth2(wireless)

I can see tcp SYN request coming in from eth2 (from client) and going out
via eth0 to destination.
I can see tcp SYN+ACK coming in from eth0. But it doesn't get out through
eth2 !!! However other udp,icmp pkts can.

src 69.56.37.146  , dst 64.236.16.52
this is tcpdump on eth0 (internet side)
17:14:32.003370 69.56.37.146.3170 > 64.236.16.52.http: S
2446361626:2446361626(0) win 64240 <mss 1460,nop,nop,sackOK> (DF)
17:14:32.004694 64.236.16.52.http > 69.56.37.146.3170: S
3641974278:3641974278(0) ack 2446361627 win 65535 <mss 1460> (DF)
17:14:34.920578 69.56.37.146.3170 > 64.236.16.52.http: S
2446361626:2446361626(0) win 64240 <mss 1460,nop,nop,sackOK> (DF)
17:14:34.921800 64.236.16.52.http > 69.56.37.146.3170: S
3641974278:3641974278(0) ack 2446361627 win 65535 <mss 1460> (DF)
17:14:37.915564 64.236.16.52.http > 69.56.37.146.3170: S
3641974278:3641974278(0) ack 2446361627 win 65535 <mss 1460> (DF)
17:14:40.955491 69.56.37.146.3170 > 64.236.16.52.http: S
2446361626:2446361626(0) win 64240 <mss 1460,nop,nop,sackOK> (DF)
17:14:40.957682 64.236.16.52.http > 69.56.37.146.3170: S
3641974278:3641974278(0) ack 2446361627 win 65535 <mss 1460> (DF)

this is tcpdump on eth2  (client side)
17:14:32.003179 69.56.37.146.3170 > 64.236.16.52.http: S
2446361626:2446361626(0) win 64240 <mss 1460,nop,nop,sackOK> (DF)
17:14:34.920212 69.56.37.146.3170 > 64.236.16.52.http: S
2446361626:2446361626(0) win 64240 <mss 1460,nop,nop,sackOK> (DF)
17:14:40.955257 69.56.37.146.3170 > 64.236.16.52.http: S
2446361626:2446361626(0) win 64240 <mss 1460,nop,nop,sackOK> (DF)

As you can see i am getting the ACK from source from seq. 2446361626 (with
ack 2446361627 ) on eth0. But it is not going out via eth2!!

After sometime everthing starts working normally again. So what may be the
problem? I have problem only with the tcp protocol and not with other. I
haven't changed any tcp memory related settings.

net.ipv4.tcp_rmem = 4096        87380   174760
net.ipv4.tcp_wmem = 4096        87380   174760
net.ipv4.tcp_mem = 195584       196096  196608
net.core.optmem_max = 10240
net.core.rmem_default = 65535
net.core.wmem_default = 65535
net.core.rmem_max = 131071
net.core.wmem_max = 131071


Has anyone come across this probelm? any suggestion?

Thanks
Rohit


