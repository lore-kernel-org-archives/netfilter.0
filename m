From: Jason Opperisano <opie@817west.com>
Subject: Re: Problem Matching Packets
Date: Tue, 5 Apr 2005 17:33:46 -0400
Message-ID: <20050405213346.GA4000@bender.817west.com>
References: <20050405221146.GB31371@gw.home.tux-labor.de>
	<20050405211045.GA3933@bender.817west.com>
	<20050405223129.GC31371@gw.home.tux-labor.de>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20050405223129.GC31371@gw.home.tux-labor.de>
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
To: Sebastian Docktor <sebi@tux-labor.de>
Cc: netfilter@lists.netfilter.org

On Wed, Apr 06, 2005 at 12:31:29AM +0200, Sebastian Docktor wrote:
> Yes I am doing this, is this a Problem, i want to redirect all these
> Packet to a speciall Machine.

yeah--it's a problem.  the "correct" way to do this (if there even is
one) is to write some sort of proxy to catch the broadcasts and resend
the data to the "special machine."  much of this depends on what the
application in question is actually doing.

another possible option would be to setup a GRE tunnel to get the native
broadcasts to reach the "special machine" without proxying.

-j

--
"Meg: Brian, you look like you lost weight! What is your secret?
 Brian: Here's my secret. PUT DOWN THE FORK!"
        --Family Guy

