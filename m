From: system administrator <sysadmails@yahoo.com>
Subject: connecting to a SMTP/POP server on the internet
Date: Wed, 16 Jul 2003 08:11:24 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030716151124.35828.qmail@web14507.mail.yahoo.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi there,

We want to connect to a SMTP/POP server on the
internet from our LAN with:
                                                      
                         
iptables -A FORWARD -i eth0 -p tcp -j ACCEPT
iptables -A FORWARD -i eth0 -p udp -j ACCEPT
iptables -A FORWARD -j DROP
iptables -t nat -o eth1 -A POSTROUTING -j MASQUERADE
                                                      
                         
When we try to access from the workstation to the POP
server we get a message: 'connection to x.com timed
out', we can however access the mail on the firewall -
even if the connection is slow.
                                                      
                         
Please help us out ...
                                                      
                         
# Our general setup:
# RedHat 8.0 firewall with iptables installed on PII
400MHz
# eth0 = our LAN and eth1 = Internet
# cat /proc/sys/net/ipv4/ip_forward => 1
# gateway on workstation in LAN pointing to firewall
# gateway defined for eth1 pointing to router

Thanks in advance,

Frank

__________________________________
Do you Yahoo!?
SBC Yahoo! DSL - Now only $29.95 per month!
http://sbc.yahoo.com

