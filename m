From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: forwarding
Date: Tue, 18 May 2004 19:42:17 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405181942.17508.Antony@Soft-Solutions.co.uk>
References: <7C9884991ADAE0479C14F10C858BCDF567934A@alderaan.smgtec.com>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF567934A@alderaan.smgtec.com>
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

On Tuesday 18 May 2004 7:23 pm, Daniel Chemko wrote:

> iptables -t nat -A POSTROUTING --destination ${server2} -j SNAT --to
> ${server1_internal_ip}
>
> This is the last time I try to respond to you since you've been ignoring
> the rest.

Who are you talking to here (your posting was addressed to two individuals, 
plus the list), and what is "the rest" you refer to?

I have only seen one other email from you in this thread, and that was in 
response to a somewhat off-topic posting about reverse routing, which IMHO 
didn't require a response...

We don't want anyone to feel left out on this list, but if you've posted other 
comments and not had a response, the reason is probably that other list 
subscribers haven't seen what you said yet (no, I don't know why that would 
be).

By the way, I disagree that the above SNAT rule is required.

Regards,

Antony.

-- 
Most people have more than the average number of legs.

                                                     Please reply to the list;
                                                           please don't CC me.


