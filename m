From: root <vlady@cyber2000.qc.ca>
Subject: Too long delay
Date: Tue, 22 Jul 2003 12:33:06 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200307221233.06581.vlady@cyber2000.qc.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

Hello, 
I need some hints for the following problem I have.

I have seted up rules for SMTP and FTP server on a firewall and they work 
exept that I should whait 10 and more seconds before to get a responce from 
the server.
I tryed to log all droped packates to see if there are some packtes which are  
related to smtp (or ftp) connection but there any.
 
I have default policy DROP by default for the main chains: iptables -P INPUT 
DROP (OUTPUT,FORWARD)

The rules in question are:
###################
### SMTP Server ###
###################

iptables -A INPUT -i $INTERFACE -p tcp --sport $UNPRIVPORTS -d $LOCAL_IP_1 
--dport 25 -j ACCEPT
iptables -A INPUT -i $INTERFACE -p tcp --sport $UNPRIVPORTS -d $LOCAL_IP_1 
--dport 25 -j ACCEPT
iptables -A INPUT -i $INTERFACE -p tcp --sport $UNPRIVPORTS -d $LOCAL_IP_1 
--dport 25 -j ACCEPT
iptables -A INPUT -i $INTERFACE -p tcp --sport $UNPRIVPORTS -d $LOCAL_IP_1 
--dport 25 -j ACCEPT

iptables -A OUTPUT -o $INTERFACE -p tcp ! --syn -s $LOCAL_IP_1 --sport 25 
--dport $UNPRIVPORTS -j ACCEPT
iptables -A OUTPUT -o $INTERFACE -p tcp ! --syn -s $LOCAL_IP_2 --sport 25 
--dport $UNPRIVPORTS -j ACCEPT
iptables -A OUTPUT -o $INTERFACE -p tcp ! --syn -s $LOCAL_IP_3 --sport 25 
--dport $UNPRIVPORTS -j ACCEPT
iptables -A OUTPUT -o $INTERFACE -p tcp ! --syn -s $LOCAL_IP_4 --sport 25 
--dport $UNPRIVPORTS -j ACCEPT

and 
###################
### FTP Server ####
###################

#ftp
iptables -A INPUT -i $INTERFACE -p tcp --sport $UNPRIVPORTS -d $LOCAL_IP_1 
--dport 21 -j ACCEPT
iptables -A INPUT -i $INTERFACE -p tcp --sport $UNPRIVPORTS -d $LOCAL_IP_2 
--dport 21 -j ACCEPT
iptables -A INPUT -i $INTERFACE -p tcp --sport $UNPRIVPORTS -d $LOCAL_IP_3 
--dport 21 -j ACCEPT
iptables -A INPUT -i $INTERFACE -p tcp --sport $UNPRIVPORTS -d $LOCAL_IP_4 
--dport 21 -j ACCEPT

iptables -A OUTPUT -o $INTERFACE -p tcp ! --syn -s $LOCAL_IP_1 --sport 21   
--dport $UNPRIVPORTS -j ACCEPT
iptables -A OUTPUT -o $INTERFACE -p tcp ! --syn -s $LOCAL_IP_2 --sport 21 
--dport $UNPRIVPORTS -j ACCEPT
iptables -A OUTPUT -o $INTERFACE -p tcp ! --syn -s $LOCAL_IP_3 --sport 21 
--dport $UNPRIVPORTS -j ACCEPT
iptables -A OUTPUT -o $INTERFACE -p tcp ! --syn -s $LOCAL_IP_4 --sport 21 
--dport $UNPRIVPORTS -j ACCEPT

#port mode
iptables -A OUTPUT -o $INTERFACE -p tcp -s $LOCAL_IP_1 --sport 20 --dport 
$UNPRIVPORTS -j ACCEPT
iptables -A OUTPUT -o $INTERFACE -p tcp -s $LOCAL_IP_2 --sport 20 --dport 
$UNPRIVPORTS -j ACCEPT
iptables -A OUTPUT -o $INTERFACE -p tcp -s $LOCAL_IP_3 --sport 20 --dport 
$UNPRIVPORTS -j ACCEPT
iptables -A OUTPUT -o $INTERFACE -p tcp -s $LOCAL_IP_4 --sport 20 --dport 
$UNPRIVPORTS -j ACCEPT

iptables -A INPUT -i $INTERFACE -p tcp ! --syn --sport $UNPRIVPORTS -d 
$LOCAL_IP_1 --dport 20 -j ACCEPT
iptables -A INPUT -i $INTERFACE -p tcp ! --syn --sport $UNPRIVPORTS -d 
$LOCAL_IP_2 --dport 20 -j ACCEPT
iptables -A INPUT -i $INTERFACE -p tcp ! --syn --sport $UNPRIVPORTS -d 
$LOCAL_IP_3 --dport 20 -j ACCEPT
iptables -A INPUT -i $INTERFACE -p tcp ! --syn --sport $UNPRIVPORTS -d 
$LOCAL_IP_4 --dport 20 -j ACCEPT

#passive mode
iptables -A INPUT -i $INTERFACE -p tcp --sport $UNPRIVPORTS -d $LOCAL_IP_1 
--dport $UNPRIVPORTS -j ACCEPT
iptables -A INPUT -i $INTERFACE -p tcp --sport $UNPRIVPORTS -d $LOCAL_IP_2 
--dport $UNPRIVPORTS -j ACCEPT
iptables -A INPUT -i $INTERFACE -p tcp --sport $UNPRIVPORTS -d $LOCAL_IP_3 
--dport $UNPRIVPORTS -j ACCEPT
iptables -A INPUT -i $INTERFACE -p tcp --sport $UNPRIVPORTS -d $LOCAL_IP_4 
--dport $UNPRIVPORTS -j ACCEPT

iptables -A OUTPUT -o $INTERFACE -p tcp ! --syn -s $LOCAL_IP_1 --sport 
$UNPRIVPORTS --dport $UNPRIVPORTS -j ACCEPT
iptables -A OUTPUT -o $INTERFACE -p tcp ! --syn -s $LOCAL_IP_2 --sport 
$UNPRIVPORTS --dport $UNPRIVPORTS -j ACCEPT
iptables -A OUTPUT -o $INTERFACE -p tcp ! --syn -s $LOCAL_IP_3 --sport 
$UNPRIVPORTS --dport $UNPRIVPORTS -j ACCEPT
iptables -A OUTPUT -o $INTERFACE -p tcp ! --syn -s $LOCAL_IP_4 --sport 
$UNPRIVPORTS --dport $UNPRIVPORTS -j ACCEPT


Thanks
Vlady 






