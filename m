From: Daniel Miller <dmiller@amfes.com>
Subject: Allow inward HTTP through double firewall
Date: Fri, 27 Feb 2004 15:57:27 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <403FD967.6010008@amfes.com>
Reply-To: dmiller@amfes.com
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

OK.  I know I'm doing this wrong - it's not a failure of the software.  
I accept that.

Would some kind soul please show me where I screwed up?

My physical connection -
    Internet connects to eth1 interface of "stonewall"
    "stonewall", utilizing eth0 interface connects to "foxy", using 
foxy's eth1 interface and a private subnet (192.168.69.0)
    our internal lan connects to "foxy" on foxy's eth0 interface using 
subnet 192.168.0.0.

Foxy has Stonewall defined as it's default gateway, and the client 
computers have Foxy defined as their default gateway.
Outbound traffic works just dandy.

Now I want to start allowing access from the outside to certain 
resources.  First, I want to get to the webserver on "amy"

    Addresses:
       amy   192.168.0.2
       foxy   192.168.0.1 / 192.168.69.2
       stonewall   192.168.69.1 / internet

Following is my iptables script from both foxy and stonewall (except for 
static IP addresses):

#Setting the EXTERNAL and INTERNAL interfaces for the network
EXTIF="eth1"
INTIF="eth0"
EXTIP="192.168.69.2"

# Assign the internal TCP/IP network and IP address
INTNET="192.168.0.0/24"
INTIP="192.168.0.1/24"

UNIVERSE="0.0.0.0/0"

# The address for the internal www server to forward external clients to
WWWIP="192.168.0.2"  # This is amy's address, set on foxy.  Stonewall 
shows 192.168.69.2, foxy's address

echo "1" > /proc/sys/net/ipv4/ip_forward

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

$IPTABLES -X
$IPTABLES -Z

$IPTABLES -N drop-and-log-it
$IPTABLES -A drop-and-log-it -j REJECT

$IPTABLES -A INPUT -i lo -s $UNIVERSE -d $UNIVERSE -j ACCEPT
$IPTABLES -A INPUT -i $INTIF -s $INTNET -d $UNIVERSE -j ACCEPT
$IPTABLES -A INPUT -i $EXTIF -s $INTNET -d $UNIVERSE -j drop-and-log-it
$IPTABLES -A INPUT -i $EXTIF -s $UNIVERSE -d $EXTIP -m state --state 
ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A INPUT -s $UNIVERSE -d $UNIVERSE -j drop-and-log-it

$IPTABLES -A OUTPUT -o lo -s $UNIVERSE -d $UNIVERSE -j ACCEPT
$IPTABLES -A OUTPUT -o $INTIF -s $EXTIP -d $INTNET -j ACCEPT
$IPTABLES -A OUTPUT -o $INTIF -s $INTIP -d $INTNET -j ACCEPT
$IPTABLES -A OUTPUT -o $EXTIF -s $UNIVERSE -d $INTNET -j drop-and-log-it
$IPTABLES -A OUTPUT -o $EXTIF -s $EXTIP -d $UNIVERSE -j ACCEPT
$IPTABLES -A OUTPUT -s $UNIVERSE -d $UNIVERSE -j drop-and-log-it

$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -p tcp --dport 80 -m state \
 --state NEW,ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A PREROUTING -t nat -p tcp -d $EXTIP --dport 80 -j DNAT --to 
$WWWIP:80
$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -m state --state 
ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT
$IPTABLES -A FORWARD -j drop-and-log-it
$IPTABLES -t nat -A POSTROUTING -o $EXTIF -j SNAT --to $EXTIP

So please help me by smacking me between the eyes with whatever I 
screwed up here.  Thanx.

Daniel

