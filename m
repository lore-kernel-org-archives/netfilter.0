From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: Blocking Netranges Based on IP-to-Country CSV
Date: Mon, 20 Sep 2004 08:16:40 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095682599.1779.106.camel@grendel>
References: <7EACCDBB65D37443912D80713CC1245D02382B06@fsnsab20.losangeles.af.mil>
	<20040917114613.GP452@metastasis.org.uk>
	<1403218a0409190209416c12b9@mail.gmail.com>
	<20040919110111.GA706@metastasis.org.uk>
	<1403218a04091904173de016ea@mail.gmail.com>
	<3063e504091904456844d5cf@mail.gmail.com>
	<20040920115357.GE3786@metastasis.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040920115357.GE3786@metastasis.org.uk>
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
To: Nick Drage <nickd@metastasis.org.uk>
Cc: netfilter <netfilter@lists.netfilter.org>

On Mon, 2004-09-20 at 07:53, Nick Drage wrote:
>
> > So, whats the reason is banning some countryes?
> 
> Imagine
> I'm going travelling, and I know I'm only going to South America, so I
> want to open up my ssh daemon to more addresses.  However I don't want
> to permit the entire Internet to have a go at the daemon, but I'm
> willing to open it up to South America to increase the risk slightly
> in return for permitting myself SSH access wherever I am.

Well said. I find it kind of strange that people are cool with blocking
ranges of ports, but as soon as you get into blocking ranges of IP
addresses they get squeamish and may even label you a bigot.

Its simply a matter of risk Vs. business need. My business model
requires an SMTP server so I accept the risk of exposing that port to
Internet access. My business model *does not* require NetBIOS/IP, so
those ports are obviously blocked. Why accept the risk involved if there
is no business argument for it?

Blocking IP ranges is exactly the same thing. If I do business in
Canada, the UK, etc., then obviously I have to accept the risk of
exposing my services to those IP blocks. If I don't do business in China
and know I never will, what's the point in accepting the risk of attack
from that country?

Cheers,
Chris



