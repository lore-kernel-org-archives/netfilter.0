From: mclinden@informed.net
Subject: netfilter forwarding to FTP gateway
Date: Tue, 1 Jun 2004 15:14:51 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OFFD27EFAD.C9CBECAA-ON85256EA6.0067F566-85256EA6.006BA67D@informed.net>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Synopsis: Linux 2.6.6
             iptables 1.2.9

I'm having a bit of difficulty deciding the best way to handle the 
following and what the iptable configuration should be. 

Basically, we are running a private, predominantly Microsoft network which 
has multiple satellites identified by split subnets (172.16.0.0/22). In 
order to handle FTP to specific clients through the firewall I have an FTP 
gateway machine (172.16.11.237) which accepts incoming FTP traffic on port 
3270 and relays traffic from port/interface combination to an interface on 
the external network (Internet). The software is JFTPGW 
(http://www.mcknight.de/jftpgw). Unfortunately, Microsoft's FTP client 
does not allow complex hostnames (with embedded proxies) and we are using 
EPA software which will not accept an alternate FTP client so the FTP must 
be transparent. 

To do this, I configured the FTP relay using the following:

iptables -t nat -A PREROUTING -p tcp -s 172.16.0.0/16 --dport 21 -j DNAT 
--to 172.16.11.237:2370

I also configure point to point routes to the specific FTP sites using 
172.16.11.237 as the gateway, which appears to work ok for systems on the 
same subnet (172.16.8.0/22). But Microsoft's desktop OSs do not let you 
specify gateways outside the subnet of the client, therefore, clients on 
the 172.16.16.0/22 subnet cannot use the transparent FTP proxy.

My thought was to put another Linux box with a single interface on the 
172.16.16 subnet, use it as the gateway to the downstream clients, and 
have it forward all packets for port 21 to the machine on the other 
subnet. But I'm a bit confused on how to do this.

Suggestions or references to tutorials/faqs/etc would be appreciated.

Thanks in advance

Sean McLinden
Allegheny County Health Department






