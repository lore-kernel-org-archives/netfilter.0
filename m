From: Rudi Starcevic <tech@wildcash.com>
Subject: Re: RDP and iptables ruleset
Date: Thu, 09 Dec 2004 14:27:19 -0800
Message-ID: <41B8D147.5050600@wildcash.com>
References: <17F5DA2FB6F18744BA13C2197738727CD19AC1@alchmail.alch-la-dc.alchemy.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <17F5DA2FB6F18744BA13C2197738727CD19AC1@alchmail.alch-la-dc.alchemy.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi James,

I set up RDP port-forwarding for the first time myself earlier this week.
I'm using Debian 3 and Win 2003.

These rules work well for me with a default policy of Accept ( which 
I'll update shortly )::

##### start NAT routing #####
$IPTABLES --table nat --append POSTROUTING --out-interface eth0 -j 
MASQUERADE

# forward remote desktop media_server_1
$IPTABLES -t nat -A PREROUTING -i eth0 -p tcp --dport 3389 -s 
xxx.xxx.xxx.xxx -j DNAT --to 192.168.0.10:3389

# ENABLE FORWARDING / NAT / MASQUERADING
echo "1" > /proc/sys/net/ipv4/ip_forward

Hope this helps.
Kind regards,
Rudi.

James Bowling wrote:

>I seem to be having some issues with iptables 1.2.11 and getting RDP to
>be allowed through.  My windows box is NAT'd behind my Gentoo 2004.3
>box.  Here is my NAT Tables:
>
># iptables -t nat -L
>Chain PREROUTING (policy ACCEPT)
>target     prot opt source               destination         
>DNAT       tcp  --  anywhere             anywhere            tcp
>dpt:3389 to:10.0.1.2:3389 
>
>Chain POSTROUTING (policy ACCEPT)
>target     prot opt source               destination         
>SNAT       tcp  --  anywhere             anywhere            tcp
>dpt:3389 to:10.0.1.2:3389 
>MASQUERADE  all  --  anywhere             anywhere            
>
>Chain OUTPUT (policy ACCEPT)
>target     prot opt source               destination   
>
>
>Here is my iptables rules:
>
># iptables -L
>Chain INPUT (policy ACCEPT)
>target     prot opt source               destination         
>ACCEPT     all  --  anywhere             anywhere            
>REJECT     udp  --  anywhere             anywhere            udp
>dpt:bootps reject-with icmp-port-unreachable 
>REJECT     udp  --  anywhere             anywhere            udp
>dpt:domain reject-with icmp-port-unreachable 
>ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:ssh
>
>ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:ftp
>
>ACCEPT     tcp  --  anywhere             anywhere            tcp
>dpt:ftp-data 
>ACCEPT     tcp  --  anywhere             anywhere            tcp
>dpt:8245 
>DROP       tcp  --  anywhere             anywhere            tcp
>dpts:0:1023 
>DROP       udp  --  anywhere             anywhere            udp
>dpts:0:1023 
>
>Chain FORWARD (policy ACCEPT)
>target     prot opt source               destination         
>DROP       all  --  anywhere             10.0.1.0/24         
>ACCEPT     all  --  10.0.1.0/24          anywhere            
>ACCEPT     all  --  anywhere             10.0.1.0/24         
>ACCEPT     all  --  anywhere             anywhere            state
>RELATED,ESTABLISHED 
>ACCEPT     all  --  anywhere             anywhere            
>
>Chain OUTPUT (policy ACCEPT)
>target     prot opt source               destination         
>
>This is just a very basic rule set as you can see.  What happens is when
>I connect with RDP it goes through to the login and then after
>authentication it just sits there and eventually times out.  Any ideas
>on what is going on?  Any help would be appreciated.
>
>
>Regards,
>James Bowling
>
>
>
>  
>


