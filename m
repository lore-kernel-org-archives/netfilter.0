From: Sandy C <sc_netfiltermail@yahoo.com>
Subject: Re: netfilter machine in between 2 servers
Date: Sun, 14 Mar 2004 11:47:25 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040314194725.94092.qmail@web60002.mail.yahoo.com>
References: <200403141841.04635.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200403141841.04635.Antony@Soft-Solutions.co.uk>
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
To: netfilter@lists.netfilter.org


--- Antony Stone <Antony@Soft-Solutions.co.uk> wrote:
> On Sunday 14 March 2004 6:27 pm, Sandy C wrote:
> 
> >    Otherwise how hard would it be to go into the
> code and make iptables
> > recognize broadcast packets ala ethereal?
> 
> If by "broadcast" you mean "packets sent to an IP
> subnet broadcast address" 
> the netfilter will do that already.
> 
> However, I don't think you do mean that, I think you
> mean "packets which 
> happen to come out of all sockets on a hub", and the
> answer is "very 
> difficult" because netfilter is plugged into the
> routing mechanism, and the 
> routing mechanism just doesn't see packets which
> aren't addressed to the 
> machine, either as an endpoint or as a router.

Correct, this is really what I meant. Didn't realize
you were psychic as well :-)

> Besides, why do you want netfilter to do your
> logging, if you can run 
> ethereal?   You get a lot more information out of
> ethereal, and it can show 
> you the protocols in a much more meaningful manner.

I really need something that can do a little bit of
both.  I need to be able to sniff the packets (ala
ethereal), and if they are of a certain type, I need
to take some action on them (ala netfilter) I'd prefer
not to do any routing.

Now you've spelled it out though, its not clear to me
if its possible.

Thanks!
S


__________________________________
Do you Yahoo!?
Yahoo! Mail - More reliable, more storage, less spam
http://mail.yahoo.com

