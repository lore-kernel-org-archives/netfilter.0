From: Jason Opperisano <opie@817west.com>
Subject: Re: scp and sftp: large files not being transfered
Date: Wed, 22 Sep 2004 16:34:02 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095885242.1891.90.camel@wolfpack.ljm.dom>
References: <20040922180449.65926.qmail@web53101.mail.yahoo.com>
	<200409221601.04310.Alistair@nerdnet.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200409221601.04310.Alistair@nerdnet.ca>
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
To: netfilter@lists.netfilter.org

On Wed, 2004-09-22 at 16:01, Alistair Tonner wrote:
> 
> 	I can't recall off the top of my head *which* ICMP messages I had to let back 
> in ...but they fixed the issue.

ICMP Type 3

technically, they *should* be ICMP Type 3 Code 4:  Fragmentation Needed
and Don't Fragment was Set, but i've noticed that some stacks will just
send a type 3 code 0 (net unreachable) or code 1 (host unreachable).

ICMP has gotten a bad rep with firewall guys over the past few years. 
it is a Good Thing (tm); IMHO, to allow ICMP Types 3, 11, and 12 through
your firewall to allow the stack to do it's magic ("-m state --state
RELATED" will not magically catch all of these for you).

references:


        http://www.iana.org/assignments/icmp-parameters

        http://rfc.net/rfc1191.html

-j

-- 
Jason Opperisano <opie@817west.com>


