From: paulobruck1 <paulobruck1@gmail.com>
Subject: connmark and fwmark not working - just a little long
Date: Sun, 25 May 2008 17:51:00 -0300
Message-ID: <1211748660.8512.22.camel@pauloric.contatogs.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:subject:from:to:content-type:date:message-id:mime-version:x-mailer:content-transfer-encoding;
        bh=Sc95fnEE5Qt5XWaAFL3bS/753x5T4QwW9VahygZsNVU=;
        b=vtb+LKJIr8Z1PZgBGjALWEqK0vijyclWFC6n/A7FRovd+s2u9YSyi5h3oDONXZOcwFWYHfuyOKuxI8uj4ujJGVP++d2ej/JQVch9P9p4pub5meaIJVTIBlrrIf478u2FpmBlgBIMHgjCq0NHssy6izMu5Ifk07dLw8qwk2p11JQ=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Hi list

After diving in CONNMARK and FWMARK for several days and after reading
among others:
http://lists.netfilter.org/pipermail/netfilter/2007-June/069148.html
http://securepoint.com/lists/html/LARTC/2007-05/msg00057.html
http://mailman.ds9a.nl/pipermail/lartc/2006q2/018964.html
http://www.lugmen.org.ar/pipermail/lug-list/2006-April/041078.html
http://lartc.org/howto/lartc.rpdb.multiple-links.html#AEN268


I really get confused. What I would like to do:

eth1 ( wan1)   
		firewall    eth0 ( local)
eth2 ( wan2)

simple a load balance w/debian etch 4.0

#route
#####################
 ip rule list | grep Pref0 2>&1 > /dev/null
 if [ $? != 0 ] ; then
        echo "200     Pref0" >> /etc/iproute2/rt_tables
        echo "201     Equalize" >> /etc/iproute2/rt_tables
        echo "202     Pref2" >> /etc/iproute2/rt_tables
 fi
 
 ip route flush table Pref0
 ip route add table Pref0 default via 200.207.125.65
 
 ip route flush table Equalize
 ip route add table Equalize default \
	nexthop via 200.207.125.76 weight 1 \
	nexthop via 201.6.110.1 weight 1
 
 ip route flush table Pref2
 ip route add table Pref2 default via 201.6.110.1
 
 #Add the rules matching marks to lookup tables
 ip rule list | grep Pref0 2>&1 > /dev/null
 if [ $? != 0 ] ; then
          ip rule add fwmark 200 table Pref0
          ip rule add fwmark 201 table Equalize
          ip rule add fwmark 202 table Pref2
 fi
          ip route flush cache
 
 ################################
------cut----------
iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to 200.207.125.76
iptables -t nat -A POSTROUTING -o eth2 -j SNAT --to 201.6.110.223


#first line in PREROUTING will pull out the existing mark on the
connection for the packet
iptables -t mangle -A PREROUTING  -i eth0 -j CONNMARK --restore-mark

iptables -t mangle -A PREROUTING -i eth0 -p tcp -d 202.28.213.163
--dport 3666  -m mark --mark 0 -j MARK --set-mark 202

iptables -t mangle -A OUTPUT -o eth0 -p tcp --dport 80  -m mark --mark 0
-j MARK --set-mark 202

iptables -t mangle -A PREROUTING -i eth0 -p tcp --dport 3666  -m mark
--mark 0 -j MARK --set-mark 200

#Equalize HTTP Traffic with mark 201
iptables -A PREROUTING -t mangle -i eth0 -p tcp --dport 80 -m mark
--mark 0  -j MARK --set-mark 201

#mark all packets send out an interface with the proper interface
preference mark (if it's been     equalized)
iptables -t mangle -A POSTROUTING -o eth1 -m mark --mark 201 -j MARK
--set-mark 200
iptables -t mangle -A POSTROUTING -o eth2 -m mark --mark 201 -j MARK
--set-mark 202
iptables -t mangle -A POSTROUTING -o eth1 -j MARK --set-mark 200
iptables -t mangle -A POSTROUTING -o eth2 -j MARK --set-mark 202

#the last line in POSTROUTING is the magic statement that stores the
mark  associated with the     connection.
iptables -t mangle -A POSTROUTING -j CONNMARK --save-mark

#####################################################################

what is wrong:

a) load-balance is not working
b) when I access 202.28.213.163 it works, passed to eth2 BUT it apears
my IP looking at tcpdump....
202.28.213.163.3666 > 201.6.110.223.47466: P 2269:2333(64) ack 1573 win
9968
IP 202.6.110.223.47466 > 202.28.213.163.3666: . ack 2333 win 11520
IP 192.168.1.11.38132 > 202.28.213.163.3666: F 0:0(0) ack 1 win 11520
^^^^^^^^^^^^^^^^^^^^^ ??????


I have read that CONNMARK its used to mark CONECTIONS from/TO iptables,
and it's invisible for iproute. Correct??

That I have to use -j MARK --set-mark to mark packages that I would like
change the router decision.

But reading all the stuff above I really get confused and I'm lost

Does any of you could help or indicate a place/book where I can solve
this situations????

thanks in advanced

