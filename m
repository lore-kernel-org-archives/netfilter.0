From: Daniel Huhardeaux <daniel.huhardeaux@tootai.com>
Subject: Understanding the routing rules
Date: Thu, 25 Dec 2008 22:21:20 +0100
Message-ID: <4953F950.9040009@tootai.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Good day all,

I set up a firewall with 3 network cards:

eth0 -> intranet 10.0.0.0/16
eth1 -> isp1
eth2 -> isp2

Outgoing traffic goes to isp1 except for net 10.0.0.0/24, incoming comes 
from isp2. What is named as EXTERNAL_MAIN_xxx is a copy of EXTERNAL2_xxx

Now let's say I redirect port 80 to a server in intranet 10.0.0.40 port 
80, I redirect port 2222 to the localhost 127.0.0.1, Finally I also 
install a OpenVPN in tun mode proto tcp.

Base policy is:
# Deny all by default
$IPTABLES -P INPUT      DROP
$IPTABLES -P OUTPUT     DROP
$IPTABLES -P FORWARD    DROP


I create my rules ALLOW_PORTS. In the variable TCP_PORTS_ALLOWED I put 
_ALL_ authorized ports, doesn't matter if they are to preroute or not.

###############################################################################
## Special Chain ALLOW_PORTS
## Rules to allow packets based on port number. This sort of thing is 
generally
## required only if you're running services on(!!!) the firewall or if 
you have a
## FORWARD policy of DROP(which we don't right now).

$IPTABLES -N ALLOW_PORTS
$IPTABLES -F ALLOW_PORTS

   
##------------------------------------------------------------------------##
   ## ACCEPT TCP traffic based on port number.

for PORT in $TCP_PORTS_ALLOWED; do
 $IPTABLES -A ALLOW_PORTS -m state --state NEW -p tcp \
 --dport $PORT -j ACCEPT
done
   
##------------------------------------------------------------------------##
   ## ACCEPT UDP traffic based on port number.
for PORT in $UDP_PORTS_ALLOWED; do
 $IPTABLES -A ALLOW_PORTS -m state --state NEW -p udp \
 --dport $PORT -j ACCEPT
done

   
##------------------------------------------------------------------------##
   ## REJECT port 113 ident requests.
$IPTABLES -A ALLOW_PORTS -p tcp --dport 113 -j REJECT \
--reject-with tcp-reset
   
##------------------------------------------------------------------------##

 From here I accept

    # Accept what is from localhost
    $IPTABLES -A INPUT   -p ALL -i $LOCAL_DEVICE -j ACCEPT
    $IPTABLES -A OUTPUT  -p ALL -o $LOCAL_DEVICE -j ACCEPT
    $IPTABLES -A FORWARD -p ALL -i $LOCAL_DEVICE -j ACCEPT

    # Accept what is from intranet
    $IPTABLES -A INPUT   -p ALL -i $INTERNAL_DEVICE -j ACCEPT
    $IPTABLES -A OUTPUT  -p ALL -o $INTERNAL_DEVICE -j ACCEPT
    $IPTABLES -A FORWARD -p ALL -i $INTERNAL_DEVICE -j ACCEPT

    # Accept what is for VPN
    $IPTABLES -A INPUT   -p ALL -i $VPN_DEVICE -j ACCEPT
    $IPTABLES -A OUTPUT  -p ALL -o $VPN_DEVICE -j ACCEPT
    $IPTABLES -A FORWARD -p ALL -i $VPN_DEVICE -j ACCEPT

And now my 2 Internet connections, where $KEEPSTATE="ESTABLISHED,RELATED"

    # Accept ports back from eth, flow return, all protocols.
    # activate established mode on all protocols  (statefull inspection)
    $IPTABLES -A OUTPUT  -o $EXTERNAL1_DEVICE -p ALL $KEEPSTATE -j ACCEPT
    $IPTABLES -A INPUT   -i $EXTERNAL1_DEVICE -p ALL $KEEPSTATE -j ACCEPT
    $IPTABLES -A FORWARD -i $EXTERNAL1_DEVICE -p ALL $KEEPSTATE -j ACCEPT

    $IPTABLES -A OUTPUT  -o $EXTERNAL2_DEVICE -p ALL $KEEPSTATE -j ACCEPT
    $IPTABLES -A INPUT   -i $EXTERNAL2_DEVICE -p ALL $KEEPSTATE -j ACCEPT
    $IPTABLES -A FORWARD -i $EXTERNAL2_DEVICE -p ALL $KEEPSTATE -j ACCEPT

PREROUTING to the host

    # SSH #
    $IPTABLES -t nat -A PREROUTING -i $EXTERNAL_MAIN_DEVICE -p tcp -d 
$EXTERNAL_MAIN_IP --dport 2222 -j DNAT --to 127.0.0.1:22
    $IPTABLES -A FORWARD -p tcp -m tcp --dport 22 -j ACCEPT

PREROUTING to the webserver

    # HTTP #
    $IPTABLES -t nat -A PREROUTING -i $EXTERNAL_MAIN_DEVICE -p tcp -d 
$EXTERNAL_MAIN_IP --dport 80 -j DNAT --to 10.0.0.40
    $IPTABLES -A FORWARD -p tcp -m tcp --dport 80 -j ACCEPT

INPUT allowed
    # Accept Packets based on ports number
    $IPTABLES -A INPUT -i $EXTERNAL_MAIN_DEVICE -s $ANY -j ALLOW_PORTS

For me this setup should open the ports PREROUTING, INPUT and FORWARD as 
I need and want. But is *NOT*. To get this rules to work I _must_ add 
the state NEW in $KEEPSTATE.

My question is: FORWARD is accepted after each PREROUTING, INPUT is 
accepted for each allowed ports so why I also have to accept the NEW state?

Thanks for your lights :-)

Merry Christmas

-- 
Daniel
