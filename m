From: Tiago <tiago.deb@gmail.com>
Subject: Re: How to register DROP rules in the kernel mode
Date: Wed, 21 Nov 2007 17:32:51 +0000
Message-ID: <9c1c9eb80711210932w14f5d04vd6d9e262bb1e922c@mail.gmail.com>
References: <2156.211.111.195.128.1195629252.squirrel@211.111.194.2>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=8BobaenAPxgOodgpF4yZ/R20saVVU1Ub41vNu14aeBM=;
        b=tlvVkHhxdkVJzox9cVygPyEZsErnj3PNFe3FsPFa05i8w0mJx5Y+DlzAB+hvmZfflaGaszDNs020F2E/xG+xn700B4mxIjewK+Meb1t3Asg+P5Iy+ANnEE1yIe3mNgffGl5i1NyGidYPZq+Q9BdZPqwhge9MVtJ9a2h/6CP9Isw=
In-Reply-To: <2156.211.111.195.128.1195629252.squirrel@211.111.194.2>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: msn@vtopia.co.kr
Cc: netfilter@vger.kernel.org

On Nov 21, 2007 7:14 AM, msn <msn@vtopia.co.kr> wrote:
>
> Hi, i'm trying to writing the kerenl modules which is hooking the packet
> from kernel mode, also it'll registering specific ip address to netfilter
> drop rules. any one knows samples whatever ? thanks in advance.
>
> all ruls comes from do_replace() in the ip_tables.c which copying from
> user space, i guess. this is what i want exactly. i mean need to get the
> exampls of the do_replace().
>
> Cheers.
>
>
>
> -
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

Hi,

You should send email for Netfilter Developer Mailing List
<netfilter-devel@vger.kernel.org>.

This link contains a howto kernel hacking netfilter, but not iptables hacking.

http://www.phrack.org/issues.html?issue=61&id=13

Regards

Tiago
