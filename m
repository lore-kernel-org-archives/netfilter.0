From: Gomathivinayagam Muthuvinayagam <sankarmail@gmail.com>
Subject: Re: ulogd - ip_conntrack_netlink - how to get it working one
Date: Sat, 28 Jul 2012 01:17:19 -0700
Message-ID: <CAAJpzgabwrGetLiKrJco_=ZByN0Z8KEdQ32A1Vw_ee6Hn4DPsw@mail.gmail.com>
References: <CAAJpzgb2ZEoRayuzvUVevvRvJ=oXA6=heQa98fKD_63QXVe4xg@mail.gmail.com>
 <CAAJpzgbutOBLB1t9vXYeXSPS=wwxeeSanTYJo+qNkjTfQr2rVw@mail.gmail.com>
 <CAAJpzga_Bga+2=hG_PpZcs9OSrpGed+gue-j=TLrg4bL9cPPNA@mail.gmail.com> <CAAJpzgaMLex=6QEd4YKik-XnAvGcOXTN7Zovo54ZfO-N=P9aDQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :content-type:content-transfer-encoding;
        bh=xWMbTSn4+OHZ1FpthJg4w0IWGPDeni+bh7KSR2uVXCY=;
        b=QCfJDx6EeKvLeLQOxCyztt4d2URJZStY5aqWqMFK3s+WJ751N0OWNbUEJrpG8kkcdp
         pGSGiIRmKl2n5Hf6D+BU9PitzD2fxxNXLR4xE4PDLrowg57Qh38MRW04LDvNMvie3KMl
         Ct7I+22WHeZFKusC8XmqOwETOS6AM1w8Ig2h7C6QnLrDPcOiZmY28xY8TJKSmndd7kLb
         mp1AeBE2tQAivSOKQtqSVWM4Iuq5t5wDtcIO6OXGtSaLEKOHDRRG8h387nI8nj0+LE0K
         Rj0dZp2vLZtrTKO5EUZYfHgZqYd1FiL3DSLjaL/EfE1D6/aLr+NT7IT3WqeuhqGGw8gE
         p7Bg==
In-Reply-To: <CAAJpzgaMLex=6QEd4YKik-XnAvGcOXTN7Zovo54ZfO-N=P9aDQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@vger.kernel.org

Can someone respond to this? Your help would be much appreciated.

Thanks & Regards,




On Fri, Jul 27, 2012 at 8:43 PM, Gomathivinayagam Muthuvinayagam
<sankarmail@gmail.com> wrote:
> For the flow based logging (NFCT plugin), without iptable rules ulogd
> works perfectly. Basically ulogd NFCT plugin directly communicates
> with conntrack system through nf_conntrack_netlink. This thing I have
> tested in my ubuntu system and works fine. Only problem is with RHEL5
> system, because there is nf_conntrack_netlink module.
>
> -----Original Message-----
> From: netfilter-owner@vger.kernel.org
> [mailto:netfilter-owner@vger.kernel.org] On Behalf Of kay
> Sent: Friday, July 27, 2012 8:39 PM
> To: netfilter@vger.kernel.org
> Subject: Re: ulogd - ip_conntrack_netlink - how to get it working one
>
> Could you please provide your iptables rules with ULOG action?
>
> 2012/7/28 Gomathivinayagam Muthuvinayagam <sankarmail@gmail.com>:
>> Thank you for your reply.
>>
>> Let me print the ulogd configurations here, so that I can describe m=
y
>> problem better.
>>
>> # this is a stack for flow-based logging via LOGEMU
>> stack=3Dct1:NFCT,ip2str1:IP2STR,print1:PRINTFLOW,emu1:LOGEMU
>>
>> [ct1]
>> netlink_socket_buffer_size=3D217088
>> netlink_socket_buffer_maxsize=3D1085440
>> #netlink_resync_timeout=3D60 # seconds to wait to perform
>> resynchronization
>> pollinterval=3D5 # use poll-based logging instead of event-driven
>> hash_enable=3D1
>>
>> ulogd is running without any error messages. But, ulogd_syslogemu.lo=
g
>> has no contents. conntrack -E displays the flow perfectly.
>>
>> I tried to find out the cause of no content in the ulogd_syslogemu.l=
og
>> in the log file. ulogd requires nf_conntrack_netlink subsystem/modul=
e.
>> In my linux version (RHEL 5), I dont have that. Instead of that I ha=
ve
>> ip_conntrack_netlink module.
>>
>> 1) Is there any way that I can make ulogd to talk to
>> ip_conntrack_netlink, and whether ip_conntrack_netlink is equivalent
>> of nf_conntrack_netlink?
>>
>> 2) If (1) is not possible, can I able to include just the
>> nf_conntrack_netlink in RHEL5 without changing any existing
>> functionality? nf_conntrack_netlink and ip_conntrack_netlink can wor=
k
>> well simultaneously?
>>
>> 3) If (2) is not possible, what would be your advice on this? RHEL5 =
+
>> ip_conntrack_netlink is used in many servers(may be more than 1000
>> servers) in my organization. Considering this, any change would caus=
e
>> potential testing. So a simple solution would be easily accepted in =
my
>> organization.
>>
>>
>> -----Original Message-----
>> From: netfilter-owner@vger.kernel.org
>> [mailto:netfilter-owner@vger.kernel.org] On Behalf Of kay
>> Sent: Friday, July 27, 2012 8:12 PM
>> To: netfilter@vger.kernel.org
>> Subject: Re: ulogd - ip_conntrack_netlink - how to get it working on=
e
>>
>> Dear Gomathivinayagam,
>>
>> What exactly you would like to achieve and what you already achieved=
?
>>
>> What did you mean saying "capture flow based logging"?
>>
>> For example here is my ulog data:
>>
>> Jul 28 01:03:15 esagila DROP packet:  IN=3Deth0 OUT=3D MAC=3D***  SR=
C=3D***
>> DST=3D*** LEN=3D52 TOS=3D00 PREC=3D0x00 TTL=3D55 ID=3D37188 CE DF PR=
OTO=3DTCP
>> SPT=3D51183 DPT=3D22 SEQ=3D2563245107 ACK=3D138246617 WINDOW=3D61 AC=
K URGP=3D0
>>
>> Do you need something more with the packet data or what?
>>
>> 2012/7/28 Gomathivinayagam Muthuvinayagam <sankarmail@gmail.com>:
>>> I don=92t know whether I=92m asking stupid questions, but if someon=
e
>>> could respond for this post, that will be great.
>>>
>>> Thanks & Regards,
>>>
>>>
>>>
>>>
>>> On Fri, Jul 27, 2012 at 7:26 PM, Gomathivinayagam Muthuvinayagam
>>> <sankarmail@gmail.com> wrote:
>>>> Hi,
>>>>
>>>> I have a RHEL 5 os in my system. I have setup ulogd in my local
>>>> system. I=92m able to do packet capturing.
>>>> I=92m not able to capture flow based logging. What I have found wa=
s,
>>>> in my system I don=92t have nf_conntrack_netlink.
>>>> Instead I have ip_conntrack_netlink. Is that possible I can
>>>> incorporate nf_conntrack_netlink into RHEL5? And make ulogd to be
>>>> working one.
>>>>
>>>> Your help would be much appreciated.
>>>>
>>>> Thanks,
>>>>
>>>>
>>>> Thanks & Regards,
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe netfilter=
"
>>> in the body of a message to majordomo@vger.kernel.org More majordom=
o
>>> info at  http://vger.kernel.org/majordomo-info.html
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"
>> in the body of a message to majordomo@vger.kernel.org More majordomo
>> info at  http://vger.kernel.org/majordomo-info.html
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"
>> in the body of a message to majordomo@vger.kernel.org More majordomo
>> info at  http://vger.kernel.org/majordomo-info.html
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter"
> in the body of a message to majordomo@vger.kernel.org More majordomo
> info at  http://vger.kernel.org/majordomo-info.html
