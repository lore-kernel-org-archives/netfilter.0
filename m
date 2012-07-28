From: Gomathivinayagam Muthuvinayagam <sankarmail@gmail.com>
Subject: Re: ulogd - ip_conntrack_netlink - how to get it working one
Date: Fri, 27 Jul 2012 20:03:53 -0700
Message-ID: <CAAJpzgbutOBLB1t9vXYeXSPS=wwxeeSanTYJo+qNkjTfQr2rVw@mail.gmail.com>
References: <CAAJpzgb2ZEoRayuzvUVevvRvJ=oXA6=heQa98fKD_63QXVe4xg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :content-type:content-transfer-encoding;
        bh=oEGhvwqq+Q5B9XacqomUcGx334KbhNgWGda76gYYawg=;
        b=0JXUIAgWmg9k3ouXnY8Pk17I5HBUT4tGPrHbAgH4r15zNnyjVpsrgREPMMZ5dvGycp
         /7ebXYJzN9x26sPtrFXJjjrzXr3bW7qDHFIHKNsaDgS3aLGZed22m8Bg1HeCbv1bQ7fw
         if3SmCHuGBz4PWNY43zarE14yUio8yNjPrjg4gV2vP6lMhlugTE/Lxf4xdV8LSYmA49V
         Ac4lgsfc9W3yq7Zt6zjDQVuxlYaWuWKDBloDIA1xhUeROvm00healHtnEfu2qBJMOGd/
         U2qiqJgJOoRhGjeh3NZwcQos734ThCS96KeslFVrQZZQstaQNpXTLFa6fsqzz8T4z7ue
         ZTqA==
In-Reply-To: <CAAJpzgb2ZEoRayuzvUVevvRvJ=oXA6=heQa98fKD_63QXVe4xg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@vger.kernel.org

I don=92t know whether I=92m asking stupid questions, but if someone co=
uld
respond for this post, that will be great.

Thanks & Regards,




On Fri, Jul 27, 2012 at 7:26 PM, Gomathivinayagam Muthuvinayagam
<sankarmail@gmail.com> wrote:
> Hi,
>
> I have a RHEL 5 os in my system. I have setup ulogd in my local
> system. I=92m able to do packet capturing.
> I=92m not able to capture flow based logging. What I have found was, =
in
> my system I don=92t have nf_conntrack_netlink.
> Instead I have ip_conntrack_netlink. Is that possible I can
> incorporate nf_conntrack_netlink into RHEL5? And make ulogd to be
> working one.
>
> Your help would be much appreciated.
>
> Thanks,
>
>
> Thanks & Regards,
