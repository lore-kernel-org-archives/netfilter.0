From: Jason Opperisano <opie@817west.com>
Subject: Re: RDP and iptables ruleset
Date: Wed, 08 Dec 2004 18:05:04 -0500
Message-ID: <1102547104.3472.24.camel@hubcap.ljm.dom>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Wed, 2004-12-08 at 13:06, James Bowling wrote:
> I seem to be having some issues with iptables 1.2.11 and getting RDP to
> be allowed through.  My windows box is NAT'd behind my Gentoo 2004.3
> box.  Here is my NAT Tables:
> 
> # iptables -t nat -L

ugh--post your rules with "-v" as well so we can see interfaces and
other options (iptables -t nat -vnxL)...

> Chain PREROUTING (policy ACCEPT)
> target     prot opt source               destination         
> DNAT       tcp  --  anywhere             anywhere            tcp
> dpt:3389 to:10.0.1.2:3389 
> 
> Chain POSTROUTING (policy ACCEPT)
> target     prot opt source               destination         
> SNAT       tcp  --  anywhere             anywhere            tcp
> dpt:3389 to:10.0.1.2:3389 

get rid of that rule.

> MASQUERADE  all  --  anywhere             anywhere            
> 
> Chain OUTPUT (policy ACCEPT)
> target     prot opt source               destination   
> 
> 
> Here is my iptables rules:
> 
> # iptables -L

ditto:  iptables -vnxL

> Chain INPUT (policy ACCEPT)
> target     prot opt source               destination         
> ACCEPT     all  --  anywhere             anywhere 

all rules after that do nothing, and no other rules will be matched
(unless there's some magic interface specified there; but we don't know,
now do we?)
           
> REJECT     udp  --  anywhere             anywhere            udp
> dpt:bootps reject-with icmp-port-unreachable 
> REJECT     udp  --  anywhere             anywhere            udp
> dpt:domain reject-with icmp-port-unreachable 
> ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:ssh
> 
> ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:ftp
> 
> ACCEPT     tcp  --  anywhere             anywhere            tcp
> dpt:ftp-data 
> ACCEPT     tcp  --  anywhere             anywhere            tcp
> dpt:8245 
> DROP       tcp  --  anywhere             anywhere            tcp
> dpts:0:1023 
> DROP       udp  --  anywhere             anywhere            udp
> dpts:0:1023 
> 
> Chain FORWARD (policy ACCEPT)
> target     prot opt source               destination         
> DROP       all  --  anywhere             10.0.1.0/24 

something tells me that could be the problem...unless there's an
interface specified there that we can't see...
        
> ACCEPT     all  --  10.0.1.0/24          anywhere            
> ACCEPT     all  --  anywhere             10.0.1.0/24         
> ACCEPT     all  --  anywhere             anywhere            state
> RELATED,ESTABLISHED 
> ACCEPT     all  --  anywhere             anywhere            
> 
> Chain OUTPUT (policy ACCEPT)
> target     prot opt source               destination         
> 
> This is just a very basic rule set as you can see.  

it appears to be a completely useless ruleset, actually.  flush all that
stuff [*] out and start fresh with:

  iptables -t nat -A PREROUTING -i $EXT_IF -p tcp --dport 3389 -j DNAT \
    --to-destination 10.0.1.2

  iptables -t nat -A POSTROUTING -o $EXT_IF -j MASQUERADE

and see what happens.

-j

[*] for t in mangle nat filter; do
      iptables -t $t -F
      iptables -t $t -X
      iptables -t $t -Z
    done
    for c in INPUT FORWARD OUTPUT; do
      iptables -P $c ACCEPT
    done

--
"It takes two to lie. One to lie and one to listen."
	--The Simpsons


