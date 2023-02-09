From: Abhijeet Rastogi <abhijeet.1989@gmail.com>
Subject: Re: IPVS: conn_tab_bits param for ip_vs > 20 leads to default being set
Date: Wed, 8 Feb 2023 20:19:44 -0800
Message-ID: <CACXxYfxAAuBSpgZgq03AAT-1tzF-0zKGL4SsbU2k2qW7E7w7Hw@mail.gmail.com>
References: <CACXxYfxtsHLpvowG3g=7vkg4U2PmqTMnojtYYjXZGrnwFkF+Ag@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mhMpUVwyeHrwinZDlzMwFNtEep08oTpeL7H7wwsTTMI=;
        b=lgHk3he5pvaQevg1WwNgQk1QLBJiYydd12DngmMlBgJarer9H6zmQDjVbyW8wIO1Be
         dqIxwZQPK9BF+lrzNwYak7hvN0CvGI4vmYVOYMiZ0xA7F4sVvQ/pSK2/ytAcdUQsHMJh
         lEck5Hhhl7D14CwRNIIJM07wsU8HRtazEAixvkJQCu8ogbdh+18eqo/gAzCmhIdcZlhG
         9EIkDTK9StOFeP1u4jOkiBWcgI78c2dpY6p7rPJYLTJIYewPerZnSvfAu/QlcnTOIZlP
         YJCrE1Y9p2+atDnO4vClqyjiINpcHa7U+LpeaPl/nI9PcF8Cf9Q0fmynUX6/IQtZD36m
         n68A==
In-Reply-To: <CACXxYfxtsHLpvowG3g=7vkg4U2PmqTMnojtYYjXZGrnwFkF+Ag@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi everyone,

I'll really appreciate some help, I felt this is the best forum to
discuss this topic. If not, please suggest.

I understand that the Kconfig file also has 8-20 range, but why isn't
that range set higher, let's say 31?

Thank you,
Abhijeet

On Mon, Feb 6, 2023 at 2:48 PM Abhijeet Rastogi <abhijeet.1989@gmail.com> wrote:
>
> Hi IPVS users,
>
> This behavior is on the 5.4 CentOS kernel and should be because of
> this check. As per the commit message[1], the problematic value is
> when conn_tab_bits>31. With that in mind, why do we limit the size to
> 7 < conn_tab_bits < 21?
>
> I stumbled upon this problem while upgrading our production hosts from
> old RHEL with kernel 3.10 to CentOS with kernel 5.4. On current RHEL
> systems, conn_tab_bits=24 works just fine.
>
> # RHEL output:-
> $ sudo ipvsadm -Ln|head -n1
> IP Virtual Server version 1.2.1 (size=16777216)
>
> Sidenote: lvs-users mailing list is dead since 2020, but it is still
> listed on the LVS website.
> http://www.linuxvirtualserver.org/mailing.html
>
> [1]: https://github.com/torvalds/linux/commit/69e73dbfda14fbfe748d3812da1244cce2928dcb
>
> Cheers,
> Abhijeet (https://abhi.host)



-- 
Cheers,
Abhijeet (https://abhi.host)
