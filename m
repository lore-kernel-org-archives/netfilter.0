From: Jason Opperisano <opie@817west.com>
Subject: RE: INPUT or FORWARD;;
Date: Mon, 20 Dec 2004 17:58:48 -0500
Message-ID: <1103583528.13782.12.camel@hubcap.ljm.dom>
References: <Pine.LNX.4.05.10412201539220.18976-100000@darkstar.sysinfo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.05.10412201539220.18976-100000@darkstar.sysinfo.com>
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

On Mon, 2004-12-20 at 15:40, R. DuFresne wrote:
> That was the rational of my asking if a rule that specified a "-i
> /dev/ppp0 -d /dev/eth0" setup would be a FORWARD rhather then a INPUT
> rule, as we are crossing interfaces with such a rule.

no.

a packet destined for a local IP address does not traverse the FORWARD
chain.

one a packets passes through:

MANGLE->PREROUTING
  |
  |
 NAT->PREROUTING

the kernel then performs a route lookup on the destination of the
packet:

if local -> INPUT
if ! local -> FORWARD

the decision of whether the destination of the packet is local is not
influenced at all by what interface the packet was received on.

i'm not sure i'm explaining this as well as a kernel developer could,
but i don't think i can make it any clearer.

-j

--
"I'm having the best day of my life, and I owe it all to not going
 to Church!"
	--The Simpsons


