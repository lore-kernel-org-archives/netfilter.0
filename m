From: "web master" <webmasta0@hotmail.com>
Subject: weird interface !
Date: Tue, 05 Nov 2002 16:41:00 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F1727WxS6brk1aRcC8a00003047@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org




hello
i'm running a redhat machine and while checking
[root@localhost root]# ifconfig -a
lo        Link encap:Local Loopback
          LOOPBACK  MTU:16436  Metric:1
          RX packets:316 errors:0 dropped:0 overruns:0 frame:0
          TX packets:316 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:15800 (15.4 Kb)  TX bytes:15800 (15.4 Kb)

ppp0      Link encap:Point-to-Point Protocol
          inet addr:62.135.14.214  P-t-P:172.17.9.205  Mask:255.255.255.255
          UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1524  Metric:1
          RX packets:1739 errors:0 dropped:0 overruns:0 frame:0
          TX packets:1942 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:3
          RX bytes:528941 (516.5 Kb)  TX bytes:178970 (174.7 Kb)

tunl0     Link encap:IPIP Tunnel  HWaddr
          NOARP  MTU:1480  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:0 (0.0 b)  TX bytes:0 (0.0 b)

[root@localhost root]#

i see tunl0 and i dont know who made it and why is it there its always 0.0 b 
and its always there even if ppp0 isnt up , so i'd like to investigate this 
, is my machine compromised or a software made it , please help me with it .

i though of running iptables to listen to what passes there .
any ideas ?
thanks in advance


_________________________________________________________________
Surf the Web without missing calls! Get MSN Broadband. 
http://resourcecenter.msn.com/access/plans/freeactivation.asp


