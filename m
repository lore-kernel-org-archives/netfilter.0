From: "J. Zeidler" <jonatan_zeidler@gmx.de>
Subject: Re: Question about using SSH-tunnel / Frage zum Benutzen eines SSH-Tunnels
Date: Sat, 13 Aug 2011 00:13:10 +0200
Message-ID: <4E45A576.7030301@gmx.de>
References: <4E44F1DC.3090605@gmx.de>	 <1313142433.3060.2.camel@ns014530.dcyb.net>  <4E44FF86.60904@gmx.de> <1313145305.3060.11.camel@ns014530.dcyb.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1313145305.3060.11.camel@ns014530.dcyb.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: netfilter@vger.kernel.org


> Read 'man iptables' again and search for REDIRECT. REDIRECT is a target,
> not a chain so the above rule is incorrect. Example:
>
> $ipt -t nat -A PREROUTING -p tcp -d<dest_ip>  -j REDIRECT --to-ports
> <local_port>
if i do this, it does not work:
iptables -A PREROUTING -t nat -p tcp -d 65.18.193.12 --dport 15000 -j 
REDIRECT --to 127.0.0.1:15000
answer:
iptables v1.4.10: REDIRECT: Bad value for "--to-ports" option: 
"127.0.0.1:15000"
Try `iptables -h' or 'iptables --help' for more information.

how can i find out, if a programm uses tcp or udp protocoll for connection?
