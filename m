From: Horst Meissner <meissner@inline.de>
Subject: iptables   counters  with ethernet frame with tcp header ???
Date: Thu, 30 Jan 2003 19:07:42 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.1.0.14.0.20030130185902.0277fe58@authsmtp.inline.de>
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

Hello,
what exactly does the counters count
shaper:~# iptables -xvL OUT
Chain OUT (1 references)
     pkts      bytes target     prot opt 
in     out     source               destination
  1047519 
565962605            all  --  any    any     anywhere             anywhere
....

The first number is the number of the packets, and the second one the 
number of bytes.
But witch size with ethernet frame (14 bytes + 4 bytes CRC) with IP header 
20 bytes....
or without ?

What ist the correct one:
bytes target = 14 Bytes Ethernet  +  20 Bytes IP  + 20 Bytes TCP + XX Bytes 
Data + 4 Bytes  CRC
bytes target = 14 Bytes Ethernet  +  20 Bytes IP  + 20 Bytes TCP + XX Bytes 
Data
bytes target = 20 Bytes IP  + 20 Bytes TCP + XX Bytes Data
bytes target = 20 Bytes TCP + XX Bytes Data
bytes target = XX Bytes Data


