From: George Georgalis <georgw@galis.org>
Subject: ssh connecting to wrong machine....
Date: Sun, 2 Jun 2002 19:21:57 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020602192157.A16556@trot.haven.dom>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

On a 2 interface firewall, I've set up an alias eth1:1 ($EXT_host04) to
an IP on our T-1, then added a nat which should connect ports $TCP_OPEN
and $UDP_OPEN to the internal IP ($LAN_host04).

But when I go to ssh $EXT_host04 from the internet I end up talking to
the firewall sshd, not the sshd on $LAN_host04. Why is that? Here are my
rules:

LANIF=eth0
EXTIF=eth1
TCP_OPEN="22,25,53,80"
UDP_OPEN="22,53"

iptables -A INPUT -m state --state ESTABLISHED,RELATED \
-j ACCEPT

iptables -A INPUT -i $EXTIF -m state --state NEW \
-p tcp -m multiport --dport $TCP_OPEN -j ACCEPT

iptables -A INPUT -i $EXTIF -m state --state NEW \
-p udp -m multiport --dport $UDP_OPEN -j ACCEPT


iptables -A FORWARD -i $EXTIF -o $LANIF -p tcp \
-m multiport --dport $TCP_OPEN \
-m state --state NEW,RELATED,ESTABLISHED \
-j ACCEPT

iptables -A FORWARD -i $EXTIF -o $LANIF -p udp \
-m multiport --dport $UDP_OPEN \
-m state --state NEW,RELATED,ESTABLISHED \
-j ACCEPT


iptables -t nat -A PREROUTING -p tcp \
-s $EXT_host04 \
-j DNAT --to-destination $LAN_host04

iptables -t nat -A POSTROUTING -o $EXTIF \
-j MASQUERADE


Thanks,
// George

-- 
GEORGE GEORGALIS, System Admin/Architect    cell: 347-451-8229 
Security Services, Web, Mail,            mailto:george@galis.org 
File, Print, DB and DNS Servers.       http://www.galis.org/george 


