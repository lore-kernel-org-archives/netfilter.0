From: Dean Hiller <olddean@xsoftware.biz>
Subject: block 8080, but redirect from 80 to 8080
Date: Mon, 31 Jul 2006 22:11:11 -0600
Message-ID: <44CED45F.10208@xsoftware.biz>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I would like block all traffic to port 8080 except that which was 
redirected in the nat table from port 80 to 8080. 

I have a default policy of DROP on incoming.  The following is what my 
iptables file currently has and this works, EXCEPT that 8080 is left 
open to anyone....

*nat table.....
-A PREROUTING -p tcp -m tcp --dport 80 -j REDIRECT --to-ports 8080

*filter table.....
-A RH-Firewall-1-INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 80 -j 
ACCEPT
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 8080 
-j ACCEPT


but anyone can go to http://<machine>:8080 which I want to disallow.  
How can I fix that?
thanks,
dean

