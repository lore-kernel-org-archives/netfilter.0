From: "J. Bakshi" <joydeep@infoservices.in>
Subject: hashtable configuration issue
Date: Tue, 01 Sep 2009 20:21:07 +0530
Message-ID: <4A9D34DB.4080209@infoservices.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Dear Marek and all,

First of all my thanks to all of you to make me familiar with the great
hashtable module. According to Marek's  suggestion I have a ruleset with
synflood protection along with IP blacklist

````````````````````
# default policy drop ##

# accept related , establish ##


# Set blacklist #
echo "blacklist initialization"
iptables -A INPUT -m recent --name blacklist --rcheck --seconds
$BLACKLIST_INTERVAL  -j DROP

## some other anti nmap rule##

##syncflood protection with IP blacklist ##

iptables -N syn-flood
iptables -A INPUT -i $IFACE -p tcp --syn -j syn-flood
iptables -A INPUT -p tcp --syn  -m hashlimit \
--hashlimit 1/sec --hashlimit-burst 4 --hashlimit-htable-expire 300000 \
--hashlimit-mode srcip --hashlimit-name testlimit -j RETURN

# Drop bad IP and put themin blacklist ############
iptables -A syn-flood -m recent --name blacklist --set -j DROP
iptables -A INPUT -j syn-flood

## my incoming and outgoing rules ##

## DROP other ##
```````````````````````````````````

But this time firewall totally blocks all incoming connection. If I
change the RETURN (above) to ACCEPT then then firewall accept *all*
incoming even the ports are blocked in the firewall !!!   I  am very
confused. Could any one enlighten me ? I missed something or
mis-configuration ?


