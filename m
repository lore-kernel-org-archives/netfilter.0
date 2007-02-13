From: Jeff Weber <jweber@amsuper.com>
Subject: NAT for heritage iptables-1.2.10
Date: Tue, 13 Feb 2007 08:54:36 -0600
Message-ID: <200702130854.36379.jweber@amsuper.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

Hello:

I am replicating a firewall from from an iptables v1.3.3 system, to an older 
iptables v1.2.10 (and Linux-2.4.27) system.  The older system cannot be 
upgraded to newer software at this time.

The following iptables command works on the newer system:
/usr/sbin/iptables -t nat -A PREROUTING -p tcp -d 192.168.100.50 --dport 502 \ 
-i eth1 -j DNAT --to 172.26.0.88:502

but is invalid on the iptables-1.2.10 system, specifically the "--dport" and 
"--to" options are unknown arguments.

I've been unable to find any documentation on NAT for the older iptables.  How 
can I implement the same NAT functionality above using iptables-1.2.10 ?

thanks,
	Jeff

