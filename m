From: Jason Opperisano <opie@817west.com>
Subject: Re: Fwd: Newbie Q: Forcing p2p traffic via one interface on a dual
	homed system.
Date: Mon, 29 Nov 2004 09:31:21 -0500
Message-ID: <1101738680.10064.39.camel@hubcap.ljm.dom>
References: <1bcb81340411281238368cf6b3@mail.gmail.com>
	<1101692026.10064.32.camel@hubcap.ljm.dom>
	<1bcb813404112901054f920830@mail.gmail.com>
	<1bcb81340411290115f7113c6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1bcb81340411290115f7113c6@mail.gmail.com>
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

On Mon, 2004-11-29 at 04:15, hArTh0 hArTh0 wrote:
> Hmmm I see what you mean.
> 
> I guess the ipp2p module is normally used to prioritise traffic rather
> than re-route it.
> 
> Could some one suggest an appropriate general strategy that I could
> use solve my original problem i.e. selectively force p2p traffic to
> traverse ppp1?

how about forcing all easily identifiable traffic over ppp0 and send
everything else (which should be p2p) over ppp1?

-j

--
"I've always wondered if there was a god. And now I know there is --
 and it's me."
	--The Simpsons


