From: =?iso-8859-1?Q?KUCKAERTZ_R=E9gis_-_NVISION?= <regis@nvision.lu>
Subject: Port forwarding
Date: Fri, 17 Sep 2004 14:32:15 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <E1C8Huj-0003X4-00@deer.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Halo,

I've set up rules so that packets sent to $MASK_IP:$MASK_PORT are =
forwarded
to $REAL_IP:$REAL_PORT with the source address being replaced by =
$MASK_IP:

# 1. Changing destination address
$IPTABLES -t nat -A PREROUTING -p tcp --dest $MASK_IP --dport $MASK_PORT =
-j
DNAT --to-destination $REAL_IP:$REAL_PORT

# 2. Accepting forwarded packets
$IPTABLES -A FORWARD -p tcp --dest $REAL_IP --dport $REAL_PORT -j ACCEPT

# 3. IP masquerading after filtering
$IPTABLES -t nat -A POSTROUTING --dest $REAL_IP --dport $REAL_PORT -j =
SNAT
--to-source $MASK_IP


When I telnet on $MASK_IP:$MASK_PORT, it's hanging... I tried sniffing =
with
tcpdump (although I must honestly confess that I don't know if the =
following
request is good), and here is what I got:

$TCPDUMP \(dst host $MASK_IP and dst port $MASK_PORT\) or \(src host
$MASK_IP and src port $MASK_PORT\)
tcpdump: listening on eth0
14:32:28.568875 x.x.x.x.46569 > $REAL_IP.$REAL_PORT: S
2813621631:2813621631(0) win 5840 <mss 1460,sackOK,timestamp 46292274
0,nop,wscale 0> (DF) [tos 0x10]=20
14:32:31.568875 x.x.x.x.46569 > $REAL_IP.$REAL_PORT: S
2813621631:2813621631(0) win 5840 <mss 1460,sackOK,timestamp 46292574
0,nop,wscale 0> (DF) [tos 0x10]=20
14:32:37.568875 x.x.x.x.46569 > $REAL_IP.$REAL_PORT: S
2813621631:2813621631(0) win 5840 <mss 1460,sackOK,timestamp 46293174
0,nop,wscale 0> (DF) [tos 0x10]=20

Nothing seems to get back... any idea?

Thanks in advance,

R=E9gis KUCKAERTZ
-----------------------------------------
NVISION sa - Luxembourg
Internet Services & Network Programming

50, rue des Pr=E9s
L-7333 Steinsel
T=E9l: (+352) 26 34 09 08
Fax: (+352) 26 34 09 07
http://www.nvision.lu/


