From: Oleg Savostyanov <osavostyanov@internetplustravel.ru>
Subject: Re[2]: Problem with Port forwarding
Date: Tue, 6 Apr 2004 16:03:10 +0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <13020760140.20040406160310@internetplustravel.ru>
References: <146373237921.20040405211401@internetplustravel.ru>
 <200404051854.13708.Antony@Soft-Solutions.co.uk>
 <1825056156.20040406114126@internetplustravel.ru>
 <200404060912.26226.Antony@Soft-Solutions.co.uk>
Reply-To: Oleg Savostyanov <osavostyanov@internetplustravel.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200404060912.26226.Antony@Soft-Solutions.co.uk>
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
To: Antony Stone <netfilter@lists.netfilter.org>

AS> On Tuesday 06 April 2004 8:41 am, Oleg Savostyanov wrote:

>> Hello Antony,
>>
>> Thank you for your answer.
>>
>> Now the connection does not logged
>> I can see the first packet on mail server,
>> but it is timed out
>>
>> telnet X.X.X.X 25
>> Trying X.X.X.X...
>> telnet: Unable to connect to remote host: Connection timed out

AS> What netfilter ruleset are you now using?


#!/bin/sh
#
# rc.firewall-2.4-stronger
#
FWVER=0.79s
IPTABLES=/usr/local/sbin/iptables
LSMOD=/sbin/lsmod
DEPMOD=/sbin/depmod
MODPROBE=/sbin/modprobe
GREP=/bin/grep
AWK=/usr/bin/mawk
SED=/bin/sed
IFCONFIG=/sbin/ifconfig
EXTIF="eth0"
INTIF="eth1"
EXTIP="62.105.158.196"
INTNET="10.10.10.0/24"
INTIP="10.10.10.254/24"
MAILIP="10.10.10.252"
UNIVERSE="0.0.0.0/0"
echo "  Enabling forwarding.."
echo "1" > /proc/sys/net/ipv4/ip_forward
echo "  Clearing any existing rules and setting default policy to DROP.."
$IPTABLES -P INPUT DROP
$IPTABLES -F INPUT 
$IPTABLES -P OUTPUT DROP
$IPTABLES -F OUTPUT 
$IPTABLES -P FORWARD DROP
$IPTABLES -F FORWARD 
$IPTABLES -F -t nat
if [ -n "`$IPTABLES -L | $GREP drop-and-log-it`" ]; then
$IPTABLES -F drop-and-log-it
fi
# Delete all User-specified chains
$IPTABLES -X
# Reset all IPTABLES counters
$IPTABLES -Z
#echo "  Creating a DROP chain.."
#$IPTABLES -t nat -A PREROUTING -i $EXTIF -p tcp --dport 25 -j DNAT --to 10.10.10.252
#$IPTABLES -A FORWARD -i $EXTIF -m state --state NEW -p tcp -d 10.10.10.252 --dport 25 -j ACCEPT
#$IPTABLES -t nat -A PREROUTING -i $EXTIF -p tcp --dport 110 -j DNAT --to 10.10.10.252
#$IPTABLES -A FORWARD -i $EXTIF -m state --state NEW -p tcp -d 10.10.10.252 --dport 110 -j ACCEPT
#$IPTABLES -t nat -A POSTROUTING -o $INTIF -p tcp --dport 25 -j SNAT --to-source $EXTIP
$IPTABLES -N drop-and-log-it
#$IPTABLES -N allowed
#$IPTABLES -A PREROUTING -p all -j LOG --log-prefix "PREROUTING: "
$IPTABLES -A drop-and-log-it -j LOG --log-level info 
$IPTABLES -A drop-and-log-it -j REJECT
$IPTABLES -A INPUT -i lo -s $UNIVERSE -d $UNIVERSE -j ACCEPT
$IPTABLES -A INPUT -i $INTIF -s $INTNET -d $UNIVERSE -j ACCEPT
$IPTABLES -A INPUT -i $EXTIF -s $INTNET -d $UNIVERSE -j drop-and-log-it
$IPTABLES -A INPUT -i $EXTIF -s $INTNET -d $UNIVERSE -j drop-and-log-it
$IPTABLES -A INPUT -p UDP -i $EXTIF -d $UNIVERSE --destination-port 135:139 -j DROP
$IPTABLES -A INPUT -p UDP -i $INTIF -d $UNIVERSE --destination-port 135:139 -j DROP
echo "  End of DROP chain.."

##-d $UNIVERSE -d $INET_BROADCAST \
# If we get DHCP requests from the Outside of our network, our logs will
# be swamped as well. This rule will block them from getting logged. 
$IPTABLES -A INPUT -p UDP -i $EXTIF -d $UNIVERSE --destination-port 67:68 -j DROP
# If you have a Microsoft Network on the outside of your firewall, you may
# also get flooded by Multicasts. We drop them so we do not get flooded by logs
$IPTABLES -A INPUT -i $EXTIF -d 224.0.0.0/8 -j DROP
$IPTABLES -A INPUT -i $EXTIF -s $UNIVERSE -d $EXTIP -m state --state \
ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A INPUT -i $EXTIF -s $UNIVERSE -p TCP -d $EXTIP -m state --state \
ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A INPUT -s $UNIVERSE -d $UNIVERSE -j drop-and-log-it
$IPTABLES -A OUTPUT -o lo -s $UNIVERSE -d $UNIVERSE -j ACCEPT
$IPTABLES -A OUTPUT -o $INTIF -s $EXTIP -d $INTNET -j ACCEPT
$IPTABLES -A OUTPUT -o $INTIF -s $INTIP -d $INTNET -j ACCEPT
$IPTABLES -A OUTPUT -o $EXTIF -s $UNIVERSE -d $INTNET -j drop-and-log-it
$IPTABLES -A OUTPUT -o $EXTIF -s $EXTIP -d $UNIVERSE -j ACCEPT
$IPTABLES -A OUTPUT -s $UNIVERSE -d $UNIVERSE -j drop-and-log-it
$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -m state --state ESTABLISHED,RELATED \
-j ACCEPT
$IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT
#echo " enable from OUTside to TERM port 25 "
#echo " END of TERM port 25 "
$IPTABLES -A FORWARD -p TCP -i $EXTIF -o $INTIF -d $MAILIP --dport 25 -j ACCEPT
$IPTABLES -A FORWARD -j drop-and-log-it
echo " port forwarding "
$IPTABLES -t nat -A PREROUTING -p TCP -i $EXTIF -d $EXTIP --dport 25 -j DNAT --to-destination $MAILIP
$IPTABLES -t nat -A POSTROUTING -o $EXTIF -j SNAT --to-source $EXTIP

Tuesday, April 6, 2004, 12:12:25 PM, you wrote:

-- 
Best regards,
 Oleg                            mailto:osavostyanov@internetplustravel.ru


