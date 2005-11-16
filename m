From: Przemek <przemek@skyline.ltd.pl>
Subject: How to DROP ip from behind NAT
Date: Wed, 16 Nov 2005 02:07:23 +0100
Message-ID: <20051116020723.2109624e@nasa.one.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

Hi,

I have little network, server is connected by ADSL to internet with
static IP. I`m shering connection to my two machines.

My firewall.sh
IPTAB=/usr/sbin/iptables
PIP=XXX.XXX.XXX.XXX <-ADSL MODEM IP
M1=10.1.1.1 <- LOCAL IPS
M2=10.1.1.2
M3=10.1.1.3
echo 1 > /proc/sys/net/ipv4/ip_forward
$IPTAB -F INPUT 
$IPTAB -P INPUT ACCEPT
$IPTAB -F OUTPUT
$IPTAB -P OUTPUT ACCEPT
$IPTAB -F FORWARD
$IPTAB -P FORWARD ACCEPT
$IPTAB -t nat -F
$IPTAB -A FORWARD -i ppp0 -j ACCEPT
$IPTAB -A FORWARD -i eth0 -o ppp0 -j ACCEPT      
$IPTAB -t nat -A POSTROUTING -o ppp0 -j SNAT --to-source $PIP -s $M2
$IPTAB -t nat -A POSTROUTING -o ppp0 -j SNAT --to-source $PIP -s $M3
$IPTAB -A PREROUTING -t nat -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 3128 <- for proxy

Now I want to block packets form 10.1.1.2 to IP YYY.YYY.YYY.YYY to PORT 22

and

Block all traffic on 10.1.1.3 but allow to connect IP YYY.YYY.YYY.YYY to PORT 80 

I`m trying to do this but I dont know how, please help me!

---
Przemek < skyline.ltd.pl / przemek@ >
ICQ: 99511187 MSN: tommyindahla -at- hotmail.com

