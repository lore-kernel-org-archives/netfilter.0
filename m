From: Maxim Berlin <mak@rtsnet.ru>
Subject: Re: I continued with the problem NAT and Filtering packet
Date: Fri, 6 Dec 2002 21:52:26 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1133748700.20021206215226@rtsnet.ru>
References: <web-160663@gecyt.cu>
Reply-To: Maxim Berlin <mak@rtsnet.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <web-160663@gecyt.cu>
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

Hello Administrador,

Friday, December 06, 2002, Administrador de Red <admin@gecyt.cu> wrote:

AdR> Dear friends thanks very Mouch a some friends that try 
AdR> help me, well I want to say you that  a I continu with the 
AdR> problem the OE don't want to send and recived the email 
AdR> from mail server, I want to send the rules for iptables 
AdR> (Filtering and Nat) well i writing this rules and the file 
AdR> iptables configuration.

AdR> iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 25 -j DNAT --to 172.16.1.4:25
AdR> iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 110 -j DNAT --to 172.16.1.4:110
AdR> iptables -t nat -A POSTROUTING -o eth0 -j SNAT 169.158.130.253
[]

AdR> I need some help  fast. please.

very unfriendly people living here:(

in my meaning, you are interested in
client <-> 169.158.130.253:25  <-> 172.16.1.4:25
client <-> 169.158.130.253:110 <-> 172.16.1.4:110
and 169.158.130.253 is your linux host.
am i correct?

try this:
*******************
#!/bin/bash

IPTABLES=/sbin/iptables
IF=eth0
echo "1" > /proc/sys/net/ipv4/ip_forward
# uncomment two next lines, if you do not have any other rules
#$IPTABLES -t nat -F
#$IPTABLES -F
$IPTABLES -t nat -A PREROUTING -p tcp -i $IF --dport 25 -j DNAT --to 172.16.1.4:25
$IPTABLES -t nat -A PREROUTING -p tcp -i $IF --dport 110 -j DNAT --to 172.16.1.4:110
$IPTABLES -A FORWARD -p tcp -i $IF -o $IF -d 169.158.130.253 --dport 25 -j ACCEPT
$IPTABLES -A FORWARD -p tcp -i $IF -o $IF -d 169.158.130.253 --dport 110 -j ACCEPT
$IPTABLES -t nat -A POSTROUTING -o $IF -j MASQUERADE
*******************
then do
telnet 169.158.130.253 25
from your client.

Best wishes,
 Maxim                            mailto:mak@rtsnet.ru


