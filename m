From: Gomathivinayagam Muthuvinayagam <sankarmail@gmail.com>
Subject: Re: ulogd - ip_conntrack_netlink - how to get it working one
Date: Sat, 28 Jul 2012 12:04:33 -0700
Message-ID: <CAAJpzgbWivGLg6YDOwFb-Rtgr-kYnHeZLWADqgtDzvJzeq=bLQ@mail.gmail.com>
References: <CAAJpzgb2ZEoRayuzvUVevvRvJ=oXA6=heQa98fKD_63QXVe4xg@mail.gmail.com>
 <CAAJpzgbutOBLB1t9vXYeXSPS=wwxeeSanTYJo+qNkjTfQr2rVw@mail.gmail.com>
 <CAAJpzga_Bga+2=hG_PpZcs9OSrpGed+gue-j=TLrg4bL9cPPNA@mail.gmail.com>
 <CAAJpzgaMLex=6QEd4YKik-XnAvGcOXTN7Zovo54ZfO-N=P9aDQ@mail.gmail.com> <1343497474.7072.4.camel@tiger.regit.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=wMrd/tFwyEnwYNO3ykNrgDT8sMUy2BxYOwseoY9rdmU=;
        b=RYwPet4BpW1V5v3P1Sl50696Oqzq/El70PML5mkCgvHs0xkYQ2YJt+CwJf/12OXe7a
         yh6kgb1rkJGMsZj630H8Fb1iL43dIRr1BOy8K9O2I85R+IqaDjexxsNbX4HpuaeYd6AE
         vBT3r0xHPUNABvD40+rKhQtq0J7lauuY9Bbii8dTGtc6KdFYFnAUAhWrQoLS4Temng0a
         JmU+7HCLV3F4arDPO6nHGey6dDBqcDglEQC3GKerrW3fQekTT2UPDcV8OSX8B0WsCpYk
         MMyTQwsDjgtbREyO1tWI+ZLcrYGBwZYB3hAHVXiqGYYLVWnUJ9ehYyuK2ZEiduPqu0uu
         YL/g==
In-Reply-To: <1343497474.7072.4.camel@tiger.regit.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Eric Leblond <eric@regit.org>
Cc: netfilter@vger.kernel.org

Thank you for your mail. Its difficult to upgrade the kernel. My
question is whether ulogd will work with ip_conntrack_netlink.
If you can answer the following questions, that would be very helpful.

 1) Is there any way that I can make ulogd to talk to
> > ip_conntrack_netlink, and whether ip_conntrack_netlink is equivalen=
t
> > of nf_conntrack_netlink?
> >
> > 2) If (1) is not possible, can I able to include just the
> > nf_conntrack_netlink in RHEL5 without changing any existing
> > functionality? nf_conntrack_netlink and ip_conntrack_netlink can wo=
rk
> > well simultaneously?
> >
> > 3) If (2) is not possible, what would be your advice on this? RHEL5=
 +
> > ip_conntrack_netlink is used in many servers(may be more than 1000
> > servers) in my organization. Considering this, any change would cau=
se
> > potential testing. So a simple solution would be easily accepted in=
 my
> > organization.


Thanks & Regards,




On Sat, Jul 28, 2012 at 10:44 AM, Eric Leblond <eric@regit.org> wrote:
> Hello,
>
> Le vendredi 27 juillet 2012 =E0 20:43 -0700, Gomathivinayagam
> Muthuvinayagam a =E9crit :
>> For the flow based logging (NFCT plugin), without iptable rules ulog=
d
>> works perfectly. Basically ulogd NFCT plugin directly communicates
>> with conntrack system through nf_conntrack_netlink. This thing I hav=
e
>> tested in my ubuntu system and works fine. Only problem is with RHEL=
5
>> system, because there is nf_conntrack_netlink module.
>
> Then all you can do is to upgrade your kernel... RHEL5 is almost from
> previous century...
>
> BR,
>
>>
>> -----Original Message-----
>> From: netfilter-owner@vger.kernel.org
>> [mailto:netfilter-owner@vger.kernel.org] On Behalf Of kay
>> Sent: Friday, July 27, 2012 8:39 PM
>> To: netfilter@vger.kernel.org
>> Subject: Re: ulogd - ip_conntrack_netlink - how to get it working on=
e
>>
>> Could you please provide your iptables rules with ULOG action?
>>
>> 2012/7/28 Gomathivinayagam Muthuvinayagam <sankarmail@gmail.com>:
>> > Thank you for your reply.
>> >
>> > Let me print the ulogd configurations here, so that I can describe=
 my
>> > problem better.
>> >
>> > # this is a stack for flow-based logging via LOGEMU
>> > stack=3Dct1:NFCT,ip2str1:IP2STR,print1:PRINTFLOW,emu1:LOGEMU
>> >
>> > [ct1]
>> > netlink_socket_buffer_size=3D217088
>> > netlink_socket_buffer_maxsize=3D1085440
>> > #netlink_resync_timeout=3D60 # seconds to wait to perform
>> > resynchronization
>> > pollinterval=3D5 # use poll-based logging instead of event-driven
>> > hash_enable=3D1
>> >
>> > ulogd is running without any error messages. But, ulogd_syslogemu.=
log
>> > has no contents. conntrack -E displays the flow perfectly.
>> >
>> > I tried to find out the cause of no content in the ulogd_syslogemu=
=2Elog
>> > in the log file. ulogd requires nf_conntrack_netlink subsystem/mod=
ule.
>> > In my linux version (RHEL 5), I dont have that. Instead of that I =
have
>> > ip_conntrack_netlink module.
>> >
>> > 1) Is there any way that I can make ulogd to talk to
>> > ip_conntrack_netlink, and whether ip_conntrack_netlink is equivale=
nt
>> > of nf_conntrack_netlink?
>> >
>> > 2) If (1) is not possible, can I able to include just the
>> > nf_conntrack_netlink in RHEL5 without changing any existing
>> > functionality? nf_conntrack_netlink and ip_conntrack_netlink can w=
ork
>> > well simultaneously?
>> >
>> > 3) If (2) is not possible, what would be your advice on this? RHEL=
5 +
>> > ip_conntrack_netlink is used in many servers(may be more than 1000
>> > servers) in my organization. Considering this, any change would ca=
use
>> > potential testing. So a simple solution would be easily accepted i=
n my
>> > organization.
>> >
>> >
>> > -----Original Message-----
>> > From: netfilter-owner@vger.kernel.org
>> > [mailto:netfilter-owner@vger.kernel.org] On Behalf Of kay
>> > Sent: Friday, July 27, 2012 8:12 PM
>> > To: netfilter@vger.kernel.org
>> > Subject: Re: ulogd - ip_conntrack_netlink - how to get it working =
one
>> >
>> > Dear Gomathivinayagam,
>> >
>> > What exactly you would like to achieve and what you already achiev=
ed?
>> >
>> > What did you mean saying "capture flow based logging"?
>> >
>> > For example here is my ulog data:
>> >
>> > Jul 28 01:03:15 esagila DROP packet:  IN=3Deth0 OUT=3D MAC=3D***  =
SRC=3D***
>> > DST=3D*** LEN=3D52 TOS=3D00 PREC=3D0x00 TTL=3D55 ID=3D37188 CE DF =
PROTO=3DTCP
>> > SPT=3D51183 DPT=3D22 SEQ=3D2563245107 ACK=3D138246617 WINDOW=3D61 =
ACK URGP=3D0
>> >
>> > Do you need something more with the packet data or what?
>> >
>> > 2012/7/28 Gomathivinayagam Muthuvinayagam <sankarmail@gmail.com>:
>> >> I don=92t know whether I=92m asking stupid questions, but if some=
one
>> >> could respond for this post, that will be great.
>> >>
>> >> Thanks & Regards,
>> >>
>> >>
>> >>
>> >>
>> >> On Fri, Jul 27, 2012 at 7:26 PM, Gomathivinayagam Muthuvinayagam
>> >> <sankarmail@gmail.com> wrote:
>> >>> Hi,
>> >>>
>> >>> I have a RHEL 5 os in my system. I have setup ulogd in my local
>> >>> system. I=92m able to do packet capturing.
>> >>> I=92m not able to capture flow based logging. What I have found =
was,
>> >>> in my system I don=92t have nf_conntrack_netlink.
>> >>> Instead I have ip_conntrack_netlink. Is that possible I can
>> >>> incorporate nf_conntrack_netlink into RHEL5? And make ulogd to b=
e
>> >>> working one.
>> >>>
>> >>> Your help would be much appreciated.
>> >>>
>> >>> Thanks,
>> >>>
>> >>>
>> >>> Thanks & Regards,
>> >> --
>> >> To unsubscribe from this list: send the line "unsubscribe netfilt=
er"
>> >> in the body of a message to majordomo@vger.kernel.org More majord=
omo
>> >> info at  http://vger.kernel.org/majordomo-info.html
>> > --
>> > To unsubscribe from this list: send the line "unsubscribe netfilte=
r"
>> > in the body of a message to majordomo@vger.kernel.org More majordo=
mo
>> > info at  http://vger.kernel.org/majordomo-info.html
>> > --
>> > To unsubscribe from this list: send the line "unsubscribe netfilte=
r"
>> > in the body of a message to majordomo@vger.kernel.org More majordo=
mo
>> > info at  http://vger.kernel.org/majordomo-info.html
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"
>> in the body of a message to majordomo@vger.kernel.org More majordomo
>> info at  http://vger.kernel.org/majordomo-info.html
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
> --
> Eric Leblond
> Blog: http://home.regit.org/ - Portfolio: http://regit.500px.com/
