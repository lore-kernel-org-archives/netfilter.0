From: "Scott Knake" <sknake@Apexsoftware.com>
Subject: RE: bad tcp packets
Date: Tue, 23 Nov 2004 08:39:23 -0500
Message-ID: <424BCB4EA242A1429A8AF0548E8CFF0E12397A@apexexchange.ApexSoftware.Com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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

The problem here is that a new (-m new) tcp packet is always a SYN. Read
on the 3 way TCP connection handshake. It originates with a SYN packet.
I've compiled a list of TCP Packet headers but they must be put in to
their own custom chain since I use the -j RETURN (exits that chain and
returns to the calling chain).

If you know anymore please post them or email me. Thanks.

${IPTABLES} -N tcpchk
${IPTABLES} -A tcpchk -p tcp --tcp-flags ALL ACK -m state --state
ESTABLISHED -j RETURN
${IPTABLES} -A tcpchk -p tcp --tcp-flags ALL ACK -m state --state
NEW,RELATED -j DROP
${IPTABLES} -A tcpchk -p tcp --tcp-flags ALL PSH,ACK -m state --state
ESTABLISHED -j RETURN
${IPTABLES} -A tcpchk -p tcp --tcp-flags ALL PSH,ACK -m state --state
NEW -j RETURN
${IPTABLES} -A tcpchk -p tcp --tcp-flags ALL PSH,ACK -m state --state
RELATED -j DROP
${IPTABLES} -A tcpchk -p tcp --tcp-flags ALL NONE -j DROP
${IPTABLES} -A tcpchk -p tcp --tcp-flags ALL ALL -j DROP
${IPTABLES} -A tcpchk -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP
${IPTABLES} -A tcpchk -p tcp --tcp-flags SYN,RST SYN,RST -j DROP
${IPTABLES} -A tcpchk -p tcp --tcp-flags RST,FIN RST,FIN -j DROP
${IPTABLES} -A tcpchk -p tcp --tcp-flags SYN,URG SYN,URG -j DROP
${IPTABLES} -A tcpchk -p tcp --tcp-flags ALL SYN,PSH -j DROP
${IPTABLES} -A tcpchk -p tcp --tcp-flags ALL SYN,ACK,PSH -j DROP
${IPTABLES} -A tcpchk -p tcp --tcp-flags ACK,FIN FIN -j DROP
${IPTABLES} -A tcpchk -p tcp --tcp-flags ACK,PSH PSH -j DROP
${IPTABLES} -A tcpchk -p tcp --tcp-flags ACK,URG URG -j DROP
${IPTABLES} -A tcpchk -p tcp --tcp-flags ALL RST -m state --state
ESTABLISHED -j RETURN
${IPTABLES} -A tcpchk -p tcp --tcp-flags ALL RST -m state --state
NEW,RELATED -j DROP
${IPTABLES} -A tcpchk -p tcp --tcp-flags SYN,ACK NONE -j DROP
${IPTABLES} -A tcpchk -p tcp --tcp-flags ALL SYN -m state --state NEW -j
RETURN
${IPTABLES} -A tcpchk -p tcp --tcp-flags ALL SYN -m state --state
RELATED -j RETURN
${IPTABLES} -A tcpchk -p tcp --tcp-flags ALL SYN -m state --state
ESTABLISHED -j DROP
${IPTABLES} -A tcpchk -p tcp --tcp-flags ALL SYN,ACK -m state --state
ESTABLISHED -j RETURN
${IPTABLES} -A tcpchk -p tcp --tcp-flags ALL SYN,ACK -m state --state
NEW,RELATED -j DROP
${IPTABLES} -A tcpchk -p tcp --tcp-flags ALL FIN,ACK -m state --state
ESTABLISHED -j RETURN
${IPTABLES} -A tcpchk -p tcp --tcp-flags ALL FIN,ACK -m state --state
NEW,RELATED -j DROP
${IPTABLES} -A tcpchk -p tcp --tcp-flags ALL RST,ACK -m state --state
ESTABLISHED -j RETURN
${IPTABLES} -A tcpchk -p tcp --tcp-flags ALL RST,ACK -m state --state
NEW -j RETURN
${IPTABLES} -A tcpchk -p tcp --tcp-flags ALL RST,ACK -m state --state
RELATED -j DROP
${IPTABLES} -A tcpchk -p tcp --tcp-flags ALL ACK,PSH,RST -m state
--state ESTABLISHED -j RETURN
${IPTABLES} -A tcpchk -p tcp --tcp-flags ALL ACK,PSH,RST -m state
--state NEW,RELATED -j DROP
${IPTABLES} -A tcpchk -p tcp --tcp-flags ALL FIN,PSH,ACK -m state
--state ESTABLISHED -j RETURN
${IPTABLES} -A tcpchk -p tcp --tcp-flags ALL FIN,PSH,ACK -m state
--state NEW,RELATED -j DROP
${IPTABLES} -A tcpchk -p tcp -m state --state INVALID -j DROP


-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of
hamals@infinito.it
Sent: Tuesday, November 23, 2004 7:18 AM
To: netfilter@lists.netfilter.org
Cc: franco.riggi@tiscali.it
Subject: bad tcp packets


Hello to everyone

I'm reading "Iptables Tutorial 1.1.19" by Oskar=20
Andreasoon, and I cant understand these bad packets rules


$IPTABLES -N bad_tcp_packets
#
#
# bad_tcp_packets chain
#
$IPTABLES -A bad_tcp_packets -p tcp --tcp-flags SYN,ACK=20
SYN,ACK \
-m state --state NEW -j REJECT --reject-with tcp-reset
$IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state=20
--state NEW -j LOG \
--log-prefix "New not syn:"
$IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state=20
--state NEW -j DROP

someone could explain me why that are bad tcp packets?

Thanks

_______________________________________
Connessione ed e-mail gratuita da 10 mb
consultabile tramite web e tramite pop.
www.infinito.it vieni a scoprire tutti=20
i nostri servizi!

http://www.infinito.it/xmail



