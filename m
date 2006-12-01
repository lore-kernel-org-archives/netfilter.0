From: sean <seandarcy2@gmail.com>
Subject: Re: how do I set the MAC address in POSTROUTING?
Date: Fri, 01 Dec 2006 10:17:20 -0500
Message-ID: <ekph22$1va$1@sea.gmane.org>
References: <eknslc$rpq$1@sea.gmane.org> <200612010153.55904.Daniel@musketa.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200612010153.55904.Daniel@musketa.de>
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

Daniel Musketa wrote:
> On Friday 01 December 2006 01:23, sean wrote:
>>   MAC-ADDRESS-TEST: IN=ppp0 OUT= MAC= SRC=ww.xx.yy.zz
> 
>> Is this even an iptables issue? 
> 
> AFAIK MAC addresses are used in ethernet to address ethernet frames. On ip 
> routed ppp0 no ethernet frames arrive.
> 
> Daniel
> 

OK. If that's the case, then the --mac-source target would 
only work on a LAN, not over the ethernet. This would mean 
thatthe --mac-sourse target has very limited use - only on 
local LANs.

But there is still a place for a MAC address. How can I  put 
one in the packet on the client side? This would allow me to 
use it over the internet.

sean




