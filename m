From: "Jason" <jason@oregonemt.net>
Subject: Re: Allowing Samba Access to certain IPs PLEASE DISREGARD THIS EMAIL
Date: Mon, 12 Dec 2005 14:08:14 -0800
Message-ID: <009d01c5ff68$8c58f910$2e01a8c0@jasonspc>
References: <009001c5ff67$9b95fe60$2e01a8c0@jasonspc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="response"
To: Jason <jason@oregonemt.net>, netfilter@lists.netfilter.org

I'm Sorry.  I accidentally sent this before I was finished composing. 
Please disregard this email message.  I will resend when I am finished.  My 
apologies

Jason

----- Original Message ----- 
From: "Jason" <jason@oregonemt.net>
To: <netfilter@lists.netfilter.org>
Sent: Monday, December 12, 2005 2:01 PM
Subject: Allowing Samba Access to certain IPs


>I am running a Samba server on Fedora Core 4 that I would like to open up 
>access only to certain networks and block all others.
>
> How Would I accomplish this using iptables?   Here is my firewall script 
> so you can see what it is I am doing wrong.
>
> Thanks
>
> Jason
>
> # import this saved configuration into your iptables configuration with 
> the following command:
> # iptables-restore < web_server.config
>
> *nat
> :PREROUTING ACCEPT [127173:7033011]
> :POSTROUTING ACCEPT [31583:2332178]
> :OUTPUT ACCEPT [32021:2375633]
> COMMIT
>
> *mangle
> :PREROUTING ACCEPT [444:43563]
> :INPUT ACCEPT [444:43563] :FORWARD ACCEPT [0:0]
> :OUTPUT ACCEPT [402:144198]
> :POSTROUTING ACCEPT [402:144198]
> -A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG 
> FIN,PSH,URG -j DROP
> -A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG NONE -j 
> DROP
> -A PREROUTING -p tcp -m tcp --tcp-flags SYN,RST SYN,RST -j DROP
> -A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN FIN,SYN -j DROP
> COMMIT
>
> *filter
> :INPUT DROP [1:242]
> :FORWARD DROP [0:0]
> :OUTPUT DROP [0:0]
> :icmp_packets - [0:0]
> -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 20 -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 21 -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 22 -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 25 -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 43 -j ACCEPT
> -A INPUT -p udp -m udp --dport 53 -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 106 -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 110 -j ACCEPT
> -A INPUT -p udp -m udp --dport 123 -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 143 -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 443 -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 783 -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 901 -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 993 -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 3306 -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 10000 -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 12000 -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 15000 -j ACCEPT
> -A INPUT -s 127.0.0.1 -j ACCEPT
> -A INPUT -s 192.168.1.0/24 -i eth0 -p udp -m udp -d 192.168.1.41 --dport 
> 137 -j ACCEPT
> -A INPUT -s 192.168.1.0/24 -i eth0 -p udp -m udp -d 192.168.1.41 --dport 
> 138 -j ACCEPT
> -A INPUT -s 192.168.1.0/24 -i eth0 -p tcp -m tcp -d 192.168.1.41 --dport 
> 139 -j ACCEPT
> -A INPUT -s 192.168.1.0/24 -i eth0 -p tcp -m tcp -d 192.168.1.41 --dport 
> 445 -j ACCEPT
> -A INPUT -s 66.220.104.76 -i eth0 -p udp -m udp -d 71.111.151.20 --dport 
> 137 -j ACCEPT
> -A INPUT -s 66.220.104.76 -i eth0 -p udp -m udp -d 71.111.151.20 --dport 
> 137 -j ACCEPT
> -A INPUT -p icmp -j icmp_packets
> -A INPUT -j LOG --log-prefix "IPTABLES-IN Default Drop: " --log-level 7
>
>
> -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
> -A OUTPUT -p tcp -m tcp --dport 20 -j ACCEPT
> -A OUTPUT -p tcp -m tcp --dport 21 -j ACCEPT
> -A OUTPUT -p tcp -m tcp --dport 22 -j ACCEPT
> -A OUTPUT -p tcp -m tcp --dport 23 -j ACCEPT
> -A OUTPUT -p tcp -m tcp --dport 25 -j ACCEPT
> -A OUTPUT -p tcp -m tcp --dport 43 -j ACCEPT
> -A OUTPUT -p udp -m udp --dport 53 -j ACCEPT
> -A OUTPUT -p tcp -m tcp --dport 80 -j ACCEPT
> -A OUTPUT -p tcp -m tcp --dport 106 -j ACCEPT
> -A OUTPUT -p tcp -m tcp --dport 110 -j ACCEPT
> -A OUTPUT -p udp -m udp --dport 123 -j ACCEPT
> -A OUTPUT -p tcp -m tcp --dport 143 -j ACCEPT
> -A OUTPUT -p tcp -m tcp --dport 443 -j ACCEPT
> -A OUTPUT -p tcp -m tcp --dport 783 -j ACCEPT
> -A OUTPUT -p tcp -m tcp --dport 901 -j ACCEPT
> -A OUTPUT -p tcp -m tcp --dport 993 -j ACCEPT
> -A OUTPUT -p tcp -m tcp --dport 3306 -j ACCEPT
> -A OUTPUT -p tcp -m tcp --dport 10000 -j ACCEPT
> -A OUTPUT -p tcp -m tcp --dport 12000 -j ACCEPT
> -A OUTPUT -p tcp -m tcp --dport 15000 -j ACCEPT
> -A OUTPUT -p tcp -m tcp --dport 2210 -j ACCEPT
> -A OUTPUT -d 127.0.0.1 -j ACCEPT
> -A OUTPUT -p icmp -j icmp_packets
> -A OUTPUT -j LOG --log-prefix "IPTABLES-OUT Default Drop: " --log-level 7
>
>
> -A icmp_packets -p icmp -m icmp --icmp-type 0 -j ACCEPT
> -A icmp_packets -s 127.0.0.1 -p icmp -m icmp --icmp-type 8 -j ACCEPT
> -A icmp_packets -p icmp -m icmp --icmp-type 8 -j DROP
> -A icmp_packets -p icmp -m icmp --icmp-type 3 -j ACCEPT
> -A icmp_packets -p icmp -m icmp --icmp-type 11 -j ACCEPT
> COMMIT
>
>
>
>
>
>
> -- 
> No virus found in this incoming message.
> Checked by AVG Free Edition.
> Version: 7.1.371 / Virus Database: 267.13.13/198 - Release Date: 
> 12/12/2005
>
> 


