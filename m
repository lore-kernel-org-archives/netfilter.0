From: Philip Craig <philipc@snapgear.com>
Subject: Re: Load Balancer Trouble, are "Routes with Memory" Possible?
Date: Thu, 01 Jun 2006 15:39:33 +1000
Message-ID: <447E7D95.5000404@snapgear.com>
References: <20060523225646.poejqicpp0cg88gc@zarzamora.com.mx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060523225646.poejqicpp0cg88gc@zarzamora.com.mx>
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
To: desert@zarzamora.com.mx
Cc: netfilter@lists.netfilter.org

On 05/24/2006 01:56 PM, desert@zarzamora.com.mx wrote:
> What i need is this.
> 
> 1) A connection comes from LAN trying to access an IP in WAN
> 2) Round robin (or whatever) to select any WAN pipe.
> 3) Remember that route for many minutes
>    or until client closes it.
> 
> I dont care if other LAN clients follow the same route or if they
> select a different route.
> 
> The real trick is to mantain the route for as long as the client needs
> it.

Use CONNMARK.  Save the mark for packets with a NEW state in the
POSTROUTING chain based on which interfaces was selected by the
round robin.  Restore the mark for packets ESTABLISHED or RELATED
states in the PREROUTING and OUTPUT chains, and use the mark to
route it out the corresponding interface.

I posted some rules a couple of months ago, search the archives.

