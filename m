From: Payal Rathod <payal-netfilter@scriptkitchen.com>
Subject: server in DMZ
Date: Wed, 1 Sep 2004 22:50:38 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040902025038.GA10835@tranquility.scriptkitchen.com>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter ML <netfilter@lists.netfilter.org>

Hi,
I have a small webserver in DMZ at 10.10.10.3 where we load our designs.
I want to allow access to its port 80 only from local LAN (via. a squid 
proxy on the gateway machine) and my client's office at 1.2.3.4. 
Right now I can see it from all over the world, but I do want to restrict 
the access. Remember that as now I want to continue accessing the DMZ machine 
using its public IP and not just 10.10.10.3 IP even from inside the LAN.
What do I do in such case?
Thanks a lot for the help in advance.
With warm regards,
-Payal
p.s. is DMZ pronounced as DMZ or DMZee?

