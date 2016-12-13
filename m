From: Mark Morgan <morganm.qc@gmail.com>
Subject: Nftables / ipset / multiple tables
Date: Mon, 12 Dec 2016 20:39:47 -0800
Message-ID: <CABAu8hMnZd84Ya-17aK9ERfqp-7TbfuhfWnDz5dydML0Jhdb0A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to;
        bh=YJtVjUyQEsmw+it2QmGDlapHpP2tKlUuhGJc1TFpgUo=;
        b=Rp2XawusvCwI6wg4KS2Bv7ma7YjoFsIV1ZmF2qLzL9V2I6QwbTi1ZX4JhKblhJAUqK
         FVbqWCM/VP0cDDnCasPFfUqyEtYlV1wJtX4rbKBfeYwDpWbbNes2jd7EemZwbycSXbZV
         qOljgL+J+fLadIZ5S3yZS2ja8yr6V2l/Qt9wNblD3DNZt/iyFWEd04JPSmjUlw35MW3N
         DO32Ocrh+X89xhvioNrxv3OHWwTpz2ZNzTejF6uOeJ1ALQkAxW+px/+xrZzBmtUQo/tU
         w5AUafjFkdJE3NeCzfkKDhms9W8n9f7RaTicofvYrT/u7pof/bW3A0y6qV4fdLrZ9lz5
         7Zsg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I am trying to convert from iptables to nftables. So far I really like
the way nftables is structured, it will allow me to cleanup my
iptables settings and I expect it to be much more manageable over the
long term.

However, I'm encountering an issue trying to translate an
iptables/ipset feature into nftables in a sane way.

Today I use ipsets, which I can maintain separate from my iptable
firewall rules. This is a nice convenience - I can add blacklists,
manage CIDR block sets, etc, all in an efficient package (ipset),
without having to restart my entire firewall rule set.

As best I can tell, nftables does not support external ipset,
presumably because it has its own internal version. It would be great
if it could support external ipset, then I could have the best of both
worlds.

For now, I converted some of my ipsets to nftables format. The problem
I'm having is that while there is an "include" directive which allows
me to separate out my ipsets into manageable separate files, there is
no mechanism I can see to actually reference these sets. Example:

# nftables.conf
@include "nftables.foobar"
table inet filter { /* stuff in here */ }

# nftables.foobar
table ip foobar { set country_block { /*blah blah*/ } }

Now I want to reference "set country_block" from my inet filters. I
can't find any documentation on how to reference a set in another
table. The "@country_block" reference seems to be scoped to only the
current table, with no way I can find to have it reference a set in
another table. I really do not want to store all of my ip sets in a
single large file/table. That would be worse than what I have today
with iptables.

Am I missing an feature that perhaps isn't documented that would make
this all work, or is there a forth coming feature that might make this
possible to do in the future?
