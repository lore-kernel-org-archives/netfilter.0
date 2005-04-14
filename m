From: Jason Opperisano <opie@817west.com>
Subject: Re: DNAT/SNAT question
Date: Thu, 14 Apr 2005 13:28:41 -0400
Message-ID: <20050414172841.GA2134@bender.817west.com>
References: <27594E8BA9D5CA458F5EF87D88B6B48F019A89@pxtvjoexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <27594E8BA9D5CA458F5EF87D88B6B48F019A89@pxtvjoexd01.pxt.primeexalia.com>
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

On Thu, Apr 14, 2005 at 10:25:27AM -0700, Gary W. Smith wrote:
> I have a set of external IP's which are SNAT'd/DNAT's to a private
> range.  On this particular network there are 64 of them.  In the part we
> create a 1:1 SNAT and a 1:1 DNAT for each IP.  Since we have a /26 is it
> possible to do this in a single line rather than having 64 entries?  I
> know that if we specificy multiple --souce or --destinations it says it
> will do round robin, which is not what we want.

this is the job of the NETMAP target.  and you would do it in two rules,
one POSTROUTING (SNAT), and one PREROUTING (DNAT).

HTH...

-j

--
"Stewie: HA! That's so funny I forgot to laugh! Excluding that first
 'ha.'"
        --Family Guy

