From: Herman <Herman@AerospaceSoftware.com>
Subject: Re: Port forwarding doesn't work.
Date: Sun, 12 Oct 2003 18:20:59 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200310121820.59977.Herman@AerospaceSoftware.com>
References: <LFEHKEBEBHAFGJBMNKAOKELACCAA.markee@bandwidthco.com> <200310121700.13102.Herman@AerospaceSoftware.com> <3F89ED5C.3050507@snapgear.com>
Reply-To: Herman@AerospaceSoftware.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F89ED5C.3050507@snapgear.com>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On Sunday 12 October 2003 6:10 pm, Philip Craig wrote:
   Herman wrote:
   > If I display the rules, I can't see any forwarding rules in the list,
   > which tells me that the forwarding rules that I try to implement are
   > simply ignored by iptables:
   >
   > iptables -v -L

   iptables defaults to listing the filter table.
   If you want to list nat rules, you must specify the nat table:

   iptables -t nat -v -L

OK, here goes:
iptables -t nat -v -L
Chain PREROUTING (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destinat                   
ion

Chain POSTROUTING (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destinat                   
ion

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destinat                   
ion

Blech...

Mark Donaldson suggested that a module may be missing

I'll try to pursue that thought.

Cheers,
-- 
Herman Oosthuysen 
B.Eng(E), MIEEE
Aerospace Software Ltd.
Ph: 1.403.241-8773, Cell: 1.403.852-5545, Fx: 1.403.241-8841
Herman@AerospaceSoftware.com, http://www.AerospaceSoftware.com

