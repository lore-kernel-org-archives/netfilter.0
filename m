From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Can reach some websites, can't reach others
Date: Sat, 22 May 2004 13:28:33 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405221328.33189.Antony@Soft-Solutions.co.uk>
References: <20040522115927.GA18767@localnet>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040522115927.GA18767@localnet>
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
To: netfilter@lists.netfilter.org

On Saturday 22 May 2004 12:59 pm, Sven Riedel wrote:

> Hi,
> I'm using a Linux 2.6.6 box as a masquerading firewall via dialup for a
> local network. From the internal network I can reach some websites (e.g.
> www.debian.org) but can't reach others (e.g. www.freshmeat.net). The
> unreachable sites _can_ be reached from the firewall-box itself though.

This sounds like an MSS / MTU mismatch poblem.   Try doing a Google search for 
"clamp MSS to MTU" - that should give you some pointers.

Can't offer specific advice myself since I've never experienced the problem, 
but I've seen it here from others several times before.

Regards,

Antony.

-- 
Most people are aware that the Universe is big.

 - Paul Davies, Professor of Theoretical Physics

                                                     Please reply to the list;
                                                           please don't CC me.


