From: Phil Howard <phil-netfilter@ipal.net>
Subject: Re: how to block 10000's of addresses?
Date: Sun, 13 Oct 2002 09:56:28 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021013095628.D15824@hamal.ipal.net>
References: <20021013080034.B15824@hamal.ipal.net> <Pine.LNX.4.44.0210130946230.16584-100000@localhost.localdomain>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0210130946230.16584-100000@localhost.localdomain>; from rpjday@mindspring.com on Sun, Oct 13, 2002 at 09:47:56AM -0400
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
To: netfilter mailing list <netfilter@lists.netfilter.org>

On Sun, Oct 13, 2002 at 09:47:56AM -0400, Robert P. J. Day wrote:

| On Sun, 13 Oct 2002, Phil Howard wrote:
| 
| > On Sun, Oct 13, 2002 at 01:10:23PM +0100, Antony Stone wrote:
| > 
| > | On Sunday 13 October 2002 12:50 pm, Phil Howard wrote:
| > | 
| > | > I would like to know how best to block 10000's of addresses using
| > | > netfilter.  Clearly I do not want to be placing 10000's of individual
| > | > filter table entries in.
| > | 
| > | Sounds like an incompatible set of requirements.   If you want to block 10000 
| > | addresses (and assuming they don't fit into contiguous network ranges) then 
| > | you need 10000 rules to be able to specify what you want to block.
| > 
| > They in fact are 10000+ different netblocks.
| 
| can you perhaps explain just a bit of the rationale for what
| you're doing?  it's not often that one has to block that many
| independent, non-related IP addresses.  just curious.  i mean, 
| if it were just for filtering SPAM, you could use other tools.

The initial inspiration is for filtering spam.  But I can see other
uses, and am looking at this for broader re-usable purposes which
would be initially deployed to filter spamming servers.

What other tools are you referring to?  Currently I use tools that
work in an SMTP daemon of my MTA to refuse mail.  But I am wanting
to go beyond that, especially considering some places just keep
pounding on SMTP to deliver spam despite getting permanent 5XX
rejections of months or even a couple years.  Are there other tools
you are thinking of besides this?

-- 
-----------------------------------------------------------------
| Phil Howard - KA9WGN |   Dallas   | http://linuxhomepage.com/ |
| phil-nospam@ipal.net | Texas, USA | http://ka9wgn.ham.org/    |
-----------------------------------------------------------------

