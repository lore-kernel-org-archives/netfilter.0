From: "azeem ahmad" <azeem484@hotmail.com>
Subject: wiered problem
Date: Thu, 20 May 2004 20:45:29 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY15-F12RLNTaFagA30009460e@hotmail.com>
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
To: netfilter@lists.netfilter.org

i m running iptables, squid proxy, bind, and samba on same machine. it works 
as a server for my LAN
the script that i ran is as follow but when i stat these rules the browsing 
stops. the squid proxy is listening on port 8080. what can be the problem. 
while netbios sharing is doing okey.
------------------------------------------------------------------------------------------------------------------------------
iptables -P INPUT ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 8080 -j ACCEPT
iptables -A INPUT -i eth0 -p udp --dport 8080 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 22   -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 53   -j ACCEPT
iptables -A INPUT -i eth0 -p udp --dport 53   -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 139  -j ACCEPT
---------------------------------------------------------------------------------------------------------------------------

Regards
Azeem

_________________________________________________________________
Add photos to your e-mail with MSN 8. Get 2 months FREE*. 
http://join.msn.com/?page=features/featuredemail


