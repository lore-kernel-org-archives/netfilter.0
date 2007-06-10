From: Yaniv Fine <yfine@jacada.com>
Subject: Re: iptables port forwarding to tun0 device
Date: Sun, 10 Jun 2007 17:29:30 +0300
Message-ID: <OF8F58C156.0F03DD5E-ONC22572F6.004F6ACA-C22572F6.004F9AD0@jacada.com>
References: <web-17954090@bk3.webmaillogin.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <web-17954090@bk3.webmaillogin.com>
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
To: Jorge Davila <davila@nicaraguaopensource.com>
Cc: netfilter@lists.netfilter.org




my tun0 device is configured with eth1 ,
so in my iptables rules i need to point the forward rules to eth1 instead
of tun0 ?



                                                                           
             Jorge Davila                                                  
             <davila@nicaragua                                             
             opensource.com>                                            To 
                                       Yaniv Fine <yfine@jacada.com>,      
             06/10/2007 05:25          netfilter@lists.netfilter.org       
             PM                                                         cc 
                                                                           
                                                                   Subject 
                                       Re: iptables port forwarding to     
                                       tun0 device                         
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           




Yaniv:

Since the tun device is created you can reference them as another network
interface and configure the iptables rules as normal.

Hope this help,

Jorge Davila.
On Wed, 6 Jun 2007 16:45:24 +0300
  Yaniv Fine <yfine@jacada.com> wrote:
>
> Hi experts
>
> i have the following configuration
> eth0.10.90.20.3/24
> tun0=172.16.10.x/24
>
> eth0 configure as Wan interface
> eth1/tun0 are lan interface .
> tun0 network 172.16.10.200 =>  web server
> in side my tun0 there is a web server i need to manage for the outside
> world (eth0, it can also be restricted to specific ip address )
> i am trying to find a way using port forwarding to enable this .
> can some one please help me modify my correct iptables rules
>
>
>
>
> IPTABLES="/sbin/iptables"
> EXTIF="eth0"
> INTIF="eth1"
>
> #Flush all rules
> $IPTABLES -F
> $IPTABLES -F -t nat
> $IPTABLES -F -t mangle
>
> #Set default behaviour
> $IPTABLES -P INPUT DROP
> $IPTABLES -P FORWARD ACCEPT
> $IPTABLES -P OUTPUT ACCEPT
>
> #Allow related and established on all interfaces (input)
> $IPTABLES -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
>
> #Allow releated, established and ssh on $EXTIF. Reject everything else.
> $IPTABLES -A INPUT -i $EXTIF -p tcp -m tcp --dport 22 --syn -j ACCEPT
> #$IPTABLES -A INPUT -i $EXTIF -p tcp -m tcp --dport 80 --syn -j ACCEPT
> $IPTABLES -A INPUT -i $EXTIF -j REJECT
>
> #Allow related and established from $INTIF. Drop everything else.
> $IPTABLES -A INPUT -i $INTIF -j DROP
>
> #Allow http and https on other interfaces (input).
> #This is only needed if authentication server is on same server as chilli
> $IPTABLES -A INPUT -p tcp -m tcp --dport 80 --syn -j ACCEPT
> $IPTABLES -A INPUT -p tcp -m tcp --dport 443 --syn -j ACCEPT
>
> #Allow 3990 on other interfaces (input).
> $IPTABLES -A INPUT -p tcp -m tcp --dport 3990 --syn -j ACCEPT
>
> #Allow ICMP echo on other interfaces (input).
> $IPTABLES -A INPUT -p icmp --icmp-type echo-request -j ACCEPT
>
> #Allow everything on loopback interface.
> $IPTABLES -A INPUT -i lo -j ACCEPT
>
> # Drop everything to and from $INTIF (forward)
> # This means that access points can only be managed from ChilliSpot
> $IPTABLES -A FORWARD -i $INTIF -j DROP
> $IPTABLES -A FORWARD -o $INTIF -j DROP
>
> #Enable NAT on output device
> $IPTABLES -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE
>
>
> thank you !
>
>
>

Jorge Isaac Davila Lopez
Nicaragua Open Source
+505 430 5462
davila@nicaraguaopensource.com



