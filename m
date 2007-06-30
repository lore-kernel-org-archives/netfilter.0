From: thiago@powers.com.br
Subject: Re: link redudancy, not load-balancing
Date: Fri, 29 Jun 2007 22:06:06 -0300
Message-ID: <OF43BB8DB7.2E865B8E-ON8325730A.0003E52A-8325730A.0005CEE9@powers.com.br>
References: <1183137011.19759.22.camel@localhost>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1183137011.19759.22.camel@localhost>
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
To: netfilter@lists.netfilter.org

Thomas,

Worked just perfect! I wasn't aware of this simple but powerful target
(even forgot to add it when last set up my router's kernel!).

Just to share, the final rules to route back all traffic destined to the
router itself and to the localnet, that came in through the secondary link:

# new routing table (based on 'main' table)

echo "10 sec.out" >> /etc/iproute2/rt_tables
ip route show table main | grep -Ev ^default | while read ROUTE
do
ip route add $ROUTE table sec.out
done
ip route add default via <EXT_GW> table sec.out

# rule match
ip rule add fwmark 0x10 table sec.out

# mangle (mark) incoming connection
iptables -t mangle -N MANGLE_IN
iptables -t mangle -A INPUT -d <EXT_IP> -j MANGLE_IN
iptables -t mangle -A PREROUTING -i <EXT_IF> -j MANGLE_IN
iptables -t mangle -A MANGLE_IN -j CONNMARK --set-mark 0x10

# mangle (restore mark) outgoing packets
iptables -t mangle -N MANGLE_OUT
iptables -t mangle -A OUTPUT -s <EXT_IP> -j MANGLE_OUT
iptables -t mangle -A PREROUTING -i <INT_IF> -j MANGLE_OUT
iptables -t mangle -A MANGLE_OUT -d <LOCAL_NET> -j RETURN
iptables -t mangle -A MANGLE_OUT -m connmark ! --mark 0 -j CONNMARK
--restore-mark

And everything else is just as usual, in PREROUTING/POSTROUTING (nat) or
INPUT/FORWARD/OUTPUT (filter) tables.

Thank you again Thomas !

Thiago.





                                                                           
             Thomas Jacob                                                  
             <jacob@internet24                                             
             .de>                                                       To 
             Sent by:                  netfilter@lists.netfilter.org       
             netfilter-bounces                                          cc 
             @lists.netfilter.                                             
             org                                                   Subject 
                                       Re: link redudancy, not             
                                       load-balancing                      
             29/06/2007 14:14                                              
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           




Check out the CONNMARK target, and
the connmark matcher module.

The following is a setup pattern for
sending back traffic related to a connection to the router it was
initiated
from, to give you a rough idea, it's probably not a workable config
though...


# mark connections by router src MAC (you can probably just use the
incoming interface in your case).
iptables -t mangle -N MANGLE_IN
iptables -t mangle -A PREROUTING -i <EXT_IF> -j MANGLE_IN

iptables -t mangle -A MANGLE_IN -m mac --mac <ROUTER_ONE_MAC> \
   -j CONNMARK --set-mark 1
iptables -t mangle -A MANGLE_IN -m mac --mac <ROUTER_TWO_MAC> \
   -j CONNMARK --set-mark 2

# Restoring mark from connmark
iptables -t mangle -N MANGLE_OUT
iptables -t mangle -A PREROUTING -i <INT_IF> -j MANGLE_OUT
iptables -t mangle -A MANGLE_OUT -d <LOCAL_NET> -j RETURN
iptables -t mangle -A MANGLE_OUT -m connmark ! --mark 0 -j CONNMARK \
   --restore-mark


# iproute stuff
ip rule add fwmark 1 pref 10001 table 100
ip route add default via <ROUTER_ONE_GW> table 101

ip rule add fwmark 2 pref 10002 table 101
ip route add default via <ROUTER_TWO_GW> table 102




On Fri, 2007-06-29 at 13:45 -0300, thiago@powers.com.br wrote:
> Whats up list,
>
> I'll try to make my question clean and clear, but unfortunatelly not too
> short. The scenario is:
>
> 2 internet providers connected to one linux router/firewall box
(provider1,
> which is my default route, and provider2)
> 1 local network connected to the same box, with services running on
> different servers/internal ip addresses (localnet)
>
> I need to hit services running on servers of this internal network,
having
> the option of doing this using one internet connection or another, or
both
> at the same time.
>
> If the connection comes in through 'provider1', there's no mangle
> treatment, the packet that comes in also goes out through the default
> route.
>
> If the connection comes in through 'provider2', directed to a service
that
> runs on the router itself, using iproute2 + iptables/mangle I make it
work;
> - I set a mark on both INPUT and OUTPUT mangle tables, marking the packet
> from/to its IP address,
> - and insert a routing rule to match the packet mark and redirect it to a
> 'secondary' routing table, which has provider2' gateway as default route,
> sending the established connection back through the correct path..
>
> But lets say I want to hit, for example, the telnet service (tcp/23)
that
> is running on a server that is behing this nat.
>
> Again, I want to be able to use this telnet service from the internet,
> throught provider1 and provider2 at the same time (its not link load
> balance; its a redundant path). The rules for 'provider1' are simple, as
> provider1 is my default route; my problem is how to match the traffic to
> use the secondary routing table when the internal server replies. Giving
> some names:
>
> firewall/router box:
> provider1 / eth1 / internet address 1.2.3.4
> provider2 / eth2 / internet address 2.3.4.5
> localnet / eth3 / local address 10.0.0.1
> -
> internal server:
> server1 / local address 10.0.0.2
> --
> provider1 rules (as usual):
>
> # established return
> iptables -A FORWARD -i eth1 -m state --state ESTABLISHED,RELATED -j
ACCEPT
> # routing, forwarding
> iptables -t nat -A PREROUTING -i eth1 -p tcp -d 1.2.3.4 --dport 23 -j
DNAT
> --to 10.0.0.2
> iptables -A FORWARD -i eth1 -p tcp -d 10.0.0.2 --dport 23 -m state
--state
> NEW -j ACCEPT
> # source nat
> iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to-source 1.2.3.4
>
> And now: how do I mangle, this same scenario, to work with provider2 ? I
> understand that the FORWARD, PREROUTING and POSTROUTING rules are needed
> for provider2 as well.. but how do I arrange the mangle table to match
> server1's reply, and send it out using the secondary routing table, only
if
> the connection came in through provider2 ?
>
> Thanks for you time !
>
>
> --
> Thiago
>
>






