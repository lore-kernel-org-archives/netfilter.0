From: Rahul Hirve <rahulhirve@gmail.com>
Subject: Problem in setting NAT using IP tables for kernel 2.4.x
Date: Sun, 3 Apr 2005 11:11:47 +0530
Message-ID: <54d79d81050402214135b12fa5@mail.gmail.com>
Reply-To: Rahul Hirve <rahulhirve@gmail.com>
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

hi all 
	I am using uClinux to test nat on IXDP425 the setup is use is as shown below

LAN
with subnet <-------------[ixp0:10.0.10.11/23 (IXDP425) ixp1:
192.168.0.1/24]----------->PC with 10.0.10.0/23					 				             
            IP 192.168.0.4/24
                                                                      
                          Default Gateway 192.168.0.1

                                                        
now here th IXDP425 acting as router with ip_forward = 1
ixp0(eth1) with IP 10.0.10.11 is acting as WAN port connecting to LAN
of subnet 10.0.10.0/23 and

ixp1(eth0) is acting as LAN port connecting to PC of IP 192.168.0.4
with default gateway as 192.168.0.1

I have inserted all modules required for filter and nat applications viz.

insmod ip_tables.o
insmod ip_conntrack.o
insmod iptable_filter.o
insmod iptable_nat.o
insmod ipt_LOG.o
insmod ipt_limit.o
insmod ipt_state.o
insmod ipt_MASQUERADE.o
insmod ip_conntrack_ftp.o
insmod ip_conntrack_irc.o
insmod ip_nat_ftp.o
insmod ip_nat_irc.o
insmod iptable_mangle.o

now the scrip i have done for nat is 

LOOPBACK=lo
LAN=ixp1
WAN=ixp0

#Flush any rules that may still be configured
iptables -t filter -F INPUT
iptables -t filter -F OUTPUT
iptables -t filter -F FORWARD
iptables -t nat -F PREROUTING
iptables -t nat -F POSTROUTING
iptables -t nat -F OUTPUT

# Set the default policies for the chains
iptables -t filter -P INPUT DROP
iptables -t filter -P OUTPUT ACCEPT
iptables -t filter -P FORWARD DROP
iptables -t nat -P PREROUTING ACCEPT
iptables -t nat -P POSTROUTING ACCEPT
iptables -t nat -P OUTPUT ACCEPT

# Set up the firewall rules
iptables -t filter -A INPUT -i ${LOOPBACK} -j ACCEPT
iptables -t filter -A INPUT -i ${LAN} -j ACCEPT
iptables -t filter -A INPUT -i ${WAN} -j ACCEPT

# Set up the ip forwarding
echo "1" > /proc/sys/net/ipv4/ip_forward
iptables -t filter -A FORWARD -i ${LAN} -o ${WAN} -j ACCEPT
iptables -t filter -A FORWARD -i ${WAN} -o ${LAN} -j ACCEPT

iptables -t nat -A POSTROUTING -s 192.168.0.4 -o ${LAN} -j SNAT --to 10.0.10.11

 
now i am pinging 10.0.10.x/23 machine from 192.168.0.4 machine but it
is not doing it WHY?
I have captured the packets using ethereal at 10.0.10.x/23 (the
machine to which i am pinging)
and the result is The IP of 192.168.0.4 is the same in packet but
according to me it should change to 10.0.10.11

can anyone help me to solve this problem?

thanks 
rahul

