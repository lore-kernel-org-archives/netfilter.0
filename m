From: "Tsillas, James" <James.Tsillas@viasat.com>
Subject: DNAT socket missing reset although ip_conntrack entry has been
 cleared
Date: Wed, 31 Oct 2012 18:29:47 +0000
Message-ID: <6B6DCF6E2CACFB4BA3F7F24D3CA24A0D259E5D02@wdc1exchmbxp01.hq.corp.viasat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

We have a transparent proxy application which uses the DNAT target to a local port.

DNAT       tcp  --  0.0.0.0/0            0.0.0.0/0           to:10.227.128.135:9033

This runs on a network appliance with using Monta Vista linux on a MIPS/Cavium CPU:

Release: 2.6.21_mvlcge510-octeon-mips64_octeon_v2_be
Version: #1 SMP PREEMPT RT Tue Oct 30 09:28:58 PDT 2012
Machine: mips64

The problem happens on a busy proxy socket which is forwarding data from a
server. The client which originated the connection will issue an RST,ACK:

48918    52.261639            99.196.131.89     8.27.225.254       TCP        66           59715 > http [RST, ACK] Seq=1 Ack=52254009 Win=11696 Len=0 TSval=10399765 TSecr=1948069

We see the connection is no longer in /proc/net/ip_conntrack.

But we notice the connection is still shown by netstat:

Proto Recv-Q Send-Q Local Address           Foreign Address         State     
tcp        0  47784 10.227.128.135:9033     99.196.131.89:59715     ESTABLISHED

Our app is never told the socket has reset and we continue to hold it open.
Since we have no conntrack, the socket can no longer send data to its client.

From the app's point of view, shouldn't a TCP socket be reset once the ip_conntrack
is removed? 

thanks!!!
-Jim.

