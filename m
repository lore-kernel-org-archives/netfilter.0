From: backup95 <backup95@netcabo.pt>
Subject: Using NFQUEUE from userspace with seteuid
Date: Mon, 01 Mar 2010 02:28:25 +0000
Message-ID: <1267410505.18948.46.camel@r1>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: netfilter@vger.kernel.org

Hello,

I wrote a daemon to do packet filtering using libnetfilter-queue.

It works well except that I ran into problems trying to run it
seteuid/setegid to an unpriviliged user.

Setup and teardown proceeds as root but when I try running the main loo=
p
seteuid/setegid to a regular user (just processing IP addresses and
calling nfq_set_verdict really) everything slows to a crawl. I don't ge=
t
any software errors (packets are apparently received and accepted/denie=
d
as usual) but all my connections time out or error out (not sure which
yet). Like I said, works fine as root.

I'm at a loss to explain this because as far as I can tell the
underlying netlink socket mechanism should not depend on root
priviledges to send messages. It's strange enough that there's a
significant slow down but no hard errors (and by that I mean
nfq_set_verdict returning a negative value).

Can anyone at least please confirm that it should work fine and it is
worth investigating or else just forget it and run the whole thing as
root?

Any comments would be greatly appreciated.

Jo=C3=A3o

