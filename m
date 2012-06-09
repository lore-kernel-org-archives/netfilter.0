From: Julien Vehent <julien@linuxwall.info>
Subject: Fwd: Re: Conntrack & Unreplied exhausts hashsize
Date: Sat, 09 Jun 2012 16:15:42 -0400
Message-ID: <1c26dc9ebe0d0e22d5309b6bc0a73e41@njm.linuxwall.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=linuxwall.info; h=
	mime-version:content-type:content-transfer-encoding:date:from:to
	:subject:message-id; s=lnw-dkim; bh=Y+bilmtk5DI6MgxnSQ6S/dRQx+Mf
	CAOXOu5sRWkv5do=; b=iTaamowjIqyXT64yT0i6C5MKbLuA1NXjmMn6crPuY807
	T2VomlBfSyg3dBbXZr0p1VTUsWZ572piu9RCN3PV3bIBAcOgQs/ZsXuUx3KUBPHH
	HyySwrHj1BgxMlsiHduto4EKFfpdFGe1tRGpUfZZTzFxiEXjK9AKVhHXYN5iGGw=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter <netfilter@vger.kernel.org>


Very interesting find ! So, what that means is that the 5 days timeout will 
not
hurt other connections, because unreplied connections will get removed
automatically if new connections need the spot ?

That would definitely explain why the total of unreplied connection went 
down a
little bit on June 8th at 4am: http://4u.1nw.eu/conntrack_stat3.png

We did fix other parameters earlier, like enabling tcp_tw_reuse and 
directing
localhost traffic to NOTRACK. It would explain why we didn't get more of 
those
`table full, dropping packet`.

- Julien

On 2012-06-09 14:14, Marco Padovan wrote:

> Looks like it's an intendend behaviour:
>
> http://www.netfilter.org/documentation/FAQ/netfilter-faq-3.html#ss3.17 [1]
>
> <
> Jun 5 09:57:51 web-front1 kernel: [7177214.445925] nf_conntrack: table 
> full,
> dropping packet.
>
> So I started tuning the kernel of one member of the farm. This server has 
> 2
> interfaces: one public and one in the LAN. The problem is on the public
> interface, it seems that connections in the UNREPLIED state continue to 
> grow
> and never get cleaned up by conntrack. Below is a diagram that shows the
> issue:
>
> http://4u.1nw.eu/conntrack_stat3.png [2]
>
> The orange line counts connections on the public IP that are in the
> unreplied state. The script parses /etc/net/ip_conntrack every 10 minutes
> (nothing fancy, see https://gist.github.com/2901349 [3] ).
>
> My questions are:
>
> Should these UNREPLIED connection get removed from conntrack after a 
> certain
> timeout?
>
> What is the parameter that controls this timeout ?
> I'm afraid it might be `net.netfilter.nf_conntrack_tcp_timeout_established 
> =
> 432000`, which is 5 days. If this is the case, would it be safe to set 
> this
> parameter to 300 seconds instead (5 minutes) ?
>
> Note: apache runs with `KeepAlive On` and `KeepAliveTimeout 3`, in case 
> this
> might be relevant.
>
> Thanks a lot,
> Julien



Links:
------
[1] http://www.netfilter.org/documentation/FAQ/netfilter-faq-3.html#ss3.17
[2] http://4u.1nw.eu/conntrack_stat3.png
[3] https://gist.github.com/2901349

