From: Yasuyuki KOZAKAI <yasuyuki.kozakai@toshiba.co.jp>
Subject: Re: SNAT before IPSec
Date: Tue, 05 Jun 2007 21:56:05 +0900 (JST)
Message-ID: <200706051256.l55Cu6Ya004553@toshiba.co.jp>
References: <8bd3dfad0706050529s484d42b6t9ef4ae0fd1730367@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <8bd3dfad0706050529s484d42b6t9ef4ae0fd1730367@mail.gmail.com>
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
Content-Type: Text/Plain; charset="us-ascii"
To: noalevy@gmail.com
Cc: netfilter@lists.netfilter.org


From: "noa levy" <noalevy@gmail.com>
Date: Tue, 5 Jun 2007 15:29:47 +0300

> Hi All,
> 
> I have a setup where I need to SNAT traffic that will be going out via
> an IPSec tunnel. The NAT must take place before the IPSec
> encryption+encapsulation, so I need the packet to first go through
> SNAT and then match an IPSec policy. After being IPSec-ified, I need
> the packets to go through routing again.
> My question:
> SNAT takes place in POST_ROUTING. Can IPSec be applied after that?

Yes. mangling addresses in packets at POST_ROUTING results in re-lookup
policy and re-routing. Then what you need is to configure policy with the
address mangled by SNAT.

>                                                                    I
> have read that after IPSec the packet gets injected to LOCAL_OUT
> again, but when does the actual IPSec policy decision take place?
> Won't it happen *before* SNAT? Can I control it?

If you don't configure any policy matching packets before SNAT, no policy
is applied at the time, of cause.

-- Yasuyuki Kozakai

