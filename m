From: "Knight, Steve" <Steve.Knight@bskyb.com>
Subject: RE: thoughts on a newbie tutorial i'll be giving shortly
Date: Thu, 30 Oct 2003 14:31:59 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FDB52A0429DFD31196FB0008C7D972D50EA57909@OST_EXCH_USR5>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: iptables mailing list <netfilter@lists.netfilter.org>

Thanks to both the Robs [and the other contributors I hope I've thanked
already!] :D

At the moment, it's a single host - but it will eventually be acting as the
single gateway for a 192.168.x.x LAN + DMZ, and I will be implementing a
fairly strict ruleset on the FORWARD chain [there are some monkeys who'd be
Kazaaing and IRCing in a moment if I didn't] - which is why I'm trying all
sorts of mojo on the INPUT/OUTPUT chains right now so I can get comfortable
with the syntax.

Ive relented for the moment [for testing purposes] to OUTPUT ACCEPT policy
and of course it's working as expected, but I'm intrigued as to why the
rules didn't work.

I almost feel like apologising for the lame questions, as the majority of
contributors to this list are clearly seasoned veterans, but I really am
determined to get myself up to speed [hence the purchase of the Ziegler
bible] with iptables and *nix security more as a personal mission [to become
as comfortable with *nix as I am with Windows], than a business need [if it
was only business I'd have used ISA or Checkpoint, which I have my certs
in].

Cheers

Steve


-----------------------------------------------------------------------
Information in this email may be privileged, confidential and is 
intended exclusively for the addressee.  The views expressed may
not be official policy, but the personal views of the originator.
If you have received it in error, please notify the sender by return
e-mail and delete it from your system.  You should not reproduce, 
distribute, store, retransmit, use or disclose its contents to anyone.
 
Please note we reserve the right to monitor all e-mail
communication through our internal and external networks.
-----------------------------------------------------------------------


