From: Payal Rathod <payal-netfilter@scriptkitchen.com>
Subject: site not seen through squid
Date: Wed, 16 Feb 2005 10:51:16 -0500
Message-ID: <20050216155116.GA3520@tranquility.scriptkitchen.com>
Mime-Version: 1.0
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: Netfilter ML <netfilter@lists.netfilter.org>

Hi,
My friend has a sharepoint (don't know what it is) server in her DMZ 
at 10.10.10.3.  She can access that server from outside world by 
giving its public IP in browser. She cannot access it via her squid 
proxy inside the LAN. But when she removes proxy settings and gives,
iptables -I FORWARD -s 192.168.10.7 -j ACCEPT
she can access it. When I say access here it means that in all cases 
she can see IIS page but it is giving authorization failed from 
inside LAN. When she removes proxy settings and gives iptables rule 
above she is presented with a username-password box which is not seen 
via squid internally.
Strangely if I am on the squid/gateway/firewall machine and still 
using proxy I can see the authorization box.  Can someone give us 
both some hints to proceed?

With warm regards,
-Payal



