From: Tom Van Overbeke <tvanoverbeke@ccncsi.net>
Subject: dns replies (udp) blocked but why ?
Date: Mon, 25 Aug 2003 14:57:35 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000101c36b08$754459f0$d90315ac@rsrc.be.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
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
Content-Type: text/plain; charset="us-ascii"
To: "Netfilter (E-mail)" <netfilter@lists.netfilter.org>

Hi,

I'm seeing a lot of these messages in my iptables logs lately:

Aug 25 14:46:21 dobermann kernel: -drop_the_rest-IN= OUT=eth1 SRC=172.21.3.1
DST=172.21.3.10 LEN=62 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=UDP SPT=53
DPT=3412 LEN=42


however, the iptables config should accept it:

i have this rule on the firewall (which is also the dns server, hence the
'INPUT')

$IPTABLES -A INPUT   -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A INPUT -p udp  -s 172.21.0.0/16  --source-port
024:65535  --destination-port 53  -m state --state NEW  -j ACCEPT

the 172.21.3.10 is the only one causing problems, i noticed howerver that
this is udp, whereas most dns related traffic i can see is tcp.

could it be a connection tracking problem ?



thx,


Tom.


PS. iptables is 1.2.4 (on redhat advanced server 2.1)

****************************************************************************
Disclaimer: 
This electronic transmission and any files attached to it are strictly 
confidential and intended solely for the addressee. If you are not 
the intended addressee, you must not disclose, copy or take any
action in reliance of this transmission. If you have received this 
transmission in error, please notify the sender by return and delete
the transmission.  Although the sender endeavors to maintain a
computer virus free network, the sender does not warrant that this
transmission is virus-free and will not be liable for any damages 
resulting from any virus transmitted. 
Thank You.
****************************************************************************


