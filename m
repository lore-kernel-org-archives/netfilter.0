From: Anton Melser <melser.anton@gmail.com>
Subject: Re: Advice on best way to set up multi-route NAT for lots of IPs
Date: Thu, 5 Jan 2012 12:59:06 +0100
Message-ID: <CAKywjPpBW-KMfS72n_fpLk10gTvZm=iDV5PjGJgPvja6sQN6NQ@mail.gmail.com>
References: <CAKywjPrbjoLhcvPXVYg+8kZ53rPRJ5+dhePx4FB=OkpNjqUGxw@mail.gmail.com>
 <1325753945.2910.11.camel@ns014530.dcyb.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=6/nCZSSp8xYORuzSy+ZLerVYp0qVGqYpyhwFRdECLbo=;
        b=giC3tEAU170WDFN4HciJanWQiX171t1nmQc59EGL7Y9AsjihvgTnC7w1XoUBLloIyq
         HSm9oveV7dnHTIGgfZ56Kv7wYXJDT91TDAzxepqYei2EmpTWLAjWiAAdsrfwaEfIpv2p
         IX1m+zF8WtUjK2ftccgB2Jcuyc9Xrvfop1KKs=
In-Reply-To: <1325753945.2910.11.camel@ns014530.dcyb.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rob Sterenborg (lists)" <lists@sterenborg.info>
Cc: netfilter@vger.kernel.org

On 5 January 2012 09:59, Rob Sterenborg (lists) <lists@sterenborg.info> wrote:
> On Sun, 2012-01-01 at 17:10 +0100, Anton Melser wrote:
>> I thought that the best way to go would be to set up NAT using blocks
>> in the 10.0.0.0 range. So say for each external IP I would have a /24,
>> giving me up to 250-odd potential internal machines. So 10.1.1.1,
>> 10.1.1.2, 10.1.1.3, etc. would map to 1.1.1.1; 10.1.2.1, 10.1.2.2,
>> 10.1.2.3, etc. would map to 1.1.1.2, etc.
>> I have been reading as many sites as I can but I can't work out the
>> best way to go forward.
>
> So, I think I understand that you want to SNAT a complete private subnet
> to a corresponding public subnet. Is the NETMAP target usable for you,
> or am I misunderstanding you completely?
> Something like:
>
> iptables -t nat -A POSTROUTING -s ${private_subnet} -j NETMAP --to
> ${public_subnet}

Thanks for the suggestion. It appears that NETMAP does 1:1 and both
SNAT and DNAT. I need to do many:1 lots of times (so (many:1)*n), and
I don't need (or want actually) DNAT. Is it possible to use NETMAP to
do this?
Thanks.
Anton
