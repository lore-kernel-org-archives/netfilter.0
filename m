From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: open port to specific ip address
Date: 10 Nov 2003 09:57:20 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1068476240.1530.30.camel@valhalla>
References: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAHvCSmpkyA0+lP5YKpr7djsKAAAAQAAAAX5TmzymhnkKWYhlmn/VLAwEAAAAA@petzetakis-africa.co.za>
	 <1068469729.1530.15.camel@valhalla>
	 <200311101326.hAADQXj16843@agate.rockstone.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200311101326.hAADQXj16843@agate.rockstone.co.uk>
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

On Mon, 2003-11-10 at 08:26, Antony Stone wrote:
> 
> I assumed (maybe wrongly?) that because Lohan specified an internal IP 
> address, the access was required from the internal network.

Obviously Lohan needs to be the one to clarify, but I think your right.
Going back through the thread, it looks like the access is internal to
internal, with forwarding to an external.

Of course this is still going to give him trouble if 10.10.10.41 is part
of the local subnet. Systems are going to ARP for this IP, not send the
traffic to their default gateway. You might be able to use publish ARP
on the internal interface of the firewall, but that assumes a flat
subnet and starts to get real messy.

Thanks for the clarification,
C



