From: Florian Westphal <fw@strlen.de>
Subject: Re: usings sets as input to sets
Date: Wed, 29 Jul 2020 14:17:12 +0200
Message-ID: <20200729121712.GA5271@breakpoint.cc>
References: <20200728092724.677EC40A2A@i-am.a-little-linux-box.at>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200728092724.677EC40A2A@i-am.a-little-linux-box.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: harald@a-little-linux-box.at
Cc: netfilter@vger.kernel.org

harald@a-little-linux-box.at <harald@a-little-linux-box.at> wrote:
[..]
> table inet portknock {
>         set port2 {
>                 type inet_service
[..]

>         set candidates {
>                 type ipv4_addr . inet_service
>                 flags timeout
>         }

[..]
>                 tcp dport 12345 add @candidates {ip saddr . @port2 timeout 10s}

What is that supposed to do?

@candidate expects ip address + port.

> So my question is is this even supposed to work or not? If not then maybe somebody could tell me why and if it is supposed to work why doesn't it?

Its not possible to add a set to a set, if thats what you are asking.

I suspect you already found
https://wiki.nftables.org/wiki-nftables/index.php/Port_knocking_example ?
