From: Nigel Metheringham <Nigel.Metheringham@dev.InTechnology.co.uk>
Subject: Re: NAT and MTU issues
Date: Mon, 22 Sep 2003 10:53:05 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1064224385.6070.8.camel@angua.localnet>
References: <1063985328.28941.37.camel@angua.localnet>
	 <1064084662.28506.42.camel@tux.rsn.bth.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1064084662.28506.42.camel@tux.rsn.bth.se>
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
To: Martin Josefsson <gandalf@wlug.westbo.se>
Cc: Netfilter <netfilter@lists.netfilter.org>

On Sat, 2003-09-20 at 20:04, Martin Josefsson wrote:
> Gah, I hoped we had fixed all these problems. Getting all the
> corner-cases right isn't as easy as one thinks when we perform multiple
> translations.

:-)

> Is the NAT-rules on the machine that has the tunnel? If they are that
> might explain a thing or two since the code looks correct for the case
> where the packets pass through and another machine down the pipe sends
> the icmp message back.

Yes - all of this is on one machine.
One interface has the effective  listening port on it, another interface
of the same box has the ipsec0 interface layered on top.

	Nigel.
-- 
[ Nigel Metheringham           Nigel.Metheringham@InTechnology.co.uk ]
[ - Comments in this message are my own and not ITO opinion/policy - ]


