From: David Harel <hareldvd@ergolight-sw.com>
Subject: How to block sending mail from local network.
Date: Sat, 07 Feb 2004 12:51:33 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4024C335.7080705@ergolight-sw.com>
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

Hi all,

I have a small local network and a Linux machine as a gateway to the 
Internet. On the Linux machine I started iptables using the script from 
Oscar Andreasson's tutorial at: 
http://iptables-tutorial.frozentux.net/iptables-tutorial.html
Using his script: rc.DHCP.firewall.
This script implements masquerading service to the internal network and 
provides firewall security.

The problem started when I was suspected of having a MyDoom virus or 
some other worm that sends unsolicited messages. Most likely this can 
happened to any of the machines on the internal network.

In Oscar's script the local network is treated liberally allowing them 
to everything assuming that illegal activity will be blocked elsewhere 
by the firewall. This is done using the command:
$IPTABLES -A INPUT -p ALL -i $LAN_IFACE -s $LAN_IP_RANGE -j ACCEPT
where LAN_IFACE is eth0 and LAN_IP_RANGE is 10.0.0/24 (of course 
IPTABLES is /usr/sbin/iptables)

I want to block smtp operations from the local network so the 
viruses/worms will be blocked.

I tried a command:
$IPTABLES -A OUTPUT -p TCP -i $LAN_IFACE -s $LAN_IP_RANGE --dport smtp 
-j DROP
but it did nothing.

What can I do to block those messages sending attempts?

-- 
Thanks.

David Harel,

==================================

Home office +972 4 6921986
Fax:        +972 4 6921986
Cellular:   +972 54 534502
Snail Mail: Amuka
            D.N Merom Hagalil
            13802
            Israel
Email:      hareldvd@ergolight-sw.com




