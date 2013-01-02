From: Eliezer Croitoru <eliezer@ngtech.co.il>
Subject: Re: Native support of counting rules?
Date: Wed, 02 Jan 2013 15:58:31 +0200
Message-ID: <50E43D07.50009@ngtech.co.il>
References: <20130102134421.GA17997@devnull>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20130102134421.GA17997@devnull>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Aaron Lewis <the.warl0ck.1989@gmail.com>
Cc: netfilter mailing list <netfilter@vger.kernel.org>

Hey Aaron,

I feel kind of odd but this should answer you:
http://linux.die.net/man/8/iptables
www.garron.me/linux/iptables-manual.html

Eliezer

On 1/2/2013 3:48 PM, Aaron Lewis wrote:
> Hi,
>      I want to know if I could get how many rules are present, i.e in
>      filter table?
>
>      Now I do `iptables -L | wc -l` like stuff, I know it's not right,
>      but iptables itself doesn't seem to count rules anyway.
>
>      I need this just to let user to know how many rules are present,
>      without root privileges, and now being able to view actual rules.
>

