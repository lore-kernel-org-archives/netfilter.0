From: Alpt <alpt-6BmP915+9Ldg9hUCZPvPmw@public.gmane.org>
Subject: Re: Multiple inet gw and multipath
Date: Thu, 2 Mar 2006 03:38:28 +0100
Message-ID: <20060302023828.GA14670@nihil>
References: <57F9959B46E0FA4D8BA88AEDFBE582901673AA@pxtbenexd01.pxt.primeexalia.com> <20060301045503.GA7482@nihil> <440532BA.40009@snapgear.com>
Reply-To: netsukuku-6BmP915+9Ldg9hUCZPvPmw@public.gmane.org
Mime-Version: 1.0
Return-path: <netsukuku-return-482-gnpn-netsukuku=m.gmane.org-6BmP915+9Ldg9hUCZPvPmw@public.gmane.org>
List-Post: <mailto:netsukuku-6BmP915+9Ldg9hUCZPvPmw@public.gmane.org>
List-Help: <mailto:netsukuku-help-6BmP915+9Ldg9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <mailto:netsukuku-unsubscribe-6BmP915+9Ldg9hUCZPvPmw@public.gmane.org>
List-Subscribe: <mailto:netsukuku-subscribe-6BmP915+9Ldg9hUCZPvPmw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <440532BA.40009-XXXsiaCtIV5Wk0Htik3J/w@public.gmane.org>
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Philip Craig <philipc-XXXsiaCtIV5Wk0Htik3J/w@public.gmane.org>
Cc: netfilter-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org, netsukuku-6BmP915+9Ldg9hUCZPvPmw@public.gmane.org

On Wed, Mar 01, 2006 at 03:35:54PM +1000, <Philip Craig>:
~> On 03/01/2006 02:55 PM, Alpt wrote:
~> > We have multiple gw. When a new connection is established through a gw,
~> > all the packets belonging to the same connection must be sent through the
~> > same gw. 
~> > We cannot use the source routing method since all the IFs use the same IP,
~> > thus in order to accomplish this we have to:
~> > mark with the same id all the packets which belong to the same
~> > connection.
~> > Each connection has to have a different mark in order to go through
~> > different gateways.

~> It should work if you just mark the connection with the same mark
~> you use for the route tables.  Some untested rules:
~> # Save the gateway in the connection mark for new outgoing connections
~> iptables -t mangle -A POSTROUTING -o eth0 -m conntrack --ctstate NEW -j CONNMARK --set-mark 0x4
~> iptables -t mangle -A POSTROUTING -o eth1 -m conntrack --ctstate NEW -j CONNMARK --set-mark 0x8
~> # Use the correct gateway for reply packets from local connections
~> iptables -t mangle -A OUTPUT -m conntrack --ctstate ESTABLISHED,RELATED -j CONNMARK --restore-mark

Thanks for your advice, it works.
Here below there are the rules and routes we've used in the tests.
(I'm including them here because they might be useful to someone who'll read
the archive of the ml in search of the solution for the same problem ;)

pc1:~/src# ip rule
0:      from all lookup local 
32764:  from 10.198.117.159 fwmark 0x8 lookup 202 
32765:  from 10.198.117.159 fwmark 0x4 lookup 201 
32766:  from all lookup main 
32767:  from all lookup default 
pc1:~/src# 

pc1:~/src# ip route show table 201
default via 10.198.117.95 dev tunl0 

pc1:~/src# ip route show table 202
default via 10.198.117.3 dev tunl1 
pc1:~/src# 

pc1:~/src# ip route
10.198.117.3 via 10.198.117.159 dev eth0  proto 15  scope link 
10.198.117.95 via 10.198.117.159 dev eth1  proto 15  scope link 
10.0.0.0/8 dev eth0  proto kernel  scope link  src 10.198.117.159 
10.0.0.0/8 dev eth1  proto kernel  scope link  src 10.198.117.159 
10.0.0.0/8 dev tunl0  proto kernel  scope link  src 10.198.117.159 
10.0.0.0/8 dev tunl1  proto kernel  scope link  src 10.198.117.159 
default equalize 
        nexthop via 10.198.117.95  dev tunl0 weight 1
        nexthop via 10.198.117.3  dev tunl1 weight 1
pc1:~/src# 

iptables -t mangle -A OUTPUT -m conntrack --ctstate ESTABLISHED,RELATED  -j CONNMARK --restore-mark
iptables -t mangle -A POSTROUTING -o tunl0 -m conntrack --ctstate NEW -j CONNMARK --set-mark 0x4
iptables -t mangle -A POSTROUTING -o tunl1 -m conntrack --ctstate NEW -j CONNMARK --set-mark 0x8

ip rule add from  10.198.117.159 fwmark 0x4 lookup 201
ip rule add from  10.198.117.159 fwmark 0x8 lookup 202

ip route add table 201 default via 10.198.117.95  dev tunl0
ip route add table 202 default via 10.198.117.3  dev tunl1

-- 
:wq!
"I don't know nothing" The One Who reached the Thinking Matter   '.'

[ Alpt --- Freaknet Medialab ]
[ GPG Key ID 441CF0EE ]
[ Key fingerprint = 8B02 26E8 831A 7BB9 81A9  5277 BFF8 037E 441C F0EE ]
