From: "hard__ware" <hard__ware@hotmail.com>
Subject: re: SNAT static vs. dynamic ip = pppoe
Date: Mon, 2 Dec 2002 04:21:23 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OE12M3SOlbpH71yEXUI000041a0@hotmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

>Ok, I have loaded roaming peguin pppoe client for my DSL connection and =
>I need to alter my rules script to allow connections out the ppp0 =
>interface that rp-pppoe client creates. If my understanding is correct, =
>(please feel free to make constructive suggestions), if you have a =
>dynamically assigned ip address, it is better to use MASQUERADE.

This is not always the case, i have a xDSL connection that is Dynamic and
always changing
(unlike Joel Newkirk's Internet Connection) & i also require more than one
SNAT / Masquerade Rule

Example:  I have many different Clients on my interenal network that are
untrusted and i like to block them at both the
forward chain & postrouting chain.(it has been proven that you can overload
firewalls and they can skip rules)
to make this easy i went and removed all the Comments From -->
/etc/hosts.allow so that it only states ip address's .. like so ...
in '/etc/hosts/allow'
-----SOF After Line-----
192.168.0.2
192.168.0.3
192.168.0.4
192.168.0.111
192.168.0.123
-----EOF Before Line----

So with a bash sequence like such we can perform all these entries in one go
...

if [ -f /etc/hosts.allow ]; then
     while read ALLOW; do

$IPTABLES -A INPUT -i $LANIF -s $ALLOW -d $LANIP -j ACCEPT
$IPTABLES -A FORWARD -i $LANIF -o $WANIF -s $ALLOW -d 0.0.0.0/0 -j ACCEPT
$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -d $ALLOW -m state --state
ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -t nat A POSTROUTING -o $WANIF -s $ALLOW -d 0.0.0.0/0 -j SNAT --to
$WANIP
        done < /etc/hosts.allow
 fi

>Example: iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
>
>This due to the fact that MASQUERADE will obtain the presently assigned =
>dynamic ip address and assigning it to every single packet going out =
>through ppp0....correct? So no matter what ip address is dynamically =
>assigned by my ISP I will always have a connection to the Internet via =
>MASQUERADE...correct?

Exactly what Joel said .. ;-D  " That's the idea."

>If I have a static ip address, (and I do), it is better to use SNAT.=20
>
>Example: iptables -t nat -A POSTROUTING -o ppp0 -j SNAT --to 1.2.3.4  =20
> This will make matters more efficient due to the fact that SNAT =
> automatically assigns the --to 1.2.3.4 ip address to every packet =
> without the overhead of having to obtained the ip address. Is this =
> correct so far?

your on the right track ...

> Now, I have had some problems with my ISP in then getting it right with =
> my account statically assigning my ip address...I have had the =
> experience where my ip address has changed in the past, as if I my =
> account where set for dynamically assigned ip address. I have called =
> then and they "supposedly" have fixed this. My ip address has recently =
> stayed static.
>
>To avoid future inabilities to access the Internet and knowing that my =
>ISP has, in the past, bungle my account; would it be a safer bet to use =
>MASQUERADE even though at the moment my ip address seems to be staying =
>static? They may have finally gotten my account right.

well that is really up to you, but what you can do is have a script in your
ppp config directory
called ' /etc/ppp/ip-up.local ' that gets executed right after
'/etc/ppp/ip-up ', you most likely wont
have this file and you will have to create it ......  In there its just like
a bash script
(except you dont have to declare the Shell at the Top), So becuase this file
will be run everytime
you reconnect to your ADSL or when your (DHCP lease expires / renews) you
will be able to launch
your firewall with the new inserted address each time.. Now make sure if
your going to use a Firewall script like this
you must make the script clear all chains including users chains &
predefined chains . Also what need to be done is detrmine your
Wan / PPP IP Address so we can use it in our script as a Variable,  e.g.
$WANIP
So all we need to do is add a line to your /etc/ppp/ip-up.local thats runs
your Firewall Script  e.g.  /etc/rc.firewall

Firewall Examples:

--------- Start of Example------------
WANIF="ppp0"
LANIF="eth0"

IPTABLES=/usr/sbin/iptables
LSMOD=/sbin/lsmod
GREP=/bin/grep
AWK=/bin/awk

# Determine the external IP automatically:
# ----------------------------------------
WANIP="`/sbin/ifconfig $WANIF | grep 'inet addr' | awk '{print $2}' | sed -e
's/.*://'`"
# For STATIC IP addresses: #
# Please Comment the WANIP line above if using the line below .. :D
# WANIP="192.168.0.253"
# ----------------------------------------

$IPTABLES -P INPUT DROP
$IPTABLES -F INPUT
$IPTABLES -P OUTPUT DROP
$IPTABLES -F OUTPUT
$IPTABLES -P FORWARD DROP
$IPTABLES -F FORWARD
$IPTABLES -t nat -P OUTPUT DROP
$IPTABLES -t nat -P PREROUTING DROP
$IPTABLES -t nat -P POSTROUTING DROP
$IPTABLES -F -t nat
$IPTABLES -F -t mangle
###  Flush the user chain.. if it exists ###
if [ -n "`$IPTABLES -L | $GREP dandgit`" ]; then
   $IPTABLES -F dandgit
fi

if [ -n "`$IPTABLES -L | $GREP SMB`" ]; then
   $IPTABLES -F SMB
fi

### This Grabs the New IP Via $WANIP Becuase we already  know its been set
via /etc/ppp/ip-up
### otherwise /etc/ppp/ip-up.local would not of launched, meaning we are not
connected yet ...

$IPTABLES -t nat -A POSTROUTING -o $WANIF -j SNAT --to $WANIP

-------------End OF Example-------------

did you get all that :-P ....

Anyway i hope some of this is usefull, see yas ..

Hard__warE

