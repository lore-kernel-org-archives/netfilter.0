From: Felix Bauer <felixathome@gmx.net>
Subject: firewall startup script
Date: Fri, 01 Aug 2003 12:54:44 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F2A46F4.9070001@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

if got a question about my script for my router-configuration. It should 
enable ip4warding, masquerade my local hosts,
allow my local hosts everything and open some ports which should be 
external available but if I run this script
it kinda stops after masquerading (I can read the output on the console 
but then everything is freezed since the local
ports aren't open anymore and not reopend by the script). Is there any 
logical error I missed?

<script>
#!/bin/bash
#** $Id$
#**
#** Firewall-startup script
#**

#** variables
iptables="/sbin/iptables"
localnet="192.168.0.0/24"
worldports="21 22 53 80"


case $1 in
    start)
    #** enable IP-forwarding
     echo "Enabling IP-Forwarding"
     echo "1" > /proc/sys/net/ipv4/ip_forward

     #** flush old chains
      echo "Flushing old rules"
      $iptables -F INPUT
      $iptables -F OUTPUT
      $iptables -F FORWARD
      $iptables -t nat -F PREROUTING
      $iptables -t nat -F POSTROUTING
      $iptables -t nat -F OUTPUT

     #** allow localnet everything
      echo "Creating rule for local network"
      $iptables -A INPUT -s localhost -d localhost -j ACCEPT
      $iptables -A INPUT -p tcp -s $localnet -j ACCEPT
      $iptables -A INPUT -p udp -s $localnet -j ACCEPT

     #** setup Masquerading
      echo "Creating rule for Masquerading"
      $iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE

     #** opening ports
      echo "Opening ports:"
      $iptables -A INPUT -p icmp -j ACCEPT

      for port in $worldports
       do
        echo " - $port"
        $iptables -A INPUT -p tcp --dport $port -j ACCEPT
        $iptables -A INPUT -p udp --dport $port -j ACCEPT
       done

     #** Allow all outgoing packets to be not filtered
      $iptables --policy OUTPUT ACCEPT

     #** Drop everything else
      $iptables -A INPUT -j DROP
    ;;
    stop)
    ;;
    *)
    echo "Usage: $0 { start | stop }"
    ;;
    esac
exit 0
</script>

thx a lot
fe


