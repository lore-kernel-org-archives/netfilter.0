From: "ganesh kumar godavari" <gkgodava@rediffmail.com>
Subject: cbq & iptables nat problems
Date: 9 Jul 2002 04:17:39 -0000
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020709041739.31197.qmail@webmail10.rediffmail.com>
Reply-To: "ganesh kumar godavari" <gkgodava@rediffmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain;
	format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org, acearns@yahoo.com
Cc: lartc@mailman.ds9a.nl

Hey guys

I've 2 questions:

Question 1
################
I want to see if the bandwidth allocation using cbq is working 
properly or not
I looked into stef coene's beautiful document(http://docum.org) 
for the monitor.pl.
I am not good at perl so can anyone help me to understand if there 
is anyway I can check if the cbq is working.


Question 2
##################
I also want to know if anyone has worked on realserver, the real 
server client can use either the tcp or udp packets for

voice/video transfer. I checked with ethereal. It looks like that 
the packets are successfully forwarded by my firewall to my

server in the private subnet. However, the server seems to be able 
to finish the tcp handshake with the real player. The last

successful connection is the sever sending the client [FIN, ACK]. 
After that, nothing happens. Why can't the realserver

serves the video/voice packets?


Thanks
Ganesh


###########################################################################################


                 ____________                  10 mbps 		       
|---------------|
         eth0   |            | eth 1          |-----|                   
|               |
internet ------|firewall    |----------------| hub 
|-------------------| 192.168.0.1   |
                |            |                |-----|                   
|               |
                |____________|                                          
|---------------|


  192.168.0.1 is running the following services

  http, https, pop3, smtp, realserver


goal
i want to allocate my internal bandwidth the following way

 	- 70% for http/https, realserver
 	- 20% for smtp, pop3
 	- 5% for tcp packets
 	- 5% for icmp packets

###############################################################
#The firewall Scripts
###############################################################

#inorder to make the 192.168.0.1 talk to the outside world i run 
the following script
# Set up IP FORWARDing and Masquerading
iptables --table nat --append POSTROUTING --out-interface eth0 -j 
MASQUERADE
iptables --append FORWARD --in-interface eth1 -j ACCEPT
echo 1 > /proc/sys/net/ipv4/ip_forward # Enables packet forwarding 
by kernel


#inorder to redirect requests from firewall to the services we can 
use the following script
iptables -t nat -A PREROUTING -p tcp --dport 21 -i eth0 -j DNAT 
--to 192.168.0.2:21
iptables -t nat -A PREROUTING -p tcp --dport 22 -i eth0 -j DNAT 
--to 192.168.0.2:22
iptables -t nat -A PREROUTING -p tcp --dport 23 -i eth0 -j DNAT 
--to 192.168.0.2:23
iptables -t nat -A PREROUTING -p tcp --dport nntp -i eth0 -j DNAT 
--to 192.168.0.2:22

iptables -t nat -A PREROUTING -p tcp --dport 80 -i eth0 -j DNAT 
--to 192.168.0.2:80
iptables -t nat -A PREROUTING -p tcp --dport 443 -i eth0 -j DNAT 
--to 192.168.0.2:443
iptables -t nat -A PREROUTING -p tcp --dport 8080 -i eth0 -j DNAT 
--to 192.168.0.2:8080
iptables -t nat -A PREROUTING -p tcp --dport 7070 -i eth0 -j DNAT 
--to 192.168.0.2:7070
iptables -t nat -A PREROUTING -p tcp --dport 554 -i eth0 -j DNAT 
--to 192.168.0.2:554
iptables -t nat -A PREROUTING -p tcp --dport 2687 -i eth0 -j DNAT 
--to 192.168.0.2:2687


#class based queuing is done this way
$INTIF = eth1
$EXTIF = eth0


add_class() {
# $1=parent class $2=classid $3=hiband $4=lowband $5=handle 
$6=style
$TC class add dev $INTIF parent $1 classid $2 cbq bandwidth 10Mbit 
rate $3 allot 1514 weight $4 prio 5 maxburst 20 avpkt 1000

$6
$TC qdisc add dev $INTIF parent $2 sfq quantum 1514b perturb 15
$TC filter add dev $INTIF protocol ip prio 3 handle $5 fw classid 
$2
}

$TC qdisc add dev $INTIF root handle 10: cbq bandwidth 10Mbit 
avpkt 1000
$TC class add dev $INTIF parent 10:0 classid 10:1 cbq bandwidth 
10Mbit rate 64kbit allot 1514 weight 6.4kbit prio 8 maxburst

20 avpkt 1000 bounded

#first type of traffic ICMP, TCP-SYN, DNS will be marked '1' by 
the firewall code
#we will give it a bounded bandwidth of 5% of our total incoming 
bandwidth (64*0.05=3.2)
add_class 10:1 10:100 3.2kbit 0.32kbit 1 bounded

#second type of traffic SMTP,POP3 will be marked '2' by the 
firewalling code
#we will give it a bounded bandwidth of 5% of our total incoming 
bandwidth (64*0.05=3.2)
add_class 10:1 10:300 3.2kbit 0.32kbit 2

#third type of traffic ssh,ftp,telnet will be marked '3' by the 
firewalling code
#we will give it a bounded bandwidth of 20% of our total incoming 
bandwidth (64*0.20=12.8)
add_class 10:1 10:200 12.8kbit 1.28kbit 3

#last type of traffic is interactive traffic. It will be marked 
'4' by the firewalling code
#we will give it a bounded bandwidth of 70% of our total incoming 
bandwidth (64*0.70=44.8)
add_class 10:1 10:400 44.8kbit 4.48kbit 4


# this is where the marking of packets is done
IPTABLES=/sbin/iptables

#mark incoming and News traffic with mark value 3
$IPTABLES -A FORWARD -p tcp ! --syn -o $INTIF -s 0/0 --dport 21 -d 
0/0 -t mangle -j MARK --set-mark 3
$IPTABLES -A FORWARD -p tcp ! --syn -o $INTIF -s 0/0 --dport 22 -d 
0/0 -t mangle -j MARK --set-mark 3
$IPTABLES -A FORWARD -p tcp ! --syn -o $INTIF -s 0/0 --dport 23 -d 
0/0 -t mangle -j MARK --set-mark 3

#mark incoming www and Real Server traffic with mark value 4
$IPTABLES -A FORWARD -p tcp ! --syn -o $INTIF -s 0/0 --dport 80 -d 
0/0 -t mangle -j MARK --set-mark 4
$IPTABLES -A FORWARD -p tcp ! --syn -o $INTIF -s 0/0 --dport 443 
-d 0/0 -t mangle -j MARK --set-mark 4
$IPTABLES -A FORWARD -p tcp ! --syn -o $INTIF -s 0/0 --dport 7070 
-d 0/0 -t mangle -j MARK --set-mark 4
$IPTABLES -A FORWARD -p tcp ! --syn -o $INTIF -s 0/0 --dport 554 
-d 0/0 -t mangle -j MARK --set-mark 4
$IPTABLES -A FORWARD -p tcp ! --syn -o $INTIF -s 0/0 --dport 8080 
-d 0/0 -t mangle -j MARK --set-mark 4
$IPTABLES -A FORWARD -p tcp ! --syn -o $INTIF -s 0/0 --dport 2687 
-d 0/0 -t mangle -j MARK --set-mark 4
$IPTABLES -A FORWARD -p udp -o $INTIF -s 0/0 --dport 7070 -d 0/0 
-t mangle -j MARK --set-mark 4
$IPTABLES -A FORWARD -p udp -o $INTIF -s 0/0 --dport 554 -d 0/0 -t 
mangle -j MARK --set-mark 4
$IPTABLES -A FORWARD -p udp -o $INTIF -s 0/0 --dport 8080 -d 0/0 
-t mangle -j MARK --set-mark 4


#mark incoming mail traffic with mark value 2
$IPTABLES -A FORWARD -p tcp ! --syn -o $INTIF -s 0/0 --dport smtp 
-d 0/0 -t mangle -j MARK --set-mark 2
$IPTABLES -A FORWARD -p tcp ! --syn -o $INTIF -s 0/0 --dport pop3 
-d 0/0 -t mangle -j MARK --set-mark 2

# allow icmp traffic mark it with value 1
$IPTABLES -A FORWARD -p icmp -o $INTIF -t mangle -j MARK 
--set-mark 1
$IPTABLES -A FORWARD -p tcp --syn -o $INTIF -t mangle -j MARK 
--set-mark 1
$IPTABLES -A FORWARD -p udp -s 0/0 --dport 53 -o $INTIF -t mangle 
-j MARK --set-mark 1


$IPTABLES -A INPUT -j ACCEPT
$IPTABLES -A FORWARD -j ACCEPT
$IPTABLES -A OUTPUT -j ACCEPT


the whole shell script can be downloaded from 
http://cs.uccs.edu/~gkgodava/tfinal.sh

i can see that the packets are marked
# iptables -L -v -t mangle
Chain FORWARD (policy ACCEPT 6404 packets, 1766K bytes)
pkts bytes target prot  opt   in   out     source   destination
0     0    MARK   tcp -- any eth1 anywhere anywhere tcp dpt:ftp 
flags:!SYN,RST,ACK/SYN MARK set 0x3
257 19602  MARK   tcp -- any eth1 anywhere anywhere tcp dpt:ssh 
flags:!SYN,RST,ACK/SYN MARK set 0x3
  :
  :
  :

_________________________________________________________
There is always a better job for you at Monsterindia.com.
Go now http://monsterindia.rediff.com/jobs


