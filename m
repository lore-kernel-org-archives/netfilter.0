From: Payal Rathod <payal-netfilter@scriptkitchen.com>
Subject: will port forwarding work here?
Date: Fri, 14 Jan 2005 10:35:08 -0500
Message-ID: <20050114153508.GA1189@tranquility.scriptkitchen.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: Netfilter ML <netfilter@lists.netfilter.org>

Hi,
I have 2 squid proxy on two different machines 192.168.0.10 and 
192.168.0.11 All my clients are configured to use 192.168.0.10:3128
Now I want a few specific clients to use 192.168.0.11:3128
Is it possible to write some kind of rule on 192.168.0.10 which will 
*properly* redirect traffic from 192.168.0.10:3128 to 
192.168.0.11:3128 for those clients.  A friend on chat suggested (he 
was not sure),

iptables -A PREROUTING -t nat -s 192.168.0.10 --dport 3128 \
 -j DNAT --to-destination 192.168.0.11

Is there anything else missing?

With warm regards,
-Payal


