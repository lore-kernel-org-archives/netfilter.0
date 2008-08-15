From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: iptables rules for cups printer discovery
Date: Fri, 15 Aug 2008 13:01:29 -0500
Message-ID: <48A5C479.9050509@riverviewtech.net>
References: <19894-78618@sneakemail.com> <48A4DD48.3080004@riverviewtech.net> <alpine.LNX.1.10.0808142150080.25617@fbirervta.pbzchgretzou.qr> <48A4E340.1090305@riverviewtech.net> <alpine.LNX.1.10.0808142202380.25617@fbirervta.pbzchgretzou.qr> <30978-20009@sneakemail.com> <alpine.LNX.1.10.0808150912130.27140@fbirervta.pbzchgretzou.qr> <19140-74447@sneakemail.com> <48A59EE8.8090709@riverviewtech.net> <17319-84921@sneakemail.com> <48A5ABE7.2040008@riverviewtech.net> <21281-33344@sneakemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <21281-33344@sneakemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 08/15/08 11:28, Stephen Isard wrote:
> This is a large university department where students and visitors use 
> the lan.  The computing officers are highly competent and doing their 
> best to provide security, but, as you know, it's a constant battle.

Sounds like it is time to divide the different access networks up in to 
smaller pieces and route between them.  Make sure that you do some 
sanity checking (filtering) as part of the routing process too.  Try to 
help prevent spoofing as close to the edge as possible.  ;)

> This particular case involves udp.

*nod*

> Thanks for your advice.

You are welcome.



Grant. . . .
