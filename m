From: Jason Opperisano <opie@817west.com>
Subject: Re: Fwd: Linux as router (Gateway Server)
Date: Mon, 14 Feb 2005 17:15:10 -0500
Message-ID: <1108419310.4338.4.camel@hubcap.ljm.dom>
References: <1dceb012050211233357e23dd4@mail.gmail.com>
	<1dceb01205021123483860fb86@mail.gmail.com>
	<1108216901.4462.27.camel@hubcap.ljm.dom>
	<4f3930a705021214026db11902@mail.gmail.com>
	<420EB7C3.7040303@hotpop.com>
	<4f3930a70502121833627af1bd@mail.gmail.com>
	<420F4010.7050609@hotpop.com>
	<4f3930a705021313382ed454fe@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <4f3930a705021313382ed454fe@mail.gmail.com>
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

On Sun, 2005-02-13 at 16:38, Josh Nerius wrote:
> Navneet,
> 
> I had the same issue you are experiencing while using SquidGuard some
> time back. The resolution was playing with accepting traffic from and
> to 127.0.0.1. I honestly don't remember the exact rules as it was some
> time ago I dealt with this issue, but a minor amount of
> experimentation should prove to solve the issue. I'm currently digging
> through old configs etc and will let you know if/when I find the exact
> rules I put in place to resolve the issue.
> 
> I hope everything works out for you.

didn't someone in this thread already point out that his rules don't
include:

  iptables -A INPUT -i lo -j ACCEPT
  iptables -A OUTPUT -o lo -j ACCEPT

-j

--
"Asleep at the switch?  I wasn't asleep, I was drunk!"
	--The Simpsons


