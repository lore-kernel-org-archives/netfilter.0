From: Dieter Raith <raith@rus.uni-stuttgart.de>
Subject: netfilter and cipe
Date: Thu, 13 Feb 2003 18:09:44 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E4BD158.8080705@rus.uni-stuttgart.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I installed CIPE 1.54 on two Linux systems.
One running 2.2.19 the other 2.4.18
The UDP tunnel connection has problems.
The log on 2.4.18 shows the following entries:

Feb 13 17:40:42 sysrai kernel: ip_finish_output: bad owned skb = 
da0aaca0: POST_ROUTING
Feb 13 17:40:42 sysrai kernel: skb: pf=2 (owned) dev=eth0 len=132
Feb 13 17:40:42 sysrai kernel: PROTO=17 129.69.3.3:4444 129.69.90.9:4444 
L=132 S=0x00 I=9147 F=0x0000 T=255


I have traced that down to netfilter.c where this messages is generated.
It does not tell me anything and I do not find information about it.

On both systems the following device is created (inet addr and P-t-P of 
course flipped)

cipcb0    Link encap:IPIP Tunnel  HWaddr
           inet addr:172.16.100.2  P-t-P:172.16.100.1  Mask:255.255.255.255
           UP POINTOPOINT RUNNING NOARP  MTU:1442  Metric:1
           RX packets:234 errors:2 dropped:0 overruns:0 frame:2
           TX packets:329 errors:0 dropped:0 overruns:0 carrier:0
           collisions:0 txqueuelen:100


Before I go into further details within CIPE I hope to get some 
information on the above kernel messages




-- 
Dieter Raith 					Phone:	++49-711-685-4516
Computing Center University of Stuttgart	Fax:	++49-711-682-357
Allmandring 30 					E-Mail:	raith@rus.uni-stuttgart.de
70550 Stuttgart, Germany


