From: Jason Opperisano <opie@817west.com>
Subject: Re: Matching IPSEC encapsulated traffic with connection tracking
Date: Thu, 6 Jan 2005 11:29:58 -0500
Message-ID: <20050106162958.GA28501@bender.817west.com>
References: <41DA5373.5080404@gmx.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <41DA5373.5080404@gmx.net>
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

On Tue, Jan 04, 2005 at 09:27:31AM +0100, Robert Dahlem wrote:
> Hi,
> 
> sorry, this is a bit lengthy ...

<snip>

are you running a 2.6 kernel (i can assume that you are, but you know
what that makes us)?

if so, MARK your ESP packets in MANGLE PREROUTING, and use the mark to
identify decrypted packets in your filter rules.

hundreds of examples of this can be found through the list archives or
google.

-j

--
"Lisa, if you don't like your job you don't strike. You just go in
 there every day and do it really half-assed. That's  the American way."
        --The Simpsons

