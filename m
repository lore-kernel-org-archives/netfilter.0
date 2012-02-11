From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: DNAT "--to" versus "--to-destination"
Date: Sat, 11 Feb 2012 02:43:50 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1202110241240.15173@frira.zrqbmnf.qr>
References: <CALTCyaS0UHTTAB1rU-NhBWu6cU6gg6O=Ok1=JV93r1Ej=g_a-A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CALTCyaS0UHTTAB1rU-NhBWu6cU6gg6O=Ok1=JV93r1Ej=g_a-A@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rodney Beede <mailinglist@rodneybeede.com>
Cc: netfilter@vger.kernel.org


On Saturday 2012-02-11 01:35, Rodney Beede wrote:

>On the web I see examples like:
>
>iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT
>--to-destination 10.1.1.1:8080
>
>However in the documentation
>(http://www.netfilter.org/documentation/HOWTO//NAT-HOWTO-6.html#ss6.2)
>I see:
>
>iptables -t nat -A PREROUTING -i eth0 -j DNAT --to 5.6.7.8
>
>Why is this or what does the difference mean?

That whoever wrote the NAT-HOWTO had a system with a getopt(3)
function that supports unique abbreviations.
