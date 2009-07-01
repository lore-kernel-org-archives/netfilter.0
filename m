From: "Jorge Bastos" <mysql.jorge@decimal.pt>
Subject: Re: rate limit by MAC
Date: Wed, 1 Jul 2009 16:44:24 +0100 (WEST)
Message-ID: <1125.192.168.1.3.1246463064.squirrel@webmail.decimal.pt>
References: <4A4B42C6.4060103@msm.ru>
    <56378e320907010448n2a02fa6cxf9653518f7eff428@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <56378e320907010448n2a02fa6cxf9653518f7eff428@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Richard Horton <arimus.uk@googlemail.com>
Cc: netfilter@vger.kernel.org

> You might be able to...
>
> iptables -A FORWARD -m mac --mac-source <<mac address>> -m limit
> --limit 100/s -j ACCEPT would restrict the given mac address to 100
> packets per second... but depending on how many mac addresses you have
> it might be too much to enter each rule...

Sawing this thread,
Iptables doesn't (still) have the capacity to do rate limit by itself,
does it?

Jorge,

