From: "Paul Yip" <paulyip@hkbu.edu.hk>
Subject: Port Forward UDP 1911
Date: Wed, 12 Mar 2003 10:05:57 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E6E9605.000005.01024@paulyip>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

 Dear all, =0D
 =0D
3 Computers are linked together with cross over cable and computer B is t=
he =0D
router. =0D
 =0D
Computer A - Starlight Video Server(Solaris) =0D
- 192.168.0.11 =0D
 =0D
Computer B - Iptables(Linux) =0D
- eth0 - 192.168.0.12 =0D
- eth1 - 158.192.92.102 =0D
 =0D
Computer C - Video receiver(Windows) =0D
- 158.192.92.105 =0D
 =0D
First =0D
# echo "1" > /proc/sys/net/ipv4/ip_forward =0D
 =0D
it works fine, video receiver can receive the video from 192.168.0.11. =0D
The purpose for using iptables is that Internet use can get access our vi=
deo
=0D
server, also our video server can be protected by iptables. =0D
 =0D
Second =0D
modprobe iptables =0D
for TABLE in filter nat mangle; do =0D
iptables -t $TABLE -F =0D
iptables -t $TABLE -X =0D
done; =0D
iptables -t nat -A PREROUTING -p udp --dport 1911 -i eth1 -j \ =0D
DAT --to 192.168.0.11: 1911 =0D
iptables -A FORWARD -p udp --dport 1911 -d 192.168.0.11 --j ACCEPT =0D
 =0D
Video receiver can receive the video, but when we investigate the packets=
 go
=0D
into video receiver. =0D
Source IP: 192.168.0.11:1911 =0D
Destination IP: 158.192.92.105: 1069 =0D
Protocol: UDP =0D
Packet Len: 1.46KB =0D
Data Len: 1.42KB =0D
 =0D
Third, we execute one more line in order to change the source IP =0D
# iptables -nat -A POSTROUTING -o eth1 -j \ =0D
SNAT --to 158.192.92.102 =0D
 =0D
But the result doesn't change, we still get packet with source IP. 192.16=
8.0
=0D
11. =0D
 =0D
I'd be grateful for any helps or advices. =0D
 =0D
Paul Yip =0D
 =0D
 =0D
 =0D
 =0D
=20

