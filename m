From: Jason Opperisano <opie@817west.com>
Subject: Re: Possibility to lock iptables rules.
Date: Wed, 20 Apr 2005 18:01:23 -0400
Message-ID: <20050420220123.GA25652@bender.817west.com>
References: <1113994155.31280.29.camel@localhost.localdomain>
	<20050420184753.GA25069@bender.817west.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20050420184753.GA25069@bender.817west.com>
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
To: netfilter@lists.netfilter.org

On Wed, Apr 20, 2005 at 02:47:53PM -0400, Jason Opperisano wrote:
> i'm guessing you're thinking about how the *BSD's have a concept of
> kern.securelevel, and certain things (like firewall rules) become
> immutable; even by root, at certain levels.
> 
> i'm not a kernel programmer, but i can tell you that the linux kernel
> doesn't have anything like kern.securelevel; and without it, i don't
> believe what you're asking for is possible.  i'd also figure that
> implementing kern.securelevel in the linux kernel would be beyond the
> scope of what the netfilter developers are responsible for.

after pondering this further (post-post, natch)...i had a thought 
(yes--it hurt).  you could probably use SELinux to achieve this.  the
minimal benefits that others have pointed out, and the overly complex
nature of SELinux probably yields a pretty low benefit/cost ratio,
though.

just a thought...

-j

--
"Peter: Wow, is that really the blood of Christ?
 Preacher: Yes, it is.
 Peter: Holy crap, that guy must've been wasted 24 hours a day."
        --Family Guy

