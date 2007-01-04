From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: SNAT on the loopback interface
Date: Thu, 04 Jan 2007 23:53:27 +0100
Message-ID: <459D8567.5010501@plouf.fr.eu.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter <netfilter@lists.netfilter.org>

Hello,
I was playing a bit with SNAT on the loopback interface and observed 
strange things. You may say that doing SNAT on the loopback interface is 
not so useful but hey, I'm just curious.

The rule :
iptables -t nat -A POSTROUTING -o lo -s 127.0.0.2 -d 127.0.0.2 \
   -j SNAT --to 127.0.0.3

I also added LOG rules to log packets in all mangle and filter chains. 
Then I tested the rule with a TCP connection to 127.0.0.2:22. The 
--log-prefix is composed of abbreviations of the chain, table and state 
names.

What I observed on a 2.4.33.6 kernel :

[SYN packet is generated]
> OUT_mgl_NEW OUT=lo SRC=127.0.0.2 DST=127.0.0.2 PROTO=TCP SPT=32772 DPT=22 SYN
> OUT_flt_NEW OUT=lo SRC=127.0.0.2 DST=127.0.0.2 PROTO=TCP SPT=32772 DPT=22 SYN
> PST_mgl_NEW OUT=lo SRC=127.0.0.2 DST=127.0.0.2 PROTO=TCP SPT=32772 DPT=22 SYN
[SYN packet is SNATed, reaches lo and loops back]
> PRE_mgl_NEW IN=lo  SRC=127.0.0.3 DST=127.0.0.2 PROTO=TCP SPT=32772 DPT=22 SYN
>  IN_mgl_NEW IN=lo  SRC=127.0.0.3 DST=127.0.0.2 PROTO=TCP SPT=32772 DPT=22 SYN
>  IN_flt_NEW IN=lo  SRC=127.0.0.3 DST=127.0.0.2 PROTO=TCP SPT=32772 DPT=22 SYN

[SYN/ACK reply packet is generated]
> OUT_mgl_EST OUT=lo SRC=127.0.0.2 DST=127.0.0.3 PROTO=TCP SPT=22 DPT=32772 ACK SYN
> OUT_flt_EST OUT=lo SRC=127.0.0.2 DST=127.0.0.3 PROTO=TCP SPT=22 DPT=32772 ACK SYN
> PST_mgl_EST OUT=lo SRC=127.0.0.2 DST=127.0.0.3 PROTO=TCP SPT=22 DPT=32772 ACK SYN
[SYN/ACK reply packet reaches lo and loops back]
> PRE_mgl_EST IN=lo  SRC=127.0.0.2 DST=127.0.0.3 PROTO=TCP SPT=22 DPT=32772 ACK SYN
[SYN packet is lost]

The initial SYN packet is SNATed as expected. The SYN/ACK reply packet 
is sent and classified as ESTABLISHED but is lost after the mangle 
PREROUTING chain ; it does not seem to reach the NF_IP_LOCAL_IN hook 
which contains the INPUT chains. How and where does this happens ? If I 
understand correctly, this could happen in two "places" : the 
NF_IP_PRE_ROUTING iptable_nat hook or the input routing decision. I 
cannot see any reason why the input routing decision would drop the 
packet. The remaining choice is the iptable_nat hook, where the packet 
destination should be restored to the original source address of the SYN 
packet. Did something go wrong during this process ?

What I observed on a 2.6.18.2 kernel :

[SYN packet is generated]
> OUT_mgl_NEW IN= OUT=lo SRC=127.0.0.2 DST=127.0.0.2 PROTO=TCP SPT=1160 DPT=22 SYN
> OUT_flt_NEW IN= OUT=lo SRC=127.0.0.2 DST=127.0.0.2 PROTO=TCP SPT=1160 DPT=22 SYN
> PST_mgl_NEW IN= OUT=lo SRC=127.0.0.2 DST=127.0.0.2 PROTO=TCP SPT=1160 DPT=22 SYN
[SYN packet is SNATed, reaches lo and loops back]
> PRE_mgl_NEW IN=lo OUT= SRC=127.0.0.3 DST=127.0.0.2 PROTO=TCP SPT=1160 DPT=22 SYN
>  IN_mgl_NEW IN=lo OUT= SRC=127.0.0.3 DST=127.0.0.2 PROTO=TCP SPT=1160 DPT=22 SYN
>  IN_flt_NEW IN=lo OUT= SRC=127.0.0.3 DST=127.0.0.2 PROTO=TCP SPT=1160 DPT=22 SYN

[SYN/ACK reply packet is generated]
> OUT_mgl_EST IN= OUT=lo SRC=127.0.0.2 DST=127.0.0.3 PROTO=TCP SPT=22 DPT=1160 ACK SYN
> OUT_flt_EST IN= OUT=lo SRC=127.0.0.2 DST=127.0.0.2 PROTO=TCP SPT=22 DPT=1160 ACK SYN
[Wow ! see what just happenened to the destination address]
> PST_mgl_EST IN= OUT=lo SRC=127.0.0.2 DST=127.0.0.2 PROTO=TCP SPT=22 DPT=1160 ACK SYN
[SYN/ACK reply packet reaches lo and loops back]
> PRE_mgl_EST IN=lo OUT= SRC=127.0.0.2 DST=127.0.0.2 PROTO=TCP SPT=22 DPT=1160 ACK SYN
>  IN_mgl_EST IN=lo OUT= SRC=127.0.0.2 DST=127.0.0.2 PROTO=TCP SPT=22 DPT=1160 ACK SYN
>  IN_flt_EST IN=lo OUT= SRC=127.0.0.2 DST=127.0.0.2 PROTO=TCP SPT=22 DPT=1160 ACK SYN

This time, the reply packet reaches the INPUT chains and the TCP/IP 
stack upper layer. Surprisingly (to me, at least), the destination 
address of the the reply packet is changed in the NF_IP_LOCAL_OUT 
(OUTPUT) iptable_nat hook which lies between the mangle and filter 
OUTPUT chains. I expected this would happen in the NF_IP_PRE_ROUTING 
iptable_nat hook, as it happens for reply packets not going through the 
loopback interface. Why is that so ?

I understand that there must be some tricks for proper conntrack and NAT 
operation through the loopback interface, but I cannot explain these 
things. Can anyone ?

