From: =?UTF-8?B?5Y+26Zuo6aOe?= <sunyucong@gmail.com>
Subject: Re: how the packet is traversed
Date: Tue, 2 Oct 2012 13:52:23 -0700
Message-ID: <CAJygYd1JjTLi7wB0ZAvMQ-3i=466px_B-8db6Ymffec3ZJVrRg@mail.gmail.com>
References: <CAFpD06STVTqteasiBmH+ahw2O1Ad2PNPuWePfzgx9xPHZbG41w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=zyRMjeW4eHzyws4T++qC8M3gjCtUUoB3pmYZB6moV2M=;
        b=UDIz6jjq1kZuXIcjwL5NL2hvDLcB0t0CJY8JI68VM1CXqXqAXoXohjIiT/l/g5sHZZ
         2afidO3JBl4WrxfT4dJHIdDO1gBizAzunomOe8Gi291y7df5NW+f4ZOqZpf2Ww86iBy2
         ZH1JszwHIHa1Mh1mfdoX48q7xUzPDnqFvzoi2dsm0mRwsLk0dRuHiwdgGs/z5WAq1pTn
         MJPqbG4djJyhsB2v1L4xok5vbcf0f9I9lqgSoNJIc3YKlMoXYzq8bw8r41APphKJZun7
         Ho+5xLeMVjV63ISUzqMAaOdXWTUHBkiJDM2KwkPVfWQs4LNxTnknynWmL6SSKuSGjx0O
         ioZQ==
In-Reply-To: <CAFpD06STVTqteasiBmH+ahw2O1Ad2PNPuWePfzgx9xPHZbG41w@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Giuseppe Longo <giuseppelng@gmail.com>
Cc: netfilter@vger.kernel.org

It's probably better that you search google first.

http://www.linuxhomenetworking.com/wiki/index.php/Quick_HOWTO_:_Ch14_:_Linux_Firewalls_Using_iptables

On Tue, Oct 2, 2012 at 1:20 PM, Giuseppe Longo <giuseppelng@gmail.com> wrote:
> Hello,
> i'm a student of computer science, working on a project using iptables.
> I'm confused how the packet is treated when it's arrived in the iptables.
>
> Someone can explain me this process?
>
> Thanks in advice,
> Regards.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
