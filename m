From: "Responsabile P.R." <info@gmecommunications.ws>
Subject: PC and Ports with iptables
Date: Thu, 1 Apr 2004 10:07:03 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <12955.8556284339$1080807058@news.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

Hello to all, 
I am italian so sorry for the english.
I'm developing a firewall based on iptables and linux redhat 7,3=
 with 
kernel 2,4,18 and two cards eth.  
I would want through this machine to make to pass some PC through=
 
some services and other through other services.  
In order to make this I have written these rules:  

#in order to block to all the ports therefore to prevent the=
 access 
to eventual virus...  
iptables -P FORWARD DROP 

#in order to accept the demand pop3 and for navigation in=
 Internet 
and only those from the PC_1 
iptables -A FORWARD -s $PC_1 -p tcp --dport 110 -i $ETH_LAN -j=
 ACCEPT
iptables -A FORWARD -s $PC_1 -p tcp --dport 80 -i $ETH_LAN -j=
 ACCEPT

#in order to accept ftp and internet navigation and only those=
 from 
the PC_2 
iptables -A FORWARD -s $PC_2 -p tcp --dport 21 -i $ETH_LAN -j=
 ACCEPT
iptables -A FORWARD -s $PC_2 -p tcp --dport 80 -i $ETH_LAN -j=
 ACCEPT

#in order to accept the answers to the LAN 
iptables -A FORWARD -i $ETH_INTERNET -o $ETH_LAN -m state --state=
 
ESTABLISHED,RELATED -j ACCEPT

#in order to mask the IP 
iptables -t nat POSTROUTING -o $ETH_INTERNET -j SNAT --to 
$IP_ETH_INTERNET

I have enabled the FORWARD and moreover loaded the following=
 modules: 
 

echo "1" > /proc/sys/net/ipv4/ip_forward

modprobe iptable_nat
modprobe iptable_filter
modprobe ipt_TOS
modprobe ipt_mark
modprobe ipt_tos
modprobe ipt_ttl
modprobe ipt_MARK
modprobe ip_nat_ftp
modprobe ip_conntrack
modprobe ip_conntrack_ftp
modprobe ip_conntrack_irc
modprobe ip_tables
modprobe ip_queue
modprobe ipt_multiport
modprobe ipt_mac
modprobe ipt_unclean
modprobe ipt_REJECT
modprobe ipt_state
modprobe ipt_owner
modprobe ipt_limit
modprobe ip_nat_irc
modprobe ip_nat_snmp_basic
modprobe ipt_MASQUERADE

for a reason that I do not understand this script does not work,=
 but 
if i navigate at least once with the PC through the services that=
 I 
want to open the script works

In fact if loaded one script with 

iptables -A FORWARD -s $PC_1 -j ACCEPT
iptables -A FORWARD -s $PC_2 -j ACCEPT

and then I navigate for the ports that I would want to open and=
 then 
reload the script that open only some ports my filter works.  

Also I have tried to set to ACCEPT the politics of default for 
FORWARD and to "DROP" the ports that do not interest to me for=
 the 
single PC but they are too many!!!  (approximately 65000) 

how can I make, therefore in order to discriminate navigation for=
 PC 
and ports, block those that do not interest to me?  

Thanks to all
Cristiano


-- Responsabile P.R., info@gmecommunications.ws on 04/01/2004


