From: Florian Westphal <fw@strlen.de>
Subject: Re: TCP 4 way handshake or TCP Split Handshake Attack
Date: Fri, 24 Jan 2020 17:24:17 +0100
Message-ID: <20200124162417.GW795@breakpoint.cc>
References: <33c1b81b-cb3d-e277-334f-5a8daaf8dd73@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <33c1b81b-cb3d-e277-334f-5a8daaf8dd73@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fatih USTA <fatihusta86@gmail.com>
Cc: netfilter@vger.kernel.org

Fatih USTA <fatihusta86@gmail.com> wrote:
> Hello,
> I am trying to protect my network from the tcp split handshake attack!
> (4-way handshake rejection or 3-way handshake enforcement).
> I tested the sample code. (link below) And passed the firewall(iptables).

Why wouldn't it?  Its valid tcp, your ruleset allows connections to happen
and there is a socket expecting a connection.

> I can't find any solution on the internet for Linux.

nft add rule filter forward tcp flags & (syn | ack) == syn ct direction reply counter drop

But why would you want to disallow this behaviour?

> Link1: https://tech.labs.oliverwyman.com/blog/2016/11/07/4-way-tcp-handshake-and-firewalls/

This is simultaneous connect, at least thats what can be seen in the
tcpdump, syns cross on wire, both ends send syn/ack.  WHy do you
consider this an "attack"?
