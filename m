From: Michael <mutk@iprimus.com.au>
Subject: Re: bandwidth again maybe O T
Date: Thu, 05 Sep 2002 20:33:37 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D773301.9040109@iprimus.com.au>
References: <200209041908.49707@.> <200209041527.g84FRpv31480@vulcan.rissington.net> <200209051228.03102@.> <3D77196B.7090301@iprimus.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: IPtables Users <netfilter@lists.samba.org>

Ohh toss....

My appologies, I shall clarify:

If a packet originates from local processes, and is destined for a local 
process, the INPUT chain is traversed only.

If a packet originates from local process and is destined for non local 
process, the OUTPUT chain is traversed only.

If the packet originates from non local process, and is destined for 
local process, the INPUT chain is traversed.

If packet originates non-local, and is destined non-local, it traverses 
FORWARD

For all, not considering any NAT or MASQ...

Sorry for any confusion I might have caused.

Michael wrote:

> PayalR wrote:
> <snip>
>
> Since you are pinging from localhost, I don't think the FORWARD chain 
> is traversed. The packets go straight to OUTPUT chain. If the packets 
> came from somewhere else, and are to be forwarded by the host on which 
> iptabls is running, then the packets will be seen and counted by FORWARD.
>
> Place the rules in the OUTPUT chain, you should see things from 
> localhost being counted.. 

Err so long as the destination is non-local...Otherwise it will be seen 
in INPUT chain...


Cheers,
Michael


