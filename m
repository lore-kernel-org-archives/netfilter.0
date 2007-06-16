From: "rajeev.sekhar" <rajeev.sekhar@sumasoft.net>
Subject: ""how can i allow IP protocol 47 "" on iptables to connet a pptp
	VPN server.
Date: Sat, 16 Jun 2007 16:32:12 +0530
Message-ID: <000e01c7b005$cb371be0$1664a8c0@ssplscu22>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

hi list ,

Right now my PPTP VPN server is outside the firewall consuming 2 Static 
IPaddress,

I want to pleace my PPTP VPN server behind firewall.

i followed good docs on http://tldp.org/HOWTO/VPN-Masquerade-HOWTO-5.html , 
but still cant understand some words in it.

I DNATed 1723, and 500 (which is used for control channels on pptp) to my 
vpn server behind my firewall.
The encrypted data channel in PPTP is carried over GRE, IP protocol 47,  Now 
how can allow IP protocol 47 from outside , Is this possible? ( pretty new 
for me)
They are telling to   ""masquerade ALL protocol traffic"  What they mean by 
this?
I am pasting my firewall rules.


##################################
#       Default policy is to drop on
#       INPUT And FORWARD and allow
#       every thing On OUTPUT chain
##################################
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

iptables -A INPUT -s 127.0.0.1 -j ACCEPT
iptables -A INPUT -s 192.168.1.0/24 -j ACCEPT
iptables -A OUTPUT -s 192.168.1.0/24 -j ACCEPT
iptables -A INPUT -p tcp -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -p tcp -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -s 192.168.1.0/24 -j ACCEPT
#### SNATing VPN server to go out #########################
iptables -A FORWARD -d 192.168.1.34 -j ACCEPT
iptables -A POSTROUTING -t nat -s 192.168.1.34 -j SNAT --to-source 
203.129.224.181
####  DNATing 1723 and 500 port for VPN server ##############
iptables -A PREROUTING -t nat -p tcp --dport 1723 -i eth1 -d 
203.129.224.181 -j DNAT --to-destination 192.168.1.34:1723
iptables -A PREROUTING -t nat -p udp --dport 500 -i eth1 -d 
203.129.224.181 -j DNAT --to-destination 192.168.1.34:500
echo "1" > /proc/sys/net/ipv4/ip_forward

optionally i tried masqurading too, But it didnt worked.
The rule i tried is
#### MASQURADE rule on server
iptables -t nat -A POSTROUTING -o  eth1 -j MASQUERADE



I tried to NAT port 41 so that protocol 41 will work ( But as expected it 
didnt worked)
#### DNATing 41 port
iptables -t nat -A PREROUTING -i eth1 -p 41 -j DNAT --to 192.168.1.34
iptables -t filter -A FORWARD -i eth1 -p 41 -d 192.168.1.34 -j ACCEPT


Is it possible to put vpn server befind firewall?
Is anybody did this before?


Regards
---------------------------------------------
Rajeev Sekhar
Suma Soft Pvt. Ltd
Jr System Administrator
Ph no :91-020-25425655
cell no :91-9370677989
email:rajeev.sekhar@sumasoft.net

----------------------------------------------
Confidentiality Note: This e-mail message and any attachments to it are
intended only for the named recipients and may contain legally privileged
and/or confidential information. If you are not one of the intended
recipients, please notify the sender and do not duplicate or forward this
e-mail message and immediately delete it from your computer.
----------------------------------------------

