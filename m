From: thingstocome@gmx.net
Subject: unexpected problem with DNAT
Date: Wed, 10 Jul 2002 14:18:55 +0200 (MEST)
Sender: netfilter-admin@lists.samba.org
Message-ID: <2881.1026303535@www8.gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: netfilter@lists.samba.org

hello,
i'm currently configuring a linux box to function as a router/gateway
between two different LAN networks.

default config:
Hosts from LAN_1 shall be able to connect to LAN_2 via masquerading (SNAT) 
which works fine, and hosts from LAN_2 shall only be able to connect to the
gateway,
not to any host in LAN_2.

However sometimes it is necessery that a host of LAN_2 initiates a
connection to a  
certain computer in LAN_1.

I do this by adding following rule to the gateways' iptables, which also
works fine:

iptables -t nat -A PREROUTING -j DNAT -i eth1 -d <GATEWAY_ADDR1> --to
<LAN_1_ADDR>

note: GATEWAY_ADDR1 ... is one of several ip addresses that belong to the
gateway,
        LAN_1_ADDR        ... is the address of host that shall be reached
from LAN_2.

ok now here's my problem:

i thought that i can deny access to LAN_1_ADDR again as soon as the
connection isnt needed anymore, by simply removing the rule.

this worked if there were no open connections between the hosts, but not if
the host in LAN_2 already had established one.

here an example:

I logon from LAN_2 to a ftp server in LAN_1 through the gateway via DNAT .
no problem.
Now i flush the prerouting chain, remove the rule, whatever.
DNAT should not be allowed now anymore.
But the host in LAN_2 still has an open ftp connection and has access to the
host in LAN_1 until the ftp session is over.

But this must not be possible, i want to avoid it .

I think the host can still be accessed because the connection tracking
module
still has the entries of the session stored.
I tried to "restart" the firewall ( -> flushed _all_ chains, & reset _all_
rules without dnat the rule) but the connection was still alive.

( if it interests you , new connections to LAN_1_ADDR couldnt be started of
course ).

Does anyone know how to solve this problem ?

i hope my explanation isnt too horrible.

thanks in advance

tC

PS:excuse my bad english, i'm not a native speaker



-- 
GMX - Die Kommunikationsplattform im Internet.
http://www.gmx.net


