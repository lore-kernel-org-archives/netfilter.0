From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: [HELP] why the string match does not work in nat tables?
Date: Mon, 31 Jan 2011 03:09:11 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1101310306560.15201@obet.zrqbmnf.qr>
References: <AANLkTinoBfMTDNVLHuBhMFJHHSrMmP0gwYTz2AX3f_ew@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <AANLkTinoBfMTDNVLHuBhMFJHHSrMmP0gwYTz2AX3f_ew@mail.gmail.com>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: JeHo Park <linuxpark@gmail.com>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org


On Monday 2011-01-31 02:53, JeHo Park wrote:
>
>the string match works well in filter table, but it does not work in NAT.

Oh it _does_ work in nat.

But given that the nat table is an abstract configuration database
rather than a filter, not all packets do a lookup.

>i used following iptables rules
>#  iptables -A PREROUTING -t nat -p tcp --dport 80 -m string --string
>"goole.com" --algo bm -j DNAT --to-destination 10.10.10.125:80
