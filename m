From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Question about using SSH-tunnel / Frage zum Benutzen eines
 SSH-Tunnels
Date: Fri, 12 Aug 2011 20:57:32 -0500
Message-ID: <20110813015732.GH14195@harrier.slackbuilds.org>
References: <4E44F1DC.3090605@gmx.de>
 <1313142433.3060.2.camel@ns014530.dcyb.net>
 <4E44FF86.60904@gmx.de>
 <1313145305.3060.11.camel@ns014530.dcyb.net>
 <4E45A576.7030301@gmx.de>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4E45A576.7030301@gmx.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Sat, Aug 13, 2011 at 12:13:10AM +0200, J. Zeidler wrote:
Rob said:
> >Read 'man iptables' again and search for REDIRECT.

*Do* this. Do not post again without reading the man page. You were 
directed to the specific section you need!

> REDIRECT is a target,
> >not a chain so the above rule is incorrect. Example:
> >
> >$ipt -t nat -A PREROUTING -p tcp -d<dest_ip> -j REDIRECT 
> >--to-ports <local_port>

That's the example. It's correct; reread it.

> if i do this, it does not work:
> iptables -A PREROUTING -t nat -p tcp -d 65.18.193.12 --dport 15000 -j
> REDIRECT --to 127.0.0.1:15000

This is NOT like the example!

> answer:
> iptables v1.4.10: REDIRECT: Bad value for "--to-ports" option:
> "127.0.0.1:15000"

Did you read this part? Find REDIRECT in the man page, and then find 
the "--to-ports" option.

> Try `iptables -h' or 'iptables --help' for more information.

Did you? "iptables -h -j REDIRECT" gives a syntax summary.

> how can i find out, if a programm uses tcp or udp protocoll for 
> connection?

What did you try? I suppose I would look in the program's 
documentation, and maybe check Wikipedia.

I'm betting this is all futile, because as noted, SSH tunnels are 
only capable of carrying TCP traffic. Furthermore, refer to the 
ssh_config(5) man page for the option "GatewayPorts". -j REDIRECT 
does not work with a process (such as a SSH tunnel) which is only 
bound to 127.0.0.1. (It works, but only with connections from 
127.0.0.1.)

The real solution might be had with OpenVPN as suggested upthread, or 
in a pinch, you can try something like PPP over SSH. Offer void where 
taxed or prohibited by law, or if Google fails to find "PPP over SSH" 
examples for you, or if you don't know how to use the tunnel once 
it's created.
-- 
    Offlist mail to this address is discarded unless
    "/dev/rob0" or "not-spam" is in Subject: header
