From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Blocking UDP Fragments
Date: Wed, 18 May 2011 14:23:05 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1105181421340.2862@frira.zrqbmnf.qr>
References: <216636937ABE004E8CD94DDB2AD8BAA501AE75C2BE63@lsnexchange.limestonenetworks.com> <BANLkTikdkdicDs-U23tJVUWp=JejDsLP4w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BANLkTikdkdicDs-U23tJVUWp=JejDsLP4w@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pandu Poluan <pandu@poluan.info>
Cc: Ryan Gelobter <r.gelobter@limestonenetworks.com>, netfilter@vger.kernel.org


On Wednesday 2011-05-18 06:27, Pandu Poluan wrote:
>
>If you want to drop all fragmented packets, including the first packet
>of the fragment,
>
>iptables -t raw -A PREROUTING -m u32 ! --u32 0x4&0x3fff=0x0 -m comment
>--comment \"Fragmented\" -j DROP

Yeah but you forget

	iptables -f -j DROP

and that, when nf_defrag is loaded, autodefragmentation is happening and
Xtables won't see any more fragments.
