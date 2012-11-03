From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: How to enable "bytes=" output in "conntrack -L" output
Date: Sat, 3 Nov 2012 13:00:33 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1211031259220.11582@nerf07.vanv.qr>
References: <CA+uOhx6tc0EZO8atcN+=vN_Buv_mWbOwNF+RM4wnr3PpYp6vrA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CA+uOhx6tc0EZO8atcN+=vN_Buv_mWbOwNF+RM4wnr3PpYp6vrA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Perl <th.perl@gmail.com>
Cc: netfilter@vger.kernel.org, Kamal Ahmed <kamal2222ahmed@yahoo.com>, =?UTF-8?Q?Stefan_K=C3=B6gl?= <stefan@skoegl.net>


On Saturday 2012-11-03 12:48, Thomas Perl wrote:
>
>However, on my machine when running "conntrack -L" (as root), I do get
>output, but without the "bytes=" part:
>
>tcp      6 ZZZZ ESTABLISHED src=X.X.X.X dst=Y.Y.Y.Y sport=XXX
>dport=YYY src=X.X.X.X dst=Y.Y.Y.Y sport=XXX dport=YYY [ASSURED] mark=0
>use=1

	sysctl -w net.netfilter.nf_conntrack_acct=1

(or via /etc/sysctl.conf, or any other method that is integrated
with your distro)

Afterwards which  new connections will be byte/packet-counted as well.
