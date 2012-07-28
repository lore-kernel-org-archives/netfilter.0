From: Gomathivinayagam Muthuvinayagam <sankarmail@gmail.com>
Subject: Re: ulogd - ip_conntrack_netlink - how to get it working one
Date: Fri, 27 Jul 2012 20:28:00 -0700
Message-ID: <CAAJpzga_Bga+2=hG_PpZcs9OSrpGed+gue-j=TLrg4bL9cPPNA@mail.gmail.com>
References: <CAAJpzgb2ZEoRayuzvUVevvRvJ=oXA6=heQa98fKD_63QXVe4xg@mail.gmail.com>
 <CAAJpzgbutOBLB1t9vXYeXSPS=wwxeeSanTYJo+qNkjTfQr2rVw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :content-type:content-transfer-encoding;
        bh=bdWpkaZGTp+Q57UIeV+jV4jxmYyUELj0WUi+4brHzOE=;
        b=GDssjsCZd6uLAIOPHJ2DHV5t5IMmb5PSjBu5ccZTBScLI38G7M3uJq99VaBJJAlkfS
         FBNH/cY0rp3WOComMNw77iVkqTInkrdknlGIv8UxZxKkwr+SFXchx4sTDdMREFtR/2So
         rlll4VwhOJht4vnF+bx2BqM/A6pPvaRuZJSTC4HUuMlr3ka6Cf4p9S5Kzn2upRi5leoZ
         WUS7oniDFW5x1CKX2PmIpmqMiAdhN7JPQwjVVldanlhIIGlYvHMhxfQYYRhG4NLyQEfL
         QmRqNYSVNea/K0D51AcO3Y92sdj33R9HgaT0FRzt8y8lPDsYujFOsbI1KZUxi/ytL0kN
         KXfg==
In-Reply-To: <CAAJpzgbutOBLB1t9vXYeXSPS=wwxeeSanTYJo+qNkjTfQr2rVw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@vger.kernel.org

Thank you for your reply.

Let me print the ulogd configurations here, so that I can describe my
problem better.

# this is a stack for flow-based logging via LOGEMU
stack=3Dct1:NFCT,ip2str1:IP2STR,print1:PRINTFLOW,emu1:LOGEMU

[ct1]
netlink_socket_buffer_size=3D217088
netlink_socket_buffer_maxsize=3D1085440
#netlink_resync_timeout=3D60 # seconds to wait to perform resynchroniza=
tion
pollinterval=3D5 # use poll-based logging instead of event-driven
hash_enable=3D1

ulogd is running without any error messages. But, ulogd_syslogemu.log
has no contents. conntrack -E displays the flow perfectly.

I tried to find out the cause of no content in the ulogd_syslogemu.log
in the log file. ulogd requires nf_conntrack_netlink subsystem/module.
In my linux version (RHEL 5), I dont have that. Instead of that I have
ip_conntrack_netlink module.

1) Is there any way that I can make ulogd to talk to
ip_conntrack_netlink, and whether ip_conntrack_netlink is equivalent
of nf_conntrack_netlink?

2) If (1) is not possible, can I able to include just the
nf_conntrack_netlink in RHEL5 without changing any existing
functionality? nf_conntrack_netlink and ip_conntrack_netlink can work
well simultaneously?

3) If (2) is not possible, what would be your advice on this? RHEL5 +
ip_conntrack_netlink is used in many servers(may be more than 1000
servers) in my organization. Considering this, any change would cause
potential testing. So a simple solution would be easily accepted in my
organization.


-----Original Message-----
=46rom: netfilter-owner@vger.kernel.org
[mailto:netfilter-owner@vger.kernel.org] On Behalf Of kay
Sent: Friday, July 27, 2012 8:12 PM
To: netfilter@vger.kernel.org
Subject: Re: ulogd - ip_conntrack_netlink - how to get it working one

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
> To unsubscribe from this list: send the line "unsubscribe netfilter"
> in the body of a message to majordomo@vger.kernel.org More majordomo
> info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe netfilter"
in the body of a message to majordomo@vger.kernel.org More majordomo
info at  http://vger.kernel.org/majordomo-info.html
