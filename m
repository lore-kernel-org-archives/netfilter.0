From: Nigel Metheringham <Nigel.Metheringham@dev.InTechnology.co.uk>
Subject: Re: NAT and MTU issues
Date: Tue, 23 Sep 2003 13:03:09 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1064318589.1153.10.camel@angua.localnet>
References: <1063985328.28941.37.camel@angua.localnet>
	 <1064084662.28506.42.camel@tux.rsn.bth.se>
	 <1064224385.6070.8.camel@angua.localnet>
	 <Pine.LNX.4.58.0309221358460.9262@tux.rsn.bth.se>
	 <1064242324.6070.77.camel@angua.localnet>
	 <1064243316.6070.85.camel@angua.localnet>
	 <Pine.LNX.4.58.0309221739330.9794@tux.rsn.bth.se>
	 <1064245619.6070.94.camel@angua.localnet>
	 <1064250374.28506.110.camel@tux.rsn.bth.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1064250374.28506.110.camel@tux.rsn.bth.se>
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

I've just redone the tests using the ip_nat_core.c with additional
debug, with similar results to last time.  So I then tried a 2.4.22
kernel just to make sure there were no other changes I've missed -
kernel is now a vanilla 2.4.22 plus super-freeswan patches for ipsec and
a few others that don't touch networking at all.

Using just the normal NAT rules, the extra debugging statements are not
triggered at all, and ICMPs (unreach/need-frag) are sent to the
connection originator with the contained packet having the DNAT still in
place (ie the packet source addresses are correct, the destination
addresses are the DNATed versions).

With the MSS clamping mangle rule in place, the debugging lines log for
many many packets (probably all), but no ICMP packets are seen
externally.
        icmp_reply_translation: translating error ce75b800 hook 3 dir REPLY
        icmp_reply: manip 0 dir ORIG hook 0
        icmp_reply: manip 1 dir REPLY hook 4
        icmp_reply: manip 2 dir ORIG hook 4
        icmp_reply: manip 3 dir REPLY hook 0
        icmp_reply_translation: translating error ce75b800 hook 4 dir REPLY
        icmp_reply: manip 0 dir ORIG hook 0
        icmp_reply: manip 1 dir REPLY hook 4
        icmp_reply: inner DST -> 192.168.50.119 1500
        icmp_reply: outer SRC -> 192.168.50.119
        icmp_reply: manip 2 dir ORIG hook 4
        icmp_reply: manip 3 dir REPLY hook 0
        icmp_reply_translation: translating error ce4af1a0 hook 3 dir REPLY
Thats a complete cycle of the logged data (you'll see I set a couple
more of the lines to log as well as the ones in your patch).

	Nigel.
-- 
[ Nigel Metheringham           Nigel.Metheringham@InTechnology.co.uk ]
[ - Comments in this message are my own and not ITO opinion/policy - ]


