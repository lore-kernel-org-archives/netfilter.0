From: "Rob Sterenborg (lists)" <lists@sterenborg.info>
Subject: Re: Question about using SSH-tunnel / Frage zum Benutzen eines
 SSH-Tunnels
Date: Fri, 12 Aug 2011 12:35:05 +0200
Message-ID: <1313145305.3060.11.camel@ns014530.dcyb.net>
References: <4E44F1DC.3090605@gmx.de>
	 <1313142433.3060.2.camel@ns014530.dcyb.net>  <4E44FF86.60904@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4E44FF86.60904@gmx.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Fri, 2011-08-12 at 12:25 +0200, J. Zeidler wrote:
> Hello
> > I think you should use REDIRECT instead.
> I don't know how to use it. Using it instead of OUTPUT does not work:

I missed the udp protocol Jan mentioned: SSH doesn't do udp tunneling.
There are tuturials on how to tunnel udp through an SSH tunnel using
tools like netcat, but I'm not sure if you're if you're up for that and
it's not something for this list either.

> sudo iptables -A REDIRECT -t nat -p tcp -d 65.18.193.12 -j DNAT --to 
> 127.0.0.1:9999
> 
> How to use it?

Read 'man iptables' again and search for REDIRECT. REDIRECT is a target,
not a chain so the above rule is incorrect. Example:

$ipt -t nat -A PREROUTING -p tcp -d <dest_ip> -j REDIRECT --to-ports
<local_port>


--
Rob


