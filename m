From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Filtering out spoofed network addresses
Date: Mon, 30 Jun 2003 11:30:33 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030630153033.GA29474@cannon.eng.us.uu.net>
References: <Pine.LNX.4.44.0306301039060.23945-100000@hay.haya.qc.ca>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0306301039060.23945-100000@hay.haya.qc.ca>
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
Content-Transfer-Encoding: 7bit
To: "James R. Hay" <jrhay@HayA.QC.CA>
Cc: netfilter@lists.netfilter.org

On Mon, Jun 30, 2003 at 10:42:13AM -0400, James R. Hay wrote:

> 
> Hi folks,

Hi James,

Indeed, you cannot do this with netfilter. Netfilter does not provide you
with the "don't care bits" as cisco calls it.

Just to give you a pointer, your best bet would be the _powerful_ u32 selector
of "tc". You define the rule, match the packets with this rule and send them
right down the drain...

tc filter add dev ... protocol ip ... u32 match u32 00000000 0000ffff at 12 ...

Basically you match these packets and allocate 0 bandwidth for them...
When you come up with the exact rule and solution, please post it here. It will
be very helpful to many people...

Ramin

> 
> Somewhere I must be missing something.  Fairly regularly we see SYN Flood
> attacks which come from addresses of the form x.x.0.0.  Since the address
> on each incoming packet changes rate limiting doesn't help with this and
> it isn't practical to include 65,000+ rules to drop each address ending in
> .0.0.
> 
> My question is, is there an easy way to get iptables to drop these
> addresses so that they don't get forwarded to the network?
> 
> As I say I may have missed something so any assistance will be
> appreciated.
> 
> Jim.
> 
> James R. Hay				jrhay@haya.qc.ca
> Hay-Net Networks
> P.O. Box 46051
> Pointe Claire, QC
> H9R 5R4
> 

