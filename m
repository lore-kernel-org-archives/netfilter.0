From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Email Server Timeouts
Date: Thu, 19 Feb 2004 19:15:44 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402191915.45211.Antony@Soft-Solutions.co.uk>
References: <20040218203304.24484.34213.Mailman@netfilter-sponsored-by.noris.net> <3515.192.168.2.103.1077216554.squirrel@mail.empirekosher.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3515.192.168.2.103.1077216554.squirrel@mail.empirekosher.com>
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

On Thursday 19 February 2004 6:49 pm, Corey Furman wrote:

> Thanks, Antony.  Just because I do a thing, doesn't mean I know why I do
> it :P
>
> I (believe it or not) close those ports because I did not think anything
> would use them, and I sort of approach the firewall as:
>     + close everything
>     + poke holes where needed

That is a good approach, however I think you need to read about what 
"stateful" means for netfilter, because this feature means you can block all 
inbound ports, *except the ones needed for replies, on connections which are 
current*, with only a singel rule in your INPUT chain.

> This may sound like a stupid question, but why aren't the SMTP and POP
> ports sufficient?

Those are destination ports.   Your INPUT rule was blocking the replies back 
to the source ports.

In case you're not sure how TCP and UDP connections work, a machine connects 
*to* a well-known port number (eg TCP port 25 in the case of SMTP), but it 
connects *from* more or less any port it likes (from 1 to 65535), depending 
on what it happens to choose at the time the connection gets made (yes, 
successive connections will use different source port numbers).

It is important that your ruleset allows in the reply packets, as well as 
allowing out the initial connection packet.

In fact, just as a reminder, I will choose the sig on this email 
specifically...

Regards,

Antony.

-- 
90% of networking problems are routing problems.
9 of the remaining 10% are routing problems in the other direction.
The remaining 1% might be something else, but check the routing anyway.

                                                     Please reply to the list;
                                                           please don't CC me.


