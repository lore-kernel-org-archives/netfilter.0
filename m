From: ATest@sbsdk12.org (Coutts, Ashe (Testing Account))
Subject: Not quite understanding DNAT
Date: Thu, 24 Jul 2003 09:22:54 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F1FA56E.28480.E59161E@localhost>
References: <3F1F9900.4080401@snapgear.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <200307241556.53796.rio@martin.mu>
Content-description: Mail message body
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I have set up a very basic firewall for our system. 
We have 126 addresses to be used to/from the outside world (204.48.178.0/25) 
and are using 10.x numbers on the inside.

It is working almost as I expected except for the following. The DNAT 
connections come into the system fine but are seen as originating from the 
eth0 interface rather than their eth0:x interface. So, when attaching to a linux 
cpu with ssh I am needing to place the ip# for the eth0 interface in the 
hosts.allow file rather than the much more restrictive eth0:x ip#. Can it be set 
up so the connection is between the external eth0:x ip# and its linked internal 
ip#?

Any help or suggestions would be greatly appreciated.

Thanks

============  Start iptables script ================
#!/bin/sh
/root/bin/NatReset

# First the "outside" eth0 interface on the firewall
/sbin/ifconfig eth0 204.48.178.2 netmask 255.255.255.128  \
        broadcast 204.48.178.127 up

### Now add aliases to eth0 to users/hosts from the  outside.
/sbin/ifconfig eth0:3 204.48.178.3 netmask 255.255.255.128  \
       broadcast 204.48.178.127 up
/sbin/ifconfig eth0:4 204.48.178.4 netmask 255.255.255.128  \
       broadcast 204.48.178.127 up
/sbin/ifconfig eth0:4 204.48.178.5 netmask 255.255.255.128  \
       broadcast 204.48.178.127 up

###  ethernet "eth1", i.e. the "inside" interface for the firewall 
/sbin/ifconfig eth1 10.0.0.1 netmask 255.255.255.248  \
       broadcast 10.0.0.7 up


## Set up outside access to the mainframe
/sbin/iptables --table nat --append PREROUTING  --destination 204.48.178.3   \
               --jump DNAT --to 10.5.2.104

## Set up outside access to a Windows 2000 cpu
/sbin/iptables --table nat --append PREROUTING  --destination 204.48.178.4   \
               --jump DNAT --to 10.5.2.105
               
#  Set up inside and outside 1 to 1 mapping for W2K user
/sbin/iptables --table nat --append PREROUTING  --destination 204.48.178.5   \
                           --jump DNAT --to 10.5.2.107
/sbin/iptables --table nat --append POSTROUTING --source 10.5.2.107/32       \
               --jump SNAT --to 204.48.178.5

## Setup NAT from entire WAN to the outside world
/sbin/iptables --table nat  --append POSTROUTING --source 0.0.0.0/0          \
               --jump SNAT --to 204.48.178.2

## Now set the genaral policies
/sbin/iptables --policy INPUT   DROP
/sbin/iptables --policy FORWARD ACCEPT
/sbin/iptables --policy OUTPUT  DROP

echo 1 > /proc/sys/net/ipv4/ip_forward
============  End iptables script ================




"Experience is not what happens to you, it
 is what you do with what happens to you"
       -- Aldous Huxley (1894-1963)

   Ashe Coutts (acoutts@sbsdk12.org)
   805.963.7751 Ext 260
   Fax 805.884.1557


