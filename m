From: Jason Opperisano <opie@817west.com>
Subject: Re: Problems Pinging the Internet w/this script
Date: Sat, 11 Sep 2004 21:24:37 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094952277.5506.26.camel@wolfpack.ljm.dom>
References: <41439912.2090701@juno.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41439912.2090701@juno.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Sat, 2004-09-11 at 20:32, Jesse wrote:
> Here's a script I'm using to create some tables which will only allow in 
> on ports I'm running services. One of the problems I'm havng is that I 
> can't ping the Internet with a DNS address from this machine. I've 
> allowed everything in the OUTPUT table and can ping the Internet when 
> using a straight IP, but when I type in "ping google.com" the machine 
> hangs for a few seconds and gives me a server request error. I know it's 
> something with my rules because when I flush them all I can ping 
> google.com just fine. Any ideas would be greatly appreciated. I'm 
> guessing it's something trivial but can't put my finger on it yet.
> 
> thanks
> 
> #!/bin/bash
> ########## Beginning 
> ###########################################################
> 
> # Define Interfaces/Networks
> 
>     # Inside/Intranet Interface
>       INSIDEIP="192.168.7.55"
>       INSIDEINT="eth0"
> 
>     # External/Internet Interface   
>     # OUTSIDEIP=
>     # OUTSIDEINT=
> 
>     # LAN Network
>       LAN="192.168.7.0/24"
> 
>     # Admin Host
>       ADMIN="192.168.7.51"
> 
> # Define other Variables
> 
>     RULE="/usr/sbin/iptables"
> 
> # Flushing All rules/chains
>   $RULE -A INPUT LOG
>   $RULE -A OUTPUT LOG
>   $RULE -A FORWARD LOG

um--any particular reason why you append 3 LOG rules (with incorrect
syntax, btw...) 3 lines before you flush everything out?  nevermind--i'm
sure there's a fantastic reason behind it--so i'll just note, that they
should be:

  iptables -A INPUT -j LOG
  iptables -A OUTPUT -j LOG
  iptables -A FORWARD -j LOG

>   $RULE -P INPUT DROP
>   $RULE -P OUTPUT DROP
>   $RULE -P FORWARD DROP
>   $RULE -F INPUT
>   $RULE -F OUTPUT
>   $RULE -F FORWARD
> 
> # Adding Permittable Network/Hosts/Ports to Input Table on Internal 
> Interface
> 
>   # Allowing DNS,FTP,SSH,Webmin,HTTP,SWAT,and Samba to Server
> 
>   $RULE -A INPUT -i $INSIDEINT --proto icmp --icmp-type any -j ACCEPT
>   $RULE -A INPUT -i $INSIDEINT --proto tcp --dport 21 -d $INSIDEIP -j ACCEPT
>   $RULE -A INPUT -i $INSIDEINT --proto tcp -s $ADMIN --dport 22 -d 
> $INSIDEIP -j ACCEPT
>   $RULE -A INPUT -i $INSIDEINT --proto tcp --dport 53 -d $INSIDEIP -j ACCEPT

if this machine is a DNS server offering name resolution to hosts on
$INSIDEINT--those requests are UDP, not TCP.  TCP 53 is used for zone
transfers between name servers.

>   $RULE -A INPUT -i $INSIDEINT --proto tcp --dport 80 -d $INSIDEIP -j ACCEPT
>   $RULE -A INPUT -i $INSIDEINT --proto tcp --dport 137 -d $INSIDEIP -j 
> ACCEPT
>   $RULE -A INPUT -i $INSIDEINT --proto tcp --dport 138 -d $INSIDEIP -j 
> ACCEPT

ports 137 and 138, if being used in the "nmbd" sense--are UDP, not TCP. 
try "netstat -lntu" if you don't believe me.

>   $RULE -A INPUT -i $INSIDEINT --proto tcp --dport 139 -d $INSIDEIP -j 
> ACCEPT
>   $RULE -A INPUT -i $INSIDEINT --proto tcp --dport 445 -d $INSIDEIP -j 
> ACCEPT

stylistic note:  you could reduce the number of rules you have by using
the "-m multiport" match:

  iptables -A INPUT -i $INSIDEINT -p tcp -d $INSIDEIP \
    -m multiport --dports 21,80,139,445 -j ACCEPT

  iptables -A INPUT -i $INSIDEINT -p udp -d $INSIDEIP \
    -m multiport --dports 53,137,138 -j ACCEPT

>   $RULE -A INPUT -i $INSIDEINT --proto tcp -s $ADMIN --dport 901 -d 
> $INSIDEIP -j ACCEPT
>   $RULE -A INPUT -i $INSIDEINT --proto tcp -s $ADMIN  --dport 10000 -d 
> $INSIDEIP -j ACCEPT
> 
> # Denying Everything on Local Network
> 
> # Adding entry to allow everything originating from Internal Interface out
>    
>   $RULE -A OUTPUT -j ACCEPT
> 
> ########## END 
> ################################################################

the reason you can ping by IP is:

  iptables -A OUTPUT -j ACCEPT

allows the ICMP echo-request out, and

  iptables -A INPUT -i $INSIDEINT --proto icmp --icmp-type any -j ACCEPT

allows the ICMP echo-reply back in.

the above does not hold true for a DNS request (UDP 53 out & in)

i might recommend investigating the use of:

  iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

as the first rule in your INPUT chain. and the use of:

  iptables -A INPUT -j LOG --log-prefix "FW DROP IN: "
  iptables -A OUTPUT -j LOG --log-prefix "FW DROP OUT: "

as the last rules in your chains.

all this (and more) is covered in depth in:

http://iptables-tutorial.frozentux.net/iptables-tutorial.html

-j

-- 
Jason Opperisano <opie@817west.com>


