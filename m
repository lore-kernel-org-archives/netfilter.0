From: seberino@spawar.navy.mil
Subject: Are these firewall rules impossible to understand?..........
Date: Fri, 11 Mar 2005 09:12:53 -0800
Message-ID: <20050311171253.GA17683@spawar.navy.mil>
Mime-Version: 1.0
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Smart firewallers drop packets based on funky TCP flag settings
that suggest they are from network sniffers and other nasties.

Many of these settings make sense, but, some are so funky I'm not
sure even reading the RFCs would have explained them.  If anyone
has any suggestions on how one can understand the wisdom of all
these rules I really want to know.  (I want to understand
EVERYTHING in my firewall script.)

For example, see these from
http://www.stearns.org/modwall/sample/tcpchk-sample


/usr/bin/sudo /sbin/iptables -N tcpchk
/usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --sport 0:19 -j DROP
/usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --dport 0:19 -j DROP
/usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL ACK -m state --state ESTABLISHED -j RETURN
/usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL ACK -m state --state NEW,RELATED -j DROP
/usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL PSH,ACK -m state --state ESTABLISHED -j RETURN
/usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL PSH,ACK -m state --state NEW -j RETURN
/usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL PSH,ACK -m state --state RELATED -j DROP
/usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL NONE -j DROP
/usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL ALL -j DROP
/usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP
/usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags SYN,RST SYN,RST -j DROP
/usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags RST,FIN RST,FIN -j DROP
/usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags SYN,URG SYN,URG -j DROP
/usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL SYN,PSH -j DROP
/usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL SYN,ACK,PSH -j DROP
/usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ACK,FIN FIN -j DROP
/usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ACK,PSH PSH -j DROP
/usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ACK,URG URG -j DROP
/usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL RST -m state --state ESTABLISHED -j RETURN
/usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL RST -m state --state NEW,RELATED -j DROP
/usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags SYN,ACK NONE -j DROP
/usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL SYN -m state --state NEW -j RETURN
/usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL SYN -m state --state RELATED -j RETURN
/usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL SYN -m state --state ESTABLISHED -j DROP
/usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL SYN,ACK -m state --state ESTABLISHED -j RETURN
/usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL SYN,ACK -m state --state NEW,RELATED -j DROP
/usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL FIN,ACK -m state --state ESTABLISHED -j RETURN
/usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL FIN,ACK -m state --state NEW,RELATED -j DROP
/usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL RST,ACK -m state --state ESTABLISHED -j RETURN
/usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL RST,ACK -m state --state NEW -j RETURN
/usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL RST,ACK -m state --state RELATED -j DROP
/usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL ACK,PSH,RST -m state --state ESTABLISHED -j RETURN
/usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL ACK,PSH,RST -m state --state NEW,RELATED -j DROP
/usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL FIN,PSH,ACK -m state --state ESTABLISHED -j RETURN
/usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL FIN,PSH,ACK -m state --state NEW,RELATED -j DROP
/usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL RST,ACK,PSH
/usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL RST,ACK,URG
/usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL RST,ACK,PSH,URG
/usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL FIN,PSH,ACK,URG
/usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL ACK,URG
/usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL ACK,URG,FIN
/usr/bin/sudo /sbin/iptables -A INPUT -i ! lo -p tcp -j tcpchk
/usr/bin/sudo /sbin/iptables -A FORWARD -p tcp -j tcpchk
/usr/bin/sudo /sbin/iptables -A OUTPUT -p tcp -j tcpchk



I'm skeptical ANYONE really understands all of these.  The ones that really bug me are the ones that insist that all FIN, PSH and URG packets
must have ACK set.  Who would have know that?

e.g. /usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ACK,FIN
FIN -j DROP


Chris

