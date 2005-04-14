From: Jason Opperisano <opie@817west.com>
Subject: Re: DNAT/SNAT question
Date: Thu, 14 Apr 2005 13:57:23 -0400
Message-ID: <20050414175723.GA2234@bender.817west.com>
References: <27594E8BA9D5CA458F5EF87D88B6B48F019A8A@pxtvjoexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <27594E8BA9D5CA458F5EF87D88B6B48F019A8A@pxtvjoexd01.pxt.primeexalia.com>
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

On Thu, Apr 14, 2005 at 10:49:30AM -0700, Gary W. Smith wrote:
> Jason, 
> 
> So I would do something like 
> [0:0] -A PREROUTING -d 66.121.12.64/26 -j NETMAP --to 10.0.12.64/26
> Instead of:
> [0:0] -A PREROUTING -d 66.121.12.64 -j DNAT --to-destination 10.0.12.64

yes.

> And 
> [0:0] -A POSTROUTING -d 10.0.12.64/26 -j NETMAP --to 66.121.12.64/26

change that to:  -s 10.0.12.64/26 ...

> Instead of:
> [0:0] -A POSTROUTING -o eth0 -s 10.0.12.64 -j SNAT --to-source
> 66.121.12.64
> 
> And 
> [0:0] -A OUTPUT -d 66.121.12.64/26 -j NETMAP --to OUTPUT 10.0.12.64/26

get rid of the wayward "OUTPUT"

> Instead of:
> [0:0] -A OUTPUT -d 66.121.12.64 -j DNAT --to-destination 10.0.12.64
> 
> Is this correct?

aside from what appears to be some errant copy & paste details, yes.

> Please note, not valid external IP's...

noted.

-j

--
"Peter: This party couldn't be better if Jesus was here.
 Jesus: For my next miracle, I will turn water... into FUNK."
        --Family Guy

