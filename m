From: Jason Opperisano <opie@817west.com>
Subject: Re: DNAT/SNAT question
Date: Thu, 14 Apr 2005 19:40:21 -0400
Message-ID: <20050414234021.GA3471@bender.817west.com>
References: <27594E8BA9D5CA458F5EF87D88B6B48F019A90@pxtvjoexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <27594E8BA9D5CA458F5EF87D88B6B48F019A90@pxtvjoexd01.pxt.primeexalia.com>
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

On Thu, Apr 14, 2005 at 04:28:00PM -0700, Gary W. Smith wrote:
> I cleared and reloaded everything and it's now returning an Invalid
> argument error.  
> 
> Fine:
> iptables -t nat -A PREROUTING -d 88.44.55.8/29 -j NETMAP --to
> 10.20.30.8/29
> iptables -t nat -A POSTROUTING -s 10.20.30.8/29  -j NETMAP --to
> 88.44.55.8/29
> 
> Error:
> iptables -t nat -A OUTPUT -d 88.44.55.8/26  -j NETMAP --to 10.20.30.8/29
> iptables: Invalid argument
> 
> Almost there.

aww crap--i had to go an open my big fat mouth without looking at the
dang help file...

NETMAP is only valid in PREROUTING and POSTROUTING...so no dice in
OUTPUT...

looks like you gotta go the old 'for loop' route:

  for i in `seq 8 127`; do
    iptables -t nat -A OUTPUT -d 88.44.55.${i} -j DNAT --to 10.20.30.${i}
  done

sorry 'bout that...

-j

--
"Lois: Meg, I'm like one of those bald eagles you see on the Discovery
 Channel. Beautiful to look at, but mess with one of my chicks and
 I'll claw your fucking eyes out. Now who wants a cookie?
 Stewie: I do. Ooh, keep talking. All this talk about eye-gouging
 has got me all frisky."
        --Family Guy

