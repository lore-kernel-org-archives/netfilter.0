From: Alexander Pries <apries@web.de>
Subject: DNAT/Port-Forwarding Problem
Date: Sun, 7 Jul 2002 11:27:34 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <200207070927.g679RYX27465@mailgate5.cinetic.de>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Hello!

I try to do a simple port-forwarding setup with my linux 2.4.18 and
iptables v1.2.6a. I use this linux box for handling my DSL and 
iptables for masquerading to enable internet use for internal machines.
Now I want to configure iptables to forward all incoming port 80 requests
from the outside(internet) to my new internal webserver box.

              INTERNET
                  | (Dynamic IP, ppp0)
           linux iptables box
                  | (192.168.100.1, eth0)
    +--------------------------+ internal network
    | (192.168.100.X)          | (192.168.100.5)
some machines              box with webserver (port 80)

I have read a lot of how-to's and created a simple iptables script 
for testing. The masquerading for internet access e.g. surfing works,
but can't get any connection to my webserver from the outside.

I have no idea what what's wrong and hope that somebody can
give me a hint about my mistake..

Thanks a lot for your time!

Alex

------- my simple test script -------
#!/bin/sh
echo "1" > /proc/sys/net/ipv4/ip_forward

# iptables command
IPTABLES="/usr/local/sbin/iptables"

# Network Interfaces
INT_IF="eth0"
EXT_IF="ppp0"

# internal network range
NETWORK="192.168.100.0/24"

# simple policies for testing
$IPTABLES -P INPUT ACCEPT
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -P FORWARD ACCEPT

# masquerading
$IPTABLES -t nat -A POSTROUTING -o $EXT_IF -s $NETWORK -j MASQUERADE

# port forwarding
$IPTABLES -t nat -A PREROUTING -p tcp -i $EXT_IF --dport 80 -j DNAT --to 192.168.100.5:80

# no forwarding rules, because the chain accepts all...
-------------------------------------
______________________________________________________________________________
All inclusive! 100 MB Speicher, SMS 50% gunstiger, 32 MB Attachment-Gro?e, 
Preisvorteile und mehr unter http://club.web.de/?mc=021104


