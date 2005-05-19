From: Chadley Wilson <chadley@pinteq.co.za>
Subject: Iptables
Date: Thu, 19 May 2005 19:45:22 +0200
Message-ID: <200505191945.22293.chadley@pinteq.co.za>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_yCNjCJM8wneouIk"
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
To: netfilter@lists.netfilter.org

--Boundary-00=_yCNjCJM8wneouIk
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Greetings,

Sort of still a newbie with iptables! I ve been at it for a while, but 
struggle to understand when things don't work when I think they are right.

OK heres the problem:

I have a dns server configure, master zone int network, slave is external dns 
box.

Dhcp server only internal.

Iptables must do the following:
allow one int ip (me) to the external int face for everything. (the external 
interface is actually our other internal network which has the gateway to the 
internet)

when I set my default policy to drop, my DNS and windows file sharing from the 
ext network doesn't work. My mail and internet still work. I have removed the 
broken lines and set my policy back to ACCEPT. But I would feel much safer if 
it were drop and only allow services that I choose. As it is now, I can 
access the net, mail and windows file shares, the dns for the FTP server is 
working and all is bliss.
How do I make this more secure?

etel is our gateway
my router has 6 cards in it. 5 are bond0 1 eth0 int and ext respectively.  

Attached is my iptables file, 

Please could some one show me what is wrong I can't figure it out.


-- 
Chadley Wilson
Redhat Certified Technician 
Cert Number: 603004708291270
Pinnacle Micro
Manufacturers of Proline Computers
====================================
Exercise freedom, Use LINUX
=====================================

--Boundary-00=_yCNjCJM8wneouIk
Content-Type: text/plain;
  charset="us-ascii";
  name="iptables"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="iptables"

########    Firewall Setup     ##################
########      Config           ##################
#set -x
ipt="/usr/sbin/iptables"
ext="eth0"
int="bond0"
lo="127.0.0.1"
chad="192.168.2.5"
etel="196.25.100.28"
#################################################


#################################################
####                                         ####
####               BASIC SETUP               ####
####                                         ####
#################################################



#Enable IP Forwarding
echo "1" >> /proc/sys/net/ipv4/ip_forward


#Clear All Tables
${ipt} -t filter -F
${ipt} -t nat -F


##  Allow all from local interfaces [localhost]
${ipt} -t filter -A INPUT -s ${lo} -j ACCEPT


##  Allow all prerouting
${ipt} -t nat -A PREROUTING -s 192.168.2.0/255.255.255.0 -j ACCEPT
${ipt} -t nat -A PREROUTING -s 196.25.100.5/255.255.255.0 -j ACCEPT


##  Allow all forwarding
${ipt} -t filter -A FORWARD -i ${int} -o ${ext} -m state --state RELATED,ESTABLISHED -j ACCEPT
${ipt} -t filter -A FORWARD -i ${ext} -o ${int} -m state --state RELATED,ESTABLISHED -j ACCEPT


##  Allow pings 
${ipt} -t filter -A INPUT -p icmp -j ACCEPT


##  Keep established connections on all interfaces
${ipt} -t filter -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
${ipt} -t filter -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

##  Accept www from internet {ext}
${ipt} -t filter -A INPUT -i ${ext} -p tcp --dport 80 -j ACCEPT


#################################################
####                                         ####
####                RULES                    ####
####                                         ####
#################################################





##  Masquerade {chad} outgoing to internet
${ipt} -t nat -A POSTROUTING -o ${ext} -s ${chad} -j MASQUERADE
${ipt} -t filter -A FORWARD -i ${int} -o ${ext} -s ${chad} -j ACCEPT


##  Accept SSH from {etel}
${ipt} -t filter -A INPUT -i ${ext} -s ${etel} -p tcp --dport 22 -j ACCEPT


##  Accept ssh from all internal
${ipt} -t filter -A INPUT -i ${int} -p tcp --dport 22 -j ACCEPT

## Accept telnet
${ipt} -t filter -A INPUT -p tcp --dport 23 -j ACCEPT
${ipt} -t filter -A INPUT -p udp --dport 23 -j ACCEPT


##  Accept incoming SMTP
${ipt} -t filter -A INPUT -i ${ext} -p tcp --dport 25 -j ACCEPT


##  Accept external POP3
${ipt} -t filter -A INPUT -i ${ext} -p tcp --dport 110 -j ACCEPT


##  Allow mail from ext to int
${ipt} -t filter -A FORWARD -p tcp -m tcp -m state -s ${chad} -d 196.25.100.21 -o ${ext} --sport 25 --state NEW,ESTABLISHED,RELATED -j ACCEPT
${ipt} -t filter -A FORWARD -p tcp -m tcp -m state -s ${chad} -d 196.25.100.21 -o ${ext} --sport 110 --state NEW,ESTABLISHED,RELATED -j ACCEPT


##  Allow DNS updates
${ipt} -t filter -A INPUT -i ${int} -p tcp --dport 53 -j ACCEPT
${ipt} -t filter -A INPUT -i ${ext} -p tcp --dport 53 -j ACCEPT


## Accept all from local interfaces
${ipt} -t filter -A INPUT -i ${int} -j ACCEPT
${ipt} -t filter -A INPUT -i ${int} -j ACCEPT


## Drop all the rest, incoming , and forward between interfaces
#${ipt} -t filter -A INPUT -j DROP
#${ipt} -t filter -A FORWARD -j DROP

### END OF FIREWALL ###

--Boundary-00=_yCNjCJM8wneouIk--


