From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: NAT and MTU issues
Date: Sat, 20 Sep 2003 21:04:23 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1064084662.28506.42.camel@tux.rsn.bth.se>
References: <1063985328.28941.37.camel@angua.localnet>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1063985328.28941.37.camel@angua.localnet>
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
To: Nigel Metheringham <Nigel.Metheringham@InTechnology.co.uk>
Cc: Netfilter <netfilter@lists.netfilter.org>

On Fri, 2003-09-19 at 17:28, Nigel Metheringham wrote:

> Having looked closer at this I find there is an ICMP dest unreach packet
> emitted from my box back to the originator.  However inside the packet
> the SNAT has been undone, but the DNAT is still in place.
> 
> Any ideas how I can fix this...?
> This is all on a 2.4.21 kernel.

Gah, I hoped we had fixed all these problems. Getting all the
corner-cases right isn't as easy as one thinks when we perform multiple
translations.
I've looked at the code responsible for the rewriting of the inner
ipheader and it looks ok to me.

Is the NAT-rules on the machine that has the tunnel? If they are that
might explain a thing or two since the code looks correct for the case
where the packets pass through and another machine down the pipe sends
the icmp message back.

-- 
/Martin

