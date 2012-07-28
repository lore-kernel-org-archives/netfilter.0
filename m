From: kay <kay.diam@gmail.com>
Subject: Re: ulogd - ip_conntrack_netlink - how to get it working one
Date: Sat, 28 Jul 2012 07:11:56 +0400
Message-ID: <CANaOheZJ0Pe8f59LrVJ+Mtes6DXMRg+WWsFGxRUqnLpQ1-c0Aw@mail.gmail.com>
References: <CAAJpzgb2ZEoRayuzvUVevvRvJ=oXA6=heQa98fKD_63QXVe4xg@mail.gmail.com>
 <CAAJpzgbutOBLB1t9vXYeXSPS=wwxeeSanTYJo+qNkjTfQr2rVw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :content-type:content-transfer-encoding;
        bh=CcfjIoHeahrkXs+ChHBn9sbKLI4Ggz06Oln90mkZxXE=;
        b=MdoF3UhSvDyqh3JS0sW3N/AKtAOjDyiyUdbXWeg16Tdd04f2S6cxXIuOwWXWmgjrF1
         bTe3F8xzHxvoi0h2s2PgNWP7wsblSEfc1hu31sbJ/RLVC2hcT8K5EVmFuAsbt73AudR1
         EWz6jpeQejLZCKV56k6MZy2je4Vn6D9H8yLPIOd7y3Rdz0eGnOdYGiiHfFyK4IHfwLC8
         oA6pmGFPp1QUsbPckKHQ/hJFTHNVqyMp5k5sHmhC/zkwEuBnVVP9w6Tgq3E5IvH3hblk
         B22OgKRRWtqkgliZ5Rx551mnL3nCcNoSUATq3k+kKydY94yj7w1O7+jt4lbIBCJ5HlMX
         U9KQ==
In-Reply-To: <CAAJpzgbutOBLB1t9vXYeXSPS=wwxeeSanTYJo+qNkjTfQr2rVw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@vger.kernel.org

Dear Gomathivinayagam,

What exactly you would like to achieve and what you already achieved?

What did you mean saying "capture flow based logging"?

=46or example here is my ulog data:

Jul 28 01:03:15 esagila DROP packet:  IN=3Deth0 OUT=3D MAC=3D***  SRC=3D=
***
DST=3D*** LEN=3D52 TOS=3D00 PREC=3D0x00 TTL=3D55 ID=3D37188 CE DF PROTO=
=3DTCP
SPT=3D51183 DPT=3D22 SEQ=3D2563245107 ACK=3D138246617 WINDOW=3D61 ACK U=
RGP=3D0

Do you need something more with the packet data or what?

2012/7/28 Gomathivinayagam Muthuvinayagam <sankarmail@gmail.com>:
> I don=92t know whether I=92m asking stupid questions, but if someone =
could
> respond for this post, that will be great.
>
> Thanks & Regards,
>
>
>
>
> On Fri, Jul 27, 2012 at 7:26 PM, Gomathivinayagam Muthuvinayagam
> <sankarmail@gmail.com> wrote:
>> Hi,
>>
>> I have a RHEL 5 os in my system. I have setup ulogd in my local
>> system. I=92m able to do packet capturing.
>> I=92m not able to capture flow based logging. What I have found was,=
 in
>> my system I don=92t have nf_conntrack_netlink.
>> Instead I have ip_conntrack_netlink. Is that possible I can
>> incorporate nf_conntrack_netlink into RHEL5? And make ulogd to be
>> working one.
>>
>> Your help would be much appreciated.
>>
>> Thanks,
>>
>>
>> Thanks & Regards,
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
