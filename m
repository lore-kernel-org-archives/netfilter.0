From: Gudmundur Arnljotsson <gudmundur@insl.co.nz>
Subject: Multiple outgoing vpn connection
Date: Wed, 09 Feb 2005 11:32:54 +1300
Message-ID: <42093E16.2010605@insl.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

  Hi
I have SuSE Standard server 8 (great product) working very nicely except 
for one small detail.
It can only masquerade 1 pptp connection at time and only for the same 
user. To allow another user to vpn out the SuSEfirewall2 must be reset.

Incoming vpn  is working grate (multiple road warriors at same time all 
using pptp)

Is there any way other than patching and recompile the kernel (according 
to google search)

What I need is to allow 3 clients to connect to same external windows 
vpn server simultaneously.
This was(and is) not a problem through our dsl router.

Any advice?

my firewall settings

iptables -A INPUT -i ppp+ -j ACCEPT
iptables -A FORWARD -i ppp+ -j ACCEPT
iptables -A FORWARD -o ppp+ -j ACCEPT


FW_DEV_EXT="eth1 ppp+"
FW_DEV_INT="eth0"
FW_DEV_DMZ=""

FW_ROUTE="yes"
FW_MASQUERADE="yes"
FW_MASQ_DEV="$FW_DEV_EXT"

FW_MASQ_NETS="192.168.50.0/24,xxx.xxx.xxx.xxx/24"
FW_PROTECT_FROM_INTERNAL="no"
FW_AUTOPROTECT_SERVICES="yes" 

FW_SERVICES_EXT_TCP="1723 imaps smtp"
FW_SERVICES_EXT_UDP=""
FW_SERVICES_EXT_IP="gre"
FW_SERVICES_INT_TCP="1723"
FW_SERVICES_INT_UDP=""
FW_SERVICES_INT_IP="gre" 

FW_TRUSTED_NETS=""
FW_ALLOW_INCOMING_HIGHPORTS_TCP="yes"
FW_ALLOW_INCOMING_HIGHPORTS_UDP="yes"
FW_SERVICE_AUTODETECT="no"
FW_SERVICE_DNS="yes"
FW_SERVICE_DHCLIENT="auto"
FW_SERVICE_DHCPD="yes"
FW_SERVICE_SQUID="yes"
FW_SERVICE_SAMBA="yes" 

FW_FORWARD=""
FW_FORWARD_MASQ=""
FW_REDIRECT="192.168.50.0/255.255.255.0,0/0,tcp,80,8080 \ 192.168.50.0/255.255.255.0,0/0,tcp,21,2121" 


-- 

regards

Gudmundur Arnljotsson B.Sc
Independent Scales Ltd
100a Hayton Road
P.O. Box 8098
Christchurch
New Zealand

Tel Office: +64 03 341 1324
Mobile:     +64 021 475 581



