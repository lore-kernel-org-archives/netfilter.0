From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: NAT and MTU issues
Date: Mon, 22 Sep 2003 19:06:15 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1064250374.28506.110.camel@tux.rsn.bth.se>
References: <1063985328.28941.37.camel@angua.localnet>
	 <1064084662.28506.42.camel@tux.rsn.bth.se>
	 <1064224385.6070.8.camel@angua.localnet>
	 <Pine.LNX.4.58.0309221358460.9262@tux.rsn.bth.se>
	 <1064242324.6070.77.camel@angua.localnet>
	 <1064243316.6070.85.camel@angua.localnet>
	 <Pine.LNX.4.58.0309221739330.9794@tux.rsn.bth.se>
	 <1064245619.6070.94.camel@angua.localnet>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1064245619.6070.94.camel@angua.localnet>
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
To: Nigel Metheringham <Nigel.Metheringham@dev.InTechnology.co.uk>
Cc: Netfilter <netfilter@lists.netfilter.org>

On Mon, 2003-09-22 at 17:46, Nigel Metheringham wrote:

> > If you add that mangle rule you don't see any icmp packets on the wire but
> > you see the icmp_reply messages?
> 
> yup.
> 
> With no mangle rule I get broken ICMP frag-needed messages on the wire
> and your debug messages do not trigger.
> 
> With the mangle rule I see no ICMP on the wire but the debug messages
> trigger frequently (ie probably once per packet).
> 
> I'm confused too!

I think I'll set up something that reminds of your situation here to be
able to more clearly see what's going on, this sounds very weird...

-- 
/Martin

