From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Firehol DROPping INVALID
Date: Sun, 6 Jun 2004 15:11:59 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406061511.59730.Antony@Soft-Solutions.co.uk>
References: <20040605201739.GA3481@hindley.uklinux.net>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040605201739.GA3481@hindley.uklinux.net>
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

On Saturday 05 June 2004 9:17 pm, Mark Hindley wrote:

> Hi,
>
> I have asked this on the Firehol lists, but got no response. Hope you
> can help.

I know nothing about (have never heard of) firehol, however here's my 
observation on the rule you've quoted.

> iptables -A OUTPUT -m state --state INVALID -j DROP
>
> Although the comment says this is recommended in the Netfilter HOWTO, I
> cannot find it.

It seems like a rather strange rule to have, to me.   Why would you expect 
your own machine to be generating invalid packets (and therefore go to the 
bother of writing a firewall rule to drop them)?

I'd be interested to know the response you get from the author of firehol if 
you ask for the source of the recommendation.

I can understand why you might want to drop *incoming* invalid packets, but 
outgoing ones would seem to me to be (a) someone else's problem - they can 
decide whether to accept them or not - and (b) an indication of some more 
fundamental problem with whatever application is generating such packets, 
which should be fixed, rather than using netfilter to ignore the problem and 
pretend the packets never happened.

Therefore my recommendation would be to eliminate the above rule altogether.

Most people secure their firewall against inbound problems (INPUT for the 
firewall itself, FORWARD for machines it is routing to) - outbound problems 
should not exist.

Maybe you want to post the rest of your ruleset so we can comment on how 
sensible that seems for you?

Regards,

Antony.

-- 
"The problem with television is that the people must sit and keep their eyes 
glued on a screen; the average American family hasn't time for it."

 - New York Times, following a demonstration at the 1939 World's Fair.

                                                     Please reply to the list;
                                                           please don't CC me.


