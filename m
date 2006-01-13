From: Sorin Panca <sorin.panca@gmail.com>
Subject: Connmark, classify, and chains
Date: Fri, 13 Jan 2006 18:28:03 +0200
Message-ID: <43C7D513.6090100@gmail.com>
References: <20060113101651.88870.qmail@web33404.mail.mud.yahoo.com>	<uiz3bjsfmm2.fsf@false.linpro.no>
	<64313.193.173.147.3.1137150421.squirrel@webmail.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <64313.193.173.147.3.1137150421.squirrel@webmail.sterenborg.info>
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

Hello!
I have a server that must do traffic shaping.
It has three badwidths for communication:
1. LAN speed (100 Mbit/s)
2. MAN speed (50 Mbit/s)
3. Internet speed (1.5 Mbit/s)

interfaces: eth0 - external; eth1 - internal; cz2bo & cz2tu - gre
tunnels to internal LANs
internal addresses: 192.168.0.0/24 and 192.168.1.0/24 via eth1
192.168.2.0/24 via cz2bo
192.168.3.0/24 via cz2tu

now i want to select classes with the -j CLASSIFY target
first question: if i have the rules in the mangle table in some
preferred order, would they be matched by a packet, and then the packet
lives the POSTROUTING  chain?
     OR the pachet matches the last rule that fits? (the general rule is
the first OR the last?)

i want to use CONNMARK to mark the packets for LAN an MAN traffic but i
need to set TOS too, so i can communicate to the other server something
about the traffic
and i do this:

ipt=`which iptables `
# SETTING TOS
for PORT in ` echo $PRIORIZED_PORTS_LIST `; do
    $ipt -t mangle -A PREROUTING -p tcp --dport $PORT -m length --length
:128 -j TOS --set-tos Minimize-Delay
    $ipt -t mangle -A PREROUTING -p udp --dport $PORT -m length --length
:128 -j TOS --set-tos Minimize-Delay
    $ipt -t mangle -A PREROUTING -p tcp --sport $PORT -m length --length
:128 -j TOS --set-tos Minimize-Delay
    $ipt -t mangle -A PREROUTING -p udp --sport $PORT -m length --length
:128 -j TOS --set-tos Minimize-Delay
done
$ipt -t mangle -A PREROUTING -p tcp --tcp-flags SYN,ACK SYN,ACK -m
length --length :128 -j TOS --set-tos Minimize-Delay
$ipt -t mangle -A PREROUTING -m length --length 128: -j TOS --set-tos
Maximize-Throughput

# MARKING MAN TRAFFIC
MANCONF="/etc/manips.lst"
$ipt -t mangle -A PREROUTING -j CONNMARK --restore-mark
$ipt -t mangle -A PREROUTING -m mark ! --mark 0 -j ACCEPT
for IP in $( cat $MANCONF | grep -v \# ); do
    $ipt -t mangle -A PREROUTING -d $IP -j MARK --set-mark $MARKMAN
    $ipt -t mangle -A PREROUTING -s $IP -j MARK --set-mark $MARKMAN
done

# MARKING LAN TRAFFIC
LANIP="127.0.0.0/8 10.0.0.0/8 172.0.0.0/8 192.168.0.0/16" (do i need to
specify the 127.0.0.0/8 net? or it's stupid to do so?)
for IP in `echo $LANIP `; do
    $ipt -t mangle -A PREROUTING -d $IP -j MARK --set-mark $MARKLAN
    $ipt -t mangle -A PREROUTING -s $IP -j MARK --set-mark $MARKLAN
done
$ipt -t mangle -A PREROUTING -j CONNMARK --save-mark

as you can see, after setting the TOS field, the same packets are marked
if they travel only in LAN or MAN. or after they are matched by TOS
rules they leave PREROUTING?... (this is the second question)
Is the RETURN target what i should use after TOS mangling? or should i
use another chain in the mangle table (e.g. FORWARD) for marking? (the
fourth question)

some examples indicated that i should place my -j MARK and -j  CONNMARK
rules in POSTROUTING. i need them in PREROUTING, but on another interface.
and i want to match that mark from CLASSIFY rules in POSTROUTING of
another interface. would i find them (the connmarks) there? (the fifth
question)
    $ipt -t mangle -A POSTROUTING -m connmark --mark $MARKLAN -m tos
--tos Minimize-Delay -j CLASSIFY --set-class 1:AA
    $ipt -t mangle -A POSTROUTING -m connmark --mark $MARKLAN -m tos -j
CLASSIFY --set-class 1:AB
    $ipt -t mangle -A POSTROUTING -m connmark --mark $MARKMAN -m tos
--tos Minimize-Delay -j CLASSIFY --set-class 1:BA
    $ipt -t mangle -A POSTROUTING -m connmark --mark $MARKMAN -j
CLASSIFY --set-class 1:BB

# ADDING CLIENTS; $CLASS$hNET$hIP; $RATE and $CEIL are computed or
read-fom-config-file variables (I cut out the part where they are set)
for CLIENT in $CLIENTS; do
$ipt -t mangle -A POSTROUTING -o $INTDEV -d $IP -m tos --tos
Minimize-Delay -j CLASSIFY --set-class 1:$CLASS$hNET$hIP # here we don't
hit with pachets from LAN or MAN - we matched them above
$ipt -t mangle -A POSTROUTING -o $EXT1   -d $IP -m tos --tos
Minimize-Delay -j CLASSIFY --set-class 1:$CLASS$hNET$hIP
done

now i want to match with ipp2p or tos Maximize-Throuput and put that
traffic in the default class... after all the above rules are not
matched (that would be p2p or downloads not in (LAN or MAN)).
Now my final question: would this all work? When I have the answars to
the questions above I test this setup on a production server of an ISP.
I hope I will not get fired. :)

Thank you for your imput in advance!
Sorin.


