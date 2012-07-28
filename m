From: Gomathivinayagam Muthuvinayagam <sankarmail@gmail.com>
Subject: Re: ulogd - ip_conntrack_netlink - how to get it working one
Date: Sat, 28 Jul 2012 13:05:40 -0700
Message-ID: <CAAJpzgbtwGZu9cc8d9yMwA4pqF_PNfxOLaCW0FSHD1TTg8StLw@mail.gmail.com>
References: <rgu14k39xifc9a2d4trq2t69.1343504485786@email.android.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=NKUk48sR+FPA9OMZ2pxbV5P2xCFZQ0vK5dN4BclxzVw=;
        b=x3zwmSGeN7ivSCx6G65pILywExyxkDljrmmHOaIUrGPE4cbcn7oyChF3d1tdaE8wWL
         hA5cXx/BhOolsz61+f5gWk+FxhVIDqMZd4jELyeulqam1k+y1+wACbz8zVu3qucnGTWL
         YVKWUWc6JvQfFoEUttcBWJuCU6zfxkCaTfdSi6YDSWSWx/xFQ5AKSKMZijaCU9nWwkYr
         N3tV/XVQG23i9/sf700XVKFN8DJk/CKecqmy2G2Y5Pylm+Idsc0ZV8Wh9f6Xg1H/7/3p
         L0XjmktSmsUf5az8f6K+eEpWR+B38uKye+IFEzkqn2+rI1eyiQONpBqENSH9oarkQtOl
         tgcw==
In-Reply-To: <rgu14k39xifc9a2d4trq2t69.1343504485786@email.android.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Eric Leblond <eric@regit.org>
Cc: netfilter@vger.kernel.org

Thank you so much for your quick reply. I will try to debug this.
If you have any suggestions in debugging, please let me know.

Thanks & Regards,




On Sat, Jul 28, 2012 at 12:41 PM, Eric Leblond <eric@regit.org> wrote:
> Hello
>
> This is an alias: ip_conntrack_net link and nf* are the same.
> However there could be an issue if kernel is too old. Some specific p=
arams could not work.
>
> BR
>
> Gomathivinayagam Muthuvinayagam <sankarmail@gmail.com> a =E9crit :
>
>>Thank you for your mail. Its difficult to upgrade the kernel. My
>>question is whether ulogd will work with ip_conntrack_netlink.
>>If you can answer the following questions, that would be very helpful=
=2E
>>
>> 1) Is there any way that I can make ulogd to talk to
>>> > ip_conntrack_netlink, and whether ip_conntrack_netlink is equival=
ent
>>> > of nf_conntrack_netlink?
>>> >
>>> > 2) If (1) is not possible, can I able to include just the
>>> > nf_conntrack_netlink in RHEL5 without changing any existing
>>> > functionality? nf_conntrack_netlink and ip_conntrack_netlink can =
work
>>> > well simultaneously?
>>> >
>>> > 3) If (2) is not possible, what would be your advice on this? RHE=
L5 +
>>> > ip_conntrack_netlink is used in many servers(may be more than 100=
0
>>> > servers) in my organization. Considering this, any change would c=
ause
>>> > potential testing. So a simple solution would be easily accepted =
in my
>>> > organization.
>>
>>
>>Thanks & Regards,
>>
>>
>>
>>
>>On Sat, Jul 28, 2012 at 10:44 AM, Eric Leblond <eric@regit.org> wrote=
:
>>> Hello,
>>>
>>> Le vendredi 27 juillet 2012 =E0 20:43 -0700, Gomathivinayagam
>>> Muthuvinayagam a =E9crit :
>>>> For the flow based logging (NFCT plugin), without iptable rules ul=
ogd
>>>> works perfectly. Basically ulogd NFCT plugin directly communicates
>>>> with conntrack system through nf_conntrack_netlink. This thing I h=
ave
>>>> tested in my ubuntu system and works fine. Only problem is with RH=
EL5
>>>> system, because there is nf_conntrack_netlink module.
>>>
>>> Then all you can do is to upgrade your kernel... RHEL5 is almost fr=
om
>>> previous century...
>>>
>>> BR,
>>>
>>>>
>>>> -----Original Message-----
>>>> From: netfilter-owner@vger.kernel.org
>>>> [mailto:netfilter-owner@vger.kernel.org] On Behalf Of kay
>>>> Sent: Friday, July 27, 2012 8:39 PM
>>>> To: netfilter@vger.kernel.org
>>>> Subject: Re: ulogd - ip_conntrack_netlink - how to get it working =
one
>>>>
>>>> Could you please provide your iptables rules with ULOG action?
>>>>
>>>> 2012/7/28 Gomathivinayagam Muthuvinayagam <sankarmail@gmail.com>:
>>>> > Thank you for your reply.
>>>> >
>>>> > Let me print the ulogd configurations here, so that I can descri=
be my
>>>> > problem better.
>>>> >
>>>> > # this is a stack for flow-based logging via LOGEMU
>>>> > stack=3Dct1:NFCT,ip2str1:IP2STR,print1:PRINTFLOW,emu1:LOGEMU
>>>> >
>>>> > [ct1]
>>>> > netlink_socket_buffer_size=3D217088
>>>> > netlink_socket_buffer_maxsize=3D1085440
>>>> > #netlink_resync_timeout=3D60 # seconds to wait to perform
>>>> > resynchronization
>>>> > pollinterval=3D5 # use poll-based logging instead of event-drive=
n
>>>> > hash_enable=3D1
>>>> >
>>>> > ulogd is running without any error messages. But, ulogd_syslogem=
u.log
>>>> > has no contents. conntrack -E displays the flow perfectly.
>>>> >
>>>> > I tried to find out the cause of no content in the ulogd_sysloge=
mu.log
>>>> > in the log file. ulogd requires nf_conntrack_netlink subsystem/m=
odule.
>>>> > In my linux version (RHEL 5), I dont have that. Instead of that =
I have
>>>> > ip_conntrack_netlink module.
>>>> >
>>>> > 1) Is there any way that I can make ulogd to talk to
>>>> > ip_conntrack_netlink, and whether ip_conntrack_netlink is equiva=
lent
>>>> > of nf_conntrack_netlink?
>>>> >
>>>> > 2) If (1) is not possible, can I able to include just the
>>>> > nf_conntrack_netlink in RHEL5 without changing any existing
>>>> > functionality? nf_conntrack_netlink and ip_conntrack_netlink can=
 work
>>>> > well simultaneously?
>>>> >
>>>> > 3) If (2) is not possible, what would be your advice on this? RH=
EL5 +
>>>> > ip_conntrack_netlink is used in many servers(may be more than 10=
00
>>>> > servers) in my organization. Considering this, any change would =
cause
>>>> > potential testing. So a simple solution would be easily accepted=
 in my
>>>> > organization.
>>>> >
>>>> >
>>>> > -----Original Message-----
>>>> > From: netfilter-owner@vger.kernel.org
>>>> > [mailto:netfilter-owner@vger.kernel.org] On Behalf Of kay
>>>> > Sent: Friday, July 27, 2012 8:12 PM
>>>> > To: netfilter@vger.kernel.org
>>>> > Subject: Re: ulogd - ip_conntrack_netlink - how to get it workin=
g one
>>>> >
>>>> > Dear Gomathivinayagam,
>>>> >
>>>> > What exactly you would like to achieve and what you already achi=
eved?
>>>> >
>>>> > What did you mean saying "capture flow based logging"?
>>>> >
>>>> > For example here is my ulog data:
>>>> >
>>>> > Jul 28 01:03:15 esagila DROP packet:  IN=3Deth0 OUT=3D MAC=3D***=
  SRC=3D***
>>>> > DST=3D*** LEN=3D52 TOS=3D00 PREC=3D0x00 TTL=3D55 ID=3D37188 CE D=
=46 PROTO=3DTCP
>>>> > SPT=3D51183 DPT=3D22 SEQ=3D2563245107 ACK=3D138246617 WINDOW=3D6=
1 ACK URGP=3D0
>>>> >
>>>> > Do you need something more with the packet data or what?
>>>> >
>>>> > 2012/7/28 Gomathivinayagam Muthuvinayagam <sankarmail@gmail.com>=
:
>>>> >> I don=92t know whether I=92m asking stupid questions, but if so=
meone
>>>> >> could respond for this post, that will be great.
>>>> >>
>>>> >> Thanks & Regards,
>>>> >>
>>>> >>
>>>> >>
>>>> >>
>>>> >> On Fri, Jul 27, 2012 at 7:26 PM, Gomathivinayagam Muthuvinayaga=
m
>>>> >> <sankarmail@gmail.com> wrote:
>>>> >>> Hi,
>>>> >>>
>>>> >>> I have a RHEL 5 os in my system. I have setup ulogd in my loca=
l
>>>> >>> system. I=92m able to do packet capturing.
>>>> >>> I=92m not able to capture flow based logging. What I have foun=
d was,
>>>> >>> in my system I don=92t have nf_conntrack_netlink.
>>>> >>> Instead I have ip_conntrack_netlink. Is that possible I can
>>>> >>> incorporate nf_conntrack_netlink into RHEL5? And make ulogd to=
 be
>>>> >>> working one.
>>>> >>>
>>>> >>> Your help would be much appreciated.
>>>> >>>
>>>> >>> Thanks,
>>>> >>>
>>>> >>>
>>>> >>> Thanks & Regards,
>>>> >> --
>>>> >> To unsubscribe from this list: send the line "unsubscribe netfi=
lter"
>>>> >> in the body of a message to majordomo@vger.kernel.org More majo=
rdomo
>>>> >> info at  http://vger.kernel.org/majordomo-info.html
>>>> > --
>>>> > To unsubscribe from this list: send the line "unsubscribe netfil=
ter"
>>>> > in the body of a message to majordomo@vger.kernel.org More major=
domo
>>>> > info at  http://vger.kernel.org/majordomo-info.html
>>>> > --
>>>> > To unsubscribe from this list: send the line "unsubscribe netfil=
ter"
>>>> > in the body of a message to majordomo@vger.kernel.org More major=
domo
>>>> > info at  http://vger.kernel.org/majordomo-info.html
>>>> --
>>>> To unsubscribe from this list: send the line "unsubscribe netfilte=
r"
>>>> in the body of a message to majordomo@vger.kernel.org More majordo=
mo
>>>> info at  http://vger.kernel.org/majordomo-info.html
>>>> --
>>>> To unsubscribe from this list: send the line "unsubscribe netfilte=
r" in
>>>> the body of a message to majordomo@vger.kernel.org
>>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>
>>> --
>>> Eric Leblond
>>> Blog: http://home.regit.org/ - Portfolio: http://regit.500px.com/
