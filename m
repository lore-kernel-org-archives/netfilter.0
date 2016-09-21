From: Lee Burton <lburton@mrow.org>
Subject: Re: Invalid argument on 1.4.4 w/DisableExternalCache On (Kernel 4.7.4)
Date: Wed, 21 Sep 2016 03:51:38 -0700
Message-ID: <CAMJqGp4t0tLJv-eTVnjAcdjCWAL9gG0dozz8MA4wQ9zC+zgH8g@mail.gmail.com>
References: <CAMJqGp6c2SaAb=nrCaxPVVx3_yD+RvNwmxsqW3tLRGFBSFnB1w@mail.gmail.com>
 <CAOkSjBi9MzyYEnA3526Dq=QKsS-aPg5SCGLZkzwh0MNd+c=Qqw@mail.gmail.com> <CAMJqGp6NwbrdcyitkY=XnS3MP4=y4RK9+XAuy0V3u_yhNhEt-A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mrow-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=sqpee7ZK0FvvTbEYz7FanuMQBOiDxTTw6fi/kkoVIHc=;
        b=V8jbmHFMdP8WwC6BMyEkAN4N9S+vxQpETix+RPA5N4U4QPvW6uZ9/UHYR/lrdtmcS/
         A5dLEcfr42tjn4rFiUYFSNANRsyph5f1vOx5NlIOclRjl/Vz8l1M5867Zl5O7/v+RoYR
         Wxlw5r89hsh8tvjlzxWhHc69pWaos7J4rwjBMyGPeoibf1YuzaF0RRp717uWd+fvI7bx
         Snn+TlgwY4iAcLueHlRBDyBGWTfFDCdSZGXclUsnw7iQ0MQV4lkWggdSVbMbAQn+C/0x
         xq626pCCvqDGITx6xQNA0Kw2gwZykqilDlgMNjQ53CLfMYRMcFj20z1of1TTkW7oPfm8
         nbPQ==
In-Reply-To: <CAMJqGp6NwbrdcyitkY=XnS3MP4=y4RK9+XAuy0V3u_yhNhEt-A@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

Oh, to be clear with DisableExternalCache Off things work as
expected.. entries show up on the standby machine w/conntrackd -e and
conntrackd -c correctly makes them appear in the kernel according to
conntrack -L... the only problem being with my being active-passive on
V4.. and sort of active-active on V6 (both routers advertise their V6
link-local so I'd like to just have entries hot in both's kernel
tables so I don't need to active/passive-ify .. although that still
might be the /right/ thing to do).  Anyway in my attempt I ran across
DisableExternalCache not seeming to work..
Thanks,
Lee

On Wed, Sep 21, 2016 at 3:30 AM, Lee Burton <lburton@mrow.org> wrote:
> It's not a custom kernel just Archlinux's standard kernel -- config:
> https://paste.pound-python.org/show/n9iDruPANle9wi7szQkX/
> lsmod: https://paste.pound-python.org/show/j4zCGcsKywUdrKpWqVSV/
> config file (mostly borrowed from somewhere):
> https://paste.pound-python.org/show/FqXslDwXlhn50jBKA6Tk/
> I believe the traffic to be fairly normal.. I don't see anything
> non-local when running conntrack -L on a machine so it looks like it's
> all traffic having an issue?
> Thanks,
> Lee
>
> On Wed, Sep 21, 2016 at 3:19 AM, Arturo Borrero Gonzalez
> <arturo.borrero.glez@gmail.com> wrote:
>> On 21 September 2016 at 12:00, Lee Burton <lburton@mrow.org> wrote:
>>> Are there known issues with DisableExternalCache currently?  I was
>>> trying it earlier and got a ton of:
>>> [ERROR] inject-upd1: Invalid argument
>>> [ERROR] inject-add2: Invalid argument
>>> etc
>>> A quick strace looking @ sendto,recvfrom of what libnetfilter is
>>> sending is @ http://pastebin.com/XFSs5cQ6
>>>
>>
>> Hi,
>>
>> any idea of what kind of traffic is triggering this?
>>
>> I would like to know a bit more about your environment.
>>
>> Could you please paste the complete conntrackd config, plus the kernel c=
onfig?
>> Is a custom kernel?
>>
>> regards
>> --
>> Arturo Borrero Gonz=C3=A1lez
>
>
>
> --
> Lee Burton
> lburton@mrow.org
> 301 910 0246



--=20
Lee Burton
lburton@mrow.org
301 910 0246
