From: Jason Opperisano <opie@817west.com>
Subject: Re: IP packet logging  function help
Date: Fri, 20 May 2005 11:33:35 -0400
Message-ID: <20050520153335.GA11764@bender.817west.com>
References: <20050520124142.88156.qmail@web33001.mail.mud.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20050520124142.88156.qmail@web33001.mail.mud.yahoo.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilterusers <netfilter@lists.netfilter.org>

On Fri, May 20, 2005 at 05:41:42AM -0700, cranium2003 wrote:
> hello,
>        Sorry i was hurry to know how to do what i want
> by reading
> > > >Because, in some table it is simply not yet
> > > > determined, and you won't
> > > > change anything about that by meddling with the
> > > > generic target function
> > > > call site.
>      Your question is 
> > > >So, in which iptables table do you intend to get 
> at the output device?
>      I want to know this in NAT table. 
> regards,
> cranium

the output device is only known to the kernel after the routing decision
has been made, until that point there's nothing you can do to magically
make the output device "appear."  netfilter hooks before the routing
decision is made (i.e. there is no output device determined yet):

  table		chain
  -----		-----
  mangle	PREROUTING
  mangle	OUTPUT

  nat		PREROUTING

there's also no output device when dealing with any of the INPUT chains
(not applicable).

-j

--
"Lois: Oh my god. you can only play the piano when you're drunk.
 Peter: That's not true. I can also vomit, fall over, and make dirty
 calls to your sister."
        --Family Guy

