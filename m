From: Carsten Maass <cm@blinkenlichten.de>
Subject: Redirect DHCP requests to DMZ?
Date: Wed, 23 Apr 2003 12:08:52 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3EA66634.2020508@blinkenlichten.de>
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

Hello List!

My network layout looks like this:


Local LAN (192.168.20.*)
     |
     |
   Switch
     |
     |
Router/Firewall ---- DMZ (192.168.21.*)
     |
     |
     |
  Internet


Everything runs smoothly, except for one thing: I am unable to redirect 
DHCP request from the clients on the local LAN to the DHCP server inside 
the DMZ.

So my question is: How can I accomplish this task? Is it at all possible 
to redirect broadcasts from one subnet to another with the help of iptables?

I tried the following rules, but they didn't work out:

$IPTABLES -A FORWARD -p UDP -i $LAN_IFACE --dport 67 --sport 68 -j ACCEPT
$IPTABLES -t nat -A PREROUTING -p UDP -i $LAN_IFACE -d 255.255.255.255 
--dport 67 -j DNAT --to-destination $DMZ_DHCP_IP

I am running iptables v1.2.6a with kernel 2.4.20 on Debian GNU/Linux 3.0.

Any hint would be highly appreciated.

Thanks in advance,
Carsten.



