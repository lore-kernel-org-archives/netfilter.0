From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: [iptables] Implement huge amount of iptables make system crash
Date: Sun, 4 Dec 2011 22:09:07 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1112042207270.5627@frira.zrqbmnf.qr>
References: <20111204133420.GC12769@via.ecp.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20111204133420.GC12769@via.ecp.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: =?UTF-8?Q?L=C3=A9o_Cavaill=C3=A9?= <chiron@via.ecp.fr>
Cc: netfilter@vger.kernel.org

On Sunday 2011-12-04 14:34, L=C3=A9o Cavaill=C3=A9 wrote:

>Hello everyone,
>
>I recently tested a new environment to account some traffic on my
>network with some iptables rules
>
>1) I have got 2 rules (one for in and one for out stream) per IP I wan=
t
>to account. Since I account some contiguous adresses I wondered if a
>binary tree starting with the first IP of my /19 and then chaining
>through different tables to reach a single IP leaf will result in a
>logarithmic complexity rather than linear=E2=80=A6

Yes, Jesper Brouer wrote some Perl code that takes care of automaticall=
y=20
producing a fanned tree like that.

>So far I am adding the whole set of rules with a perl script using
>libiptc to commit only once the rules to netfilter.
>
>
>2) These ~62k rules are not really significant for the load of my
>firewall. But unfortunately, I had sometimes in my tests to manage som=
e big=20
>failures, where an iptables command (-Z, -A or -L) is stuck on the sys=
tem=20
>and then one of my cores is used at 100% and the load increases, and g=
enerally=20
>I get this kernel alert :
>http://pastebin.com/F1DL7ZZT

Keep in mind that the ruleset is replaced for each HW thread and thus=20
puts big requirements on memory available; as such though, I would have=
=20
expected an OOM message rather than a Unable To Handle Kernel Paging=20
Request.

