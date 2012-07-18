From: Luke Pascoe <luke@osnz.co.nz>
Subject: Kernel 3.2.0.0 IPSec policy patch bug?
Date: Wed, 18 Jul 2012 14:30:44 +1200
Message-ID: <CAKYdRA90C4_wBcYt3hASi5wdp_DCxkFdtFY2Y3Hufw0DcW4Z5A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi all,

Just wondering if there is a known bug with kernel 3.2.0.0 regarding IPSec
policy matching?

I have a Debian Squeeze based firewall running a backported 3.2 kernel and
while it correctly matches inbound packets in the PREROUTING mangle table
with 'policy match dir in pol ipsec', if I try to do a similar match in
POSTROUTING for outbound packets 'policy match dir out pol ipsec' I get no
match.

This same logic works fine on another firewall I manage, which has an older
2.6.32 kernel.

If it is a known bug, can someone tell me what kernel version I need to
upgrade to to fix it?

Thanks.
