From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: netfilter machine in between 2 servers
Date: Sun, 14 Mar 2004 18:41:04 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403141841.04635.Antony@Soft-Solutions.co.uk>
References: <20040314182723.32260.qmail@web60004.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040314182723.32260.qmail@web60004.mail.yahoo.com>
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

On Sunday 14 March 2004 6:27 pm, Sandy C wrote:

> Hi Antony,
>     Great explanation. It seems like what you're saying is *if * I did want
> to keep track of whatever's going on (i.e. LOG http packets)  using
> iptables I would need to make sure the client and server are part of 2
> different nets, correct? So...the 3rd machine would neet to route and
> filter.

Correct.

>    Otherwise how hard would it be to go into the code and make iptables
> recognize broadcast packets ala ethereal?

If by "broadcast" you mean "packets sent to an IP subnet broadcast address" 
the netfilter will do that already.

However, I don't think you do mean that, I think you mean "packets which 
happen to come out of all sockets on a hub", and the answer is "very 
difficult" because netfilter is plugged into the routing mechanism, and the 
routing mechanism just doesn't see packets which aren't addressed to the 
machine, either as an endpoint or as a router.

Besides, why do you want netfilter to do your logging, if you can run 
ethereal?   You get a lot more information out of ethereal, and it can show 
you the protocols in a much more meaningful manner.

Regards,

Antony.

-- 
If builders made buildings the way programmers write programs, then the first 
woodpecker to come along would destroy civilisation.

                                                     Please reply to the list;
                                                           please don't CC me.


