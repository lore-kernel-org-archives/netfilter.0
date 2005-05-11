From: Jason Opperisano <opie@817west.com>
Subject: Re: captive web system using DNAT and SNAT
Date: Wed, 11 May 2005 14:49:45 -0400
Message-ID: <20050511184945.GA13612@bender.817west.com>
References: <200505110139.50503.dcinege-mlists@psychosis.com>
	<428250BD.3020304@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <428250BD.3020304@riverviewtech.net>
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

On Wed, May 11, 2005 at 01:36:45PM -0500, Taylor, Grant wrote:
> Very interesting.  This makes me think that there is a kernel routing 
> caching type issue.  I expect that if this is indeed the case there could 
> (or should) easily be a way to flush said cache or adjust a garbage 
> collection interval.  This might need to be (summarized and) cross posted 
> to a kernel developers mailing list to get their thoughts on it.

i'm pretty sure there's a known memory leak related to the kernel route
cache in the 2.6 kernel (don't recall kernel version the OP has), that
should have been fixed in 2.6.11.

-j

--
"Susan Sarandon: I'm Susan Sarandon. Most of you know me as Tim
 Robbins' mother, but actually I'm his wife!"
        --Family Guy

