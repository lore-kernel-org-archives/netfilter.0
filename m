From: Ross Boylan <rossboylan@stanfordalumni.org>
Subject: Meaning of "." (dot) in netfilter
Date: Fri, 3 Dec 2021 22:33:55 -0800
Message-ID: <CAK3NTRAQE7UD9_0EuzyS0UGQ_s++Dg_hbZPXscHBrStnGJHGjw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

https://wiki.nftables.org/wiki-nftables/index.php/Simple_ruleset_for_a_home_router
include a number of rules like

        ip protocol . th dport vmap { tcp . 22 : accept, udp . 53 :
accept, tcp . 53 : accept, udp . 67 : accept}
with possibly 2 different uses of ".", namely 'ip protocol .'  and 'udp . 67'.
What do those "."'s mean?

I've looked in available documentation, but can't tell.

Thanks.
Ross Boylan
