From: =?utf-8?B?TMOpbyBDYXZhaWxsw6k=?= <chiron@via.ecp.fr>
Subject: [iptables] Implement huge amount of iptables make system crash
Date: Sun, 4 Dec 2011 14:34:20 +0100
Message-ID: <20111204133420.GC12769@via.ecp.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hello everyone,

I recently tested a new environment to account some traffic on my
network with some iptables rules

1) I have got 2 rules (one for in and one for out stream) per IP I want
to account. Since I account some contiguous adresses I wondered if a
binary tree starting with the first IP of my /19 and then chaining
through different tables to reach a single IP leaf will result in a
logarithmic complexity rather than linear=E2=80=A6
So far I am adding the whole set of rules with a perl script using
libiptc to commit only once the rules to netfilter.


2) These ~62k rules are not really significant for the load of my
firewall. But unfortunately, I had sometimes in my tests to manage some=
 big=20
failures, where an iptables command (-Z, -A or -L) is stuck on the syst=
em=20
and then one of my cores is used at 100% and the load increases, and ge=
nerally=20
I get this kernel alert :
http://pastebin.com/F1DL7ZZT

Any advice, or explanation will be great for my new installation !

Thanks,

--=20
L=C3=A9o Cavaill=C3=A9
