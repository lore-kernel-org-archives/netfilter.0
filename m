From: Oleg Savostyanov <osavostyanov@internetplustravel.ru>
Subject: Problem with Port forwarding
Date: Mon, 5 Apr 2004 21:14:01 +0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <146373237921.20040405211401@internetplustravel.ru>
Reply-To: Oleg Savostyanov <osavostyanov@internetplustravel.ru>
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

I get lost, trying to do a very simple thing...
My mail server is inside my lan with IP 10.10.10.252
I need to open port 25 of my mailserver  to the universe
I made following
1)I permit in forward chain packets with dest. port 25
and
2)do DNAT in PREROUTING chain

when I try to telnet to $EXTIP on 25 from outside
telnet: Unable to connect to remote host: Connection refused

This packet is catched by the rule drop-and-log-it, and I see in my logs

Apr  5 20:47:16 firewall kernel: IN=eth0 OUT=eth1 SRC=Y.Y.Y.Y DST=10.10.10.252
LEN=60 TOS=0x00 PREC=0x00 TTL=55 ID=11611 DF PROTO=TCP SPT=33150 DPT=25
WINDOW=5840 RES=0x00 SYN URGP=0

Maybe I miss smth?

Any help is appreciated.....


IPTABLES=/usr/local/sbin/iptables
EXTIF="eth0"
INTIF="eth1"
EXTIP="X.X.X.X"
INTNET="10.10.10.0/24"
INTIP="10.10.10.254/24"
UNIVERSE="0.0.0.0/0"
$IPTABLES -P INPUT DROP
$IPTABLES -F INPUT 
$IPTABLES -P OUTPUT DROP
$IPTABLES -F OUTPUT 
$IPTABLES -P FORWARD DROP
$IPTABLES -F FORWARD 
$IPTABLES -F -t nat
$IPTABLES -N drop-and-log-it
$IPTABLES -A drop-and-log-it -j LOG --log-level info 
$IPTABLES -A drop-and-log-it -j REJECT
$IPTABLES -A INPUT -i lo -s $UNIVERSE -d $UNIVERSE -j ACCEPT
$IPTABLES -A INPUT -i $INTIF -s $INTNET -d $UNIVERSE -j ACCEPT
$IPTABLES -A INPUT -i $EXTIF -s $INTNET -d $UNIVERSE -j drop-and-log-it
$IPTABLES -A INPUT -i $EXTIF -s $INTNET -d $UNIVERSE -j drop-and-log-it
$IPTABLES -A INPUT -p UDP -i $EXTIF -d $UNIVERSE --destination-port 135:139 -j DROP
$IPTABLES -A INPUT -p UDP -i $INTIF -d $UNIVERSE --destination-port 135:139 -j DROP
$IPTABLES -A INPUT -p UDP -i $EXTIF -d $UNIVERSE --destination-port 67:68 -j DROP
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
>>>>>>>$IPTABLES -A FORWARD -p TCP -i $EXTIF -o $INTIF -d $EXTIP --dport 25 -j ACCEPT
$IPTABLES -A FORWARD -j drop-and-log-it
>>>>>>>$IPTABLES -t nat -A PREROUTING -p TCP -i $EXTIF -d $EXTIP --dport 25 -j DNAT --to-destination 10.10.10.252:25
$IPTABLES -t nat -A POSTROUTING -o $EXTIF -j SNAT --to-source $EXTIP


