From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: using iptables to route between public networks
Date: Tue, 23 Dec 2003 12:16:39 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1072199798.3572.470.camel@grendel>
References: <001301c3c96a$060086c0$0100a8c0@KARI>
	 <200312231542.48587.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200312231542.48587.Antony@Soft-Solutions.co.uk>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.netfilter.org

I replied to Matthew off-list on this one. Note the last two lines. "It
works" because he sets a default ACCEPT policy and then flushes the
previous rules. 

You are right about the syntax on the first two lines, but iptables is
smart enough to correct it and implements 209.210.10.0/28.

C


On Tue, 2003-12-23 at 10:42, Antony Stone wrote:
> On Tuesday 23 December 2003 3:32 pm, Matthew Simpson wrote:
> 
> > I must have been doing something stupid last night, because I retried it
> > this morning and it works.  Here is what I have for the forward chain:
> >
> > $IPTABLES -A FORWARD -d 209.210.10.1/28 -j ACCEPT
> > $IPTABLES -A FORWARD -d ! 209.210.10.1/28 -j DROP
> > $IPTABLES -P FORWARD ACCEPT
> > $IPTABLES -F FORWARD
> >
> > This works.
> 
> When you say "this works", is assume that's only for minimal values of 
> "working" :)
> 
> I can't believe that a router which will drop all packets except those 
> addressed to 209.210.10.0/28 (note that your address designation is slightly 
> incorrect above) will do an effective job.
> 
> You may want to route inbound packets only to these IP addresses, but what 
> about the replies?   They are going to be going to other destination 
> addresses, and need routing too.....
> 
> Antony.


