From: Jason Opperisano <opie@817west.com>
Subject: Re: myfirewall help
Date: Thu, 27 Jan 2005 09:44:03 -0500
Message-ID: <1106837043.5784.36.camel@hubcap.ljm.dom>
References: <1fac6581fa72b3.1fa72b31fac658@vsnl.net>
	<1106835582.5784.16.camel@hubcap.ljm.dom>
	<41F8FC71.7050702@mail.co.gilchrist.fl.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41F8FC71.7050702@mail.co.gilchrist.fl.us>
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
To: netfilter@lists.netfilter.org

On Thu, 2005-01-27 at 09:36, Eric Ellis wrote:
> Jason:
> 
> He has a squid proxy on the other side. :)  3128 is the default for squid.

really?  wow--i didn't know that.

web servers listen on tcp port 80 by default.
squid listens on tcp port 3128 by default.
none of this is new to anyone (hopefully).

now i ask again--explain to me what communication pattern results in a
TCP packet with a source port of 80 and a destination port of 3128.

i would prefer that you provide tcpdump output as part of the reply as
well.

-j

ps--i understand that it's inevitable that eventually a client machine
will use a source port of 3128 when connecting to a web server, and the
reply packets from the web server to the client will actually match this
pattern:  sport=80 dport=3128.  if this is the case that the OP was
trying to account for--then i retract all my posts in this thread.

--
"I've added an extra ingredient just for you.  The merciless peppers
 of Quetzlzacatenango!  Grown deep in the jungle primeval by the
 inmates of a Guatemalan insane asylum."
	--The Simpsons


