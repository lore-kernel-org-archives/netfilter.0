From: Anand Raj Manickam <anandrm@gmail.com>
Subject: Re: Fails to NAT and Route reply packets for Multiple Interfaces
Date: Fri, 21 Aug 2015 16:10:55 +0530
Message-ID: <CAEyr1FRVQ2J++aFsxT9rTtvOGjs+OfJu5Yw1AG__Py=n7pdRZQ@mail.gmail.com>
References: <CAEyr1FTKc3bbt4UNKooA2VW7=-gthE2C3_rP7-PxvF3LebW7Ew@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=beXx6SwOi6lQU4gESkS52uKKjdfD6mzaw5uZ7vdPEZs=;
        b=kba2LNuuPhGlaBLYMzkPZixMO9go/S7/JScWbkG+zpiM94vKc08FRPkpkjcmjvwDMu
         zSCF0w8Xh86WcT4ceQLtirQDA4T0bc9H2bFN8czr+gN3sFKDajM1nGiXScpVqdotgN8p
         NYtb88pFmg7FtfC6cFZ+FYzJ9OU62XxQzZ25D0J9/ZoCy5wRUCv9h9bSh4ZbDI/IKxDd
         1XW5m4wp5AWwe4wGZMoSuH1ElWWZ+H4+bTmIsAhPG2Nxqzr2vH90PDamt4RMHdfqbniu
         b/6FtsoOS2WtwYCfRfBVct7U+5NmcL3UdyUI8PQpA71YHovK4B9GvWnJT83Qx7y7FHgt
         MDzA==
In-Reply-To: <CAEyr1FTKc3bbt4UNKooA2VW7=-gthE2C3_rP7-PxvF3LebW7Ew@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>, Anand Raj Manickam <anandrm@gmail.com>

This issue was due to rp_filter was turned on . Looks good now after
turning off rp_filter.
Thanks.

On Thu, Aug 20, 2015 at 8:28 PM, Anand Raj Manickam <anandrm@gmail.com> wrote:
> Hi ,
> I have a multi nic router setup.
>
> 172.0.0.1/24  |---------(eth1)(Internet)
> eth0(LAN)----|
>                       |---------(eth2)(Internet)
>
> When both the Links are up and connected , the NATTING / ROUTING fails
> to route the packet back to the LAN on one of the Links in most cases
> it eth1 .
> Eg
> 172.1.1.1->100.1.1.1  routed to eth1 , which(i m MASQURADING) SNAT's
> to x.x.x.x ->100.1.1.1
> there is reply from 100.1.1.1->x.x.x.x. I see the packet in the
> PREROUTING Mangle table and also in TCPDUMP . But after that the
> packet is lost.
> I did try to log the packet in FORWARD , mangle table , it did not reach here .
>
> Conntrack -E , also show the SYN_RECV state for the packet.
>
> But when only one link is in connected state , it works fine. Also
> ,when both the links are up it routes fine on eth2. The connectivity
> of the links are fine as i m using this in a private setup.
>
> I m using fwmark ip route table to route the packets on the particular
> interface .
> I m using Linux Kernel version 3.12.14 .
>
> Can someone shed some light this ?
>
> Thanks,
> Anand
