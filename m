From: Esteban <eribicic@sinectis.com>
Subject: RE: upgrade to iptabels from ipchains
Date: 28 May 2003 11:22:02 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1054131723.21086.4.camel@dejawu>
References: <09B04A55822EFF4DA48D2E0BB2941D4A01924C@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <09B04A55822EFF4DA48D2E0BB2941D4A01924C@wardrive.citadelcomputer.com.au>
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
To: George Vieira <georgev@citadelcomputer.com.au>
Cc: netfilter@lists.netfilter.org

$IPCHAINS -A soporte -s 10.0.1.1 -j MASQUERADE
$IPCHAINS -A soporte -j DENY

this rules does not work!
(the second should be DROP, but what about the first one?)

thanks!

On Tue, 2003-05-27 at 20:11, George Vieira wrote:
> Yes you can? You haven't reasearch much have you?
> 
> Do this...
> 
> IPCHAINS="/sbin/iptables"   # ;)
> 
> Just remember that iptables structure is different to ipchains in that INPUT is no longer part of the forwarding line.. it handles packets destined for itself ONLY..
> 
> Thanks,
> ____________________________________________
> 
> -----Original Message-----
> From: Esteban [mailto:eribicic@sinectis.com]
> Sent: Wednesday, May 28, 2003 8:02 AM
> To: netfilter@lists.netfilter.org
> Subject: upgrade to iptabels from ipchains
> 
> 
> i used to have this:
> 
> $IPCHAINS -N soporte
> $IPCHAINS -A FORWARD -s 10.0.0.0/25  -j soporte
> $IPCHAINS -A soporte -s 10.0.1.1 -j MASQUERADE
> $IPCHAINS -A soporte -j DENY
> 
> how can i do this with iptables?
> the idea is to use chains for each group.
> 
> thanks!
> 
> 
> 




