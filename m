From: Gudmundur Arnljotsson <gudmundur@insl.co.nz>
Subject: pptp pom patch rules
Date: Fri, 18 Mar 2005 13:34:34 +1300
Message-ID: <423A221A.5020907@insl.co.nz>
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

Hi list

I have successfully recompiled my kernel 2.4.21 with newest pptp pom 
patch and complied and installed newest iptables so I can masquerade 
multiple outgoing pptp connection. My old kernel only supported 1 
connection at the time

My system is SuSE Standard server 8 with 2 nic

For allowing incoming pptp I have this rules in my SuSEfirewall2-custom file

iptables -A INPUT -i ppp+ -j ACCEPT
iptables -A FORWARD -i ppp+ -j ACCEPT
iptables -A FORWARD -o ppp+ -j ACCEPT

So the question is what rules do I need for the new functionality and 
where should I put them (you know SuSE has it own ways of doing things 
making it very hard to use and apply general Linux documentations)

If it is to any help, here are my firewall settings
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
FW_REDIRECT="192.168.50.0/255.255.255.0,0/0,tcp,80,8080 \ 
192.168.50.0/255.255.255.0,0/0,tcp,21,2121"


-- 

regards

Gudmundur Arnljotsson



