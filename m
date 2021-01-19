From: linux-netfilter-list@dbg.werbittewas.de
Subject: where in kernel is conntrack-matching done?
Date: Tue, 19 Jan 2021 05:21:05 +0100
Message-ID: <c604e1cd-3540-fabd-dadd-78b735dca7cc@dbg.werbittewas.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: de
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

hi.

we had recently a problem where we first thought, that there's a problem
with conntrack, but it was our fault by mis-reading packets...

nevertheless we've not found the kernel-method, where a packet is
matched against current conntrack-list.

to limit possible answers, we want to start with an UDP-packet.

does anyone have a hint, where to look in kernel to better understand,
what is happened there with a certain packet? where does it enter
conntrack-checking? where is checked, if it's a new connection or if it
matches an existing one?


thanks a lot.

regards

dbg.
