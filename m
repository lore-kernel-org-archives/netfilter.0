From: Alfredo Muchut <amuchut@sanluis.gov.ar>
Subject: Are ok those rules to not filter smtp?
Date: Thu, 17 Oct 2002 20:54:42 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <02101721054005.10974@linux1.egovernment>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: netfilter@lists.netfilter.org

When I send a mail, there is a delay of  15 second. Why is this problem?

Thank you, for your help. 


ITF_EXT=eth1
ITF_INT=eth0
MAIL_SERVER="200.26.91.2"
WEB_SERVER="200.26.91.10"
 
echo 1 > /proc/sys/net/ipv4/ip_forward
 
# Nuevas chains
iptables -N externa-interna
iptables -N interna-externa
iptables -N interna-if
 
 
# Politicas paras INPUT OUTPUT (el INPUT no tiene DROP, pues esta en cada cadena que llama)
iptables -P INPUT DROP
iptables -A INPUT -i $ITF_EXT -j externa-interna
iptables -A INPUT -i $ITF_INT -j interna-if
iptables -P OUTPUT ACCEPT
 
# Forward
iptables -A FORWARD -i $ITF_EXT -o $ITF_INT -j externa-interna
iptables -A FORWARD -i $ITF_INT -o $ITF_EXT -j interna-externa
iptables -A FORWARD -j DROP
 
 
# De afuera hacia adentro (no sean inicio de seccion)
iptables -A externa-interna -p tcp ! --syn -s $MAIL_SERVER --sport smtp -j ACCEPT
iptables -A externa-interna -p tcp ! --syn -s $MAIL_SERVER --sport pop-3 -j ACCEPT
iptables -A externa-interna -p tcp ! --syn -s $WEB_SERVER --sport ftp -j ACCEPT
iptables -A externa-interna -p icmp --icmp-type pong -j ACCEPT
 
 
# De adentro hacia afuera.
iptables -A interna-externa -d $MAIL_SERVER -p tcp --dport smtp -j ACCEPT
iptables -A interna-externa -d $MAIL_SERVER -p tcp --dport pop-3 -j ACCEPT
iptables -A interna-externa -d $WEB_SERVER -p tcp --dport ftp -j ACCEPT   
 iptables -A interna-externa -p icmp --icmp-type ping -j ACCEPT
 
 
# Interna-if
iptables -A interna-if -p icmp --icmp-type ping -j ACCEPT
iptables -A interna-if -p icmp --icmp-type pong -j ACCEPT
iptables -A interna-if -s 200.26.92.0/24 -d 200.26.92.4 -p tcp -j ACCEPT
 
 
# Postrouting
iptables -t nat -A POSTROUTING -o $ITF_EXT -j MASQUERADE                                                                                         

