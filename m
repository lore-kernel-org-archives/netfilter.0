From: Vincent Lim <vincent.lim@nestac.com>
Subject: Re: connection tracking query
Date: 07 Apr 2003 17:51:38 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1049709098.1231.169.camel@vincentlim>
References: <7497DCA1C240C042B28F6657ADFD8E0926876C@i2km11-ukbr.domain1.systemhost.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7497DCA1C240C042B28F6657ADFD8E0926876C@i2km11-ukbr.domain1.systemhost.net>
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
To: dhiraj.2.bhuyan@bt.com
Cc: netfilter@lists.netfilter.org

On Mon, 2003-04-07 at 17:02, dhiraj.2.bhuyan@bt.com wrote:

<snip rest>

> but also in INPUT and POSTROUTING chain. What I find strange with this is
> that for a packet that goes through the "FORWARD" chain, "conntrack" is done
> twice on the same packet - first in the "PREROUTING" chain and second in the
> "POSTROUTING" chain. Does anyone have any explanation for this?

I think the first packet goes thru POSTROUTING, subsequent packets
(after their routes determined) goes straight to FORWARD.
> 
> 2. If a packet is found to belong to an already ESTABLISHED connection, does
> it still have to go through the filter rules again?

I would think so. You need to explicitly have "-m state --state
ESTABLISHED, RELATED -j ACCEPT" to process those packets.

My $0.02
*awaits flame galore*
-- 
Vincent Lim <vincent.lim@nestac.com>
NESTAC Solution Sdn Bhd


