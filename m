From: "Alexis" <alexis@tpys.com.ar>
Subject: Is this suitable (2)?
Date: Mon, 22 Nov 2004 08:23:08 -0300
Message-ID: <E1CWCIm-0004Hh-00@deer.gmane.org>
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

Im doing some tests in the lab, i have this idea and i want 
to know if this is suitable to do.
 
 
This is the idea (not mine, customer,and the customer is 
always right) , suppose this schema
 
  
Wap server <-> GW
SQL server _| 


My customer wants to wap server send the sql queries to GW 
(so the wap box thinks that sql server is the gw box), then 
gw redirect the sql request to the sql server, and replies 
then follow the same way back. 

For this case WAP server is in a dmz, sql is in another dmz, 
and sql server is in the local lan (different from the 
dmz's). The idea to fit 2 nic's to the GW is discarded 
because the only device allowed to interconnect the DMZ's, 
the LAN and the WAN are the firewalls.
 
So I need to do this.

In GW using only 1 NIC, rederirect the traffic in both directions.

Using mysql as an example and this addresses
 
Wap server: 10.11.0.20
GW: 10.12.0.10 (gw 10.12.0.1)
SQL: 10.10.2.205
 
Will this rules in the gw box work?
 
(filter:INPUT and filter:FORWARD policies are DROP)
 
ip ro add default via 10.12.0.1
iptables -t nat -A PREROUTING -s 10.11.0.20 -d 10.12.0.10 -p tcp --dport
3306 -j DNAT --to 10.10.2.205:3306 
iptables -t nat -A PREROUTING -s 10.10.2.205 -d 10.12.0.10 -p tcp --sport
3306 -j DNAT --to 10.11.0.20 
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT 
iptables -A FORWARD -m state --state NEW -s 10.11.0.20 -d 10.12.0.10 -p tcp
--dport 3306 -j ACCEPT 
iptables -A FORWARD -m state --state NEW -s 10.10.2.205 -d 10.12.0.10 -p tcp
--sport 3306 -j ACCEPT

Is this enough????
 
I think that, as the connections will be always started from 
wap server, the second FORWARD rule will not match never, 
because this match will be in the RELATED,ESTABLISHED rule, 
but the main doubt is if this is correct in the nat table.
 
 
Thanks in advance.
 
Best regards


