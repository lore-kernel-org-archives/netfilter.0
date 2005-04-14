From: Jason Opperisano <opie@817west.com>
Subject: Re: DNAT/SNAT question
Date: Thu, 14 Apr 2005 19:16:36 -0400
Message-ID: <20050414231636.GA3376@bender.817west.com>
References: <27594E8BA9D5CA458F5EF87D88B6B48F019A8F@pxtvjoexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <27594E8BA9D5CA458F5EF87D88B6B48F019A8F@pxtvjoexd01.pxt.primeexalia.com>
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

On Thu, Apr 14, 2005 at 04:08:08PM -0700, Gary W. Smith wrote:
> I'm almost there.  I get an error when trying to use NETMAP in the
> OUTPUT chain.  Is there something else I need to add?
> 
> iptables -t nat -A OUTPUT -d 88.44.55.8/26  -j NETMAP --to 10.20.30.8/26
> iptables v1.2.11: Bad network address `10.20.30.8/26'

'nother typo:  the network address for 10.20.30.8/26 is 10.20.30.0 not
.8.  i thought we agreed on 10.20.30.8/29?

-j

--
"Lois: $49.95? Are you sure we can afford this?
 Peter: Lois, our relationship can not be measured in nipples and
 dimes... nickels and boobs... money."
        --Family Guy

