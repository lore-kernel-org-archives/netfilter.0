From: "Michael K" <micke@klintan.se>
Subject: RE: firewall rules
Date: Mon, 14 Apr 2003 19:18:09 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001f01c302a9$d4191cd0$0200a8c0@klintan.local>
References: <20030414140009.GA1942@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030414140009.GA1942@localhost>
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
To: 'Payal Rathod' <linux@rpayal.cjb.net>
Cc: netfilter@lists.netfilter.org

#Here you go. I haven't tried the syntax.

INTERNAL_INTERFACE='eth0'
EXTERNAL_INTERFACE='eth1'
EXTERNAL_IP=`ifconfig $EXTERNAL_INTERFACE | awk '/inet/ { print $2 }' |
awk -F ":" '{ print $2 }'`

iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP
iptables -F 
iptables -t nat -F
Iptables -t mangle -F


#ESTABLISHED,RELATED
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

#SSH
iptables -A INPUT -p tcp -s 192.168.10.0/24 --sport 512: --dport 22 -j
ACCEPT

#Telnet (Only use if you must, ssh is better)
iptables -A INPUT -p tcp -s 192.168.10.0/24 --sport 1024: --dport 23 -j
ACCEPT

#SMTP
iptables -A INPUT -p tcp -s 192.168.10.0/24 --sport 1024: --dport 25 -j
ACCEPT

#POP3
iptables -A INPUT -p tcp -s 192.168.10.0/24 --sport 1024: --dport 110 -j
ACCEPT

#FTP
iptables -A INPUT -p tcp -s 192.168.10.0/24 --sport 1024: --dport 21 -j
ACCEPT

#Web
iptables -A INPUT -p tcp -s 192.168.10.0/24 --sport 1024: -m multiport
--dports 80,443 -j ACCEPT

#Ping
iptables -A INPUT -p ICMP -s 192.168.10.0/24 --icmp-type echo-request -j
ACCEPT

#Surfing from the firewall
iptables -A OUTPUT -p tcp --dports 80,443 -j ACCEPT
iptables -A OUTPUT -p udp --dport 53 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 53 -j ACCEPT

#Internet sharing
iptables -t nat -A POSTROUTING -o $EXTERNAL_INTERFACE -j SNAT --to
$EXTERNAL_IP
iptables -A FORWARD -i $INTERNAL_INTERFACE -o $EXTERNAL_INTERFACE -p tcp
-s 192.168.10.1 --dport 80 -j ACCEPT 
iptables -A FORWARD -i $INTERNAL_INTERFACE -o $EXTERNAL_INTERFACE -p tcp
-s 192.168.10.3 --dport 80 -j ACCEPT
iptables -A FORWARD -i $INTERNAL_INTERFACE -o $EXTERNAL_INTERFACE -p tcp
-s 192.168.10.1 --dport 443 -j ACCEPT
iptables -A FORWARD -i $INTERNAL_INTERFACE -o $EXTERNAL_INTERFACE -p tcp
-s 192.168.10.3 --dport 443 -j ACCEPT
iptables -A FORWARD -i $INTERNAL_INTERFACE -o $EXTERNAL_INTERFACE -s
192.168.10.0/24 --dport ! 80 -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT


#/Klintan


> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org 
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Payal Rathod
> Sent: Monday, April 14, 2003 4:00 PM
> To: netfilter@lists.netfilter.org
> Subject: firewall rules
> 
> 
> Hi,
> I have made a few firewall rules, almost stolen from 
> IP-Masquerading HOWTO. Can you please check them and tell 
> about any loopholes. I have a lan of 15 computers and a 
> central linux server. Users can telnet, ping, http, ssh, 
> pop3, smtp in this linux box if only they belong to the lan. 
> Also, users of the lan have internet access to everything 
> except www, how do I mention it? Only ip 192.168.10.1, 
> 192.168.10.3, 192.168.10.10 have www net access also. Rest no.
> 
> So as not to waste bandwidth I have put the rules on my site 
> at www.geocities.com/rpayal99/firewall-b1.txt Please have a 
> look at them and suggest changes. For security I have just 
> made a small change to external IP, but the rest of all the 
> rules are kept as they are.
> 
> With warm regards,
> -Payal
> 
> 
> 
> -- 
> "Visit GNU/Linux Success Stories"
> www.geocities.com/rpayal99
> Guest-Book Section Updated.
> 
> 
> 



