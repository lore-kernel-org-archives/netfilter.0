From: Dominic Iadicicco <sctylib2004@yahoo.com>
Subject: Re: Can anyone tell me how to do this?
Date: Thu, 23 Sep 2004 09:58:47 -0700 (PDT)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040923165847.46091.qmail@web51303.mail.yahoo.com>
References: <1095956124.6715.8.camel@wolfpack.ljm.dom>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1095956124.6715.8.camel@wolfpack.ljm.dom>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@lists.netfilter.org>

Jason:

  Thats a perfectly good question.

   I am tring to learn how to use iptables.  I have
read a lot of documentation but am not having to much
success. So my whole goal in this is just to learn.
:)


Thanks.

Dom
--- Jason Opperisano <opie@817west.com> wrote:

> On Thu, 2004-09-23 at 11:14, Dominic Iadicicco
> wrote:
> > yes
> > 
> > > wrote: On Thu, 2004-09-23 at 09:22, Dominic
> Iadicicco wrote:
> > > ok, I have another one for all.
> > > 
> > > I have now been tring to do this:
> > > 
> > > I have an IP, 10.0.0.1 on eth1 and an IP
> 172.16.12.130
> > > at eth0. And heres were things get fun. I want
> all
> > > ssh requests that go to 10.0.0.1 to get routed
> to
> > > 172.16.12.130 just like it worked when we did it
> from
> > > .130 to .212. (if anyone is new and doesn't what
> was
> > > discussed yesterday, please let me know I will
> post
> > > it.)
> > 
> > are 10.0.0.1 and 172.16.12.130 on the same
> physical machine?
> > 
> > -j
> 
> i hate answering questions with the "why don't you
> just do it this way"
> response, but here goes...
> 
> if you have SSH connections being received on
> 10.0.0.1, and that machine
> also has an IP of 172.16.12.130, why don't you just
> accept the
> connections on 10.0.0.1?
> 
> -j
> 
> -- 
> Jason Opperisano <opie@817west.com>
> 
> 
> 


		
_______________________________
Do you Yahoo!?
Declare Yourself - Register online to vote today!
http://vote.yahoo.com

