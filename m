From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: NAT and MTU issues
Date: Mon, 22 Sep 2003 17:41:26 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.58.0309221739330.9794@tux.rsn.bth.se>
References: <1063985328.28941.37.camel@angua.localnet> 
 <1064084662.28506.42.camel@tux.rsn.bth.se>  <1064224385.6070.8.camel@angua.localnet>
  <Pine.LNX.4.58.0309221358460.9262@tux.rsn.bth.se>  <1064242324.6070.77.camel@angua.localnet>
 <1064243316.6070.85.camel@angua.localnet>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1064243316.6070.85.camel@angua.localnet>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nigel Metheringham <Nigel.Metheringham@dev.InTechnology.co.uk>
Cc: Netfilter <netfilter@lists.netfilter.org>

On Mon, 22 Sep 2003, Nigel Metheringham wrote:

> Took a closer look.
> If I put that mangle rule in then:-
>       * I see no ICMP packets on the wire between the originating box
>         and the linux g/w (tested in 2 places to make sure I don't have
>         any packet sniffing/netfilter interactions).  Previously I saw
>         ICMP need frag packets as quoted above
>       * those icmp_reply log messages appear to fire on each and every
>         packet
>
>    icmp_reply: outer SRC -> 192.168.50.119
>    icmp_reply: inner DST -> 192.168.50.119 1500

Uhm, let me see if I got this right...

If you add that mangle rule you don't see any icmp packets on the wire but
you see the icmp_reply messages?

Or do you see those messages when you don't have the rule and thus see the
icmp packets?

/Martin

