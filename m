From: "Stephen Isard" <y8ju2p902@sneakemail.com>
Subject: Re: iptables rules for cups printer discovery
Date: Fri, 15 Aug 2008 12:28:41 -0400 (EDT)
Message-ID: <21281-33344@sneakemail.com>
References: <19894-78618@sneakemail.com> <48A4DD48.3080004@riverviewtech.net> <alpine.LNX.1.10.0808142150080.25617@fbirervta.pbzchgretzou.qr> <48A4E340.1090305@riverviewtech.net> <alpine.LNX.1.10.0808142202380.25617@fbirervta.pbzchgretzou.qr>
 <30978-20009@sneakemail.com> <alpine.LNX.1.10.0808150912130.27140@fbirervta.pbzchgretzou.qr> <19140-74447@sneakemail.com> <48A59EE8.8090709@riverviewtech.net> <17319-84921@sneakemail.com> <48A5ABE7.2040008@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48A5ABE7.2040008@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

> Um, if they have gotten a system in to your LAN I think you have bigger 
> problems.  If this is a real concern, I'd suggest that you look in to 802.1x 
> (port) authentication.

This is a large university department where students and visitors use 
the lan.  The computing officers are highly competent and doing their 
best to provide security, but, as you know, it's a constant battle.

> Also remember that you can adjust the length of time for the "recent" window.

Right.

> You can probably also mitigate the window by looking for the closing 
> connection (at least with TCP)

This particular case involves udp.

Thanks for your advice.
