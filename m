From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: netfilter machine in between 2 servers
Date: Sun, 14 Mar 2004 19:57:51 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403141957.51946.Antony@Soft-Solutions.co.uk>
References: <20040314194725.94092.qmail@web60002.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040314194725.94092.qmail@web60002.mail.yahoo.com>
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

On Sunday 14 March 2004 7:47 pm, Sandy C wrote:

> --- Antony Stone wrote:
>
> > Besides, why do you want netfilter to do your logging, if you can run
> > ethereal?   You get a lot more information out of ethereal, and it can
> > show you the protocols in a much more meaningful manner.
>
> I really need something that can do a little bit of
> both.  I need to be able to sniff the packets (ala
> ethereal), and if they are of a certain type, I need
> to take some action on them (ala netfilter) I'd prefer
> not to do any routing.
>
> Now you've spelled it out though, its not clear to me
> if its possible.

Think of the setup like this:

One machine (client or server) sends a packet to the other, and that packet 
also gets picked up by the sniffer.

It's too late then to think about doing any filtering, or other action to 
change the packet, because by the time the sniffer has seen it, so has the 
machine it was addressed to (server or client).

I hope this explains why you cannot possibly do what you wanted.

Regards,

Antony.

-- 
People who use Microsoft software should be certified.

                                                     Please reply to the list;
                                                           please don't CC me.


