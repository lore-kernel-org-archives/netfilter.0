From: "Robert K. Johnson" <johnson60@llnl.gov>
Subject: iptables config for netperf
Date: Wed, 12 Mar 2003 14:30:38 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.1.0.14.2.20030312142537.044a5968@poptop.llnl.gov>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I am having trouble getting netperf to work through a Linux iptables firewall.
I have created an allow rule for TCP/12865 and for TCP with 
state=Established,Related on the machine that will be running netserver. 
However, after successfully connecting from a client machine, the server 
drops TCP packets that are destined for ports in the 1024-1030 range. Here 
is an excerpt from /var/log/messages:

Mar 12 13:39:59 basis16 authpriv.info netserver[440]: connect from 
10.1.253.254
Mar 12 13:39:59 basis16 daemon.info klogd: Pkt Dropped IN=eth1 OUT= 
MAC=00:09:b7:f1:05:17:00:09:b7:f1:07:b4:08:00 SRC=10.1.253.254 
DST=10.1.253.115 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=3424 DF PROTO=TCP 
SPT=1029 DPT=1026 WINDOW=5840 RES=0x00 SYN URGP=0
Mar 12 13:40:02 basis16 daemon.info klogd: Pkt Dropped IN=eth1 OUT= 
MAC=00:09:b7:f1:05:17:00:09:b7:f1:07:b4:08:00 SRC=10.1.253.254 
DST=10.1.253.115 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=3425 DF PROTO=TCP 
SPT=1029 DPT=1026 WINDOW=5840 RES=0x00 SYN URGP=0

What iptables configuration is required to get netperf to be fully operational?


