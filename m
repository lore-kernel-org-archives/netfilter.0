From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Ipsec and masquerading
Date: Tue, 30 Mar 2010 21:27:54 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1003302122370.28716@obet.zrqbmnf.qr>
References: <c59a952f1003301201o1da401ffsc515d797fe56d3ff@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <c59a952f1003301201o1da401ffsc515d797fe56d3ff@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Kaagman <prjv.kaagman@gmail.com>
Cc: netfilter@vger.kernel.org


On Tuesday 2010-03-30 21:01, Peter Kaagman wrote:
># Some vars
>ext_if="eth1"
>int_if="eth0"
>lo_if="lo"
>
># Init commands
># flush en clear all rules and reset counters
>
>iptables -F
>iptables -X
>iptables -Z
>iptables -t nat -F
>iptables -t nat -X
>iptables -t nat -Z

Use iptables-save, which is a lot faster than running through all of this.

># Allow esp, ah and key exchange

In practice you don't need AH when you already have ESP.

>iptables -A INPUT  -i $ext_if -p esp -s $remote -j ACCEPT
>iptables -A INPUT  -i $ext_if -p ah  -s $remote -j ACCEPT
>iptables -A OUTPUT  -o $ext_if -p esp -d $remote -j ACCEPT
>iptables -A OUTPUT  -o $ext_if -p ah  -d $remote -j ACCEPT
>iptables -A INPUT  -i $ext_if -p udp --sport 500 --dport 500 \
>         -s $remote -j ACCEPT
>iptables -A OUTPUT -o $ext_if -p udp --sport 500 --dport 500 \
>         -d $remote -j ACCEPT

IKE is on 4500 too.

