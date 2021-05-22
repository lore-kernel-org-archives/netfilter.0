From: Psyspy 22 <psyspy2020@gmail.com>
Subject: Re: libnetfilter_conntrack: ABI breakage error
Date: Fri, 21 May 2021 18:55:54 -0600
Message-ID: <CAFqmWq_rRH8_XydrUdFgmG0kYe1+xXJucp7XZbEows5DE=qxbg@mail.gmail.com>
References: <CAFqmWq9r95YtvNc+eYwHcL+oDutgL+g++tPZBsr9yh2KrNveNw@mail.gmail.com>
 <20210521215632.GA3619@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EXpRyQpgF0G47y+3DIzyLNa/k+ZOW7RlWWfHHGaWMQs=;
        b=E1DqxprCiEs89jdjrjzYCOPzas7VGpwg8yvNEyA/gfhbme7xZw4Iz7PrstHPay7o0q
         M8fO4wT9XNnX2fda8YVs8PfS2CTm3XNIZUfxxoaNQey88nUELWkdMbG7kr5galCbgtcH
         ODCIJIBl3IK6ph83ccmgMP9wriU7DF+E6ap9LXvzeWQ/qC0YFPEO6dACCo5/FwuuaqC6
         Fuorwd7zG9ZyzizUSfOEBw714POfig7rLd7NPQQfiixcZiDpYGWcbbGvR07+7MaQWUn9
         YAaMZRdGdVUaqGl7Tz0JCoaSP/eTPGMc+dDHza+PWavst6a/qfzxhhZZ4e2hSoAcN8hr
         +zRg==
In-Reply-To: <20210521215632.GA3619@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Hello Pablo,

I cross compiled the application. Host/Build: Ubuntu 20,10, x86_64.
Target machine: aarch64, Linux kernel: 4.1. I am using other netfilter
libraries like libnetfilter_queue, libmnl. They work fine. Instead of
using the dump example from libnetfilter_conntrack, I can try using
the example from libmnl. The conntrack library uses nfct_nlmsg_parse()
(which causes the issue) whereas the libmnl parses the netlink message
by itself. I can try to avoid parsing the CTA_SYNPROXY_TSOFF
attribute.

Thanks!

On Fri, May 21, 2021 at 3:56 PM Pablo Neira Ayuso <pablo@netfilter.org> wrote:
>
> On Fri, May 21, 2021 at 11:55:11AM -0600, Psyspy 22 wrote:
> > Hello,
> >
> > I am trying to dump conntrack entries from my application. When I run
> > the binary, it throws the following error and exits:
> >
> > # ./dump
> > ctnetlink kernel ABI is broken, contact your vendor.
> > ../../source_subfolder/src/conntrack/parse_mnl.c:824 reason: Numerical
> > result out of range
> >
> > I looked at the source code of the library, it seems to be this line:
> >
> > case CTA_SYNPROXY_TSOFF:
> >            if (mnl_attr_validate(attr, MNL_TYPE_U32) < 0)
> >                abi_breakage();
> >            break;
> >        }
> >
> > I am not sure why this issue occurs or how to fix it. I appreciate any help!
>
> Strange. Could you provide more details regarding your setup?
>
> Thanks.
