From: "azeem ahmad" <azeem484@hotmail.com>
Subject: multiple source
Date: Wed, 31 Mar 2004 21:05:25 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY15-F45vJd9o0PRxd0002ad8a@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org, netfilter-failover@lists.netfilter.org

hi all
i want to make such a setup that the two ip 192.168.0.2 and 192.168.0.102 
from my lan should be MASQUERADEd and all the other addresses should be 
redirected to the proxy working on the same machine on port 8080, so i made 
the following rules but these are not working. if i dont add rules in 
PREROUTING and only add rules in POSTROUTING then both ips (.0.2 and .0.102) 
MASQUERADEs very well but i also want the other sources to be REDIRECTed to 
the proxy so if i start redirection then it redirects all the sources 
including the two (.0.2 and .0.102) which i dont want. wot should i do
plz help me out

###################################################################################
#!/bin/bash
echo 1 > /proc/sys/net/ipv4/ip_forward

iptables -F
iptables -t nat -F

MASQs="192.168.0.2 192.168.0.102"
PROTs="tcp udp"

for MASQ in $MASQs;
do
	iptables -t nat -A POSTROUTING -s $MASQ -o ppp0 -j MASQUERADE
done


for MASQ in $MASQs;
do
	for PROT in $PROTs;
	do
		iptables -t nat -A PREROUTING -s ! $MASQ -p tcp --dport 80 -j REDIRECT 
--to-port 8080
	done
done

###################################################################################
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination
REDIRECT   tcp  -- !192.168.0.2          anywhere           tcp dpt:http 
redir ports 8080
REDIRECT   tcp  -- !192.168.0.2          anywhere           tcp dpt:http 
redir ports 8080
REDIRECT   tcp  -- !192.168.0.102        anywhere           tcp dpt:http 
redir ports 8080
REDIRECT   tcp  -- !192.168.0.102        anywhere           tcp dpt:http 
redir ports 8080

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
MASQUERADE  all  --  192.168.0.2          anywhere
MASQUERADE  all  --  192.168.0.102        anywhere

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
#####################################################################################

Regards
Azeem

_________________________________________________________________
Protect your PC - get McAfee.com VirusScan Online 
http://clinic.mcafee.com/clinic/ibuy/campaign.asp?cid=3963


