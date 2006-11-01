From: "Filip Sneppe" <filip.sneppe@gmail.com>
Subject: Re: cooperation between connection tracking and traffic shaping
Date: Wed, 1 Nov 2006 11:21:43 +0100
Message-ID: <9151ac2a0611010221i3e062172pc9c6ee5e636b94b3@mail.gmail.com>
References: <f36b08ee0611010211r598a4857u383de5d0c721887a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <f36b08ee0611010211r598a4857u383de5d0c721887a@mail.gmail.com>
Content-Disposition: inline
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
To: Yakov Lerner <iler.ml@gmail.com>
Cc: netfilter@lists.netfilter.org

Hi Yakov,

On 11/1/06, Yakov Lerner <iler.ml@gmail.com> wrote:
> It worked. But I think it was ugly because:
>
>      (1) I want qos-to-conntrack cooperation for more protocols
> with dynamic ports ... can I have it/do it without hacking every
> conntrack module ?
>
>     (2) maybe there is a much easier way to achieve this
> qos-to-conntrack cooperation [than hacking conntrack modules] ?
>
Yes, the general way to do this, is to use the MARK target from
netfilter to mark the packets you want to QoS and then use the fwmark
from within your tc rules.

That works without hacking any code. Note that the fwmarks can also
be used between netfilter and the advanced routing framework in the
Linux kernel (ip route, ip rule, etc.)

Best regards,
Filip

