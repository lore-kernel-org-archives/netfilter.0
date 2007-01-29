From: Fabio Muzzi <liste@kurgan.org>
Subject: SNAT seems to "miss" some packets
Date: Mon, 29 Jan 2007 14:12:38 +0100
Message-ID: <1003211157.20070129141238@kurgan.org>
Reply-To: Fabio Muzzi <liste@kurgan.org>
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


Hi,  this is my first post to this list. I have tried goggling, but I have
failed, and i think now it's time to ask for help.

I  am  running  a  firewall  with Debian Linux (kernel 2.6.15) and am I am
expriencing a strange behavior in a simple SNAT rule.

I  was  running  a  dual gateway equal cost multipath configuration, but I
have  reverted to a single gateway configuration to be sure that the issue
was not with the dual gateway config.

eth2  is  my  WAN  interface,  with  address  217.221.234.74.  My  lan  is
10.0.0.0/16, and I have a SNAT rule that says:

iptables -t nat -A POSTROUTING -o eth2  -j SNAT -s 10.0.0.0/16 --to-source 217.221.234.74

Running  a  simple  "ethereal -i eth2 'not host 217.221.234.74'" I can see
that  sometimes some packets go through WAN interface without being SNATed
by netfilter.

Tipically  I  can  see  a  lot of correctly SNATed traffic, and once every
minute  or so, some packets that seem to belong to an existent connection,
that  go  through  with  the  original  "from" address (in the 10.0.0.0/16
network)

this is an example taken from tethereal:

5062.581579    10.0.0.51 -> 207.68.178.134 TCP 1069 > www [FIN, ACK] Seq=0 Ack=0 Win=64526 Len=0
5062.581602    10.0.0.51 -> 207.68.178.134 TCP 1070 > www [FIN, ACK] Seq=0 Ack=0 Win=65535 Len=0
5063.687959    10.0.0.51 -> 207.68.178.134 TCP [TCP Retransmission] 1070 > www [FIN, ACK] Seq=0 Ack=0 Win=65535 Len=0
5064.016036    10.0.0.51 -> 207.68.178.134 TCP [TCP Retransmission] 1069 > www [FIN, ACK] Seq=0 Ack=0 Win=64526 Len=0
5066.094266    10.0.0.51 -> 207.68.178.134 TCP [TCP Retransmission] 1070 > www [FIN, ACK] Seq=0 Ack=0 Win=65535 Len=0
5067.078602    10.0.0.51 -> 207.68.178.134 TCP [TCP Retransmission] 1069 > www [FIN, ACK] Seq=0 Ack=0 Win=64526 Len=0
5070.906759    10.0.0.51 -> 207.68.178.134 TCP [TCP Retransmission] 1070 > www [FIN, ACK] Seq=0 Ack=0 Win=65535 Len=0
5071.806521    10.0.0.51 -> 195.113.232.83 TCP 1065 > www [RST, ACK] Seq=0 Ack=0 Win=0 Len=0
5071.806642    10.0.0.51 -> 195.113.232.83 TCP 1067 > www [RST, ACK] Seq=0 Ack=0 Win=0 Len=0
5071.806657    10.0.0.51 -> 195.113.232.83 TCP 1066 > www [RST, ACK] Seq=0 Ack=0 Win=0 Len=0
5071.806765    10.0.0.51 -> 195.113.232.83 TCP 1068 > www [RST, ACK] Seq=0 Ack=0 Win=0 Len=0
5073.094312    10.0.0.51 -> 207.68.178.134 TCP [TCP Retransmission] 1069 > www [FIN, ACK] Seq=0 Ack=0 Win=64526 Len=0
5077.923046    10.0.0.12 -> 207.68.178.239 TCP [TCP Retransmission] remoteping > www [FIN, ACK] Seq=0 Ack=0 Win=64294 Le  n=0
5080.531986    10.0.0.51 -> 207.68.178.134 TCP [TCP Retransmission] 1070 > www [FIN, ACK] Seq=0 Ack=0 Win=65535 Len=0
5085.125717    10.0.0.51 -> 207.68.178.134 TCP [TCP Retransmission] 1069 > www [FIN, ACK] Seq=0 Ack=0 Win=64526 Len=0
5099.782192    10.0.0.51 -> 207.68.178.134 TCP [TCP Retransmission] 1070 > www [FIN, ACK] Seq=0 Ack=0 Win=65535 Len=0
5109.188539    10.0.0.51 -> 207.68.178.134 TCP [TCP Retransmission] 1069 > www [FIN, ACK] Seq=0 Ack=0 Win=64526 Len=0
5116.244053    10.0.0.12 -> 207.68.178.239 TCP [TCP Retransmission] remoteping > www [FIN, ACK] Seq=0 Ack=0 Win=64294 Le  n=0


Is  this  a known bug of my kernel/netfilter version? Is there something I
can do to fix it?

Thanks.



-- 

  Fabio "Kurgan" Muzzi


