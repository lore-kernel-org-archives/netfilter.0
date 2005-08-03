From: "Ming-Ching Tiew" <mingching.tiew@redtone.com>
Subject: Re: DNAT pptp to windows machine
Date: Wed, 3 Aug 2005 14:11:09 +0800
Message-ID: <01d001c597f2$246fe580$0100a8c0@newlife>
References: <04a101c597aa$2db2bc50$1500a8c0@domain.internationalauto.com>
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


From: "J.T. Moore" <jtmoore@international-auto.com>


> You will need to DNAT inbound traffic to TCP port 1723 and the GRE
> protocol (IP Protocol 47). Any nat or conntracking of GRE requires the
> PPTP connection tracking and NAT helper patch for iptables and kernel
> pacth from the iptables patch-o-matic next generataion (pom-ng) extra's
> repository. This patch was recently broken on 2.6.11 and newer kernels,
> but the latest notes in netfilter-svn say that its been fixed and will work 
> on 2.6.11 and newer.
> 

As far as I know, PPTP connection tracking is for the PPTP client going
through firewall, ie pptp masquerade. It is not needed for DNAT of PPTP 
into a pptp server.

Cheers.




