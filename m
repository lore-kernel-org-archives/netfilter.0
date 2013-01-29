From: =?UTF-8?B?5Y+26Zuo6aOe?= <sunyucong@gmail.com>
Subject: Re: hex string matching at a negative offset from the end of the
 packet payload
Date: Tue, 29 Jan 2013 02:28:56 -0800
Message-ID: <CAJygYd3LhHy3nn_GRDv2h2FW3JhmWhCs-Pvi-ZEMo_+W5QC53g@mail.gmail.com>
References: <5107A008.90806@t0mb.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:mime-version:in-reply-to:references:from:date:message-id
         :subject:to:cc:content-type;
        bh=uMHD0nKQCTlkLBVsilS03Wq/FmsNC95XCUvT2PKc0lU=;
        b=n4qfOfRFR7yvwin3+VWBPJxV+vmXnFSe/DoMiD/0d8351NQInnwjUrCQrl+uI9aJ+D
         irRKCUfYzrR3jPoDHyHMmGfEorO8f9B9u0jiLtc2UOA5s1i6a0el/p8MksB9wWMjyIH0
         rt30090ByEWDnKUcEhTv6XBbKHZXWCsURgA+Hijem9/SB7abHWmKKCV0KFBZ/r/ijiNW
         9cgrRFssKKbwubGahqVqOrosqXUBVzSUEuB4BvTp8kXk5NlxmLTx5DEyytsTCk2kXxVA
         t9Xh/Vyc+DsgL1bRi9oEW75+y8bEUpxDT/H5QXsxO5NW5S3/vsA9TgKxisfjtN6KeZRG
         iOLg==
In-Reply-To: <5107A008.90806@t0mb.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom <tom@t0mb.net>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

you can probabaly do what you want with u32

http://www.stearns.org/doc/iptables-u32.v0.1.7.html

But, I've never used it before, i only know it can do something like that.

On the other hand, why do you want to limit it? it may burn a few cpu
cycle on your dns server, but you can always rate limit at application
level.

On Tue, Jan 29, 2013 at 2:10 AM, Tom <tom@t0mb.net> wrote:
> Greetings,
>
> I'm trying to match DNS ANY type queries and rate limit them with iptables.
> An imperfect way of doing this is in use at the moment:
>
> -A INPUT -p udp -m udp --dport 53 -m string --hex-string "|0000ff0001|"
> --algo bm --from 50 --to 65535 -m recent --set --name dnsanyqueryudp
> --rsource
> -A INPUT -p udp -m udp --dport 53 -m string --hex-string "|0000ff0001|"
> --algo bm --from 50 --to 65535 -m recent --rcheck --seconds 60 --hitcount
> 100 --name dnsanyqueryudp --rsource -j ANYRATELIMIT
>
> What I want is a way of checking the byte which is at a negative offset from
> the end of the payload, so I can match only the byte I need.  Is there any
> mechanism at all by which I can do this?
>
> It's annoying that the query type always comes after the variable length
> query in DNS!
>
> Thanks for any help.
>
> Tom.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
