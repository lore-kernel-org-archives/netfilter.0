From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: Dropping RST of SYN
Date: Mon, 08 Sep 2003 07:29:22 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F5C6812.2040407@chrisbrenton.org>
References: <1063000297.827.26.camel@india.nsecure.net> <3F5C539E.8030704@chrisbrenton.org> <20030908204206.C148.ATNAK@chejz.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Atsushi Nakagawa <atnak@chejz.com>
Cc: "Dharmendra.T" <dharmu@nsecure.net>, Ralf Spenneberg <lists@spenneberg.org>, Netfilter <netfilter@lists.netfilter.org>

Atsushi Nakagawa wrote:
> 
> Ralf's response was to a question regarding the removal of outgoing RST
> packets that are generated in reply to incoming SYN packets.  (These
> RSTs being the kind that causes the "Connection Refused" TCP message)

DOOOOH!

> In this case, there should be no consequences with SYN flood-type
> attacks.  The only ill-effect, AFAIK, is with abortive disconnects not
> reaching remote host (and remote host will resend obselete packets
> little more times).  --A problem enough to deter me from implmementing
> this.

Guess that's what I get for jumping in mid thread. :(

I think I'm at a loss as to why we are trying to do it this way. In 
other words, if you want to stop a scanner from getting a reply from all 
of your closed ports, would it not be easier to only let SYN packets in 
to legitimate services?

Or is this another "we're a .edu stuck in Dante's fourth circle of hell 
and are not permitted to filter out services". ;-)

C


