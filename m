From: Jordan Griege <jgriege@cloudflare.com>
Subject: nf_queue flush on deletion
Date: Mon, 13 Jun 2022 15:36:55 -0500
Message-ID: <CA+=Uk6bgPJtcF3XDtraF0vHL8EmY+hqAwXhmzqka5HwDL_jnBg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=JqrxzV5Mqcn0Dz5krJogkZPbo7ognd/hlEQ4b6EZib4=;
        b=e9QQa1OkfdoJRbqzcmh5ggso79WQT1Vdu6BGbelWLrgD6y5LdW0MKTpOgRlJTtbsc1
         bXDM6eIeRWYcTbVacLS7fh1QIUcBgWS7CT8tOYYjlwIGHUsEKMuTRPa/N4ZjXUYkJ7b3
         TIKvxpJbRcTMEsnY0MROgvjSCV4WlMGipZlLU=
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I am looking for a way to run a userspace firewall and came across
nf_queue.  The library documentation and examples were easy enough to
follow, but I found some unexpected behavior when setting up a
proof-of-concept.  Say I have the following nftables configuration
loaded:

table ip test-queue {
  chain prerouting {
    type filter hook prerouting priority filter; policy accept;
    queue num 0 bypass
  }
}
table ip unrelated {
  chain input {
    type filter hook input priority mangle; policy accept;
  }
}

and a program running that reads packets from queue 0.  If at any
point I run a command that deletes a base chain, e.g.

nft delete table ip unrelated

Then all the packets in queue 0 are dropped.  When the program sends a
verdict for any packets it had received before the queue was flushed,
the nf_queue system responds with an ENOENT message (wrapped in a
header with NLMSG_ERROR) through the netlink socket.

This appears to be the intended behavior by what I could make of the
kernel code.  Is that correct, and if so, what is the motivation?

I understand that it would be possible for the deleted chain to have a
rule that also sends packets to queue 0, which might necessitate this
behavior.  But in my case, I can guarantee that only one table/chain
submits packets to any given queue.

Would it be possible to develop a patch that determines queue 0 should
be unaffected by that chain deletion and preserves the queue contents?
 Has such a change been attempted before?  Or is there some other
workaround for this behavior?

Thanks,
Jordan
