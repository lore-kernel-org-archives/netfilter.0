From: Feizhou <feizhou@linuxmail.org>
Subject: Re: Is this firewall good enough?
Date: Wed, 09 Jun 2004 04:14:13 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40C61E15.4050702@linuxmail.org>
References: <20040608091436.84113.qmail@web14712.mail.yahoo.com> <200406081057.40137.Antony@Soft-Solutions.co.uk> <40C5D53A.9060407@linuxmail.org> <200406081617.05230.lists@edeca.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406081617.05230.lists@edeca.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Cannings <lists@edeca.net>
Cc: netfilter@lists.netfilter.org

David Cannings wrote:
> On Tuesday 08 June 2004 15:03, Feizhou wrote:
> 
>>Antony Stone wrote:
>>
>>>On Tuesday 08 June 2004 10:42 am, Feizhou wrote:
>>>
>>>>>2.  /sbin/iptables -A INPUT -p tcp -m state --state
>>>>>ESTABLISHED,RELATED -j ACCEPT
>>>>
>>>>Forget about this. It makes things easier yes but it is too slow if
>>>>you come under attack...but then you put everything on one box
>>>>seemly so I guess you don't get much traffic.
>>>
>>>How do you recommend dealing with reply packets instead?
>>
>>So to avoid loading the connection tracking module, I would put rules
>>to handle return packets in the proper chain.
> 
> 
> A lot of work has gone into connection tracking and, whilst it is entirely 
> possible to implement it yourself using many flag matches, it's hardly 
> worth it.  Connection tracking works very well for me and I imagine many 
> others, I see no reason to try and circumvent that.
> 
> Is there any good reason not to load connection tracking?

SLOW. It isn't good enough to use on a high traffic server.

You don't even have to use stateful checks. Just do iptables -t nat -L 
-n which will load the conntrack module and boom, you've just slowed 
down your box big time network wise if you have a high packet rate.

