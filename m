From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: how does NOTRACK work?
Date: Thu, 29 Dec 2011 16:56:05 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1112291654500.25460@frira.zrqbmnf.qr>
References: <CAHyifnRkaVncFdpu6M7Op0tDuyhzBQqkokQJ+Oq9k-CbP5FScg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAHyifnRkaVncFdpu6M7Op0tDuyhzBQqkokQJ+Oq9k-CbP5FScg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tim Lank <timlank@timlank.com>
Cc: netfilter@vger.kernel.org

On Wednesday 2011-12-28 03:12, Tim Lank wrote:

>Netfilter list:
>
>I have this in my iptables and it seems to work in that it doesn't
>track the connections on the eth1 interface.
>
>*raw
>:PREROUTING ACCEPT [1327:114702]
>:OUTPUT ACCEPT [2012:272100]
>-A PREROUTING -i bond1 -j NOTRACK
>-A OUTPUT -o bond1 -j NOTRACK
>COMMIT
>
>However, it never gets to the sshd or httpd service and reply to the client.

Is that perhaps because your ruleset implicitly drops these packets,
since they are neither NEW nor ESTABLISHED nor RELATED.
