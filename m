From: "Tyler J. Wagner" <tyler@tolaris.com>
Subject: Re: Extremely slow upload (and more) from behind NAT
Date: Fri, 12 Aug 2011 17:32:34 +0100
Message-ID: <4E4555A2.4090705@tolaris.com>
References: <CAKbQEqG3vrDpLBzh7CVBxhezWOtuZRASFPFG4uHTOQDpkyUFtw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAKbQEqG3vrDpLBzh7CVBxhezWOtuZRASFPFG4uHTOQDpkyUFtw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christian Pernegger <pernegger@gmail.com>
Cc: netfilter@vger.kernel.org

On 2011-08-12 17:06, Christian Pernegger wrote:
> Since randomly disabling TCP "offensive" TCP options like syncookies,
> ECN and even SACK didn't work either, I'm now officially at my wits
> end.

That's a good one. Do you have any unusual routing loops or other
network oddities? Just eth0 (external) and eth1 (internal)?

Please post your iptables / iptables-restore script.

Regards,
Tyler

-- 
"Never underestimate the bandwidth of a station wagon full of tapes
hurtling down the highway.
   -- Andrew S. Tanenbaum
