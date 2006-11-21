From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: load balancing multiple isp
Date: Tue, 21 Nov 2006 09:27:54 -0600
Message-ID: <45631AFA.50102@riverviewtech.net>
References: <1164069640.4057.31.camel@mfarooq-1.tango-networks.com>
	<006601c70d54$f992a620$0503800a@wanxpe2773a9cb>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <006601c70d54$f992a620$0503800a@wanxpe2773a9cb>
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
To: ArioS <christian@wanxp.net>
Cc: netfilter@lists.netfilter.org

ArioS wrote:
> anyone have experience bout load balancing on multiple isp ? i have 3 
> connection from different isp (A = 64kb , B = 128kb , C = 128kb). howto 
> mix these 3 isp into 1 virtually.. so if bw on ISP A is lacked then the 
> connection will move to ISP B. currently i did manual route for specific 
> network to specific ISP... it really hard to balance it with manual 
> route. any clue ?

Look in to the "--next-hop" "ip route" command option.  I think you will 
find what you are looking for in the fact that you can have multiple next hops.

Something to keep in mind is that if you are NATing each ISP connection, you 
can not have a stream migrate from one ISP to another b/c you will break 
connection state on your end, or even if your end could handle it, the 
server you are connecting to would flip out.  From the server's point of 
view, it would be talking to Bob and Bob would stop mid sentence and Tom 
would start where Bob left of with out the ability to correlate what Bob and 
Tom were saying in to one coherent stream.



Grant. . . .

