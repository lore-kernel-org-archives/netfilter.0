From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: detect original chain after jump?
Date: Sat, 27 Mar 2004 13:51:32 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403271351.32300.Antony@Soft-Solutions.co.uk>
References: <20040327133801.GA5251@fake>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040327133801.GA5251@fake>
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

On Saturday 27 March 2004 1:38 pm, Richard Hector wrote:

> This means that early on, I have something like:
>
> iptables -A INPUT -j protocol
> iptables -A FORWARD -j protocol
>
> iptables -A protocol -p tcp --dport 22 -j ssh
>
> But then I get a bit stuck. I need to then do different things depending
> on the source and destination - which includes whether this packet is
> arriving locally or being forwarded. Therefore it would be useful to
> know whether this packet started out in the INPUT or FORWARD chain - but
> that info seems to have been lost with the jump.
>
> Is there any way to regain that?

Surely the destination address is all you need for this?

If it's an address local to the machine, the packet is addressed to the 
machine, therefore it came through the INPUT chain.

If the destination address is not local, the packet isn't addressed to the 
machine, therefore it's going somewhere else, therefore it came through the 
FORWARD chain.

Are you sure that combining INPUT and FORWARD rules like this is really what 
you want to do?

I would have thought the two were sufficiently different (what traffic you 
allow in to your firewall, compared to what traffic you allow through it to 
elsewhere) that it would be worth writing separate rulesets for the two.

However, YMMV as they say....

Regards,

Antony.

-- 
Never write it in Perl if you can do it in Awk.
Never do it in Awk if sed can handle it.
Never use sed when tr can do the job.
Never invoke tr when cat is sufficient.
Avoid using cat whenever possible.

                                                     Please reply to the list;
                                                           please don't CC me.


