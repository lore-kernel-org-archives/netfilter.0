From: Luigi Rizzo <rizzo@iet.unipi.it>
Subject: Re: Build firewall with millions pps support
Date: Wed, 27 Apr 2016 08:39:52 +0200
Message-ID: <20160427063952.GA55161@onelab2.iet.unipi.it>
References: <CAPgF-foyqY7_UbQVK7R4vU5MRP0XsfgXAjpQUNwNROZVq9YxDQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAPgF-foyqY7_UbQVK7R4vU5MRP0XsfgXAjpQUNwNROZVq9YxDQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Satish Patel <satish.txt@gmail.com>
Cc: netfilter@vger.kernel.org

On Tue, Apr 26, 2016 at 11:20:00PM -0400, Satish Patel wrote:
> Planning to build stateless firewall which support 10GE link with
> handling 2 million packet per second, need following suggestion from
> folks
> 
> 1. Which OS i should use?  (BSD or Linux?)
> 2. what type of 10GE NIC i should pick to achieve high Mpps (multiqueue etc.)
> 3. what should i use for bypass kernel (I heard from googling people
> saying use this technique).
> 4. what kind of server i should pick?
> 
> We are build this firewall to stop bad traffic at front door and DDoS
> (specially flooding and UDP IP Fragmentation stype)


you may want to look at github.com/luigirizzo/netmap-ipfw ,
it is a version of FreeBSD's ipfw+dummynet which runs on top
of netmap.

This works on both Linux and FreeBSD

Re. cards in my experience the Intel cards (the old X520
based on the 85299, and the newer X710 based on the new chipset)
are both decent (I have a slight preference for the older,
which I find more performant)

cheers
luigi

> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
