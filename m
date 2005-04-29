From: Jason Opperisano <opie@817west.com>
Subject: Re: Delay in responding caused by netfilter ?
Date: Fri, 29 Apr 2005 10:25:17 -0400
Message-ID: <20050429142517.GA1074@bender.817west.com>
References: <42721F84.6080503@mnemon.de>
	<200504290937.49507.Alistair@nerdnet.ca>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200504290937.49507.Alistair@nerdnet.ca>
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

On Fri, Apr 29, 2005 at 09:37:49AM -0400, Alistair Tonner wrote:
> I'm wondering if that pop3 server is trying to do an identd check on the 
> connection that is getting *b0rked* with the firewall up.  Try that dump 
> again and loosen the filter a tad.

i'd second that notion.  setup the OUTPUT chain to allow everything and
see if that fixes it.  if it does--figure out what traffic you need to
be allowing out to prevent the delay.

-j

--
"Peter: We love the Bible in this house.
 Francis: Really. What's your favorite book of the Bible?
 Peter: Uhhhhh... the book where Jesus swallows the puzzle piece and
 the man in the yellow hat has to take him to the hospital."
        --Family Guy

